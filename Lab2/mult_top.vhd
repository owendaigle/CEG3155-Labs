--- @Author: OWEN DAIGLE
--- @Inputs: A and B are 4 bit numbers to be multiplied, global clock and global reset
--- @Outputs: P is 8 bit product
--- @Function: Multiply 2 numbers A and B
--- @Tested ON OCT 16 2025

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mult_top IS
    PORT (
        A, B: IN STD_LOGIC_VECTOR(3 downto 0);
        O: OUT STD_LOGIC_VECTOR(7 downto 0);
        DONE: OUT STD_LOGIC;
        Gclk, Greset: IN STD_LOGIC
        );
END ENTITY mult_top;

ARCHITECTURE main OF mult_top IS
    ---convenience signals
    SIGNAL RESETP, RESETLOOP, LDP, LSHA, LOOPPP, LDA, RSHB, LDB, B0: STD_LOGIC;
    SIGNAL L: STD_LOGIC_VECTOR(2 downto 0);
BEGIN
    dp : ENTITY work.mult_datapath(main)
        PORT MAP (
            --- a => a
            A => A,
            B => B,
            L => L,
            P => O,
            Gclk => Gclk,
            Greset => Greset,
            RESETP => RESETP,
            RESETLOOP => RESETLOOP,
            LDP => LDP,
            LSHA => LSHA,
            LOOPPP => LOOPPP,
            LDA => LDA,
            RSHB => RSHB,
            LDB => LDB,
            B0 => B0
        );

    cp : ENTITY work.mult_controlpath(main)
    PORT MAP (
        --- a => a
        A => A,
        B => B,
        L => L,
        Gclk => Gclk,
        Greset => Greset,
        RESETP => RESETP,
        RESETLOOP => RESETLOOP,
        LDP => LDP,
        LSHA => LSHA,
        LOOPPP => LOOPPP,
        LDA => LDA,
        RSHB => RSHB,
        LDB => LDB,
        B0 => B0,
        DONE => DONE
    );

END ARCHITECTURE main;
