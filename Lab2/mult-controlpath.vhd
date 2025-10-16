--- @Author: OWEN DAIGLE
--- @Inputs: A and B are numbers to multiply, clk and global reset
--- @Outputs: L is outputs from counter in datapath, and all control signals
--- @Function: control path for the multiplier
--- @Tested ON OCT 13 2025

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mult_controlpath IS
    PORT (
        A, B: IN STD_LOGIC_VECTOR(3 downto 0); --- multiplier and multiplicand
        L: IN STD_LOGIC_VECTOR(2 downto 0); --- counter outputs
        Gclk, Greset, B0 : IN STD_LOGIC;
        RESETP, RESETLOOP, LDP, LSHA, LOOPPP, LDA, LDB, RSHB, DONE: OUT STD_LOGIC --- generated control signals
        );
END ENTITY mult_controlpath;

ARCHITECTURE main OF mult_controlpath IS
    ---convenience signals
    signal Bi : STD_LOGIC;
    signal q_int, d_int : STD_LOGIC_VECTOR(2 downto 0);
    SIGNAL L_BelowMax : STD_LOGIC; --- logic expression to be below the Lth repetition

BEGIN
    Bi <= (B(0) AND NOT L(1) AND NOT L(0)) OR (B(1) AND NOT L(1) AND L(0)) OR (B(2) AND L(1) AND NOT L(0)) OR (B(3) AND L(1) AND L(2)); --- mux for Bi to get the ith digit of B depending on the loop stage
    dff0 : entity work.DFlipFlop(main)
		port map (
            EN=>'1',
            D=>d_int(0),
            clk=>Gclk,
            asyncR=>'0',
            asyncS=>Greset,
            q0=>q_int(0)
            );
        dff1 : entity work.DFlipFlop(main)
		port map (
            EN=>'1',
            D=>d_int(1),
            clk=>Gclk,
            asyncR=>Greset,
            asyncS=>'0',
            q0=>q_int(1)
            );
        dff2 : entity work.DFlipFlop(main)
		port map (
            EN=>'1',
            D=>d_int(2),
            clk=>Gclk,
            asyncR=>Greset,
            asyncS=>'0',
            q0=>q_int(2)
            );

        ---define max repetitions in the loop
        L_BelowMax <= NOT L(2);

        --- define inputs to state flip flops
        d_int(0) <= '0';
        d_int(1) <= L_BelowMax AND B0 AND NOT q_int(0);
        d_int(2) <= L_BelowMax AND NOT B0 AND NOT q_int(0);

        --- bind internal outputs to actual outputs
        LDA <= q_int(0);
        RESETP <= q_int(0);
        RESETLOOP <= q_int(0);
        LDP <= q_int(1);
        LSHA <= q_int(1) OR q_int(2);
        LOOPPP <= q_int(1) OR q_int(2) OR (NOT q_int(0) AND NOT q_int(1) AND NOT q_int(2) AND L_BelowMax);
        RSHB <= q_int(1) OR q_int(2) OR (NOT q_int(0) AND NOT q_int(1) AND NOT q_int(2) AND L_BelowMax);
        LDB <= q_int(0);

        --- done flag
        DONE <= L(2);

END ARCHITECTURE main;
