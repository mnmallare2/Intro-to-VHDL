library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity mux2to1 is
Port (
A : in STD_LOGIC_VECTOR(7 downto 0);
B : in STD_LOGIC_VECTOR(7 downto 0);
S : in STD_LOGIC;
Y : out STD_LOGIC_VECTOR(7 downto 0)
);
end mux2to1;
architecture Behavioral of mux2to1 is
begin
-- If S=0 -> Y=A, if S=1 -> Y=B
Y <= A when S = '0' else B;
end Behavioral;