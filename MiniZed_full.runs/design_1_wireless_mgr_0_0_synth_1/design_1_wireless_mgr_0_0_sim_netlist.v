// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Sat Nov 04 15:01:55 2017
// Host        : DESKTOP-HQKVQ13 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_wireless_mgr_0_0_sim_netlist.v
// Design      : design_1_wireless_mgr_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z007sclg225-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_wireless_mgr_0_0,wireless_mgr,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "wireless_mgr,Vivado 2016.4" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (SDIO_CLK,
    SDIO_CLK_FB,
    SDIO_CMD_from_Zynq,
    SDIO_CMD_to_Zynq,
    SDIO_CMD_dir,
    SDIO_DATA_from_Zynq,
    SDIO_DATA_to_Zynq,
    SDIO_DATA_dir,
    SDIO_CDN,
    SDIO_WP,
    ZYNQ_UART_TX,
    ZYNQ_UART_RX,
    ZYNQ_UART_RTS,
    ZYNQ_UART_CTS,
    GPIO_from_Zynq,
    GPIO_to_Zynq,
    GPIO_dir,
    WL_SDIO_CLK,
    WL_SDIO_CMD,
    WL_SDIO_DAT,
    WL_REG_ON,
    WL_HOST_WAKE,
    BT_TXD_OUT,
    BT_RXD_IN,
    BT_RTS_OUT_N,
    BT_CTS_IN_N,
    BT_REG_ON,
    BT_HOST_WAKE);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 SDIO_CLK CLK" *) input SDIO_CLK;
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
  (* x_interface_info = "xilinx.com:signal:clock:1.0 WL_SDIO_CLK CLK" *) output WL_SDIO_CLK;
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

  wire \<const0> ;
  wire BT_HOST_WAKE;
  wire BT_REG_ON;
  wire BT_REG_ON_INST_0_i_1_n_0;
  wire BT_RTS_OUT_N;
  wire BT_TXD_OUT;
  wire [3:0]GPIO_dir;
  wire [3:0]GPIO_from_Zynq;
  wire SDIO_CLK;
  (* DRIVE = "12" *) (* IBUF_LOW_PWR *) (* SLEW = "SLOW" *) wire SDIO_CMD_dir;
  (* DRIVE = "12" *) (* IBUF_LOW_PWR *) (* SLEW = "SLOW" *) wire SDIO_CMD_from_Zynq;
  (* DRIVE = "12" *) (* IBUF_LOW_PWR *) (* SLEW = "SLOW" *) wire SDIO_CMD_to_Zynq;
  (* DRIVE = "12" *) (* IBUF_LOW_PWR *) (* SLEW = "SLOW" *) wire [3:0]SDIO_DATA_dir;
  (* DRIVE = "12" *) (* IBUF_LOW_PWR *) (* SLEW = "SLOW" *) wire [3:0]SDIO_DATA_from_Zynq;
  (* DRIVE = "12" *) (* IBUF_LOW_PWR *) (* SLEW = "SLOW" *) wire [3:0]SDIO_DATA_to_Zynq;
  wire WL_HOST_WAKE;
  wire WL_REG_ON;
  wire WL_REG_ON_INST_0_i_1_n_0;
  (* DRIVE = "12" *) (* IBUF_LOW_PWR *) (* SLEW = "SLOW" *) wire WL_SDIO_CMD;
  (* DRIVE = "12" *) (* IBUF_LOW_PWR *) (* SLEW = "SLOW" *) wire [3:0]WL_SDIO_DAT;
  wire ZYNQ_UART_RTS;
  wire ZYNQ_UART_TX;

  assign BT_CTS_IN_N = ZYNQ_UART_RTS;
  assign BT_RXD_IN = ZYNQ_UART_TX;
  assign GPIO_to_Zynq[3] = WL_HOST_WAKE;
  assign GPIO_to_Zynq[1] = BT_HOST_WAKE;
  assign SDIO_CDN = \<const0> ;
  assign SDIO_CLK_FB = SDIO_CLK;
  assign SDIO_WP = \<const0> ;
  assign WL_SDIO_CLK = SDIO_CLK;
  assign ZYNQ_UART_CTS = BT_RTS_OUT_N;
  assign ZYNQ_UART_RX = BT_TXD_OUT;
  LUT2 #(
    .INIT(4'h8)) 
    BT_REG_ON_INST_0
       (.I0(GPIO_from_Zynq[0]),
        .I1(BT_REG_ON_INST_0_i_1_n_0),
        .O(BT_REG_ON));
  LUT1 #(
    .INIT(2'h1)) 
    BT_REG_ON_INST_0_i_1
       (.I0(GPIO_dir[0]),
        .O(BT_REG_ON_INST_0_i_1_n_0));
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wireless_mgr U0
       (.SDIO_CMD_dir(SDIO_CMD_dir),
        .SDIO_CMD_from_Zynq(SDIO_CMD_from_Zynq),
        .SDIO_CMD_to_Zynq(SDIO_CMD_to_Zynq),
        .SDIO_DATA_dir(SDIO_DATA_dir),
        .SDIO_DATA_from_Zynq(SDIO_DATA_from_Zynq),
        .SDIO_DATA_to_Zynq(SDIO_DATA_to_Zynq),
        .WL_SDIO_CMD(WL_SDIO_CMD),
        .WL_SDIO_DAT(WL_SDIO_DAT));
  LUT2 #(
    .INIT(4'h8)) 
    WL_REG_ON_INST_0
       (.I0(GPIO_from_Zynq[2]),
        .I1(WL_REG_ON_INST_0_i_1_n_0),
        .O(WL_REG_ON));
  LUT1 #(
    .INIT(2'h1)) 
    WL_REG_ON_INST_0_i_1
       (.I0(GPIO_dir[2]),
        .O(WL_REG_ON_INST_0_i_1_n_0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wireless_mgr
   (SDIO_CMD_to_Zynq,
    SDIO_DATA_to_Zynq,
    WL_SDIO_CMD,
    WL_SDIO_DAT,
    SDIO_CMD_from_Zynq,
    SDIO_CMD_dir,
    SDIO_DATA_from_Zynq,
    SDIO_DATA_dir);
  output SDIO_CMD_to_Zynq;
  output [3:0]SDIO_DATA_to_Zynq;
  inout WL_SDIO_CMD;
  inout [3:0]WL_SDIO_DAT;
  input SDIO_CMD_from_Zynq;
  input SDIO_CMD_dir;
  input [3:0]SDIO_DATA_from_Zynq;
  input [3:0]SDIO_DATA_dir;

  wire SDIO_CMD_dir;
  wire SDIO_CMD_from_Zynq;
  wire SDIO_CMD_to_Zynq;
  wire [3:0]SDIO_DATA_dir;
  wire [3:0]SDIO_DATA_from_Zynq;
  wire [3:0]SDIO_DATA_to_Zynq;
  wire WL_SDIO_CMD;
  wire [3:0]WL_SDIO_DAT;

  (* BOX_TYPE = "PRIMITIVE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    sdio_cmd_iobuf
       (.I(SDIO_CMD_from_Zynq),
        .IO(WL_SDIO_CMD),
        .O(SDIO_CMD_to_Zynq),
        .T(SDIO_CMD_dir));
  (* BOX_TYPE = "PRIMITIVE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    sdio_dat0_iobuf
       (.I(SDIO_DATA_from_Zynq[0]),
        .IO(WL_SDIO_DAT[0]),
        .O(SDIO_DATA_to_Zynq[0]),
        .T(SDIO_DATA_dir[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    sdio_dat1_iobuf
       (.I(SDIO_DATA_from_Zynq[1]),
        .IO(WL_SDIO_DAT[1]),
        .O(SDIO_DATA_to_Zynq[1]),
        .T(SDIO_DATA_dir[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    sdio_dat2_iobuf
       (.I(SDIO_DATA_from_Zynq[2]),
        .IO(WL_SDIO_DAT[2]),
        .O(SDIO_DATA_to_Zynq[2]),
        .T(SDIO_DATA_dir[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    sdio_dat3_iobuf
       (.I(SDIO_DATA_from_Zynq[3]),
        .IO(WL_SDIO_DAT[3]),
        .O(SDIO_DATA_to_Zynq[3]),
        .T(SDIO_DATA_dir[3]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
