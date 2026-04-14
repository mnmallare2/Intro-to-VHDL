----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/17/2026 03:36:02 PM
-- Design Name: 
-- Module Name: CCAU - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CCAU is
Port (
A : in STD_LOGIC_VECTOR(7 downto 0);
Y : out STD_LOGIC_VECTOR (7 downto 0)
 );
end CCAU;

architecture Behavioral of CCAU is

component ripple_adder8bit
Port (
a, b : in STD_LOGIC_VECTOR(7 downto 0);
s : out STD_LOGIC_VECTOR(7 downto 0);
cout : out STD_LOGIC
);
end component;

component mux2to1
Port (
A : in STD_LOGIC_VECTOR(7 downto 0);
B : in STD_LOGIC_VECTOR(7 downto 0);
S : in STD_LOGIC;
Y : out STD_LOGIC_VECTOR(7 downto 0)
);
end component;

component comparator8bit
Port (
A : in STD_LOGIC_VECTOR(7 downto 0);
comp5 : out STD_LOGIC
);
end component;

signal sum20 : STD_LOGIC_VECTOR(7 downto 0);
signal sum40 : STD_LOGIC_VECTOR(7 downto 0);
signal comp5 : STD_LOGIC;
signal place1, place2 : STD_LOGIC;

begin

Comp : comparator8bit
port map (
A => A,
comp5 => comp5
);

Add20 : ripple_adder8bit
port map(
a => A,
b => "00010100",
s => sum20,
cout => place1
);

Add40 : ripple_adder8bit
port map(
a => A,
b => "00101000",
s => sum40,
cout => place2
);

Mux : mux2to1
port map(
A => sum40,
B => sum20,
S => comp5,
Y => Y
);


end Behavioral;
