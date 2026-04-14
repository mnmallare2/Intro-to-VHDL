----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/17/2026 04:10:14 PM
-- Design Name: 
-- Module Name: comparator8bit - Behavioral
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


entity comparator8bit is
Port (
A : in STD_LOGIC_VECTOR(7 downto 0);
comp5 : out STD_LOGIC
);
end comparator8bit;

architecture Behavioral of comparator8bit is

begin

comp5 <= '1' when A = "00000101" else '0';

end Behavioral;
