// See README.md for license details.

package gcd

import chisel3._

class PEIO (val data_size: Int) extends Bundle {
  val in_a = Input(UInt(data_size.W))
  val in_b = Input(UInt(data_size.W))
  val in_c = Input(UInt(data_size.W))
  val out_a = Input(UInt(data_size.W))
  val out_b = Input(UInt(data_size.W))
  val out_c = Input(UInt(data_size.W))
}

class PE (val data_size: Int) extends Module {

  val io = IO(new PEIO(data_size))

  io.out_a := io.in_a
  io.out_b := io.in_b

  io.out_c := io.in_c + (io.in_a * io.in_b)
}

class SisArrayMMIO (val data_size: Int, val grid_size: Int) extends Bundle {
  val in_a = Input(Vec(grid_size - 1, UInt(data_size.W)))
  val in_b = Input(Vec(grid_size - 1, UInt(data_size.W)))
  val out_c = Input(Vec(2 * (grid_size - 1), UInt(data_size.W)))
}

class SisArrayMM (val data_size: Int, val grid_size: Int) extends Module {

  val io = IO(new SisArrayMMIO(data_size, grid_size))

  // Connections wire between PEs
  val a_cxn_in = Wire( Vec((grid_size + 1) * (grid_size + 1), UInt(data_size.W)) )
  val b_cxn_in = Wire( Vec((grid_size + 1) * (grid_size + 1), UInt(data_size.W)) )
  val c_cxn_in = Wire( Vec((grid_size + 1) * (grid_size + 1), UInt(data_size.W)) )

  val a_cxn_out = Wire( Vec((grid_size + 1) * (grid_size + 1), UInt(data_size.W)) )
  val b_cxn_out = Wire( Vec((grid_size + 1) * (grid_size + 1), UInt(data_size.W)) )
  val c_cxn_out = Wire( Vec((grid_size + 1) * (grid_size + 1), UInt(data_size.W)) )

  // Inputs
  c_cxn_out(0 * grid_size + 0) := 0.U(data_size.W)
  for (i <- 1 until (grid_size + 1)) {
    a_cxn_out(0 * grid_size + i) := io.in_a(i - 1)
    c_cxn_out(0 * grid_size + i) := 0.U(data_size.W)

    b_cxn_out(i * grid_size + 0) := io.in_b(i - 1)
    c_cxn_out(i * grid_size + 0) := 0.U(data_size.W)
  }

  // Outputs
  io.out_c(2 * (grid_size - 1)) := c_cxn_out(grid_size * grid_size + grid_size)
  for (i <- 1 until (grid_size + 1)) {
    io.out_c(2 * (i - 1))     := c_cxn_out(i * grid_size + grid_size)
    io.out_c(2 * (i - 1) + 1) := c_cxn_out(grid_size * grid_size + i)
  }

  // PEs
  for (i <- 1 until grid_size) {
    for (j <- 1 until grid_size) {
      val pe = Module(new PE(data_size))
      pe.io.in_a := a_cxn_in(i * grid_size + j)
      pe.io.in_b := b_cxn_in(i * grid_size + j)
      pe.io.in_c := c_cxn_in(i * grid_size + j)
      pe.io.out_a := a_cxn_out(i * grid_size + j)
      pe.io.out_b := b_cxn_out(i * grid_size + j)
      pe.io.out_c := c_cxn_out(i * grid_size + j)

      a_cxn_in(i * grid_size + j) := a_cxn_out((i - 1) * grid_size + (j - 0))
      b_cxn_in(i * grid_size + j) := a_cxn_out((i - 0) * grid_size + (j - 1))
      c_cxn_in(i * grid_size + j) := c_cxn_out((i - 1) * grid_size + (j - 1))
    }
  }
}

