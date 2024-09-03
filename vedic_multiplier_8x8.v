module vedic_multiplier_2x2(a, b, result_2x2);
	input[1:0] a, b;
	output[3:0] result_2x2;
	wire[3:0] temp;
	
	assign result_2x2[0] = a[0] & b[0];
	assign temp[0] = a[0] & b[1];
	assign temp[1] = a[1] & b[0];
	assign temp[2] = a[1] & b[1];
	
	half_adder h1(temp[0], temp[1], result_2x2[1], temp[3]);
	half_adder h2(temp[2], temp[3], result_2x2[2], result_2x2[3]);
endmodule

//-----------------------------------------

module vedic_multiplier_4x4(a, b, result_4x4);
	input[3:0] a, b;
	output[7:0] result_4x4;
	
	wire[3:0] q0, q1, q2, q3, w0, w1;
	wire[5:0] w2, w3, w4, w5, w6;
	
	vedic_multiplier_2x2 v2_0(a[1:0], b[1:0], q0[3:0]);
	vedic_multiplier_2x2 v2_1(a[1:0], b[3:2], q1[3:0]);
	vedic_multiplier_2x2 v2_2(a[3:2], b[1:0], q2[3:0]);
	vedic_multiplier_2x2 v2_3(a[3:2], b[3:2], q3[3:0]);
	
	assign w0[3:0] = {2'b0, q0[3:2]};
	add4b a4_0(w0[3:0], q1[3:0], w1[3:0]);
	assign w2 = {2'b0, q2[3:0]};
	assign w3 = {q3[3:0], 2'b0};
	add6b a6_0(w2, w3, w4);
	
	assign w5 = {2'b0, w1[3:0]};
	add6b a6_1(w4, w5, w6);
	
	assign result_4x4[7:2] = w6[5:0];
	assign result_4x4[1:0] = q0[1:0];
endmodule

//-----------------------------------------

module vedic_multiplier_8x8(a, b, result_8x8);
	input[7:0] a, b;
	output[15:0] result_8x8;
	
	wire[15:0] q0, q1, q2, q3;
	wire[7:0] w0, w1;
	wire[11:0] w2, w3, w4, w5, w6;
	
	vedic_multiplier_4x4 v4_0(a[3:0], b[3:0], q0[15:0]);
	vedic_multiplier_4x4 v4_1(a[3:0], b[7:4], q1[15:0]);
	vedic_multiplier_4x4 v4_2(a[7:4], b[3:0], q2[15:0]);
	vedic_multiplier_4x4 v4_3(a[7:4], b[7:4], q3[15:0]);
	
   assign w0[7:0] = {4'b0, q0[7:4]};
	add8b a8_0(w0, q1, w1);
	assign w2 = {4'b0, q2[7:0]};
	assign w3 = {q3[7:0], 4'b0};
	add12b a12_0(w2, w3, w4);
	
	assign w5 = {4'b0, w1[7:0]};
	add12b a12_1(w4, w5, w6);
	
	assign result_8x8[15:4] = w6[11:0];
	assign result_8x8[3:0] = q0[3:0];

endmodule


