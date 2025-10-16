--- @Author: OWEN DAIGLE
--- @Inputs: NONE
--- @Outputs: NONE
--- @Function: TESTBENCH FOR

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY bit3counter_tb IS

END ENTITY bit3counter_tb;

ARCHITECTURE test OF bit3counter_tb IS
    signal  inc, reset, clk : STD_LOGIC;
    signal s: STD_LOGIC_VECTOR(2 downto 0);
BEGIN
    dut : ENTITY work.bit3counter(main)
        PORT MAP (
            --- a => a
            INC => inc,
            RESET => reset,
            CLK => clk,
            s => s
        );

    test_process : PROCESS IS
    BEGIN
        --- test code here
        clk <= '0'; reset <= '1'; inc <= '0'; WAIT FOR 20 NS;
        clk <= '0'; WAIT FOR 10 NS; clk <= '1'; WAIT FOR 20 NS;
        reset <= '0';
        clk <= '0'; WAIT FOR 10 NS; clk <= '1'; WAIT FOR 20 NS; ---clock 000
        inc <= '1';
        clk <= '0'; WAIT FOR 10 NS; clk <= '1'; WAIT FOR 20 NS; ---clock 001
        inc <= '0';
        clk <= '0'; WAIT FOR 10 NS; clk <= '1'; WAIT FOR 20 NS; ---clock 001
        inc <= '1';
        clk <= '0'; WAIT FOR 10 NS; clk <= '1'; WAIT FOR 20 NS; ---clock 010

        clk <= '0'; WAIT FOR 10 NS; clk <= '1'; WAIT FOR 20 NS; ---clock 011

        clk <= '0'; WAIT FOR 10 NS; clk <= '1'; WAIT FOR 20 NS; ---clock 100

        clk <= '0'; WAIT FOR 10 NS; clk <= '1'; WAIT FOR 20 NS; ---clock 101

        clk <= '0'; WAIT FOR 10 NS; clk <= '1'; WAIT FOR 20 NS; ---clock 110

        clk <= '0'; WAIT FOR 10 NS; clk <= '1'; WAIT FOR 20 NS; ---clock 111
        inc <= '0';
        clk <= '0'; WAIT FOR 10 NS; clk <= '1'; WAIT FOR 20 NS; ---clock 111
        inc <= '1';
        clk <= '0'; WAIT FOR 10 NS; clk <= '1'; WAIT FOR 20 NS; ---clock 000

        clk <= '0'; WAIT FOR 10 NS; clk <= '1'; WAIT FOR 20 NS; ---clock 001
        reset <= '1';
        --- 000
        WAIT;
    END PROCESS test_process;
END ARCHITECTURE test;
