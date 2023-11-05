module SRAM512 (we, addr, data_in, data_out, r);
   input we;
   input [6:0] addr;
   input [31:0]	data_in;
   output logic [31:0] data_out;
   output logic	       r;


   logic [31:0]	       mem [128];
   	
   int		       i;
   assign i = 0;
   always @(*) begin
      if (rst) begin
	 for(i = 0; i < 256; i++) begin
	    memoryCells[i] = 32'b0;
	 end
      end
		
      else if (we) begin
	 memoryCells[addr] = data_in;
      end
	   
      else begin
	 data_out <= cs ? memoryCells[addr] : 32'bz;
      end
		
      r <= cs? 1'b1 : 1'bz;
		
   end

   
   
  
endmodule; // SRAM16x32
