
module a_or_bc_block(input in1,in2,in3,
                     output out1);

assign out1 = in1|(in2 & in3);

endmodule
