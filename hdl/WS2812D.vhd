--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: WS2812D.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::ProASIC3> <Die::A3P250> <Package::208 PQFP>
-- Author: <Name>
--
--------------------------------------------------------------------------------

library IEEE;

use IEEE.std_logic_1164.all;

entity WS2812D is
port (
    Clk : IN std_logic;
    key: IN std_logic;
--    Din : IN std_logic;
    Dout: OUT std_logic;
    G   : OUT std_logic;
    R   : OUT std_logic;
    B   : OUT std_logic
);
end WS2812D;
architecture architecture_WS2812D of WS2812D is

component CLK_800KHZ is
port(
    ClkIN : IN STD_LOGIC;     -- 40MHz (pin 55)
    ClkOUT: BUFFER STD_LOGIC  -- overload signal
);
end component;
component RSHF_REG_8BIT is -- right shift register
port (
    Clk : IN std_logic;
    ClkData: IN std_logic;
    Din : IN std_logic;
    Dout: OUT std_logic
);
end component;
component ROM is
port (
    din : IN STD_LOGIC;
    dout: OUT STD_LOGIC
);
end component;
    signal Clk800khz : std_logic := '0';
    signal tmp: std_logic := '0';
begin
    R_REG   : RSHF_REG_8BIT port map (Clk => Clk800khz, ClkData => key, Din => tmp, Dout => R);
    G_REG   : RSHF_REG_8BIT port map (Clk => Clk800khz, ClkData => key, Din => R, Dout => G);
    B_REG   : RSHF_REG_8BIT port map (Clk => Clk800khz, ClkData => key, Din => G, Dout => B);
    SUBCLK  : CLK_800KHZ port map (ClkIN => Clk, ClkOUT => Clk800khz);
    DATA_ROM: ROM port map (din => key, dout => tmp);
    Dout <= B;
end architecture_WS2812D;
