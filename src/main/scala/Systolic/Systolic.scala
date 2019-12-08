// See README.md for license details.

package Systolic

import chisel3._

class PEIO (val data_size: Int) extends Bundle {
  val in_a = Input(UInt(data_size.W))
  val in_b = Input(UInt(data_size.W))
  val in_c = Input(UInt(data_size.W))
  val out_a = Output(UInt(data_size.W))
  val out_b = Output(UInt(data_size.W))
  val out_c = Output(UInt(data_size.W))
}

class PE (val data_size: Int) extends Module {

  val io = IO(new PEIO(data_size))

  val a = RegInit(init = 0.U(data_size.W))
  val b = RegInit(init = 0.U(data_size.W))
  val c = RegInit(init = 0.U(data_size.W))
  a := io.in_a
  b := io.in_b
  c := io.in_c + (io.in_a * io.in_b)
  io.out_a := a
  io.out_b := b
  io.out_c := c
}

class SysArrayMMIO (val data_size: Int, val grid_size: Int) extends Bundle {
  val in_a = Input(Vec(grid_size, UInt(data_size.W)))
  val in_b = Input(Vec(grid_size, UInt(data_size.W)))
  val out_c = Output(Vec(2 * grid_size - 1, UInt(data_size.W)))
}

class SysArrayMM (val data_size: Int, val grid_size: Int) extends Module {

  val io = IO(new SysArrayMMIO(data_size, grid_size))

  val pes = Seq.fill(grid_size * grid_size) {Module(new PE(data_size))}

  // Connect out_a to in_a
  for (i <- 0 until grid_size) {
    for (j <- 0 until grid_size) {
      val src_pe_id = i * grid_size + j
      val dst_pe_id_a = (i + 1) * grid_size + j
      val dst_pe_id_b = src_pe_id + 1
      val dst_pe_id_c = (i + 1) * grid_size + j + 1


      if (i != grid_size - 1) {
        pes(dst_pe_id_a).io.in_a := pes(src_pe_id).io.out_a
      }

      if (j != grid_size - 1) {
        pes(dst_pe_id_b).io.in_b := pes(src_pe_id).io.out_b
      }

      if (j != grid_size - 1 && i != grid_size - 1) {
        pes(dst_pe_id_c).io.in_c := pes(src_pe_id).io.out_c
      }
    }
  }
  for (j <- 0 until grid_size) {
    // Connect the top row pes to in_a
    pes(j).io.in_a := io.in_a(j)
    val last_row_j = (grid_size - 1) * grid_size + j
    // Connect the bottom row pes to out_c
    io.out_c(j) := pes(last_row_j).io.out_c
    // Set the top row in_c to 0
    pes(j).io.in_c := 0.U(data_size.W)
  }

  for (i <- 0 until grid_size) {

    val last_col_i = grid_size * i + grid_size - 1
    val first_col_i = grid_size * i
    // Connect the left column pes to in_b
    pes(first_col_i).io.in_b := io.in_b(i)
    // Connect the right column out_c to pes
    if (i != grid_size - 1) {
      io.out_c(2 * grid_size - 2 - i) := pes(last_col_i).io.out_c
    }
    // Set the left column pes.in_c to 0
    pes(first_col_i).io.in_c := 0.U(data_size.W)
  }
}



object SysArrayMM extends App {
  chisel3.Driver.execute(Array("-td", "verilog"), () => new SysArrayMM(32, 3))
}