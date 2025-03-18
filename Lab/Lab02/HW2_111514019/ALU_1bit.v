`include "Full_adder.v"

module ALU_1bit (
    a,
    b,
    invertA,
    invertB,
    operation,
    carryIn,
    less,
    result,
    carryOut,
    set
);

  //I/O ports
  input a;
  input b;
  input invertA;
  input invertB;
  input [2-1:0] operation;
  input carryIn;
  input less;

  output result;
  output carryOut;
  output set;

  //Internal Signals
  // wire result;
  // wire carryOut;

  wire in_a, in_b;
  wire add_wire;

  //Main function
  /*your code here*/

  assign in_a = (invertA) ? ~a : a;
  assign in_b = (invertB) ? ~b : b;

  assign {carryOut, add_wire} = in_a + in_b + carryIn;
  assign set = add_wire;

  assign result = (operation == 0) ? in_a & in_b :
                  (operation == 2) ? in_a | in_b :
                  (operation == 3) ? add_wire : less;

endmodule
