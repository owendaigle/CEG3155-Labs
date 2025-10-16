--- @Author: OWEN DAIGLE
--- @Inputs:
--- @Outputs:
--- @Function: 4 bit divider circuit
--- @Tested ON OCT 15 2025

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY div_topV3 IS
    PORT (
        A, B: IN STD_LOGIC_VECTOR(3 downto 0);
        O: OUT STD_LOGIC_VECTOR(7 downto 0);
        DONE: OUT STD_LOGIC;
        Gclk, Greset: IN STD_LOGIC
        );
END ENTITY div_topV3;

ARCHITECTURE main OF div_topV3 IS
    ---convenience signals
    SIGNAL RESETR, RESETLOOP, RESETQ, LDA, LDB, LSHR, LSHA, LSHQ1, SUB, LOOPPP, LDR, LSHQ0: STD_LOGIC;
    SIGNAL L: STD_LOGIC_VECTOR(2 downto 0);
    SIGNAL RMB: STD_LOGIC_VECTOR(3 downto 0);
BEGIN
    dp : ENTITY work.div_datapathV3(main)
        PORT MAP (
            --- a => a
            A => A,
            B => B,
            L => L,
            Q => O,
            Gclk => Gclk,
            Greset => Greset,
            RMB => RMB,
            RESETLOOP => RESETLOOP,
            SUB => SUB,
            LDR => LDR,
            LSHQ1 => LSHQ1,
            LSHQ0 => LSHQ0,
            LOOPPP => LOOPPP,
            LDB => LDB,
            LDA => LDA,
            RESETR => RESETR,
            RESETQ => RESETQ,
            LSHR => LSHR,
            LSHA => LSHA
        );

    cp : ENTITY work.div_controlpathV3(main)
        PORT MAP (
            --- a => a
            A => A,
            B => B,
            L => L,
            Gclk => Gclk,
            Greset => Greset,
            RMB => RMB,
            RESETLOOP => RESETLOOP,
            SUB => SUB,
            LDR => LDR,
            LSHQ1 => LSHQ1,
            LSHQ0 => LSHQ0,
            LOOPPP => LOOPPP,
            LDB => LDB,
            LDA => LDA,
            RESETR => RESETR,
            RESETQ => RESETQ,
            LSHR => LSHR,
            LSHA => LSHA,
            DONE => DONE
        );
END ARCHITECTURE main;
