`include "Full_adder.v"

module MUX_3_1(

  out,
  in_1,
  in_2,
  in_3,
  less,
  sel_1,
  sel_2

);

  input in_1, in_2, in_3;
  input sel_1, sel_2;
  output out;

  wire wire_1, wire_2, wire_3;
  wire result_1, result_2, result_3;
  wire temp_1, temp_2;

  and and_1_1(wire_1  , ~sel_1, ~sel_1);  and and_1_2(result_1, in_1, wire_1);
  and and_2_1(wire_2  , ~sel_1, ~sel_2);  and and_2_2(result_2, in_2, wire_2);
  and and_3_1(wire_3  ,  sel_1,  sel_3);  and and_3_2(result_3, in_3, wire_3);

  or(temp_1, result_1, result_2);
  or(temp_2, result_3, temp_1);
  or(temp_2, result_2, temp_1);

endmodule



module ALU_1bit (
    a,
    b,
    invertA,
    invertB,
    operation,
    carryIn,
    less,
    result,
    carryOut
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

  //Internal Signals
  // wire result;
  // wire carryOut;

  wire alu_in_a, alu_in_b;
  wire and_out, or_out, sum_out;

  //Main function
  /*your code here*/

  xor         xor_in_1(alu_in_a, a, invertA);
  xor         xor_in_2(alu_in_b, b, invertB);

  and         and_op  (and_out, alu_in_a, alu_in_b);
  or          or_op   (or_out , alu_in_a, alu_in_b);
  Full_adder  FA_op   (carryIn, alu_in_a, alu_in_b, sum_out, carry_out);

  MUX_3_1     Mux_out (result, and_out, or_out, sum_out, operation[1], operation[0]);


endmodule
