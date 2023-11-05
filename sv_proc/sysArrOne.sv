module sysArrOne(
	input [31:0] num1,
	input [31:0] num2,
	input r,
	
	output [31:0] output_x,
	output [31:0] output_y,
	output [31:0] calc
);
		
	logic [31:0] sum;
	logic [31:0] sum2;
	MAC m0(num1, num2, sum, sum2);
		
	
	always @ (*) begin
		sum = r ? 32'b0 : sum2;
		output_x = num1;
		output_y = num2;
		calc = sum2;
	end

endmodule