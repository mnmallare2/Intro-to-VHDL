--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity tb_mux2to1 is
end tb_mux2to1;
architecture Behavioral of tb_mux2to1 is
-- Component declaration (matches your mux entity)
component mux2to1
Port (
A : in STD_LOGIC;
B : in STD_LOGIC;
S : in STD_LOGIC;
Y : out STD_LOGIC
);
end component;
-- Testbench signals
signal A_tb : STD_LOGIC := '0';
signal B_tb : STD_LOGIC := '0';
signal S_tb : STD_LOGIC := '0';
signal Y_tb : STD_LOGIC;
begin
-- Instantiate the Unit Under Test (UUT)
UUT: mux2to1
port map (
A => A_tb,
B => B_tb,
S => S_tb,
Y => Y_tb
);
-- Stimulus process
stim_proc: process
begin
-- Test all combinations of A, B, S (8 total)
A_tb <= '0'; B_tb <= '0'; S_tb <= '0'; wait for 10 ns;
A_tb <= '0'; B_tb <= '0'; S_tb <= '1'; wait for 10 ns;
A_tb <= '0'; B_tb <= '1'; S_tb <= '0'; wait for 10 ns;
A_tb <= '0'; B_tb <= '1'; S_tb <= '1'; wait for 10 ns;
A_tb <= '1'; B_tb <= '0'; S_tb <= '0'; wait for 10 ns;
A_tb <= '1'; B_tb <= '0'; S_tb <= '1'; wait for 10 ns;
A_tb <= '1'; B_tb <= '1'; S_tb <= '0'; wait for 10 ns;
A_tb <= '1'; B_tb <= '1'; S_tb <= '1'; wait for 10 ns;
wait; -- stop simulation
end process;
end Behavioral;