----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/10/2026 07:33:59 PM
-- Design Name: 
-- Module Name: half_adderTB - Behavioral
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

entity half_adderTB is
--  Port ( );
end half_adderTB;

architecture Behavioral of half_adderTB is

signal a, b : std_logic;
signal c : std_logic;
signal s: std_logic;

begin

DUT: entity work.half_adder
port map(
a => a,
b => b,
c => c,
s => s
);

stim_proc: process
begin
a <= '0'; b <= '0'; wait for 10ns;
a <= '0'; b <= '1'; wait for 10ns;
a <= '1'; b <= '0'; wait for 10ns;
a <= '1'; b <= '1'; wait for 10ns;
wait;
end process;

end Behavioral;
