module MAC (
	input logic [31:0] num1,
	input logic [31:0] num2,
	input logic [31:0] num3,
	
	output logic [31:0] calcOut
);
	logic [31:0] tempOut;
	multiply m0(num1, num2, tempOut);
	add a0(tempOut, num3, calcOut);
	
endmodule