----------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CCAU_tb is
--  Port ( );
end CCAU_tb;

architecture Behavioral of CCAU_tb is

component CCAU
Port (
A : in STD_LOGIC_VECTOR(7 downto 0);
Y : out STD_LOGIC_VECTOR(7 downto 0)
);
end component;

signal A_tb : STD_LOGIC_VECTOR(7 downto 0);
signal Y_tb : STD_LOGIC_VECTOR(7 downto 0);


begin

UUT: CCAU
port map(
A => A_tb,
Y => Y_tb
);

stim_proc : process
begin

-- A=4
A_tb <= "00000100";
wait for 10ns;

-- A=5
A_tb <= "00000101";
wait for 10ns;

-- A=6
A_tb <= "00000110";
wait for 10ns;

-- A=20
A_tb <= "00010100";
wait for 10ns;

-- A=50
A_tb <= "00110010";
wait for 10ns;

wait;
end process;

end Behavioral;
