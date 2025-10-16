--- @Author: OWEN DAIGLE
--- @Inputs: INC is for incrementing, RESET is to reset the counter asynchronously, CLK is global clk
--- @Outputs: s is output S2 is MSB.
--- @Function: A counter to count 000 001 010 011 100 101 110 111 000 ...
--- @Tested ON OCT 12 2025

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY bit3counter IS
    PORT (
        INC, RESET, CLK: IN STD_LOGIC;
        s: OUT STD_LOGIC_VECTOR(2 downto 0)
        );
END ENTITY bit3counter;

ARCHITECTURE main OF bit3counter IS
    ---convenience signals
    signal d2_int, d1_int, d0_int, s2_int, s1_int, s0_int:  STD_LOGIC;
BEGIN
    d2 : entity work.DFlipFlop(main)
		port map (
            EN=>'1',
            D=>d2_int,
            clk=>CLK,
            asyncR=>RESET,
            asyncS=>'0',
            q0=>s2_int
        );
    d1 : entity work.DFlipFlop(main)
		port map (
            EN=>'1',
            D=>d1_int,
            clk=>CLK,
            asyncR=>RESET,
            asyncS=>'0',
            q0=>s1_int
        );
    d0 : entity work.DFlipFlop(main)
		port map (
            EN=>'1',
            D=>d0_int,
            clk=>CLK,
            asyncR=>RESET,
            asyncS=>'0',
            q0=>s0_int
        );
    s(2) <= s2_int;
    s(1) <= s1_int;
    s(0) <= s0_int;
    d2_int <= (((NOT s2_int AND s1_int AND s0_int) OR (s2_int AND NOT s1_int) OR (s2_int AND NOT s0_int)) AND INC) OR (s2_int AND NOT INC);
    d1_int <= ((s1_int XOR s0_int) AND INC) OR (s1_int AND NOT INC);
    d0_int <= ((NOT s0_int) AND INC) OR (s0_int AND NOT INC);
END ARCHITECTURE main;
