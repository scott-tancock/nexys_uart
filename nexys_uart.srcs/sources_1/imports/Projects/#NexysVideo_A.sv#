module NexysVideo_A(
		    input wire 	      sysclk,

		    //inout wire 	       gtp_clk_n,
		    //inout wire 	       gtp_clk_p,

		    //inout wire 	       fmc_clk_n,
		    //inout wire 	       fmc_clk_p,
		    
		    output wire [7:0] led,
		    
		    input wire [7:0]  sw,
		    
		    input wire 	      btnu,
		    input wire 	      btnl,
		    input wire 	      btnc,
		    input wire 	      btnr,
		    input wire 	      btnd,
		    input wire 	      cpu_resetn,
		    
		    output wire       oled_dc,
		    output wire       oled_res,
		    output wire       oled_sclk,
		    output wire       oled_sdin,
		    output wire       oled_vbat,
		    output wire       oled_vdd,
		    
		    //inout wire 	       hdmi_rx_cec,
		    //input wire 	       hdmi_rx_clk_n,
		    //input wire 	       hdmi_rx_clk_p,
		    //output wire        hdmi_rx_hpa,
		    //input wire 	       hdmi_rx_scl,
		    //inout wire 	       hdmi_rx_sda,
		    //output wire        hdmi_rx_txen,
		    //input wire [2:0]   hdmi_rx_n,
		    //input wire [2:0]   hdmi_rx_p,
		    
		    //inout wire 	       hdmi_tx_cec,
		    //output wire        hdmi_tx_clk_n,
		    //output wire        hdmi_tx_clk_p,
		    //input wire 	       hdmi_tx_hpd,
		    //output wire        hdmi_tx_rscl,
		    //inout wire 	       hdmi_tx_rsda,
		    //output wire [2:0]  hdmi_tx_n,
		    //output wire [2:0]  hdmi_tx_p,
		    
		    //inout wire 	       dp_tx_aux_n,
		    //inout wire 	       dp_tx_aux_p,
		    //input wire 	       dp_tx_hpd,
		    
		    output wire       ac_adc_sdata,
		    output wire       ac_bclk,
		    input wire 	      ac_dac_sdata,
		    output wire       ac_lrclk,
		    output wire       ac_mclk,
		    
		    inout wire [7:0]  ja,
		    inout wire [7:0]  jb,
		    inout wire [7:0]  jc,
		    
		    inout wire [3:0]  xa_n,
		    inout wire [3:0]  xa_p,
		    
		    inout wire 	      uart_out,
		    inout wire 	      uart_in,
		    
		    //inout wire 	       eth_int_b,
		    //inout wire 	       eth_mdc,
		    //inout wire 	       eth_mdio,
		    //inout wire 	       eth_pme_b,
		    //inout wire 	       eth_rst_b,
		    //inout wire 	       eth_rxck,
		    //inout wire 	       eth_rxctl,
		    //inout wire [3:0]   eth_rxd,
		    //inout wire 	       eth_txck,
		    //inout wire 	       eth_txctl,
		    //inout wire [3:0]   eth_txd,
		    
		    //output wire        fan_pwm,
		    
		    //inout wire 	       prog_clko,
		    //inout wire [7:0]   prog_d,
		    //inout wire 	       prog_oen,
		    //inout wire 	       prog_rdn,
		    //inout wire 	       prog_rxen,
		    //inout wire 	       prog_siwun,
		    //inout wire 	       prog_spien,
		    //inout wire 	       prog_txen,
		    //inout wire 	       prog_wrn,
		    
		    //inout wire 	       ps2_clk,
		    //inout wire 	       ps2_data,
		    
		    //inout wire 	       qspi_cs,
		    //inout wire [3:0]   qspi_dq,
		    //inout wire 	       scl,
		    
		    //inout wire 	       sd_cclk,
		    //inout wire 	       sd_cd,
		    //inout wire 	       sd_cmd,
		    //inout wire [3:0]   sd_d,
		    //inout wire 	       sd_reset,
		    //inout wire 	       sda,
		    
		    inout wire [1:0]  set_vadj,
		    inout wire 	      vadj_en
		    
		    //output wire [14:0] ddr3_addr,
		    //inout wire [2:0]   ddr3_ba,
		    //inout wire 	       ddr3_cas,
		    //inout wire 	       ddr3_cke,
		    //output wire [0:0]  ddr3_clk_n,
		    //output wire [0:0]  ddr3_clk_p,
		    //inout wire [1:0]   ddr3_dm,
		    //inout wire [15:0]  ddr3_dq,
		    //inout wire [1:0]   ddr3_dqs_n,
		    //inout wire [1:0]   ddr3_dqs_p,
		    //inout wire 	       ddr3_odt,
		    //inout wire 	       ddr3_ras,
		    //inout wire 	       ddr3_reset,
		    //inout wire 	       ddr3_we
		    
		    //inout wire 	       fmc_clk0_m2c_n,
		    //inout wire 	       fmc_clk0_m2c_p,
		    //inout wire 	       fmc_clk1_m2c_n,
		    //inout wire 	       fmc_clk1_m2c_p,
		    //inout wire [33:0]  fmc_la_n,
		    //inout wire [33:0]  fmc_la_p
		    );
   
   
   //wire 			       prog_sck = prog_d[0];
   //wire 			       prog_mosi = prog_d[1];
   //wire 			       prog_miso = prog_d[2];
   //wire 			       prog_ss = prog_d[3];
   
   //wire 			       fmc_la00_cc_n = fmc_la_n[0];
   //wire 			       fmc_la00_cc_p = fmc_la_p[0];
   //wire 			       fmc_la01_cc_n = fmc_la_n[1];
   //wire 			       fmc_la01_cc_p = fmc_la_p[1];
   
   wire [7:0] 			      rxdata, txdata;
   wire 			      rxrdy, rxack, rxmissed, txrdy, txack;
   
   wire [1:0] 			      set_vadj_io;
   wire 			      vadj_en_io;
   wire 			      uart_in_io;
   wire 			      uart_out_io;
   
   IBUF #(
          .IBUF_LOW_PWR("FALSE"),  // Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards 
          .IOSTANDARD("LVCMOS33")  // Specify the input I/O standard
	  ) IBUF_uart (
		       .O(uart_in_io),     // Buffer output
		       .I(uart_in)      // Buffer input (connect directly to top-level port)
		       );
   
   OBUF #(
          //.DRIVE(33),              // Specify output drive strength
	  .SLEW("FAST"),           // Specify the output slew rate
          .IOSTANDARD("LVCMOS33")  // Specify the input I/O standard
	  ) OBUF_uart (
		       .O(uart_out),     // Buffer output (connect directly to top-level port)
		       .I(uart_out_io)      // Buffer input 
		       );
   OBUF #(
          //.DRIVE(33),              // Specify output drive strength
	  .SLEW("SLOW"),           // Specify the output slew rate
          .IOSTANDARD("LVCMOS33")  // Specify the input I/O standard
	  ) OBUF_set_vadj_0 (
			     .O(set_vadj[0]),     // Buffer output (connect directly to top-level port)
			     .I(set_vadj_io[0])      // Buffer input 
			     );
   
   OBUF #(
          //.DRIVE(33),              // Specify output drive strength
	  .SLEW("SLOW"),           // Specify the output slew rate
          .IOSTANDARD("LVCMOS33")  // Specify the input I/O standard
	  ) OBUF_set_vadj_1 (
			     .O(set_vadj[1]),     // Buffer output (connect directly to top-level port)
			     .I(set_vadj_io[1])      // Buffer input 
			     );
   
   OBUF #(
          //.DRIVE(33),              // Specify output drive strength
	  .SLEW("SLOW"),           // Specify the output slew rate
          .IOSTANDARD("LVCMOS33")  // Specify the input I/O standard
	  ) OBUF_vadj_en (
			  .O(vadj_en),     // Buffer output (connect directly to top-level port)
			  .I(vadj_en_io)      // Buffer input 
			  );
   
   assign set_vadj_io = 3;
   
   assign vadj_en_io = 1;
   
   //assign uart_out_io = uart_in_io;
   
   uart u(sysclk, uart_in_io, rxdata, rxrdy, rxack, rxmissed, uart_out_io, txdata, txrdy, txack);
   
   assign txrdy = rxrdy;
   assign rxack = txack;
   assign txdata = rxdata;
   
   /*
   integer 			      number_to_send = -1;
   integer 			      nibble = -2;
   wire [3:0] 			      bits;
   reg [7:0] 			      r_txdata = 0;
   reg 				      r_txrdy = 0;
   assign txdata = r_txdata;
   assign txrdy = r_txrdy;
   //assign bits = number_to_send[nibble*4+:4];
   
   always @ (posedge sysclk) begin
      if(txack && txrdy) begin
	 r_txrdy <= 0;
	 nibble <= nibble - 1;
      end
      else if (!txrdy && !txack) begin
	 if(nibble == -1) begin
	    r_txdata <= 10;
	    r_txrdy <= 1;
	 end
	 else if(nibble == -2) begin
	    number_to_send <= number_to_send + 1;
	    nibble <= 7;
	 end
	 else begin
	    r_txdata <= (bits < 10)?(bits+7'h30):(bits+7'h41-10);
	    r_txrdy <= 1;
	 end
      end
   end
   */
   //hexconverter hc(.clk(sysclk), .rxdata(rxdata), .rxrdy(rxrdy), .rxack(rxack), .txdata(txdata), .txrdy(txrdy), .txack(txack));
   
   wire [7:0] led_io;
   
   //assign led_io = 0;
   
   assign led_io = {{2{0}}, rxrdy, rxack, txrdy, txack, uart_in_io, uart_out_io};
   
   genvar     g1;
   
   generate
      for(g1 = 0; g1 < 8; g1 = g1 + 1) begin:led_obuf_gen
	 OBUF #(
		.SLEW("SLOW"),
		.IOSTANDARD("LVCMOS33")
		) OBUF_led (
			    .O(led[g1]),
			    .I(led_io[g1])
			    );
      end
   endgenerate
   
endmodule // NexysVideo_A

