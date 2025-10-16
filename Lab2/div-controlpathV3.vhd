--- @Author: OWEN DAIGLE
--- @Inputs:
--- @Outputs:
--- @Function:
--- @Tested ON OCT 15 2025

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY div_controlpathV3 IS
    PORT (
        A, B, RMB: IN STD_LOGIC_VECTOR(3 downto 0);
        L: IN STD_LOGIC_VECTOR(2 downto 0);
        Gclk, Greset: IN STD_LOGIC;
        RESETR, RESETLOOP, RESETQ, LDA, LDB, LSHR, LSHA, LSHQ1, SUB, LOOPPP, LDR, LSHQ0, DONE: OUT STD_LOGIC
        );
END ENTITY div_controlpathV3;

ARCHITECTURE main OF div_controlpathV3 IS
    ---convenience signals
    SIGNAL S1POSS, BUFF : STD_LOGIC; --- 1 if S1 is possible (In S0, S2, or S3)
    SIGNAL q_int, d_int: STD_LOGIC_VECTOR(4 downto 0); ---for 4 states and buffer
    SIGNAL L_BelowMax : STD_LOGIC; --- logic expression to be below the Lth repetition
BEGIN
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
    dff3 : entity work.DFlipFlop(main)
        port map (
            EN=>'1',
            D=>d_int(3),
            clk=>Gclk,
            asyncR=>Greset,
            asyncS=>'0',
            q0=>q_int(3)
        );
    dff3BUFF : entity work.DFlipFlop(main)
        port map (
            EN=>'1',
            D=>d_int(4),
            clk=>Gclk,
            asyncR=>Greset,
            asyncS=>'0',
            q0=>q_int(4)
        );
    --- define max repetitions in loop
    --- L_BelowMax <= NOT ((L(2) AND L(1)) OR (L(2) AND NOT L(1) AND L(0)));
    L_BelowMax <= NOT L(2);
    --- L_BelowMax <= (NOT L(2) AND NOT L(1) AND NOT L(0)) OR (NOT L(2) AND NOT L(1));

    --- define inputs to state flip flops
    d_int(0) <= '0';
    d_int(1) <=  NOT q_int(0) AND NOT q_int(1) AND NOT q_int(2) AND NOT q_int(3) AND NOT q_int(4) AND L_BelowMax;
    d_int(2) <= NOT q_int(2) AND NOT q_int(0) AND q_int(4) AND NOT RMB(3) AND L_BelowMax;
    d_int(3) <= NOT q_int(3) AND NOT q_int(0) AND q_int(4) AND RMB(3) AND L_BelowMax;
    d_int(4) <= BUFF;

    --- bind internal outputs to actual outputs
    RESETR <= q_int(0);
    RESETLOOP <= q_int(0);
    RESETQ <= q_int(0);
    LDA <= q_int(0);
    LDB <= q_int(0);
    LSHR <= q_int(1);
    LSHA <= q_int(1);
    LSHQ1 <= q_int(2);
    SUB <= q_int(2);
    LOOPPP <= q_int(2) OR q_int(3);
    LDR <= q_int(2);
    LSHQ0 <= q_int(3);
    BUFF <= q_int(1);

    --- done flag, outputs 1 if done
    DONE <= NOT L_BelowMax;
END ARCHITECTURE main;
