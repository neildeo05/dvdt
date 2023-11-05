module add (
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
	assign exp1 = in1[30:23];
	logic [7:0] exp2;
	assign exp2 = in2[30:23];

	logic [23:0] mantissa1;
	assign mantissa1 = {1, in1[22:0]};
	logic [23:0] mantissa2;
	assign mantissa2 = {1, in2[22:0]};
	logic [7:0] expC;
	logic signF;
	
	logic [23:0] addMants;

	
	always_comb begin
		if (exp1 >= exp2) begin
		expC = exp1; 
		mantissa2 = mantissa2 >> (exp1-exp2);
		end
	
	else if (exp2 > exp1) begin
		expC = exp2;
		mantissa1 = mantissa1 >> (exp2-exp1);
	end
	

	if (in1 [31] == 1'b1 && in2 [31] == 1'b0) begin
		addMants = mantissa1 - mantissa2;
		signF = (mantissa1 > mantissa2) ? 1'b1 : 1'b0;
	end 
	else if (in1 [31] == 1'b0 && in2 [31] == 1'b1) begin
		addMants = mantissa2 - mantissa1;
		signF = (mantissa2 > mantissa1) ? 1'b1 : 1'b0;
	end 
	else if (in1 [31] == 1'b0 && in2 [31] == 1'b0) begin
		addMants = mantissa1 + mantissa2;
		signF = 1'b0;
	end
	else begin
		addMants = mantissa1 + mantissa2;
		signF = 1'b1;
	end

	if (addMants [23] == 1'b1) begin 
		expC = expC + 1;
	end

	res = {signF, expC, addMants[22:0]};
	end

endmodule