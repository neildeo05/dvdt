module multiply (
	input [31:0] var1,
	input [31:0] var2,
	output [31:0] res
);

	logic [31:0] in1;
	logic [31:0] in2;
	logic [31:0] out;
	assign in1 = var1;
	assign in2 = var2;
	

	logic [7:0] exp1;
	
	logic [7:0] exp2;

	logic [23:0] mantissa1;
	logic [23:0] mantissa2; 
	logic [24:0] mantissaProd;
	logic [7:0] expC;
	logic signF;
	
	always @(*) begin
		exp1 = in1[30:23];
		exp2 = in2[30:23];
		mantissa1 = {1'b1, in1[22:0]};
		mantissa2 = {1'b1, in2[22:0]};
		
		signF = in1[31] ^ in2[31];
		expC = (exp1 - 8'b01111111) + (exp2 - 8'b01111111) + 8'b01111111;
		mantissaProd = mantissa1*mantissa2;
		if(mantissaProd[24] == 1) begin
			mantissaProd = mantissaProd >> 1;
			expC = expC + 1'b1;
		end
		res = {signF, expC, mantissaProd[22:0]};
	
	end
endmodule	