module dm_20x10(
        input  [19:0] IN1,
        input  [9:0] IN2,
        output  [29:0] result);
    

wire [9:0] pp0, pp1, pp2, pp3, pp4, pp5, pp6, pp7, pp8, pp9, pp10, pp11, pp12, pp13, pp14, pp15, pp16, pp17, pp18, pp19;
wire s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12;
wire c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12;
wire s13, s14, s15, s16, s17, s18, s19, s20, s21, s22, s23, s24, s25, s26, s27, s28, s29, s30, s31, s32, s33, s34, s35, s36, s37, s38, s39, s40, s41, s42, s43, s44, s45, s46, s47, s48, s49, s50, s51, s52, s53, s54, s55, s56, s57, s58, s59, s60;
wire c13, c14, c15, c16, c17, c18, c19, c20, c21, c22, c23, c24, c25, c26, c27, c28, c29, c30, c31, c32, c33, c34, c35, c36, c37, c38, c39, c40, c41, c42, c43, c44, c45, c46, c47, c48, c49, c50, c51, c52, c53, c54, c55, c56, c57, c58, c59, c60;
wire s61, s62, s63, s64, s65, s66, s67, s68, s69, s70, s71, s72, s73, s74, s75, s76, s77, s78, s79, s80, s81, s82, s83, s84, s85, s86, s87, s88, s89, s90, s91, s92, s93, s94, s95, s96, s97, s98, s99, s100, s101, s102;
wire c61, c62, c63, c64, c65, c66, c67, c68, c69, c70, c71, c72, c73, c74, c75, c76, c77, c78, c79, c80, c81, c82, c83, c84, c85, c86, c87, c88, c89, c90, c91, c92, c93, c94, c95, c96, c97, c98, c99, c100, c101, c102;
wire s103, s104, s105, s106, s107, s108, s109, s110, s111, s112, s113, s114, s115, s116, s117, s118, s119, s120, s121, s122, s123, s124, s125, s126;
wire c103, c104, c105, c106, c107, c108, c109, c110, c111, c112, c113, c114, c115, c116, c117, c118, c119, c120, c121, c122, c123, c124, c125, c126;
wire s127, s128, s129, s130, s131, s132, s133, s134, s135, s136, s137, s138, s139, s140, s141, s142, s143, s144, s145, s146, s147, s148, s149, s150, s151, s152;
wire c127, c128, c129, c130, c131, c132, c133, c134, c135, c136, c137, c138, c139, c140, c141, c142, c143, c144, c145, c146, c147, c148, c149, c150, c151, c152;
wire [28:0] addin1, addin2;
wire [29:0] adder_result;
   
pp partialproduct0 (IN1[0],IN2,pp0);
pp partialproduct1 (IN1[1],IN2,pp1);
pp partialproduct2 (IN1[2],IN2,pp2);
pp partialproduct3 (IN1[3],IN2,pp3);
pp partialproduct4 (IN1[4],IN2,pp4);
pp partialproduct5 (IN1[5],IN2,pp5);
pp partialproduct6 (IN1[6],IN2,pp6);
pp partialproduct7 (IN1[7],IN2,pp7);
pp partialproduct8 (IN1[8],IN2,pp8);
pp partialproduct9 (IN1[9],IN2,pp9);
pp partialproduct10(IN1[10],IN2,pp10);
pp partialproduct11(IN1[11],IN2,pp11);
pp partialproduct12(IN1[12],IN2,pp12);
pp partialproduct13(IN1[13],IN2,pp13);
pp partialproduct14(IN1[14],IN2,pp14);
pp partialproduct15(IN1[15],IN2,pp15);
pp partialproduct16(IN1[16],IN2,pp16);
pp partialproduct17(IN1[17],IN2,pp17);
pp partialproduct18(IN1[18],IN2,pp18);
pp_2 partialproduct19(IN1[19],IN2,pp19);


fa fa0  (pp0[9],  pp1[8],  pp2[7],  s0,  c0);
fa fa1  (pp1[9],  pp2[8],  pp3[7],  s1,  c1);
fa fa2  (pp2[9],  pp3[8],  pp4[7],  s2,  c2);
fa fa3  (pp3[9],  pp4[8],  pp5[7],  s3,  c3);
fa fa4  (pp4[9],  pp5[8],  pp6[7],  s4,  c4);
fa fa5  (pp5[9],  pp6[8],  pp7[7],  s5,  c5);
fa fa6  (pp6[9],  pp7[8],  pp8[7],  s6,  c6);
fa fa7  (pp7[9],  pp8[8],  pp9[7],  s7,  c7);
fa fa8  (pp8[9],  pp9[8],  pp10[7], s8,  c8);
fa fa9  (pp9[9],  pp10[8], pp11[7], s9,  c9);
fa fa10 (pp10[9], pp11[8], pp12[7], s10, c10);
ha ha11 (pp13[6], pp14[5], s11, c11);
fa fa12 (pp11[9], pp12[8], pp13[7], s12, c12);
ha ha13 (pp0[6], pp1[5], s13, c13);
fa fa14 (pp0[7], pp1[6], pp2[5], s14, c14);
ha ha15 (pp3[4], pp4[3], s15, c15);
fa fa16 (pp0[8], pp1[7], pp2[6], s16, c16);
fa fa17 (pp3[5], pp4[4], pp5[3], s17, c17);
ha ha18 (pp6[2], pp7[1], s18, c18);
fa fa19 (pp3[6], pp4[5], pp5[4], s19, c19);
fa fa20 (pp6[3], pp7[2], pp8[1], s20, c20);
fa fa21 (pp9[0], 1'b1, s0, s21, c21);////////
fa fa22 (pp4[6], pp5[5], pp6[4], s22, c22);
fa fa23 (pp7[3], pp8[2], pp9[1], s23, c23);
fa fa24 (pp10[0], c0, s1, s24, c24);
fa fa25 (pp5[6], pp6[5], pp7[4], s25, c25);
fa fa26 (pp8[3], pp9[2], pp10[1], s26, c26);
fa fa27 (pp11[0], c1, s2, s27, c27);
fa fa28 (pp6[6], pp7[5], pp8[4], s28, c28);
fa fa29 (pp9[3], pp10[2], pp11[1], s29, c29);
fa fa30 (pp12[0], c2, s3, s30, c30);
fa fa31 (pp7[6], pp8[5], pp9[4], s31, c31);
fa fa32 (pp10[3], pp11[2], pp12[1], s32, c32);
fa fa33 (pp13[0], c3, s4, s33, c33);
fa fa34 (pp8[6], pp9[5], pp10[4], s34, c34);
fa fa35 (pp11[3], pp12[2], pp13[1], s35, c35);
fa fa36 (pp14[0], c4, s5, s36, c36);
fa fa37 (pp9[6], pp10[5], pp11[4], s37, c37);
fa fa38 (pp12[3], pp13[2], pp14[1], s38, c38);
fa fa39 (pp15[0], c5, s6, s39, c39);
fa fa40 (pp10[6], pp11[5], pp12[4], s40, c40);
fa fa41 (pp13[3], pp14[2], pp15[1], s41, c41);
fa fa42 (pp16[0], c6, s7, s42, c42);
fa fa43 (pp11[6], pp12[5], pp13[4], s43, c43);
fa fa44 (pp14[3], pp15[2], pp16[1], s44, c44);
fa fa45 (pp17[0], c7, s8, s45, c45);
fa fa46 (pp12[6], pp13[5], pp14[4], s46, c46);
fa fa47 (pp15[3], pp16[2], pp17[1], s47, c47);
fa fa48 (pp18[0], c8, s9, s48, c48);
fa fa49 (pp15[4], pp16[3], pp17[2], s49, c49);
fa fa50 (pp18[1], pp19[0], 1'b1, s50, c50);
fa fa51 (c9, s10, s11, s51, c51);
fa fa52 (pp14[6], pp15[5], pp16[4], s52, c52);
fa fa53 (pp17[3], pp18[2], pp19[1], s53, c53);
fa fa54 (c10, c11, s12, s54, c54);
fa fa55 (pp12[9], pp13[8], pp14[7], s55, c55);
fa fa56 (pp15[6], pp16[5], pp17[4], s56, c56);
fa fa57 (pp18[3], pp19[2], c12, s57, c57);
fa fa58 (pp13[9], pp14[8], pp15[7], s58, c58);
fa fa59 (pp16[6], pp17[5], pp18[4], s59, c59);
fa fa60 (pp14[9], pp15[8], pp16[7], s60, c60);
ha ha61 (pp0[4], pp1[3], s61, c61);
fa fa62 (pp0[5], pp1[4], pp2[3], s62, c62);
ha ha63 (pp3[2], pp4[1], s63, c63);
fa fa64 (pp2[4], pp3[3], pp4[2], s64, c64);
fa fa65 (pp5[1], pp6[0], s13, s65, c65);
fa fa66 (pp5[2], pp6[1], pp7[0], s66, c66);
fa fa67 (c13, s14, s15, s67, c67);
fa fa68 (pp8[0], c14, c15, s68, c68);
fa fa69 (s16, s17, s18, s69, c69);
fa fa70 (c16, c17, c18, s70, c70);
fa fa71 (s19, s20, s21, s71, c71);
fa fa72 (c19, c20, c21, s72, c72);
fa fa73 (s22, s23, s24, s73, c73);
fa fa74 (c22, c23, c24, s74, c74);
fa fa75 (s25, s26, s27, s75, c75);
fa fa76 (c25, c26, c27, s76, c76);
fa fa77 (s28, s29, s30, s77, c77);
fa fa78 (c28, c29, c30, s78, c78);
fa fa79 (s31, s32, s33, s79, c79);
fa fa80 (c31, c32, c33, s80, c80);
fa fa81 (s34, s35, s36, s81, c81);
fa fa82 (c34, c35, c36, s82, c82);
fa fa83 (s37, s38, s39, s83, c83);
fa fa84 (c37, c38, c39, s84, c84);
fa fa85 (s40, s41, s42, s85, c85);
fa fa86 (c40, c41, c42, s86, c86);
fa fa87 (s43, s44, s45, s87, c87);
fa fa88 (c43, c44, c45, s88, c88);
fa fa89 (s46, s47, s48, s89, c89);
fa fa90 (c46, c47, c48, s90, c90);
fa fa91 (s49, s50, s51, s91, c91);
fa fa92 (c49, c50, c51, s92, c92);
fa fa93 (s52, s53, s54, s93, c93);
fa fa94 (c52, c53, c54, s94, c94);
fa fa95 (s55, s56, s57, s95, c95);
fa fa96 (pp19[3], c55, c56, s96, c96);
fa fa97 (c57, s58, s59, s97, c97);
fa fa98 (pp17[6], pp18[5], pp19[4], s98, c98);
fa fa99 (c58, c59, s60, s99, c99);
fa fa100 (pp15[9], pp16[8], pp17[7], s100, c100);
fa fa101 (pp18[6], pp19[5], c60, s101, c101);
fa fa102 (pp16[9], pp17[8], pp18[7], s102, c102);
ha ha103 (pp0[3], pp1[2], s103, c103);
fa fa104 (pp2[2], pp3[1], pp4[0], s104, c104);
fa fa105 (pp5[0], c61, s62, s105, c105);
fa fa106 (c62, c63, s64, s106, c106);
fa fa107 (c64, c65, s66, s107, c107);
fa fa108 (c66, c67, s68, s108, c108);
fa fa109 (c68, c69, s70, s109, c109);
fa fa110 (c70, c71, s72, s110, c110);
fa fa111 (c72, c73, s74, s111, c111);
fa fa112 (c74, c75, s76, s112, c112);
fa fa113 (c76, c77, s78, s113, c113);
fa fa114 (c78, c79, s80, s114, c114);
fa fa115 (c80, c81, s82, s115, c115);
fa fa116 (c82, c83, s84, s116, c116);
fa fa117 (c84, c85, s86, s117, c117);
fa fa118 (c86, c87, s88, s118, c118);
fa fa119 (c88, c89, s90, s119, c119);
fa fa120 (c90, c91, s92, s120, c120);
fa fa121 (c92, c93, s94, s121, c121);
fa fa122 (c94, c95, s96, s122, c122);
fa fa123 (c96, c97, s98, s123, c123);
fa fa124 (c98, c99, s100, s124, c124);
fa fa125 (pp19[6], c100, c101, s125, c125);
fa fa126 (pp17[9], pp18[8], pp19[7], s126, c126);
ha ha127 (pp0[2], pp1[1], s127, c127);
fa fa128 (pp2[1], pp3[0], s103, s128, c128);
fa fa129 (s61, c103, s104, s129, c129);
fa fa130 (s63, c104, s105, s130, c130);
fa fa131 (s65, c105, s106, s131, c131);
fa fa132 (s67, c106, s107, s132, c132);
fa fa133 (s69, c107, s108, s133, c133);
fa fa134 (s71, c108, s109, s134, c134);
fa fa135 (s73, c109, s110, s135, c135);
fa fa136 (s75, c110, s111, s136, c136);
fa fa137 (s77, c111, s112, s137, c137);
fa fa138 (s79, c112, s113, s138, c138);
fa fa139 (s81, c113, s114, s139, c139);
fa fa140 (s83, c114, s115, s140, c140);
fa fa141 (s85, c115, s116, s141, c141);
fa fa142 (s87, c116, s117, s142, c142);
fa fa143 (s89, c117, s118, s143, c143);
fa fa144 (s91, c118, s119, s144, c144);
fa fa145 (s93, c119, s120, s145, c145);
fa fa146 (s95, c120, s121, s146, c146);
fa fa147 (s97, c121, s122, s147, c147);
fa fa148 (s99, c122, s123, s148, c148);
fa fa149 (s101, c123, s124, s149, c149);
fa fa150 (s102, c124, s125, s150, c150);
fa fa151 (c102, c125, s126, s151, c151);
fa fa152 (pp18[9], pp19[8], c126, s152, c152);

    
assign result[0] = pp0[0];
assign addin1 = {1'b1, pp19[9], c151, c150, c149, c148, c147, c146, c145, c144, c143, c142, c141, c140, c139, c138, c137, c136, c135, c134, c133, c132, c131, c130, c129, c128, c127, pp2[0], pp0[1] };
assign addin2 = {1'b0, c152, s152, s151, s150, s149, s148, s147, s146, s145, s144, s143, s142, s141, s140, s139, s138, s137, s136, s135, s134, s133, s132, s131, s130, s129, s128, s127, pp1[0] };
BK_29 final_adder (addin1, addin2, adder_result );
assign result[29:1] = adder_result[28:0];
endmodule


















