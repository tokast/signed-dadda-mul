//Brent Kung Adder
module BK_29 ( 
        input  [28:0] IN1,
        input  [28:0] IN2,
        output  [29:0] OUT);  
 

   
wire  [28:0] p_0, g_0;
wire g_1_1, p_1_3, g_1_3, p_1_5, g_1_5, p_1_7, g_1_7, p_1_9, g_1_9, p_1_11, g_1_11, p_1_13, g_1_13, p_1_15, 
     g_1_15, p_1_17, g_1_17, p_1_19, g_1_19, p_1_21, g_1_21, p_1_23, g_1_23, p_1_25, g_1_25, p_1_27, g_1_27;
wire g_2_3, p_2_7, g_2_7, p_2_11, g_2_11, p_2_15, g_2_15, p_2_19, g_2_19, p_2_23, g_2_23, p_2_27, g_2_27;
wire g_3_7, p_3_15, g_3_15, p_3_23, g_3_23;
wire g_4_15, g_5_23, g_6_11, g_6_19, g_6_27;
wire g_7_5, g_7_9, g_7_13, g_7_17, g_7_21, g_7_25;
wire g_8_2, g_8_4, g_8_6, g_8_8, g_8_10, g_8_12, g_8_14, g_8_16, g_8_18, g_8_20, g_8_22, g_8_24, g_8_26, g_8_28;

assign g_0 = IN1 & IN2;
assign p_0 = IN1 ^ IN2;

assign g_1_1 = (p_0[1] & g_0[0]) | g_0[1];
assign p_1_3 = p_0[3] & p_0[2];
assign g_1_3 = (p_0[3] & g_0[2]) | g_0[3];
assign p_1_5 = p_0[5] & p_0[4];
assign g_1_5 = (p_0[5] & g_0[4]) | g_0[5];
assign p_1_7 = p_0[7] & p_0[6];
assign g_1_7 = (p_0[7] & g_0[6]) | g_0[7];
assign p_1_9 = p_0[9] & p_0[8];
assign g_1_9 = (p_0[9] & g_0[8]) | g_0[9];
assign p_1_11 = p_0[11] & p_0[10];
assign g_1_11 = (p_0[11] & g_0[10]) | g_0[11];
assign p_1_13 = p_0[13] & p_0[12];
assign g_1_13 = (p_0[13] & g_0[12]) | g_0[13];
assign p_1_15 = p_0[15] & p_0[14];
assign g_1_15 = (p_0[15] & g_0[14]) | g_0[15];
assign p_1_17 = p_0[17] & p_0[16];
assign g_1_17 = (p_0[17] & g_0[16]) | g_0[17];
assign p_1_19 = p_0[19] & p_0[18];
assign g_1_19 = (p_0[19] & g_0[18]) | g_0[19];
assign p_1_21 = p_0[21] & p_0[20];
assign g_1_21 = (p_0[21] & g_0[20]) | g_0[21];
assign p_1_23 = p_0[23] & p_0[22];
assign g_1_23 = (p_0[23] & g_0[22]) | g_0[23];
assign p_1_25 = p_0[25] & p_0[24];
assign g_1_25 = (p_0[25] & g_0[24]) | g_0[25];
assign p_1_27 = p_0[27] & p_0[26];
assign g_1_27 = (p_0[27] & g_0[26]) | g_0[27];

assign g_2_3 = (p_1_3 & g_1_1) | g_1_3;
assign p_2_7 = p_1_7 & p_1_5;
assign g_2_7 = (p_1_7 & g_1_5) | g_1_7;
assign p_2_11 = p_1_11 & p_1_9;
assign g_2_11 = (p_1_11 & g_1_9) | g_1_11;
assign p_2_15 = p_1_15 & p_1_13;
assign g_2_15 = (p_1_15 & g_1_13) | g_1_15;
assign p_2_19 = p_1_19 & p_1_17;
assign g_2_19 = (p_1_19 & g_1_17) | g_1_19;
assign p_2_23 = p_1_23 & p_1_21;
assign g_2_23 = (p_1_23 & g_1_21) | g_1_23;
assign p_2_27 = p_1_27 & p_1_25;
assign g_2_27 = (p_1_27 & g_1_25) | g_1_27;

assign g_3_7 = (p_2_7 & g_2_3) | g_2_7;
assign p_3_15 = p_2_15 & p_2_11;
assign g_3_15 = (p_2_15 & g_2_11) | g_2_15;
assign p_3_23 = p_2_23 & p_2_19;
assign g_3_23 = (p_2_23 & g_2_19) | g_2_23;

assign g_4_15 = (p_3_15 & g_3_7) | g_3_15;

assign g_5_23 = (p_3_23 & g_4_15) | g_3_23;

assign g_6_11 = (p_2_11 & g_3_7) | g_2_11;
assign g_6_19 = (p_2_19 & g_4_15) | g_2_19;
assign g_6_27 = (p_2_27 & g_5_23) | g_2_27;

assign g_7_5 = (p_1_5 & g_2_3) | g_1_5;
assign g_7_9 = (p_1_9 & g_3_7) | g_1_9;
assign g_7_13 = (p_1_13 & g_6_11) | g_1_13;
assign g_7_17 = (p_1_17 & g_4_15) | g_1_17;
assign g_7_21 = (p_1_21 & g_6_19) | g_1_21;
assign g_7_25 = (p_1_25 & g_5_23) | g_1_25;

assign g_8_2 = (p_0[2] & g_1_1) | g_0[2];
assign g_8_4 = (p_0[4] & g_2_3) | g_0[4];
assign g_8_6 = (p_0[6] & g_7_5) | g_0[6];
assign g_8_8 = (p_0[8] & g_3_7) | g_0[8];
assign g_8_10 = (p_0[10] & g_7_9) | g_0[10];
assign g_8_12 = (p_0[12] & g_6_11) | g_0[12];
assign g_8_14 = (p_0[14] & g_7_13) | g_0[14];
assign g_8_16 = (p_0[16] & g_4_15) | g_0[16];
assign g_8_18 = (p_0[18] & g_7_17) | g_0[18];
assign g_8_20 = (p_0[20] & g_6_19) | g_0[20];
assign g_8_22 = (p_0[22] & g_7_21) | g_0[22];
assign g_8_24 = (p_0[24] & g_5_23) | g_0[24];
assign g_8_26 = (p_0[26] & g_7_25) | g_0[26];
assign g_8_28 = (p_0[28] & g_6_27) | g_0[28];

    

assign OUT[0] = p_0[0];
assign OUT[1] = p_0[1] ^ g_0[0];
assign OUT[2] = p_0[2] ^ g_1_1;
assign OUT[3] = p_0[3] ^ g_8_2;
assign OUT[4] = p_0[4] ^ g_2_3;
assign OUT[5] = p_0[5] ^ g_8_4;
assign OUT[6] = p_0[6] ^ g_7_5;
assign OUT[7] = p_0[7] ^ g_8_6;
assign OUT[8] = p_0[8] ^ g_3_7;
assign OUT[9] = p_0[9] ^ g_8_8;
assign OUT[10] = p_0[10] ^ g_7_9;
assign OUT[11] = p_0[11] ^ g_8_10;
assign OUT[12] = p_0[12] ^ g_6_11;
assign OUT[13] = p_0[13] ^ g_8_12;
assign OUT[14] = p_0[14] ^ g_7_13;
assign OUT[15] = p_0[15] ^ g_8_14;
assign OUT[16] = p_0[16] ^ g_4_15;
assign OUT[17] = p_0[17] ^ g_8_16;
assign OUT[18] = p_0[18] ^ g_7_17;
assign OUT[19] = p_0[19] ^ g_8_18;
assign OUT[20] = p_0[20] ^ g_6_19;
assign OUT[21] = p_0[21] ^ g_8_20;
assign OUT[22] = p_0[22] ^ g_7_21;
assign OUT[23] = p_0[23] ^ g_8_22;
assign OUT[24] = p_0[24] ^ g_5_23;
assign OUT[25] = p_0[25] ^ g_8_24;
assign OUT[26] = p_0[26] ^ g_7_25;
assign OUT[27] = p_0[27] ^ g_8_26;
assign OUT[28] = p_0[28] ^ g_6_27;
assign OUT[29] = g_8_28;
endmodule