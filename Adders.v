module half_adder(a, b, sum, carry);
	input a, b;
	output sum, carry;
	assign sum = a^b;
	assign carry = a&b;
endmodule

module add4b(a,b,sum);
	input [3:0] a,b;
	output [3:0] sum;
	wire [3:0] sum;
	assign sum = a + b;
endmodule

module add6b(a, b, sum);
	input [5:0] a,b;
	output [5:0] sum;
	wire [5:0] sum;
	assign sum = a + b;
endmodule

module add8b(a,b,sum);
	input [7:0] a,b;
	output [7:0] sum;
	wire [7:0] sum;
	assign sum = a + b;
endmodule

module add12b(a,b,sum);
	input [11:0] a,b;
	output [11:0] sum;
	wire [11:0] sum;
	assign sum = a + b;
endmodule

module add16b(a,b,sum);
	input [15:0] a,b;
	output [15:0] sum;
	wire [15:0] sum;
	assign sum = a + b;
endmodule

module add24b(a,b,sum);
	input [23:0] a,b;
	output [23:0] sum;
	wire [23:0] sum;
	assign sum = a + b;
endmodule

module add32b(a,b,sum);
	input [31:0] a,b;
	output [31:0] sum;
	wire [31:0] sum;
	assign sum = a + b;
endmodule

module add48b (
    input [47:0] a,
    input [47:0] b,
    output [47:0] sum
);
    assign sum = a + b;
endmodule
