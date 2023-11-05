module SystolicPE(clk, rst, top_i, left_i, down_o, right_o, val);
   input clk, rst;
   
   input [31:0] top_i;
   input [31:0]	left_i;
   output logic [31:0] down_o;

   output logic [31:0] right_o;

   output logic [31:0] val;

   logic [31:0]	       acum;
   
   
   always_ff @(posedge clk) begin
      if(rst) begin
	 down_o <= 0;

	 right_o <= 0;

	 acum <= 0;
	 
      end
      else begin
	 acum <= acum + (top_i*left_i);
	 down_o <= top_i;
	 right_o <= left_i;
      end
   end // always_ff @ (posedge clk)
   assign val = acum;
   
   
   
endmodule; // SystolicPE
