`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.02.2017 21:00:52
// Design Name: 
// Module Name: ram_iface
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ram_iface(
		 input wire 	   clk,
		 input wire [7:0]  rxdata,
		 input wire 	   rxrdy,
		 output reg 	   rxack = 0,
		 output reg [7:0]  txdata = 0,
		 output reg 	   txrdy = 0,
		 input wire 	   txack,
		 output reg [31:0] addr = 0,
		 inout wire [31:0] data,
		 output reg 	   rden = 0,
		 output reg 	   wren = 0
    );

   reg [1:0] 				state = 0; //0 = IDLE, 1 = write, 2 = read, 3 = processing
   reg [31:0] 				length = 0;
   reg [31:0] 				start = 0;
   reg 						cmd = 0;
   reg [2:0] 				nibble_count = 0;
   reg [31:0]				r_data = 0;
   reg 						data_wen = 0;
   assign data = (data_wen)?r_data:32'bZZZZ_ZZZZ_ZZZZ_ZZZZ_ZZZZ_ZZZZ_ZZZZ_ZZZZ;
   
   
	always @ (posedge clk) begin: state_machine
		data_wen <= 0;
    	if(txrdy == 1 && txack == 1) begin: deassert_tx
			txrdy <= 0;
      	end // deassert_tx
      	if(rxrdy == 0 && rxack == 1) begin: deassert_rx
	 		rxack <= 0;
      	end // deassert_rx
      	if(state == 0) begin: get_command
	 		if(rxrdy == 1 && rxack == 0 && txrdy == 0 && txack == 0) begin: command_ready
	    		rxack <= 1;
	    		txdata <= rxdata;
	    		txrdy <= 1;
	    		if(rxdata == 8'h77) begin: write_processing
	       			cmd <= 1;
	       			state <= 3;
	    		end // write_processing
	    		else if(rxdata == 8'h72) begin: read_processing
	       			cmd <= 0;
	       			state <= 3;
	    		end // read_processing
	 		end // command_ready
      	end // block: get_command
      	else if(state == 3) begin: get_positions
	 		if(length == 0) begin: get_start
	    		if(rxrdy == 1 && rxack == 0 && txrdy == 0 && txack == 0) begin: get_digit
	       			if(rxdata >= 8'h30 && rxdata <= 8'h39) begin: numerical
		  				start = (start << 4) + (rxdata & 8'h0F);
		  				rxack <= 1;
		  				txdata <= rxdata;
		  				txrdy <= 1;
	       			end // numerical
	       			else if((rxdata >= 8'h41 && rxdata <= 8'h46) || (rxdata >= 8'h61 && rxdata <= 8'h66)) begin: alphabetical
		  				start = (start << 4) + ((rxdata & 8'h07) + 9);
		  				rxack <= 1;
		  				txdata <= rxdata;
		  				txrdy <= 1;
	       			end // alphabetical
	       			else if(rxdata == 8'h20) begin: next
		  				length <= 32'h80000000;
		  				rxack <= 1;
		  				txdata <= rxdata;
		  				txrdy <= 1;
	       			end // next
	    		end // get_digit
	 		end // block: get_start
	 		else begin: get_length
	    		if(rxrdy == 1 && rxack == 0 && txrdy == 0 && txack == 0) begin: get_digit
	       			if(rxdata >= 8'h30 && rxdata <= 8'h39) begin: numerical
		  				length = (length << 4) + (rxdata & 8'h0F);
		  				rxack <= 1;
		  				txdata <= rxdata;
		  				txrdy <= 1;
	       			end
	       			else if((rxdata >= 8'h41 && rxdata <= 8'h46) || (rxdata >= 8'h61 && rxdata <= 8'h66)) begin: alphabetical
		  				length = (length << 4) + ((rxdata & 8'h07) + 9);
		  				rxack <= 1;
		  				txdata <= rxdata;
		  				txrdy <= 1;
	       			end
	       			else if(rxdata == 8'h20) begin: next
		  				state <= (cmd == 1)?1:2; //cmd == 1: state == 1(write), cmd == 0: state == 2(read)
		  				rxack <= 1;
		  				txdata <= rxdata;
		  				txrdy <= 1;
	       			end // next
	    		end // get_digit
	 		end // block: get_length
      	end // block: get_positions
      	else if(state == 1) begin: write_loop
	 		if(rxrdy == 1 && rxack == 0 && txrdy == 0 && txack == 0) begin: get_byte
	 			if(rxdata >= 8'h30 && rxdata <= 8'h39) begin: numerical
	 				r_data <= (r_data << 4) + (rxdata & 8'h0F);
	 				rxack <= 1;
					txdata <= rxdata;
		  			txrdy <= 1;
		  			nibble_count <= nibble_count + 1;
	 			end // numerical
	 			else if ((rxdata >= 8'h41 && rxdata <= 8'h46) || (rxdata >= 8'h61 && rxdata <= 8'h66)) begin: alphabetical
	 				r_data <= (r_data << 4) + ((rxdata & 8'h07) + 9);
	 				rxack <= 1;
		  			txdata <= rxdata;
		  			txrdy <= 1;
		  			nibble_count <= nibble_count + 1;
	 			end // alphabetical
	 			if(nibble_count == 3) begin: write
	 				data_wen <= 1;
	 				addr <= start;
	 				start <= start + 1;
	 				length <= length - 1;
	 				if(length == 1) begin: end_writes
	 					state <= 0;
	 					start <= 0;
	 					length <= 0;
	 				end // end_writes
	 			end // write
	 		end // get_byte
      	end // write_loop
     	else if(state == 2) begin: read_loop

     	end // read_loop
 	end // state_machine
endmodule
