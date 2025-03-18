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

  wire carry_1, carry_2;
  wire [32-1:0] in_A, in_B, add_1;

  //Main function
  assign in_A = (invertA) ? ~aluSrc1 : aluSrc1;
  assign in_B = (invertB) ? ~aluSrc2 : aluSrc2;

  assign {carry_1, add_1[30:0]} = in_A[30:0] + in_B[30:0] + invertB;
  assign {carry_2, add_1[31  ]} = in_A[31  ] + in_B[31  ] + carry_1;
  assign overflow = carry_1 ^ carry_2; 

  assign result = (operation == 0) ? in_A & in_B : 
                  (operation == 2) ? in_A | in_B : 
                  (operation == 3) ? add_1  :  add_1[31] & !overflow | carry_2 & overflow;

  assign zero = result == 0;

endmodule
