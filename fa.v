module fa (
        input  x,
        input  y,
        input  z,
        output  s,
        output  c);
    
assign s = x ^ y ^ z;
assign c = (x & y) | (x & z) | (y & z);
endmodule
