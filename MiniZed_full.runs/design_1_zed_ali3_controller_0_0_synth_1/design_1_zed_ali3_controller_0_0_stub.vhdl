-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Sat Nov 04 15:01:53 2017
-- Host        : DESKTOP-HQKVQ13 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_zed_ali3_controller_0_0_stub.vhdl
-- Design      : design_1_zed_ali3_controller_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z007sclg225-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    reset_in : in STD_LOGIC;
    clk_in : in STD_LOGIC;
    pll_locked : out STD_LOGIC;
    reset_out : out STD_LOGIC;
    clk_out : out STD_LOGIC;
    video_de : in STD_LOGIC;
    video_vsync : in STD_LOGIC;
    video_hsync : in STD_LOGIC;
    video_data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ALI_RST_N : out STD_LOGIC;
    ALI_CLK_N : out STD_LOGIC;
    ALI_CLK_P : out STD_LOGIC;
    ALI_DATA_N : out STD_LOGIC_VECTOR ( 3 downto 0 );
    ALI_DATA_P : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "reset_in,clk_in,pll_locked,reset_out,clk_out,video_de,video_vsync,video_hsync,video_data[31:0],ALI_RST_N,ALI_CLK_N,ALI_CLK_P,ALI_DATA_N[3:0],ALI_DATA_P[3:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "zed_ali3_controller,Vivado 2016.4";
begin
end;
