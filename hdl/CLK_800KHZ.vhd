--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: CLK_800KHZ.vhd
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
use IEEE.STD_LOGIC_ARITH.all;   
use IEEE.STD_LOGIC_UNSIGNED.all;

entity CLK_800KHZ is
port (
	ClkIN   : IN std_logic;
    ClkOUT  : BUFFER std_logic
);
end CLK_800KHZ;
architecture architecture_CLK_800KHZ of CLK_800KHZ is
    signal adder_buffer : std_logic_vector(6 downto 0) := "0000000";
    constant preset     : std_logic_vector(5 downto 0) := "001110";
begin
    process (ClkIN)
    begin 
        if (ClkIN'event and ClkIN = '1') then
            adder_buffer <= adder_buffer + 1;
            if (adder_buffer(5 downto 0) = "111111") then
                adder_buffer(5 downto 0) <= preset;
            end if;  
        end if;
    end process;
    
    ClkOUT <= adder_buffer(6); -- clock edge overload bit
end architecture_CLK_800KHZ;
