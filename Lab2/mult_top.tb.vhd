--- @Author: OWEN DAIGLE
--- @Inputs: NONE
--- @Outputs: NONE
--- @Function: TESTBENCH FOR

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mult_top_TB IS

END ENTITY mult_top_TB;

ARCHITECTURE test OF mult_top_TB IS
    SIGNAL Gclk, Greset, DONE: STD_LOGIC;
    SIGNAL A, B : STD_LOGIC_VECTOR (3 downto 0);
    SIGNAL O : STD_LOGIC_VECTOR(7 downto 0);
BEGIN
    dut : ENTITY work.mult_top(main)
        PORT MAP (
            --- a => a
            A => A,
            B => B,
            O => O,
            Gclk => Gclk,
            Greset => Greset,
            DONE => DONE
        );

    test_process : PROCESS IS
    BEGIN
        --- test code here
        Greset <= '1'; A <= "0100"; B <= "0111";
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Greset <= '0';
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        --- 0001 1100
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE

        Greset <= '1'; A <= "0111"; B <= "0111";
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Greset <= '0';
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        --- 0011 0001
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE

        Greset <= '1'; A <= "0001"; B <= "0111";
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Greset <= '0';
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        --- 0000 0111
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE

        Greset <= '1'; A <= "0101"; B <= "0100";
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Greset <= '0';
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        --- 0001 0100
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE

        Greset <= '1'; A <= "0101"; B <= "0110";
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Greset <= '0';
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        --- 0001 1110
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE

        WAIT;
    END PROCESS test_process;
END ARCHITECTURE test;
