-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Sat Nov 04 15:01:55 2017
-- Host        : DESKTOP-HQKVQ13 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_wireless_mgr_0_0_stub.vhdl
-- Design      : design_1_wireless_mgr_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z007sclg225-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    SDIO_CLK : in STD_LOGIC;
    SDIO_CLK_FB : out STD_LOGIC;
    SDIO_CMD_from_Zynq : in STD_LOGIC;
    SDIO_CMD_to_Zynq : out STD_LOGIC;
    SDIO_CMD_dir : in STD_LOGIC;
    SDIO_DATA_from_Zynq : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SDIO_DATA_to_Zynq : out STD_LOGIC_VECTOR ( 3 downto 0 );
    SDIO_DATA_dir : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SDIO_CDN : out STD_LOGIC;
    SDIO_WP : out STD_LOGIC;
    ZYNQ_UART_TX : in STD_LOGIC;
    ZYNQ_UART_RX : out STD_LOGIC;
    ZYNQ_UART_RTS : in STD_LOGIC;
    ZYNQ_UART_CTS : out STD_LOGIC;
    GPIO_from_Zynq : in STD_LOGIC_VECTOR ( 3 downto 0 );
    GPIO_to_Zynq : out STD_LOGIC_VECTOR ( 3 downto 0 );
    GPIO_dir : in STD_LOGIC_VECTOR ( 3 downto 0 );
    WL_SDIO_CLK : out STD_LOGIC;
    WL_SDIO_CMD : inout STD_LOGIC;
    WL_SDIO_DAT : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    WL_REG_ON : out STD_LOGIC;
    WL_HOST_WAKE : in STD_LOGIC;
    BT_TXD_OUT : in STD_LOGIC;
    BT_RXD_IN : out STD_LOGIC;
    BT_RTS_OUT_N : in STD_LOGIC;
    BT_CTS_IN_N : out STD_LOGIC;
    BT_REG_ON : out STD_LOGIC;
    BT_HOST_WAKE : in STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "SDIO_CLK,SDIO_CLK_FB,SDIO_CMD_from_Zynq,SDIO_CMD_to_Zynq,SDIO_CMD_dir,SDIO_DATA_from_Zynq[3:0],SDIO_DATA_to_Zynq[3:0],SDIO_DATA_dir[3:0],SDIO_CDN,SDIO_WP,ZYNQ_UART_TX,ZYNQ_UART_RX,ZYNQ_UART_RTS,ZYNQ_UART_CTS,GPIO_from_Zynq[3:0],GPIO_to_Zynq[3:0],GPIO_dir[3:0],WL_SDIO_CLK,WL_SDIO_CMD,WL_SDIO_DAT[3:0],WL_REG_ON,WL_HOST_WAKE,BT_TXD_OUT,BT_RXD_IN,BT_RTS_OUT_N,BT_CTS_IN_N,BT_REG_ON,BT_HOST_WAKE";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "wireless_mgr,Vivado 2016.4";
begin
end;
