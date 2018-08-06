// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Sat Nov 04 15:01:55 2017
// Host        : DESKTOP-HQKVQ13 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_wireless_mgr_0_0_stub.v
// Design      : design_1_wireless_mgr_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z007sclg225-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "wireless_mgr,Vivado 2016.4" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(SDIO_CLK, SDIO_CLK_FB, SDIO_CMD_from_Zynq, 
  SDIO_CMD_to_Zynq, SDIO_CMD_dir, SDIO_DATA_from_Zynq, SDIO_DATA_to_Zynq, SDIO_DATA_dir, 
  SDIO_CDN, SDIO_WP, ZYNQ_UART_TX, ZYNQ_UART_RX, ZYNQ_UART_RTS, ZYNQ_UART_CTS, GPIO_from_Zynq, 
  GPIO_to_Zynq, GPIO_dir, WL_SDIO_CLK, WL_SDIO_CMD, WL_SDIO_DAT, WL_REG_ON, WL_HOST_WAKE, 
  BT_TXD_OUT, BT_RXD_IN, BT_RTS_OUT_N, BT_CTS_IN_N, BT_REG_ON, BT_HOST_WAKE)
/* synthesis syn_black_box black_box_pad_pin="SDIO_CLK,SDIO_CLK_FB,SDIO_CMD_from_Zynq,SDIO_CMD_to_Zynq,SDIO_CMD_dir,SDIO_DATA_from_Zynq[3:0],SDIO_DATA_to_Zynq[3:0],SDIO_DATA_dir[3:0],SDIO_CDN,SDIO_WP,ZYNQ_UART_TX,ZYNQ_UART_RX,ZYNQ_UART_RTS,ZYNQ_UART_CTS,GPIO_from_Zynq[3:0],GPIO_to_Zynq[3:0],GPIO_dir[3:0],WL_SDIO_CLK,WL_SDIO_CMD,WL_SDIO_DAT[3:0],WL_REG_ON,WL_HOST_WAKE,BT_TXD_OUT,BT_RXD_IN,BT_RTS_OUT_N,BT_CTS_IN_N,BT_REG_ON,BT_HOST_WAKE" */;
  input SDIO_CLK;
  output SDIO_CLK_FB;
  input SDIO_CMD_from_Zynq;
  output SDIO_CMD_to_Zynq;
  input SDIO_CMD_dir;
  input [3:0]SDIO_DATA_from_Zynq;
  output [3:0]SDIO_DATA_to_Zynq;
  input [3:0]SDIO_DATA_dir;
  output SDIO_CDN;
  output SDIO_WP;
  input ZYNQ_UART_TX;
  output ZYNQ_UART_RX;
  input ZYNQ_UART_RTS;
  output ZYNQ_UART_CTS;
  input [3:0]GPIO_from_Zynq;
  output [3:0]GPIO_to_Zynq;
  input [3:0]GPIO_dir;
  output WL_SDIO_CLK;
  inout WL_SDIO_CMD;
  inout [3:0]WL_SDIO_DAT;
  output WL_REG_ON;
  input WL_HOST_WAKE;
  input BT_TXD_OUT;
  output BT_RXD_IN;
  input BT_RTS_OUT_N;
  output BT_CTS_IN_N;
  output BT_REG_ON;
  input BT_HOST_WAKE;
endmodule
