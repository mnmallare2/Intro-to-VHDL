----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/10/2026 03:39:41 PM
-- Design Name: 
-- Module Name: ripple_adder8bit - Behavioral
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

entity ripple_adder8bit is
Port ( 
a, b: in std_logic_vector(7 downto 0);
s: out std_logic_vector(7 downto 0);
cout: out std_logic
);
end ripple_adder8bit;

architecture Behavioral of ripple_adder8bit is

component half_adder
Port (
a, b: in std_logic;
c: out std_logic;
s: out std_logic
);
end component;

component full_adder
Port ( a, b, cin: in std_logic;
s: out std_logic;
cout: out std_logic);
end component;

signal c : std_logic_vector(7 downto 0);

begin

HA0: half_adder
port map(
a => a(0),
b => b(0),
s => s(0),
c => c(0)
);

FA1: full_adder 
port map (a(1), b(1), c(0), s(1), c(1));
 
FA2: full_adder 
port map (a(2), b(2), c(1), s(2), c(2));

FA3: full_adder 
port map (a(3), b(3), c(2), s(3), c(3));

FA4: full_adder 
port map (a(4), b(4), c(3), s(4), c(4));

FA5: full_adder 
port map (a(5), b(5), c(4), s(5), c(5));

FA6: full_adder 
port map (a(6), b(6), c(5), s(6), c(6));

FA7: full_adder 
port map (a(7), b(7), c(6), s(7), c(7));

cout <= c(7);

end Behavioral;
