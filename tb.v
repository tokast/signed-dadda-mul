//module tb;
//
//// Inputs
//reg signed [9:0] a;
//reg signed [19:0] b;
//
//// Outputs
//wire signed [29:0] p;
//
//// Intermediate signals
//wire [19:0] d6row1;
//wire [20:1] d6row2;
//wire [21:2] d6row3;
//wire [22:3] d6row4;
//wire [23:4] d6row5;
//wire [24:5] d6row6;
//wire [25:6] d6row7;
//wire [26:7] d6row8;
//wire [27:8] d6row9;
//wire [28:9] d6row10;
//wire [21:0] d5row1;
//wire [21:1] d5row2;
//wire [22:2] d5row3;
//wire [23:3] d5row4;
//wire [24:4] d5row5;
//wire [25:5] d5row6;
//wire [26:6] d5row7;
//wire [27:7] d5row8;
//wire [28:8] d5row9;
//wire [28:0] d4row1;
//wire [27:1] d4row2;
//wire [26:2] d4row3;
//wire [25:3] d4row4;
//wire [24:4] d4row5;
//wire [24:5] d4row6;
//wire [28:0] d3row1;
//wire [27:1] d3row2;
//wire [26:2] d3row3;
//wire [26:3] d3row4;
//wire [28:0] d2row1;
//wire [27:1] d2row2;
//wire [27:2] d2row3;
//wire [28:0] d1row1;
//wire [28:1] d1row2;
//wire [28:21] d1row3;
//
//// Expected values
//reg signed [29:0] expected_p;
//
//// Test counter and error flag
//integer test_count;
//integer error_count;
//
//// Instantiate the Dadda multiplier
//dadda_multiplier_20x10bits_signed dut (
//    .a(a),
//    .b(b),
//    .p(p),
//    .d6row1(d6row1), .d6row2(d6row2), .d6row3(d6row3), .d6row4(d6row4), .d6row5(d6row5),
//    .d6row6(d6row6), .d6row7(d6row7), .d6row8(d6row8), .d6row9(d6row9), .d6row10(d6row10),
//    .d5row1(d5row1), .d5row2(d5row2), .d5row3(d5row3), .d5row4(d5row4), .d5row5(d5row5),
//    .d5row6(d5row6), .d5row7(d5row7), .d5row8(d5row8), .d5row9(d5row9),
//    .d4row1(d4row1), .d4row2(d4row2), .d4row3(d4row3), .d4row4(d4row4), .d4row5(d4row5), .d4row6(d4row6),
//    .d3row1(d3row1), .d3row2(d3row2), .d3row3(d3row3), .d3row4(d3row4),
//    .d2row1(d2row1), .d2row2(d2row2), .d2row3(d2row3),
//    .d1row1(d1row1), .d1row2(d1row2),.d1row3(d1row3)
//);
//
//// Initial block for test setup and execution
//initial begin
//    // Initialize test counters
//    test_count = 0;
//    error_count = 0;
//
//    // Display header
//    $display("Starting Testbench for 20x10-bit Signed Dadda Multiplier");
//    $display("-----------------------------------------------------");
//    $display("Test# | A (Dec)    | B (Dec)       | Expected P (Dec) | Actual P (Dec) | Status | Bit Errors | Problematic Layer");
//    $display("-----------------------------------------------------");
//
//    // Test Case 1: Positive × Positive (Failing case)
//    a = 10'd255;
//    b = 20'd20897;
//    test_count = test_count + 1;
//    #10;
//    expected_p = 30'd5328735; // 255 * 20897 = 5328735
//    check_result();
//
//    // Summary
//    $display("-----------------------------------------------------");
//    $display("Test Summary: %0d tests run, %0d errors found", test_count, error_count);
//    if (error_count == 0) begin
//        $display("All tests passed successfully!");
//    end else begin
//        $display("Some tests failed. Please check the errors.");
//    end
//
//    // Finish simulation
//    #10;
//    $stop;
//end
//
//// Task to check results and trace the error
//task check_result;
//    integer i, j;
//    reg [29:0] bit_diff;
//    reg [29:0] expected_row1, expected_row2;
//    reg error_found;
//    integer problematic_layer;
//begin
//    if (p !== expected_p) begin
//        bit_diff = p ^ expected_p; // XOR to find differing bits
//        error_found = 0;
//        problematic_layer = 0;
//
//        // Initialize expected values for d1 rows based on multiplication
//        expected_row1 = 0;
//        expected_row2 = 0;
//        for (i = 0; i < 10; i = i + 1) begin
//            for (j = 0; j < 20; j = j + 1) begin
//                if (a[i] & b[j]) begin
//                    if (i == 9) expected_row1 = expected_row1 | (30'h3FFFFF & (b << i));
//                    else expected_row1 = expected_row1 | (30'h1FFFFF & (b << i));
//                end
//            end
//        end
//        expected_row2 = expected_row1; // Simplified for positive case, adjust for reduction
//
//        $display("%0d     | %0d      | %0d        | %0d         | %0d       | FAIL  | ", 
//                 test_count, a, b, expected_p, p);
//        for (i = 0; i < 30; i = i + 1) begin
//            if (bit_diff[i]) begin
//                $display("Bit %0d is incorrect", i);
//            end
//        end
//
//        if (d6row6[15] != (a[5] & b[10]) || d6row7[16] != (a[6] & b[10]) ||
//            d6row8[17] != (a[7] & b[10]) || d6row9[18] != (a[8] & b[10]) ||
//            d6row10[19] != (a[9] & b[10]) || d6row5[14] != (a[4] & b[10]) ||
//            d6row4[13] != (a[3] & b[10]) || d6row3[12] != (a[2] & b[10]) ||
//            d6row2[11] != (a[1] & b[10]) || d6row1[10] != (a[0] & b[10])) begin
//            problematic_layer = 6; // d6 layer
//            error_found = 1;
//        end else if (d5row1[10] != expected_row1[10] 
//	               || d5row2[10] != expected_row2[10] 
//
//                    ||d5row3[10] != expected_row2[10] 
//						  //|| d5row4[10] != 0 
//						  //|| d5row5[10] != 0 || d5row6[10] != 0 
////                     ||d5row7[10] != 0 || d5row8[10] != 0 || d5row9[10] != 0 ||
////                     d5row1[11] != expected_row1[11] || d5row2[11] != expected_row2[11] ||
////                     d5row3[11] != 0 || d5row4[11] != 0 || d5row5[11] != 0 || d5row6[11] != 0 ||
////                     d5row7[11] != 0 || d5row8[11] != 0 || d5row9[11] != 0 ||
////                     d5row1[12] != expected_row1[12] || d5row2[12] != expected_row2[12] ||
////                     d5row3[12] != 0 || d5row4[12] != 0 || d5row5[12] != 0 || d5row6[12] != 0 ||
////                     d5row7[12] != 0 || d5row8[12] != 0 || d5row9[12] != 0
//                      ) 
//            begin
//            problematic_layer = 5; // d5 layer
//            error_found = 1;
//        end else if (d4row1[10] != expected_row1[10] || d4row2[10] != expected_row2[10] ||
//                     d4row3[10] != 0 || d4row4[10] != 0 || d4row5[10] != 0 || d4row6[10] != 0 ||
//                     d4row1[11] != expected_row1[11] || d4row2[11] != expected_row2[11] ||
//                     d4row3[11] != 0 || d4row4[11] != 0 || d4row5[11] != 0 || d4row6[11] != 0 ||
//                     d4row1[12] != expected_row1[12] || d4row2[12] != expected_row2[12] ||
//                     d4row3[12] != 0 || d4row4[12] != 0 || d4row5[12] != 0 || d4row6[12] != 0) begin
//            problematic_layer = 4; // d4 layer
//            error_found = 1;
//        end else if (d3row1[10] != expected_row1[10] || d3row2[10] != expected_row2[10] ||
//                     d3row3[10] != 0 || d3row4[10] != 0 || d3row1[11] != expected_row1[11] ||
//                     d3row2[11] != expected_row2[11] || d3row3[11] != 0 || d3row4[11] != 0 ||
//                     d3row1[12] != expected_row1[12] || d3row2[12] != expected_row2[12] ||
//                     d3row3[12] != 0 || d3row4[12] != 0) begin
//            problematic_layer = 3; // d3 layer
//            error_found = 1;
//        end else if (d2row1[10] != expected_row1[10] || d2row2[10] != expected_row2[10] ||
//                     d2row3[10] != 0 || d2row1[11] != expected_row1[11] || d2row2[11] != expected_row2[11] ||
//                     d2row3[11] != 0 || d2row1[12] != expected_row1[12] || d2row2[12] != expected_row2[12] ||
//                     d2row3[12] != 0) begin
//            problematic_layer = 2; // d2 layer
//            error_found = 1;
//        end else if (d1row1[10] != expected_row1[10] || d1row2[10] != expected_row2[10] ||
//                     d1row1[11] != expected_row1[11] || d1row2[11] != expected_row2[11] ||
//                     d1row1[12] != expected_row1[12] || d1row2[12] != expected_row2[12]) begin
//            problematic_layer = 1; // d1 layer
//            error_found = 1;
//        end
//
//        if (problematic_layer > 0) begin
//            $display("Problematic Layer: d%d", problematic_layer);
//        end else begin
//            $display("Problematic Layer: Final Addition");
//        end
//        error_count = error_count + 1;
//    end else begin
//        $display("%0d     | %0d      | %0d        | %0d         | %0d       | PASS  |         | ",
//                 test_count, a, b, expected_p, p);
//    end
//end
//endtask
//
//endmodule






module tb;

// Inputs
reg  [9:0] a;
reg  [19:0] b;

// Outputs
wire [29:0] p;

// Expected values
reg  [29:0] expected_p;

// Test counter and error flag
integer test_count;
integer error_count;

// Instantiate the Dadda multiplier
dm_20x10 dut (
    .IN1(b),
    .IN2(a),
    .result(p)
);

// Initial block for test setup and execution
initial begin
    // Initialize test counters
    test_count = 0;
    error_count = 0;

    // Display header
    $display("Starting Testbench for 20x10-bit Signed Dadda Multiplier");
    $display("-----------------------------------------------------");
    $display("Test# | A (Dec)    | B (Dec)       | Expected P (Dec) | Actual P (Dec) | Status | Bit Errors");
    $display("-----------------------------------------------------");

    // Test Case 1: Positive × Positive (Small numbers)
    a = -10'd5;
    b = 20'd10;
    test_count = test_count + 1;
    #10;
    expected_p = -30'd50; // 5 * 10 = 50
    check_result();
	 
	  a = 10'd5;
    b = -20'd10;
    test_count = test_count + 1;
    #10;
    expected_p = -30'd50; // 5 * 10 = 50
    check_result();
	 
	  a = -10'd5;
    b = -20'd10;
    test_count = test_count + 1;
    #10;
    expected_p = 30'd50; // 5 * 10 = 50
    check_result();

    // Test Case 2: Zero × Any number
    a = 10'd1;
    b = 20'd12345;
    test_count = test_count + 1;
    #10;
    expected_p = 30'd12345; // 0 * 12345 = 0
    check_result();

    // Test Case 3: Maximum positive × Maximum positive
    a = 10'd511; // 2^9 - 1
    b = 20'd524287; // 2^19 - 1
    test_count = test_count + 1;
    #10;
    expected_p = 30'd267910657; // 511 * 524287 = 267910657
    check_result();

    // Test Case 4: Random positive × Random positive
    a = 10'd123;
    b = 20'd45678;
    test_count = test_count + 1;
    #10;
    expected_p = 30'd5618394; // 123 * 45678 = 5618394
    check_result();

    // Test Case 5: Edge case (1 × 1)
    a = 10'd19;
    b = 20'd7888;
    test_count = test_count + 1;
    #10;
    expected_p = 30'd149872; // 19 * 7888 = 149872
    check_result();
	 
	  a = 10'd15;
    b = 20'd13;
    test_count = test_count + 1;
    #10;
    expected_p = 30'd195; // 5 * 10 = 50
    check_result();
	 
	  a = 10'd115;
    b = 20'd109;
    test_count = test_count + 1;
    #10;
    expected_p = 30'd12535; // 5 * 10 = 50
    check_result();
	 
	  a = 10'd255;
    b = 20'd20897;
    test_count = test_count + 1;
    #10;
    expected_p = 30'd5328735; // 5 * 10 = 50
    check_result();
	 
	 	  a = -10'd512;
    b = 20'd20897;
    test_count = test_count + 1;
    #10;
    expected_p = -30'd10699264; // 5 * 10 = 50
    check_result();
	 
	 	  a = -10'd512;//-1
    b = -20'd524288;//-1
    test_count = test_count + 1;
    #10;
    expected_p = 30'd268435456; // 5 * 10 = 50
    check_result();
	 
	 	  a = 10'd511;
    b = 20'd524287;
    test_count = test_count + 1;
    #10;
    expected_p = 30'd267910657; // 5 * 10 = 50
    check_result();
	 
	 	  a = 10'd498;
    b = -20'd404857;
    test_count = test_count + 1;
    #10;
    expected_p = -30'd201618786; // 5 * 10 = 50
    check_result();
	 
	 
	 // Test Case 5: Maximum positive × Maximum positive
    a = 10'd511; // 2^9 - 1
    b = -20'd514287; // 2^19 - 1
    test_count = test_count + 1;
    #10;
    expected_p = -30'd262800657; // 511 * 524287 = 267915457
    check_result();
	 
	 

    // Summary
    $display("-----------------------------------------------------");
    $display("Test Summary: %0d tests run, %0d errors found", test_count, error_count);
    if (error_count == 0) begin
        $display("All tests passed successfully!");
    end else begin
        $display("Some tests failed. Please check the errors.");
    end

    // Finish simulation
    #10;
    $stop;
end

// Task to check results and report
task check_result;
    integer i;
    reg [29:0] bit_diff;
begin
    if (p !== expected_p) begin
        bit_diff = p ^ expected_p; // XOR to find differing bits
        $display("%0d     | %0d      | %0d        | %0d         | %0d       | FAIL  | ", 
                 test_count, a, b, expected_p, p);
        for (i = 0; i < 30; i = i + 1) begin
            if (bit_diff[i]) begin
                $display("Bit %0d is incorrect", i);
            end
        end
        error_count = error_count + 1;
    end else begin
        $display("%0d     | %0d      | %0d        | %0d         | %0d       | PASS  | ",
                 test_count, a, b, expected_p, p);
    end
end
endtask

endmodule


















//module tb;
//
//// Inputs
//reg signed [9:0] a;
//reg signed [9:0] b;
//
//// Outputs
//wire signed [19:0] p;
//
//// Expected values
//reg signed [19:0] expected_p;
//
//// Test counter and error flag
//integer test_count;
//integer error_count;
//
//// Instantiate the Dadda multiplier
//dadda_multiplier_10x10bits_signed dut (
//    .a(a),
//    .b(b),
//    .p(p)
//);
//
//// Initial block for test setup and execution
//initial begin
//    // Initialize test counters
//    test_count = 0;
//    error_count = 0;
//
//    // Display header
//    $display("Starting Testbench for 20x10-bit Signed Dadda Multiplier");
//    $display("-----------------------------------------------------");
//    $display("Test# | A (Dec)    | B (Dec)       | Expected P (Dec) | Actual P (Dec) | Status");
//    $display("-----------------------------------------------------");
//
//    // Test Case 1: Positive × Positive (Small numbers)
//    a = 10'd5;
//    b = 10'd10;
//    test_count = test_count + 1;
//    #10;
//    expected_p = 20'd50; // 5 * 10 = 50
//    check_result();
//
//    // Test Case 2: Negative × Negative (Small numbers)
//    a = -10'd5;
//    b = -10'd10;
//    test_count = test_count + 1;
//    #10;
//    expected_p = 20'd50; // (-5) * (-10) = 50
//    check_result();
//
//    // Test Case 3: Positive × Negative (Small numbers)
//    a = 10'd5;
//    b = -10'd10;
//    test_count = test_count + 1;
//    #10;
//    expected_p = -20'd50; // 5 * (-10) = -50
//    check_result();
//
////    // Test Case 4: Zero × Any number
////    a = 10'd0;
////    b = 10'd12345;
////    test_count = test_count + 1;
////    #10;
////    expected_p = 30'd0; // 0 * 12345 = 0
////    check_result();
////
////    // Test Case 5: Maximum positive × Maximum positive
////    a = 10'd511; // 2^9 - 1
////    b = 20'd524287; // 2^19 - 1
////    test_count = test_count + 1;
////    #10;
////    expected_p = 30'd267915457; // 511 * 524287 = 267915457
////    check_result();
////
////    // Test Case 6: Minimum negative × Minimum negative
////    a = -10'd512; // -2^9
////    b = -20'd524288; // -2^19
////    test_count = test_count + 1;
////    #10;
////    expected_p = 30'h10000000; // (-512) * (-524288) = 268435456 = 2^28
////    check_result();
////
////    // Test Case 7: Maximum positive × Minimum negative
////    a = 10'd511;
////    b = -20'd524288;
////    test_count = test_count + 1;
////    #10;
////    expected_p = -30'd267915008; // 511 * (-524288) = -267915008
////    check_result();
////
////    // Test Case 8: Random positive × Random positive
////    a = 10'd123;
////    b = 20'd45678;
////    test_count = test_count + 1;
////    #10;
////    expected_p = 30'd5618394; // 123 * 45678 = 5618394
////    check_result();
////
////    // Test Case 9: Random negative × Random positive
////    a = -10'd234;
////    b = 20'd56789;
////    test_count = test_count + 1;
////    #10;
////    expected_p = -30'd13288626; // (-234) * 56789 = -13288626
////    check_result();
//
//    // Test Case 10: Edge case (1 × 1)
//    a = 10'd1;
//    b = 10'd1;
//    test_count = test_count + 1;
//    #10;
//    expected_p = 20'd1; // 1 * 1 = 1
//    check_result();
//
//    // Test Case 11: Edge case (-1 × -1)
//    a = -10'd1;
//    b = -10'd1;
//    test_count = test_count + 1;
//    #10;
//    expected_p = 20'd1; // (-1) * (-1) = 1
//    check_result();
//
//    // Test Case 12: Edge case (1 × -1)
//    a = 10'd1;
//    b = -10'd1;
//    test_count = test_count + 1;
//    #10;
//    expected_p = -20'd1; // 1 * (-1) = -1
//    check_result();
//
//    // Test Case 13: Another random test
//    a = 10'd300;
//    b = -10'd2;
//    test_count = test_count + 1;
//    #10;
//    expected_p = -20'd600; // 300 * (-40000) = -12000000
//    check_result();
//
////    // Test Case 14: Maximum positive × Small negative
////    a = 10'd511;
////    b = -20'd5;
////    test_count = test_count + 1;
////    #10;
////    expected_p = -30'd2555; // 511 * (-5) = -2555
////    check_result();
////
////    // Test Case 15: Minimum negative × Small positive
////    a = -10'd512;
////    b = 20'd10;
////    test_count = test_count + 1;
////    #10;
////    expected_p = -30'd5120; // (-512) * 10 = -5120
////    check_result();
//
//    // Summary
//    $display("-----------------------------------------------------");
//    $display("Test Summary: %0d tests run, %0d errors found", test_count, error_count);
//    if (error_count == 0) begin
//        $display("All tests passed successfully!");
//    end else begin
//        $display("Some tests failed. Please check the errors.");
//    end
//
//    // Finish simulation
//    $finish;
//end
//
//// Task to check results and report
//task check_result;
//begin
//    if (p !== expected_p) begin
//        $display("%0d     | %0d      | %0d        | %0d         | %0d       | FAIL",
//                 test_count, a, b, expected_p, p);
//        error_count = error_count + 1;
//    end else begin
//        $display("%0d     | %0d      | %0d        | %0d         | %0d       | PASS",
//                 test_count, a, b, expected_p, p);
//    end
//end
//endtask
//
//endmodule
















//module tb;
//
//// Inputs
//reg signed [9:0] a;
//reg signed [19:0] b;
//
//// Outputs
//wire signed [29:0] p;
//
//// Expected values
//reg signed [29:0] expected_p;
//
//// Test counter and error flag
//integer test_count;
//integer error_count;
//
//// Instantiate the Dadda multiplier
//dadda_multiplier_20x10bits_signed dut (
//    .a(a),
//    .b(b),
//    .p(p)
//);
//
//// Initial block for test setup and execution
//initial begin
//    // Initialize test counters
//    test_count = 0;
//    error_count = 0;
//
//    // Display header
//    $display("Starting Testbench for 20x10-bit Signed Dadda Multiplier");
//    $display("-----------------------------------------------------");
//    $display("Test# | A (Dec)    | B (Dec)       | Expected P (Dec) | Actual P (Dec) | Status");
//    $display("-----------------------------------------------------");
//
//    // Test Case 1: Positive × Positive (Small numbers)
//    a = 10'd5;
//    b = 20'd10;
//    test_count = test_count + 1;
//    #10;
//    expected_p = 30'd50; // 5 * 10 = 50
//    check_result();
//
////    // Test Case 2: Negative × Negative (Small numbers)
////    a = -10'd5;
////    b = -20'd10;
////    test_count = test_count + 1;
////    #10;
////    expected_p = 30'd50; // (-5) * (-10) = 50
////    check_result();
//
////    // Test Case 3: Positive × Negative (Small numbers)
////    a = 10'd5;
////    b = -20'd10;
////    test_count = test_count + 1;
////    #10;
////    expected_p = -30'd50; // 5 * (-10) = -50
////    check_result();
//
//    // Test Case 4: Zero × Any number
//    a = 10'd1;
//    b = 20'd12345;
//    test_count = test_count + 1;
//    #10;
//    expected_p = 30'd12345; // 0 * 12345 = 0
//    check_result();
//
//    // Test Case 5: Maximum positive × Maximum positive
//    a = 10'd511; // 2^9 - 1
//    b = 20'd524287; // 2^19 - 1
//    test_count = test_count + 1;
//    #10;
//    expected_p = 30'd267910657; // 511 * 524287 = 267915457
//    check_result();
//
////    // Test Case 6: Minimum negative × Minimum negative
////    a = -10'd512; // -2^9
////    b = -20'd524288; // -2^19
////    test_count = test_count + 1;
////    #10;
////    expected_p = 30'h10000000; // (-512) * (-524288) = 268435456 = 2^28
////    check_result();
//
////    // Test Case 7: Maximum positive × Minimum negative
////    a = 10'd511;
////    b = -20'd524288;
////    test_count = test_count + 1;
////    #10;
////    expected_p = -30'd267915008; // 511 * (-524288) = -267915008
////    check_result();
//
//    // Test Case 8: Random positive × Random positive
//    a = 10'd123;
//    b = 20'd45678;
//    test_count = test_count + 1;
//    #10;
//    expected_p = 30'd5618394; // 123 * 45678 = 5618394
//    check_result();
////
////    // Test Case 9: Random negative × Random positive
////    a = -10'd234;
////    b = 20'd56789;
////    test_count = test_count + 1;
////    #10;
////    expected_p = -30'd13288626; // (-234) * 56789 = -13288626
////    check_result();
//
//    // Test Case 10: Edge case (1 × 1)
//    a = 10'd19;
//    b = 20'd7888;
//    test_count = test_count + 1;
//    #10;
//    expected_p = 30'd149872; // 1 * 1 = 1
//    check_result();
//
////    // Test Case 11: Edge case (-1 × -1)
////    a = -10'd1;
////    b = -20'd1;
////    test_count = test_count + 1;
////    #10;
////    expected_p = 30'd1; // (-1) * (-1) = 1
////    check_result();
//
////    // Test Case 12: Edge case (1 × -1)
////    a = 10'd1;
////    b = -20'd1;
////    test_count = test_count + 1;
////    #10;
////    expected_p = -30'd1; // 1 * (-1) = -1
////    check_result();
////
////    // Test Case 13: Another random test
////    a = 10'd300;
////    b = -20'd40000;
////    test_count = test_count + 1;
////    #10;
////    expected_p = -30'd12000000; // 300 * (-40000) = -12000000
////    check_result();
////
////    // Test Case 14: Maximum positive × Small negative
////    a = 10'd511;
////    b = -20'd5;
////    test_count = test_count + 1;
////    #10;
////    expected_p = -30'd2555; // 511 * (-5) = -2555
////    check_result();
////
////    // Test Case 15: Minimum negative × Small positive
////    a = -10'd512;
////    b = 20'd10;
////    test_count = test_count + 1;
////    #10;
////    expected_p = -30'd5120; // (-512) * 10 = -5120
////    check_result();
//
//    // Summary
//    $display("-----------------------------------------------------");
//    $display("Test Summary: %0d tests run, %0d errors found", test_count, error_count);
//    if (error_count == 0) begin
//        $display("All tests passed successfully!");
//    end else begin
//        $display("Some tests failed. Please check the errors.");
//    end
//
//    // Finish simulation
//	 #10;
//    $stop;
//end
//
//// Task to check results and report
//task check_result;
//begin
//    if (p !== expected_p) begin
//        $display("%0d     | %0d      | %0d        | %0d         | %0d       | FAIL",
//                 test_count, a, b, expected_p, p);
//        error_count = error_count + 1;
//    end else begin
//        $display("%0d     | %0d      | %0d        | %0d         | %0d       | PASS",
//                 test_count, a, b, expected_p, p);
//    end
//end
//endtask
//
//endmodule