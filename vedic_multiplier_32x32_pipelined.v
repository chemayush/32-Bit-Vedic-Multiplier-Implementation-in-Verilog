module vedic_multiplier_32x32_pipelined(
    input clk,
    input [31:0] a, b,
    output reg [63:0] result_32x32
);

    wire [31:0] q0, q1, q2, q3;

    reg [31:0] q0_reg, q1_reg, q2_reg, q3_reg;
    reg [31:0] w0, w1_reg;
    
    reg [47:0] w2, w3, w4_reg, w5_reg, w6_reg;

    vedic_multiplier_16x16 v16_0(.a(a[15:0]), .b(b[15:0]), .result_16x16(q0));
    vedic_multiplier_16x16 v16_1(.a(a[15:0]), .b(b[31:16]), .result_16x16(q1));
    vedic_multiplier_16x16 v16_2(.a(a[31:16]), .b(b[15:0]), .result_16x16(q2));
    vedic_multiplier_16x16 v16_3(.a(a[31:16]), .b(b[31:16]), .result_16x16(q3));

    always @(posedge clk) begin
        q0_reg <= q0;
        q1_reg <= q1;
        q2_reg <= q2;
        q3_reg <= q3;
    end

    always @(posedge clk) begin
        w0 <= {16'b0, q0_reg[31:16]};
        w1_reg <= w0 + q1_reg;
    end

    always @(posedge clk) begin
        w2 <= {16'b0, q2_reg};
        w3 <= {q3_reg, 16'b0};
        w4_reg <= w2 + w3;
    end

    always @(posedge clk) begin
        w5_reg <= {16'b0, w1_reg};
        w6_reg <= w4_reg + w5_reg;
    end
	 
	 always @(posedge clk) begin
	     result_32x32[63:16] <= w6_reg;
        result_32x32[15:0] <= q0_reg[15:0];
	 end 

endmodule
