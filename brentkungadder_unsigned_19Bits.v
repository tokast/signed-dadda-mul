
module brentkungadder_unsigned_19Bits(input [18:0] a,b,
 //       input carry_in,
        output [19:0] outp
//        output carry_out                
                        );

wire g1_pseudo;


wire [18:0]g1,p1;
wire [8:0]g2,p2;
wire [3:0]g3,p3;
wire [1:0]g4,p4;
wire [0:0]g5,p5;

wire [19:0]carry_internal;
wire [18:0]p;

// xor_block x1( a[0], b[0], p1[0]);
// and_block x2( a[0], b[0], g1_pseudo);
// a_or_bc_block x3( g1_pseudo, p1[0], carry_in, g1[0]);


genvar i;

generate
    for(i=0; i<=18; i=i+1) begin : gen0
        xor_block m1( a[i], b[i], p1[i]);
        and_block m2( a[i], b[i], g1[i]); 
    end
endgenerate

generate
    for(i=0; i<=8; i=i+1) begin: gen2
        a_or_bc_block m3( g1[(2*i)+1], p1[(2*i)+1], g1[2*i], g2[i]);
		and_block m4( p1[2*i+1], p1[2*i], p2[i]);
    end
endgenerate

generate
    for(i=0; i<=3; i=i+1) begin: gen3
		a_or_bc_block m5( g2[2*i+1], p2[2*i+1], g2[2*i], g3[i]);
		and_block m6( p2[2*i+1], p2[2*i], p3[i]);
    end
endgenerate

generate
    for(i=0; i<=1; i=i+1) begin: gen4
		a_or_bc_block m7( g3[2*i+1], p3[2*i+1], g3[2*i], g4[i]);
		and_block m8( p3[2*i+1], p3[2*i], p4[i]);
    end
endgenerate


generate
    for(i=0; i<=0; i=i+1) begin: gen4x
		a_or_bc_block m7( g4[1], p4[1], g4[0], g5[0]);
		//and_block m8( p3[2*i+1], p3[2*i], p4[i]);
    end
endgenerate

assign carry_internal[0] = 1'b0;
assign carry_internal[1] = g1[0];
assign carry_internal[2] = g2[0];
assign carry_internal[4] = g3[0];
assign carry_internal[8] = g4[0];
assign carry_internal[16] = g5[0];


generate 
    for(i=1; i<=9; i=i+1) begin:gen5
		a_or_bc_block m9(g1[2*i],p1[2*i],carry_internal[2*i], carry_internal[2*i+1]);
    end
endgenerate

generate
    for(i=1; i<=4; i=i+1) begin: gen6
			a_or_bc_block k1(g2[2*i],p2[2*i],carry_internal[4*i], carry_internal[4*i+2]);
    end
endgenerate

generate
    for(i=1; i<=1; i=i+1) begin: gen6x
			a_or_bc_block k1(g3[2*i],p3[2*i],carry_internal[8*i], carry_internal[8*i+4]);
    end
endgenerate

// assign outp[10] = a[9] ^ b[9] ^ carry_internal[10];
assign outp[19] = carry_internal[19];

generate
    for(i=0; i<=18; i=i+1) begin: gen7
							xor_block k2(a[i],b[i], p[i]); 
							xor_block k3(p[i],carry_internal[i], outp[i]);
    end
endgenerate

endmodule
