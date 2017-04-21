`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.02.2017 17:52:27
// Design Name: 
// Module Name: hexconverter
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


module hexconverter(
		    input wire 	     clk,
		    input wire [7:0] rxdata,
		    input wire 	     rxrdy,
		    output reg 	     rxack = 0,
		    output reg [7:0] txdata = 0,
		    output reg 	     txrdy = 0,
		    input wire 	     txack
    );

   reg [7:0] 			      data;
   reg 				      nibble = 1;
   
   function[7:0] hexconvert;
      input [3:0] 		      nibble;
      hexconvert = (nibble < 10)?nibble+48:nibble+55;
   endfunction
   
   always @ (posedge clk) begin: state_machine
      if(rxrdy == 1 && rxack == 0 && txrdy == 0 && txack == 0 && nibble == 1) begin: start
	 data <= rxdata;
	 nibble <= 0;
	 txdata <= hexconvert(rxdata[7:4]);
	 txrdy <= 1;
	 rxack <= 1;
      end
      else if (txack == 0 && txrdy == 0 && nibble == 0) begin: second_nibble
	 nibble <= 1;
	 txdata <= hexconvert(data[3:0]);
	 txrdy <= 1;	 
      end
      else if (txack == 0 && txrdy == 0 && rxrdy == 0 && nibble == 1) begin: finish
	 rxack <= 0;
      end
      if(txrdy == 1 && txack == 1) begin: deassert
	 txrdy <= 0;
      end
   end
      
   
endmodule
