
-- 2-to-1 Multiplexer (Design)
-- File name: mux2to1.vhd
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity decoder2to4 is
Port (
I : in STD_LOGIC_VECTOR(1 downto 0);
D : out STD_LOGIC_VECTOR(3 downto 0)
);
end decoder2to4;
architecture Behavioral of decoder2to4 is
begin
process(I)
begin
D <= "0000"; -- default
case I is
when "00" => D <= "0001";
when "01" => D <= "0010";
when "10" => D <= "0100";
when "11" => D <= "1000";
when others => D <= "0000";
end case;
end process;
end Behavioral;