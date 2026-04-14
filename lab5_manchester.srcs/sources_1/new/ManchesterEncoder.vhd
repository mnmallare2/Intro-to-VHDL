library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ManchesterEncoder is
    port(
        str_input  : in  std_logic_vector(7 downto 0);
        clk        : in  std_logic;
        reset      : in  std_logic;
        str_output : out std_logic
    );
end ManchesterEncoder;

architecture Behavioral of ManchesterEncoder is

    type state_type is (idle, s0, s1, s2, s3, s4, s5, s6, s7);
    signal state_reg, state_next : state_type;
    signal str_output_next       : std_logic;
    signal half                  : std_logic;
    signal done                  : std_logic;

    signal data_reg              : std_logic_vector(7 downto 0);

    function get_bit(s : state_type;
                     d : std_logic_vector(7 downto 0))
                     return std_logic is
    begin
        case s is
            when s0     => return d(7);
            when s1     => return d(6);
            when s2     => return d(5);
            when s3     => return d(4);
            when s4     => return d(3);
            when s5     => return d(2);
            when s6     => return d(1);
            when s7     => return d(0);
            when others => return '0';
        end case;
    end function;

begin
    -- PROCESS 1 : Sequential
    -- State register + look-ahead output buffer
    process(clk, reset)
    begin
        if reset = '1' then
            state_reg  <= idle;
            str_output <= '0';
            half       <= '0';
            done       <= '0';
            data_reg   <= (others => '0');
        elsif rising_edge(clk) then
            state_reg  <= state_next;
            str_output <= str_output_next;

            if state_reg = idle then
                data_reg <= str_input;
            end if;

            if state_reg = idle then
                half <= '0';
            else
                half <= not half;
            end if;

            if state_reg = s7 and half = '1' then
                done <= '1';
            else
                done <= '0';
            end if;
        end if;
    end process;

    -- PROCESS 2 : Next-State Logic
    process(state_reg, half, reset)
    begin
        state_next <= idle;
        case state_reg is

            when idle =>
                if reset = '1' then
                    state_next <= idle;
                else
                    state_next <= s0;
                end if;

            when s0 =>
                if half = '1' then state_next <= s1;
                else                state_next <= s0; end if;

            when s1 =>
                if half = '1' then state_next <= s2;
                else                state_next <= s1; end if;

            when s2 =>
                if half = '1' then state_next <= s3;
                else                state_next <= s2; end if;

            when s3 =>
                if half = '1' then state_next <= s4;
                else                state_next <= s3; end if;

            when s4 =>
                if half = '1' then state_next <= s5;
                else                state_next <= s4; end if;

            when s5 =>
                if half = '1' then state_next <= s6;
                else                state_next <= s5; end if;

            when s6 =>
                if half = '1' then state_next <= s7;
                else                state_next <= s6; end if;

            when s7 =>
                if half = '1' then state_next <= idle;
                else                state_next <= s7; end if;

            when others =>
                state_next <= idle;

        end case;
    end process;

    -- PROCESS 3 : Look-Ahead Output 
    process(state_reg, state_next, half, data_reg, str_input)
    begin
        str_output_next <= '0';
        case state_reg is

            when idle =>
                str_output_next <= str_input(7);

            when others =>
                if half = '0' then
                    str_output_next <= not get_bit(state_reg, data_reg);
                else
                    if state_next /= idle then
                        str_output_next <= get_bit(state_next, data_reg);
                    else
                        str_output_next <= '0';
                    end if;
                end if;

        end case;
    end process;

end Behavioral;
