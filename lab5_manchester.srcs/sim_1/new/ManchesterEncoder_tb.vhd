library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ManchesterEncoder_tb is
end ManchesterEncoder_tb;

architecture sim of ManchesterEncoder_tb is
    signal str_input  : std_logic_vector(7 downto 0);
    signal clk        : std_logic := '0';
    signal reset      : std_logic := '1';
    signal str_output : std_logic;

    constant CLK_PERIOD : time := 20 ns;

begin
    UUT: entity work.ManchesterEncoder
        port map(
            str_input  => str_input,
            clk        => clk,
            reset      => reset,
            str_output => str_output
        );

    clk <= not clk after CLK_PERIOD / 2;

    -- Stimulus process
    stim_proc: process
    begin
    -- 0xA7
        str_input <= "10100111";  
        reset     <= '1';
        wait for CLK_PERIOD * 2;

        reset <= '0';
        wait for CLK_PERIOD * 18;

        --- 0x55
        reset <= '1';
        wait for CLK_PERIOD * 2;
        str_input <= "01010101";
        reset <= '0';
        wait for CLK_PERIOD * 18;

        wait;
    end process;

end sim;