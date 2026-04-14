----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/10/2026 04:20:03 PM
-- Design Name: 
-- Module Name: ripple_adder8bitTB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_adder8bitTB is
--  Port ( );
end ripple_adder8bitTB;

architecture Behavioral of ripple_adder8bitTB is

--Testbench Signals
signal a, b : std_logic_vector(7 downto 0);
signal s    : std_logic_vector(7 downto 0);
signal cout : std_logic;

begin
-- Device Under Test
DUT: entity work.ripple_adder8bit
port map(
a => a,
b => b,
s => s,
cout => cout
);

--Stimulus Process
stim_proc : process
begin

-- 29+37
a <= "00011101";
b <= "00100101";
wait for 10 ns;

-- 100+120
a <= "01100100";
b <= "01111000";
wait for 10 ns;

-- 16 + 16
a <= "00010000";
b <= "00010000";
wait for 10 ns;

-- 10 + 130
a <= "00001010";
b <= "10000010";
wait for 10 ns;

-- 200 + 128
a <= "11001000";
b <= "10000000";
wait for 10 ns;

-- 0 + 127
a <= "00000000";
b <= "01111111";
wait for 10 ns;

-- 0 + 0
a <= "00000000";
b <= "00000000";
wait for 10 ns;

-- studentid (476) + 11
-- 476 wouldn't work due to contraints of being over 255, so i added them together to create 17 + 11
a <= "00010001";
b <= "00001011";
wait for 10 ns;

wait;
end process;

end Behavioral;
