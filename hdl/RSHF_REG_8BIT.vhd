--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: RSHF_REG_8BIT.vhd
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

entity RSHF_REG_8BIT is
port (
    Clk     : IN std_logic;
    ClkData: IN std_logic;
    Din     : IN std_logic;
    Dout    : OUT std_logic
);
end RSHF_REG_8BIT;
architecture architecture_RSHF_REG_8BIT of RSHF_REG_8BIT is
	signal data : std_logic_vector(7 downto 0);
begin
    process (Clk)
    begin
        if (rising_edge(Clk)) then
            Dout <= data(0);
            for i in 6 downto 0 loop -- shift from the 6-th bit to the 0-th bit
                data(i) <= data(i + 1);
            end loop;
            if (ClkData = '1') then
                data(7) <= Din;
            else
                data(7) <= data(0);
            end if;
        end if;
    end process;
end architecture_RSHF_REG_8BIT;
