;buildInfoPackage: chisel3, version: 3.2.1, scalaVersion: 2.12.10, sbtVersion: 1.3.2
circuit SysArrayMM : 
  module PE : 
    input clock : Clock
    input reset : Reset
    output io : {flip in_a : UInt<32>, flip in_b : UInt<32>, flip in_c : UInt<32>, out_a : UInt<32>, out_b : UInt<32>, out_c : UInt<32>}
    
    reg a : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[Systolic.scala 20:18]
    reg b : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[Systolic.scala 21:18]
    reg c : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[Systolic.scala 22:18]
    a <= io.in_a @[Systolic.scala 23:5]
    b <= io.in_b @[Systolic.scala 24:5]
    node _T = mul(io.in_a, io.in_b) @[Systolic.scala 25:27]
    node _T_1 = add(io.in_c, _T) @[Systolic.scala 25:16]
    node _T_2 = tail(_T_1, 1) @[Systolic.scala 25:16]
    c <= _T_2 @[Systolic.scala 25:5]
    io.out_a <= a @[Systolic.scala 26:12]
    io.out_b <= b @[Systolic.scala 27:12]
    io.out_c <= c @[Systolic.scala 28:12]
    
  module PE_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in_a : UInt<32>, flip in_b : UInt<32>, flip in_c : UInt<32>, out_a : UInt<32>, out_b : UInt<32>, out_c : UInt<32>}
    
    reg a : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[Systolic.scala 20:18]
    reg b : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[Systolic.scala 21:18]
    reg c : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[Systolic.scala 22:18]
    a <= io.in_a @[Systolic.scala 23:5]
    b <= io.in_b @[Systolic.scala 24:5]
    node _T = mul(io.in_a, io.in_b) @[Systolic.scala 25:27]
    node _T_1 = add(io.in_c, _T) @[Systolic.scala 25:16]
    node _T_2 = tail(_T_1, 1) @[Systolic.scala 25:16]
    c <= _T_2 @[Systolic.scala 25:5]
    io.out_a <= a @[Systolic.scala 26:12]
    io.out_b <= b @[Systolic.scala 27:12]
    io.out_c <= c @[Systolic.scala 28:12]
    
  module PE_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in_a : UInt<32>, flip in_b : UInt<32>, flip in_c : UInt<32>, out_a : UInt<32>, out_b : UInt<32>, out_c : UInt<32>}
    
    reg a : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[Systolic.scala 20:18]
    reg b : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[Systolic.scala 21:18]
    reg c : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[Systolic.scala 22:18]
    a <= io.in_a @[Systolic.scala 23:5]
    b <= io.in_b @[Systolic.scala 24:5]
    node _T = mul(io.in_a, io.in_b) @[Systolic.scala 25:27]
    node _T_1 = add(io.in_c, _T) @[Systolic.scala 25:16]
    node _T_2 = tail(_T_1, 1) @[Systolic.scala 25:16]
    c <= _T_2 @[Systolic.scala 25:5]
    io.out_a <= a @[Systolic.scala 26:12]
    io.out_b <= b @[Systolic.scala 27:12]
    io.out_c <= c @[Systolic.scala 28:12]
    
  module PE_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in_a : UInt<32>, flip in_b : UInt<32>, flip in_c : UInt<32>, out_a : UInt<32>, out_b : UInt<32>, out_c : UInt<32>}
    
    reg a : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[Systolic.scala 20:18]
    reg b : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[Systolic.scala 21:18]
    reg c : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[Systolic.scala 22:18]
    a <= io.in_a @[Systolic.scala 23:5]
    b <= io.in_b @[Systolic.scala 24:5]
    node _T = mul(io.in_a, io.in_b) @[Systolic.scala 25:27]
    node _T_1 = add(io.in_c, _T) @[Systolic.scala 25:16]
    node _T_2 = tail(_T_1, 1) @[Systolic.scala 25:16]
    c <= _T_2 @[Systolic.scala 25:5]
    io.out_a <= a @[Systolic.scala 26:12]
    io.out_b <= b @[Systolic.scala 27:12]
    io.out_c <= c @[Systolic.scala 28:12]
    
  module PE_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in_a : UInt<32>, flip in_b : UInt<32>, flip in_c : UInt<32>, out_a : UInt<32>, out_b : UInt<32>, out_c : UInt<32>}
    
    reg a : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[Systolic.scala 20:18]
    reg b : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[Systolic.scala 21:18]
    reg c : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[Systolic.scala 22:18]
    a <= io.in_a @[Systolic.scala 23:5]
    b <= io.in_b @[Systolic.scala 24:5]
    node _T = mul(io.in_a, io.in_b) @[Systolic.scala 25:27]
    node _T_1 = add(io.in_c, _T) @[Systolic.scala 25:16]
    node _T_2 = tail(_T_1, 1) @[Systolic.scala 25:16]
    c <= _T_2 @[Systolic.scala 25:5]
    io.out_a <= a @[Systolic.scala 26:12]
    io.out_b <= b @[Systolic.scala 27:12]
    io.out_c <= c @[Systolic.scala 28:12]
    
  module PE_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in_a : UInt<32>, flip in_b : UInt<32>, flip in_c : UInt<32>, out_a : UInt<32>, out_b : UInt<32>, out_c : UInt<32>}
    
    reg a : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[Systolic.scala 20:18]
    reg b : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[Systolic.scala 21:18]
    reg c : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[Systolic.scala 22:18]
    a <= io.in_a @[Systolic.scala 23:5]
    b <= io.in_b @[Systolic.scala 24:5]
    node _T = mul(io.in_a, io.in_b) @[Systolic.scala 25:27]
    node _T_1 = add(io.in_c, _T) @[Systolic.scala 25:16]
    node _T_2 = tail(_T_1, 1) @[Systolic.scala 25:16]
    c <= _T_2 @[Systolic.scala 25:5]
    io.out_a <= a @[Systolic.scala 26:12]
    io.out_b <= b @[Systolic.scala 27:12]
    io.out_c <= c @[Systolic.scala 28:12]
    
  module PE_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in_a : UInt<32>, flip in_b : UInt<32>, flip in_c : UInt<32>, out_a : UInt<32>, out_b : UInt<32>, out_c : UInt<32>}
    
    reg a : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[Systolic.scala 20:18]
    reg b : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[Systolic.scala 21:18]
    reg c : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[Systolic.scala 22:18]
    a <= io.in_a @[Systolic.scala 23:5]
    b <= io.in_b @[Systolic.scala 24:5]
    node _T = mul(io.in_a, io.in_b) @[Systolic.scala 25:27]
    node _T_1 = add(io.in_c, _T) @[Systolic.scala 25:16]
    node _T_2 = tail(_T_1, 1) @[Systolic.scala 25:16]
    c <= _T_2 @[Systolic.scala 25:5]
    io.out_a <= a @[Systolic.scala 26:12]
    io.out_b <= b @[Systolic.scala 27:12]
    io.out_c <= c @[Systolic.scala 28:12]
    
  module PE_7 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in_a : UInt<32>, flip in_b : UInt<32>, flip in_c : UInt<32>, out_a : UInt<32>, out_b : UInt<32>, out_c : UInt<32>}
    
    reg a : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[Systolic.scala 20:18]
    reg b : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[Systolic.scala 21:18]
    reg c : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[Systolic.scala 22:18]
    a <= io.in_a @[Systolic.scala 23:5]
    b <= io.in_b @[Systolic.scala 24:5]
    node _T = mul(io.in_a, io.in_b) @[Systolic.scala 25:27]
    node _T_1 = add(io.in_c, _T) @[Systolic.scala 25:16]
    node _T_2 = tail(_T_1, 1) @[Systolic.scala 25:16]
    c <= _T_2 @[Systolic.scala 25:5]
    io.out_a <= a @[Systolic.scala 26:12]
    io.out_b <= b @[Systolic.scala 27:12]
    io.out_c <= c @[Systolic.scala 28:12]
    
  module PE_8 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in_a : UInt<32>, flip in_b : UInt<32>, flip in_c : UInt<32>, out_a : UInt<32>, out_b : UInt<32>, out_c : UInt<32>}
    
    reg a : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[Systolic.scala 20:18]
    reg b : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[Systolic.scala 21:18]
    reg c : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[Systolic.scala 22:18]
    a <= io.in_a @[Systolic.scala 23:5]
    b <= io.in_b @[Systolic.scala 24:5]
    node _T = mul(io.in_a, io.in_b) @[Systolic.scala 25:27]
    node _T_1 = add(io.in_c, _T) @[Systolic.scala 25:16]
    node _T_2 = tail(_T_1, 1) @[Systolic.scala 25:16]
    c <= _T_2 @[Systolic.scala 25:5]
    io.out_a <= a @[Systolic.scala 26:12]
    io.out_b <= b @[Systolic.scala 27:12]
    io.out_c <= c @[Systolic.scala 28:12]
    
  module SysArrayMM : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in_a : UInt<32>[3], flip in_b : UInt<32>[3], out_c : UInt<32>[5]}
    
    inst pes_0 of PE @[Systolic.scala 41:52]
    pes_0.clock <= clock
    pes_0.reset <= reset
    inst pes_1 of PE_1 @[Systolic.scala 41:52]
    pes_1.clock <= clock
    pes_1.reset <= reset
    inst pes_2 of PE_2 @[Systolic.scala 41:52]
    pes_2.clock <= clock
    pes_2.reset <= reset
    inst pes_3 of PE_3 @[Systolic.scala 41:52]
    pes_3.clock <= clock
    pes_3.reset <= reset
    inst pes_4 of PE_4 @[Systolic.scala 41:52]
    pes_4.clock <= clock
    pes_4.reset <= reset
    inst pes_5 of PE_5 @[Systolic.scala 41:52]
    pes_5.clock <= clock
    pes_5.reset <= reset
    inst pes_6 of PE_6 @[Systolic.scala 41:52]
    pes_6.clock <= clock
    pes_6.reset <= reset
    inst pes_7 of PE_7 @[Systolic.scala 41:52]
    pes_7.clock <= clock
    pes_7.reset <= reset
    inst pes_8 of PE_8 @[Systolic.scala 41:52]
    pes_8.clock <= clock
    pes_8.reset <= reset
    pes_3.io.in_a <= pes_0.io.out_a @[Systolic.scala 53:34]
    pes_1.io.in_b <= pes_0.io.out_b @[Systolic.scala 57:34]
    pes_4.io.in_c <= pes_0.io.out_c @[Systolic.scala 61:34]
    pes_4.io.in_a <= pes_1.io.out_a @[Systolic.scala 53:34]
    pes_2.io.in_b <= pes_1.io.out_b @[Systolic.scala 57:34]
    pes_5.io.in_c <= pes_1.io.out_c @[Systolic.scala 61:34]
    pes_5.io.in_a <= pes_2.io.out_a @[Systolic.scala 53:34]
    pes_6.io.in_a <= pes_3.io.out_a @[Systolic.scala 53:34]
    pes_4.io.in_b <= pes_3.io.out_b @[Systolic.scala 57:34]
    pes_7.io.in_c <= pes_3.io.out_c @[Systolic.scala 61:34]
    pes_7.io.in_a <= pes_4.io.out_a @[Systolic.scala 53:34]
    pes_5.io.in_b <= pes_4.io.out_b @[Systolic.scala 57:34]
    pes_8.io.in_c <= pes_4.io.out_c @[Systolic.scala 61:34]
    pes_8.io.in_a <= pes_5.io.out_a @[Systolic.scala 53:34]
    pes_7.io.in_b <= pes_6.io.out_b @[Systolic.scala 57:34]
    pes_8.io.in_b <= pes_7.io.out_b @[Systolic.scala 57:34]
    pes_0.io.in_a <= io.in_a[0] @[Systolic.scala 67:20]
    io.out_c[0] <= pes_6.io.out_c @[Systolic.scala 70:17]
    pes_0.io.in_c <= UInt<32>("h00") @[Systolic.scala 72:20]
    pes_1.io.in_a <= io.in_a[1] @[Systolic.scala 67:20]
    io.out_c[1] <= pes_7.io.out_c @[Systolic.scala 70:17]
    pes_1.io.in_c <= UInt<32>("h00") @[Systolic.scala 72:20]
    pes_2.io.in_a <= io.in_a[2] @[Systolic.scala 67:20]
    io.out_c[2] <= pes_8.io.out_c @[Systolic.scala 70:17]
    pes_2.io.in_c <= UInt<32>("h00") @[Systolic.scala 72:20]
    pes_0.io.in_b <= io.in_b[0] @[Systolic.scala 80:30]
    io.out_c[4] <= pes_2.io.out_c @[Systolic.scala 83:39]
    pes_0.io.in_c <= UInt<32>("h00") @[Systolic.scala 86:30]
    pes_3.io.in_b <= io.in_b[1] @[Systolic.scala 80:30]
    io.out_c[3] <= pes_5.io.out_c @[Systolic.scala 83:39]
    pes_3.io.in_c <= UInt<32>("h00") @[Systolic.scala 86:30]
    pes_6.io.in_b <= io.in_b[2] @[Systolic.scala 80:30]
    pes_6.io.in_c <= UInt<32>("h00") @[Systolic.scala 86:30]
    
