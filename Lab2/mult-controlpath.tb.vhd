--- @Author: OWEN DAIGLE
--- @Inputs: NONE
--- @Outputs: NONE
--- @Function: TESTBENCH FOR

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mult_controlpath_TB IS

END ENTITY mult_controlpath_TB;

ARCHITECTURE test OF mult_controlpath_TB IS
    signal RESETP, RESETLOOP, LDP, LSHA, LOOPPP, LDA, B0, RSHB, LDB, clk, reset: STD_LOGIC;
    signal L : STD_LOGIC_VECTOR(2 downto 0);
    signal A, B : STD_LOGIC_VECTOR(3 downto 0);
BEGIN
    dut : ENTITY work.mult_controlpath(main)
        PORT MAP (
            --- a => a
            A => A,
            B => B,
            L => L,
            Gclk => clk,
            Greset => reset,
            RESETP => RESETP,
            RESETLOOP => RESETLOOP,
            LDP => LDP,
            LSHA => LSHA,
            LOOPPP => LOOPPP,
            LDA => LDA,
            B0 => B0,
            LDB => LDB,
            RSHB => RSHB
        );

    test_process : PROCESS IS
    BEGIN
        --- test code here
        ---reset to start state
        reset <= '1'; A <= "0000"; B <= "0001"; L <= "000"; B0 <= '0';
        clk <= '0'; WAIT FOR 20 NS; clk <= '1'; WAIT FOR 20 NS; --- CLOCK PULSE
        reset <= '0';
        clk <= '0'; WAIT FOR 20 NS; clk <= '1'; WAIT FOR 20 NS; --- CLOCK PULSE
        ---test state 1
        clk <= '0'; WAIT FOR 20 NS; clk <= '1'; WAIT FOR 20 NS; --- CLOCK PULSE
        L <= "001";
        clk <= '0'; WAIT FOR 20 NS; clk <= '1'; WAIT FOR 20 NS; --- CLOCK PULSE
        ---test state 2

        ---these tests should reset it and alwasy  stay in state 1
        reset <= '1'; A <= "0000"; B <= "1111"; L <= "001";
        clk <= '0'; WAIT FOR 20 NS; clk <= '1'; WAIT FOR 20 NS; --- CLOCK PULSE
        reset <= '0';
        clk <= '0'; WAIT FOR 20 NS; clk <= '1'; WAIT FOR 20 NS; --- CLOCK PULSE
        ---test state 1
        clk <= '0'; WAIT FOR 20 NS; clk <= '1'; WAIT FOR 20 NS; --- CLOCK PULSE
        L <= "001";
        clk <= '0'; WAIT FOR 20 NS; clk <= '1'; WAIT FOR 20 NS; --- CLOCK PULSE
        ---test state 1

        WAIT;
    END PROCESS test_process;
END ARCHITECTURE test;
