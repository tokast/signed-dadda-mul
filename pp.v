module pp (
           input a,
			  input [9:0] b,
			  output [9:0] out
			  );
			  
//assign out = ({10{a[0]}} & b) ^ ((1'b1)<<9);
assign out[8:0] = ({9{a}} & b[8:0]);
assign out[9] = ~(a & b[9]);
endmodule
