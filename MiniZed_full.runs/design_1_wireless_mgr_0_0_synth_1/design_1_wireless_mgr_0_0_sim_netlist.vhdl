-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Sat Nov 04 15:01:55 2017
-- Host        : DESKTOP-HQKVQ13 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_wireless_mgr_0_0_sim_netlist.vhdl
-- Design      : design_1_wireless_mgr_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z007sclg225-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wireless_mgr is
  port (
    SDIO_CMD_to_Zynq : out STD_LOGIC;
    SDIO_DATA_to_Zynq : out STD_LOGIC_VECTOR ( 3 downto 0 );
    WL_SDIO_CMD : inout STD_LOGIC;
    WL_SDIO_DAT : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    SDIO_CMD_from_Zynq : in STD_LOGIC;
    SDIO_CMD_dir : in STD_LOGIC;
    SDIO_DATA_from_Zynq : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SDIO_DATA_dir : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wireless_mgr;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wireless_mgr is
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of sdio_cmd_iobuf : label is "PRIMITIVE";
  attribute BOX_TYPE of sdio_dat0_iobuf : label is "PRIMITIVE";
  attribute BOX_TYPE of sdio_dat1_iobuf : label is "PRIMITIVE";
  attribute BOX_TYPE of sdio_dat2_iobuf : label is "PRIMITIVE";
  attribute BOX_TYPE of sdio_dat3_iobuf : label is "PRIMITIVE";
begin
sdio_cmd_iobuf: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => SDIO_CMD_from_Zynq,
      IO => WL_SDIO_CMD,
      O => SDIO_CMD_to_Zynq,
      T => SDIO_CMD_dir
    );
sdio_dat0_iobuf: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => SDIO_DATA_from_Zynq(0),
      IO => WL_SDIO_DAT(0),
      O => SDIO_DATA_to_Zynq(0),
      T => SDIO_DATA_dir(0)
    );
sdio_dat1_iobuf: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => SDIO_DATA_from_Zynq(1),
      IO => WL_SDIO_DAT(1),
      O => SDIO_DATA_to_Zynq(1),
      T => SDIO_DATA_dir(1)
    );
sdio_dat2_iobuf: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => SDIO_DATA_from_Zynq(2),
      IO => WL_SDIO_DAT(2),
      O => SDIO_DATA_to_Zynq(2),
      T => SDIO_DATA_dir(2)
    );
sdio_dat3_iobuf: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => SDIO_DATA_from_Zynq(3),
      IO => WL_SDIO_DAT(3),
      O => SDIO_DATA_to_Zynq(3),
      T => SDIO_DATA_dir(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_1_wireless_mgr_0_0,wireless_mgr,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "wireless_mgr,Vivado 2016.4";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \<const0>\ : STD_LOGIC;
  signal \^bt_host_wake\ : STD_LOGIC;
  signal BT_REG_ON_INST_0_i_1_n_0 : STD_LOGIC;
  signal \^bt_rts_out_n\ : STD_LOGIC;
  signal \^bt_txd_out\ : STD_LOGIC;
  signal \^sdio_clk\ : STD_LOGIC;
  signal \^wl_host_wake\ : STD_LOGIC;
  signal WL_REG_ON_INST_0_i_1_n_0 : STD_LOGIC;
  signal \^zynq_uart_rts\ : STD_LOGIC;
  signal \^zynq_uart_tx\ : STD_LOGIC;
begin
  BT_CTS_IN_N <= \^zynq_uart_rts\;
  BT_RXD_IN <= \^zynq_uart_tx\;
  GPIO_to_Zynq(3) <= \^wl_host_wake\;
  GPIO_to_Zynq(1) <= \^bt_host_wake\;
  SDIO_CDN <= \<const0>\;
  SDIO_CLK_FB <= \^sdio_clk\;
  SDIO_WP <= \<const0>\;
  WL_SDIO_CLK <= \^sdio_clk\;
  ZYNQ_UART_CTS <= \^bt_rts_out_n\;
  ZYNQ_UART_RX <= \^bt_txd_out\;
  \^bt_host_wake\ <= BT_HOST_WAKE;
  \^bt_rts_out_n\ <= BT_RTS_OUT_N;
  \^bt_txd_out\ <= BT_TXD_OUT;
  \^sdio_clk\ <= SDIO_CLK;
  \^wl_host_wake\ <= WL_HOST_WAKE;
  \^zynq_uart_rts\ <= ZYNQ_UART_RTS;
  \^zynq_uart_tx\ <= ZYNQ_UART_TX;
  GPIO_to_Zynq(0) <= 'Z';
  GPIO_to_Zynq(2) <= 'Z';
BT_REG_ON_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => GPIO_from_Zynq(0),
      I1 => BT_REG_ON_INST_0_i_1_n_0,
      O => BT_REG_ON
    );
BT_REG_ON_INST_0_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => GPIO_dir(0),
      O => BT_REG_ON_INST_0_i_1_n_0
    );
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
U0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_wireless_mgr
     port map (
      SDIO_CMD_dir => SDIO_CMD_dir,
      SDIO_CMD_from_Zynq => SDIO_CMD_from_Zynq,
      SDIO_CMD_to_Zynq => SDIO_CMD_to_Zynq,
      SDIO_DATA_dir(3 downto 0) => SDIO_DATA_dir(3 downto 0),
      SDIO_DATA_from_Zynq(3 downto 0) => SDIO_DATA_from_Zynq(3 downto 0),
      SDIO_DATA_to_Zynq(3 downto 0) => SDIO_DATA_to_Zynq(3 downto 0),
      WL_SDIO_CMD => WL_SDIO_CMD,
      WL_SDIO_DAT(3 downto 0) => WL_SDIO_DAT(3 downto 0)
    );
WL_REG_ON_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => GPIO_from_Zynq(2),
      I1 => WL_REG_ON_INST_0_i_1_n_0,
      O => WL_REG_ON
    );
WL_REG_ON_INST_0_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => GPIO_dir(2),
      O => WL_REG_ON_INST_0_i_1_n_0
    );
end STRUCTURE;
