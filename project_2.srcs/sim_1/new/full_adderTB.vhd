----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/10/2026 07:43:46 PM
-- Design Name: 
-- Module Name: full_adderTB - Behavioral
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

entity full_adderTB is
--  Port ( );
end full_adderTB;

architecture Behavioral of full_adderTB is

signal a, b, cin : std_logic;
signal s, cout : std_logic;

begin

DUT: entity work.full_adder
port map(
a => a,
b => b,
cin => cin,
s => s,
cout => cout
);

stim_proc : process
begin
a <= '0'; b <= '0'; cin <= '0'; wait for 10ns;
a <= '0'; b <= '0'; cin <= '1'; wait for 10ns;
a <= '0'; b <= '1'; cin <= '0'; wait for 10ns;
a <= '0'; b <= '1'; cin <= '1'; wait for 10ns;
a <= '1'; b <= '0'; cin <= '0'; wait for 10ns;
a <= '1'; b <= '0'; cin <= '1'; wait for 10ns;
a <= '1'; b <= '1'; cin <= '0'; wait for 10ns;
a <= '1'; b <= '1'; cin <= '1'; wait for 10ns;
wait;
end process;

end Behavioral;
