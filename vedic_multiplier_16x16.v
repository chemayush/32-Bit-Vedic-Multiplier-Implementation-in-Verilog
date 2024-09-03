module vedic_multiplier_16x16(a, b, result_16x16);
	input[15:0] a, b;
	output[31:0] result_16x16;
	
	wire[15:0] q0, q1, q2, q3;
	wire[15:0] w0, w1;
	wire[23:0] w2, w3, w4, w5, w6;
	
	vedic_multiplier_8x8 v8_0(a[7:0], b[7:0], q0[15:0]);
	vedic_multiplier_8x8 v8_1(a[7:0], b[15:8], q1[15:0]);
	vedic_multiplier_8x8 v8_2(a[15:8], b[7:0], q2[15:0]);
	vedic_multiplier_8x8 v8_3(a[15:8], b[15:8], q3[15:0]);
	
   assign w0[15:0] = {8'b0, q0[15:8]};
	add16b a16_0(w0, q1, w1);
	assign w2 = {8'b0, q2[15:0]};
	assign w3 = {q3[15:0], 8'b0};
	add24b a24_0(w2, w3, w4);
	
	assign w5 = {8'b0, w1[15:0]};
	add24b a24_1(w4, w5, w6);
	
	assign result_16x16[31:8] = w6[23:0];
	assign result_16x16[7:0] = q0[7:0];

endmodule
