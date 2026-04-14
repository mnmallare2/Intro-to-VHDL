library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity jkflipflop_tb is

end jkflipflop_tb;

architecture Behavioral of jkflipflop_tb is

component jkflipflop
Port (
Clk : in std_logic;
Reset : in std_logic;
J : in std_logic;
K : in std_logic;
Q : out std_logic;
Qnot : out std_logic
);
end component;

signal Clk : std_logic := '0';
signal Reset : std_logic := '0';
signal J : std_logic := '0';
signal K : std_logic := '0';
signal Q : std_logic;
signal Qnot : std_logic;
constant clk_period : time := 10ns;

begin
-- UUT
uut: jkflipflop
port map (
Clk => Clk,
Reset => Reset,
J => J,
K => K,
Q => Q,
Qnot => Qnot
);

-- Clock Signal
clk_process : process
begin
while true loop
Clk <= '0';
wait for clk_period/2;
Clk <= '1';
wait for clk_period/2;
end loop;
end process;

--Stimulus Process
stim_proc: process
begin
Reset <= '1';
wait for 20 ns;
Reset <= '0';
wait for 10 ns;

-- 00
J <= '0'; K <= '0';
wait for 20 ns;
-- 01
J <= '0'; K <= '1';
wait for 20 ns;
-- 10
J <= '1'; K <= '0';
wait for 20 ns;
-- 11
J <= '1'; K <= '1';
wait for 40 ns;
wait;
end process;

end Behavioral;
