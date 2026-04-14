-- 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity tb_decoder2to4 is
end tb_decoder2to4;
architecture Behavioral of tb_decoder2to4 is
-- Component declaration (matches your decoder entity)
component decoder2to4
Port (
I : in STD_LOGIC_VECTOR(1 downto 0);
D : out STD_LOGIC_VECTOR(3 downto 0)
);
end component;
-- Testbench signals
signal I_tb : STD_LOGIC_VECTOR(1 downto 0) := "00";
signal D_tb : STD_LOGIC_VECTOR(3 downto 0);
begin
-- Instantiate the Unit Under Test (UUT)
UUT: decoder2to4
port map (
I => I_tb,
D => D_tb
);
-- Stimulus process
stim_proc: process
begin
I_tb <= "00"; wait for 10 ns;
I_tb <= "01"; wait for 10 ns;
I_tb <= "10"; wait for 10 ns;
I_tb <= "11"; wait for 10 ns;
wait; -- stop simulation
end process;
end Behavioral;