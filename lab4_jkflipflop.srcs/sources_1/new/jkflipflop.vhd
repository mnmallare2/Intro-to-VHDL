library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity jkflipflop is
Port (
Clk : in std_logic;
Reset : in std_logic;
J : in std_logic;
K : in std_logic;
Q : out std_logic;
Qnot : out std_logic
);
end jkflipflop;

architecture Behavioral of jkflipflop is
signal presentstate : std_logic := '0';
signal nextstate : std_logic;
begin

nextstate <= (J AND NOT presentstate) OR
(NOT K AND presentstate);

process(Clk, Reset)
begin
if Reset = '1' then
presentstate <= '0';
elsif rising_edge(Clk) then
presentstate <= nextstate;
end if;
end process;

Q <= presentstate;
Qnot <= NOT presentstate;

end Behavioral;
