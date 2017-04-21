`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.01.2017 15:12:29
// Design Name: 
// Module Name: test_uart
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


module test_uart(

    );
    
    reg clk = 0;
    
    always begin: clk_inv
        #5 clk = ~clk;
    end
    
    reg[7:0] test_vec[7:0];
    
    wire link;
    reg[7:0] txb = 0;
    wire[7:0] rxb;
    reg txr = 0, rxa = 0;
    wire rxr, txa, rxm;
    reg succ = 0;
    
    integer i = 0, j = 0;
    
    initial begin: init
        $readmemh("uart_data.mem", test_vec);
        txb = test_vec[0];
    end 
    
    uart u(clk, link, rxb, rxr, rxa, rxm, link, txb, txr, txa);
    
    always @ (posedge clk) begin: test
        if(txr == 1 && txa == 1) begin: next_data
            i = (i + 1) % 8;
            txb = test_vec[i];
            txr = 0;
        end
        if(rxr == 1 && rxa == 0) begin: get_data
            if(rxb == test_vec[j]) begin: success
                $display("Success for byte %d (= %x)", j, test_vec[j]);
                succ = 1;
            end
            else begin: failure
                $display("Error on byte %d: %x vs %x", j, rxb, test_vec[j]);
            end
            rxa = 1;
            j = (j + 1) % 8;
        end
        if(rxr == 0 && rxa == 1) begin: acknowledged
            rxa = 0;
        end
        if(rxr == 0 && rxa == 0 && txa == 0) begin: start
            txr = 1;
        end
    end
endmodule
