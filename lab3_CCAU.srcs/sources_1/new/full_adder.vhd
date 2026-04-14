----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/10/2026 03:20:56 PM
-- Design Name: 
-- Module Name: full_adder - Behavioral
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

entity full_adder is
Port ( a, b, cin: in std_logic;
cout: out std_logic;
s: out std_logic);
end full_adder;

architecture Behavioral of full_adder is

component half_adder
Port (
a, b: in std_logic;
c: out std_logic;
s: out std_logic
);
end component;

signal s1, c1, c2 : std_logic;

begin

HA1: half_adder
port map (
a => a,
b => b,
c => c1,
s => s1
);

HA2: half_adder
port map(
a => s1,
b => cin,
s => s,
c => c2
);

cout <= c1 OR c2;

end Behavioral;
