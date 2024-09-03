module vedic_multiplier_32x32(a, b, result_32x32);
	input[31:0] a, b;
	output[63:0] result_32x32;
	
	wire[31:0] q0, q1, q2, q3;
	wire[31:0] w0, w1;
	wire[47:0] w2, w3, w4, w5, w6;
	
	vedic_multiplier_16x16 v16_0(a[15:0], b[15:0], q0[31:0]);
	vedic_multiplier_16x16 v16_1(a[15:0], b[31:16], q1[31:0]);
	vedic_multiplier_16x16 v16_2(a[31:16], b[15:0], q2[31:0]);
	vedic_multiplier_16x16 v16_3(a[31:16], b[31:16], q3[31:0]);
	
   assign w0[31:0] = {16'b0, q0[31:16]};
	add32b a32_0(w0, q1, w1);
	assign w2 = {16'b0, q2[31:0]};
	assign w3 = {q3[31:0], 16'b0};
	add48b a48_0(w2, w3, w4);
	
	assign w5 = {16'b0, w1[31:0]};
	add48b a48_1(w4, w5, w6);
	
	assign result_32x32[63:16] = w6[47:0];
	assign result_32x32[15:0] = q0[15:0];

endmodule
