module WaitQueue(
	input logic [15:0] [15:0] [31:0] inWeights,
	input logic [15:0] [31:0] inBiases,
	input logic contQ,
	
	
	output logic [15:0] [31:0] weight_vals,
	output logic [31:0] bias_val
);

int i;

assign i = 0;

always @ (posedge contQ) begin
	if(i == 16) begin
		i = 0;
	end
	
	weight_vals = inWeights[i];
	bias_val = inBiases[i];
	
	i++;
	
end

endmodule