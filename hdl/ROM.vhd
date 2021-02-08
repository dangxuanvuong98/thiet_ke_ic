--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: ROM.vhd
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

entity ROM is
port (
    --<port_name> : <direction> <type>;
    din: IN std_logic;
    dout : OUT std_logic  -- example
    --<other_ports>;
);
end ROM;
architecture architecture_ROM of ROM is
   -- signal, component etc. declarations
	signal data : std_logic_vector(23 downto 0) := x"FF00FF" ; -- example

begin
    dout <= data(0);
    process (din, data)
    begin
        if (rising_edge(din)) then
            for i in 22 downto 0 loop -- shift from the 6-th bit to the 0-th bit
                data(i) <= data(i + 1);
            end loop;
            data(23) <= data(0);
        end if;
    end process;
end architecture_ROM;
