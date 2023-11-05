module Processor1 (
	input logic [15:0] [15:0] [31:0] inX, //A 4x4 matrix for each PB
	input logic [1:0] [15:0] [15:0] [31:0] inWeights, //A 4x4 matrix for each PB for each layer
	input logic [1:0] [15:0] [31:0] inBiases, //A bias value for each PB for each layer
	
	output logic [15:0] [15:0] [32:0] outMatrices//Output of 4x4 matrix for each PB
);

	logic [15:0] [15:0] [31:0] Xs; //Init X values then outputs from each layer
	logic contQ; //flag progressing the queue further
	logic [15:0] [15:0] [31:0] currWeights1; //current weights to pass into the PBs
	logic [15:0] [31:0] currBiases; //current biases to pass into the PBs
	int k; //loop iterator through the number of layers
	logic [15:0] V; //Tracker of whether the PBs are done with their matmuls or not.
	logic vAll; //sees if all of V is 1 or not.
	logic [15:0] [15:0] [31:0] temp_x; //Init X values then outputs from each layer

	
	assign Xs = (k)? temp_x : inX;
	
	PB p0(Xs[0], currWeights1[0], currBiases[0], temp_x[0], V[0]); 
	PB p1(Xs[1], currWeights1[1], currBiases[1], temp_x[1], V[1]);
	PB p2(Xs[2], currWeights1[2], currBiases[2], temp_x[2], V[2]); 
	PB p3(Xs[3], currWeights1[3], currBiases[3], temp_x[3], V[3]); 
	PB p4(Xs[4], currWeights1[4], currBiases[4], temp_x[4], V[4]); 
	PB p5(Xs[5], currWeights1[5], currBiases[5], temp_x[5], V[5]); 
	PB p6(Xs[6], currWeights1[6], currBiases[6], temp_x[6], V[6]); 
	PB p7(Xs[7], currWeights1[7], currBiases[7], temp_x[7], V[7]); 
	PB p8(Xs[8], currWeights1[8], currBiases[8], temp_x[8], V[8]); 
	PB p9(Xs[9], currWeights1[9], currBiases[9], temp_x[9], V[9]); 
	PB p10(Xs[10], currWeights1[10], currBiases[10], temp_x[10], V[10]); 
	PB p11(Xs[11], currWeights1[11], currBiases[11], temp_x[11], V[11]); 
	PB p12(Xs[12], currWeights1[12], currBiases[12], temp_x[12], V[12]); 
	PB p13(Xs[13], currWeights1[13], currBiases[13], temp_x[13], V[13]); 
	PB p14(Xs[14], currWeights1[14], currBiases[14], temp_x[14], V[14]); 
	PB p15(Xs[15], currWeights1[15], currBiases[15], temp_x[15], V[15]); 
	
	always @ (*) begin
		for (k = 0; k < 2; k++) begin //Queue Service that hands the PBs each layer's computations. 
			currWeights1 = inWeights[k];
			currBiases = inBiases[k];
		end
		outMatrices = {Xs[0], Xs[1], Xs[2], Xs[3], Xs[4], Xs[5], Xs[6], Xs[7], Xs[8], Xs[9], Xs[10], Xs[11], Xs[12], Xs[13], Xs[14], Xs[15]};
	end

endmodule