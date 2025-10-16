--- @Author: OWEN DAIGLE
--- @Inputs: NONE
--- @Outputs: NONE
--- @Function: TESTBENCH FOR

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mult_datapath_tb IS

END ENTITY mult_datapath_tb;

ARCHITECTURE test OF mult_datapath_tb IS
        SIGNAL A, B: STD_LOGIC_VECTOR(3 downto 0); --- multiplier and multiplicand
        SIGNAL L: STD_LOGIC_VECTOR(2 downto 0); --- counter outputs
        SIGNAL P: STD_LOGIC_VECTOR(7 downto 0); --- product
        SIGNAL Gclk, Greset : STD_LOGIC;
        SIGNAL RESETP, RESETLOOP, LDP, LSHA, LOOPPP, LDA, LDB, RSHB : STD_LOGIC; --- received control signals
BEGIN
    dut : ENTITY work.mult_datapath(main)
        PORT MAP (
            --- a => a
            A => A,
            B => B,
            L => L,
            P => P,
            Gclk => Gclk,
            Greset => Greset,
            RESETP => RESETP,
            RESETLOOP => RESETLOOP,
            LDP => LDP,
            LSHA => LSHA,
            LOOPPP => LOOPPP,
            LDA => LDA,
            RSHB => RSHB,
            LDB => LDB
        );

    test_process : PROCESS IS
    BEGIN
        --- test code here
        Greset <= '1';
        Gclk <= '0'; WAIT FOR 20 NS; Gclk <= '1'; WAIT FOR 20 NS; --- CLOCK PULSE
        Greset <= '0';
        Gclk <= '0'; WAIT FOR 20 NS; Gclk <= '1'; WAIT FOR 20 NS; --- CLOCK PULSE



        WAIT;
    END PROCESS test_process;
END ARCHITECTURE test;
