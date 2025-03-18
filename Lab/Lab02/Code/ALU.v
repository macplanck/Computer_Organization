`include "ALU_1bit.v"
module ALU (
    aluSrc1,
    aluSrc2,
    invertA,
    invertB,
    operation,
    result,
    zero,
    overflow
);

  //I/O ports
  input [32-1:0] aluSrc1;
  input [32-1:0] aluSrc2;
  input invertA;
  input invertB;
  input [2-1:0] operation;

  output [32-1:0] result;
  output zero;
  output overflow;

  //Internal Signals
  wire [32-1:0] result;
  wire zero;
  wire overflow;
  wire Extend_MSB;

  wire [32-1:0] result_wire;
  wire [32:0] carried, set;

  //Main function

  ALU_1bit ALU_33[32:0] (

    {aluSrc1[31], aluSrc1}, 
    {aluSrc2[31], aluSrc2}, 
    {33 {invertA}}, 
    {33 {invertB}}, 
    {33 {operation}},
    {carried[31:0], invertB},
    {32'd0, set[32]},
    {Extend_MSB, result_wire},
    {carried},
    {set}

  );

  assign result = result_wire;
  assign zero = result_wire == 0;
  assign overflow = carried[31] ^ carried[30];


endmodule
