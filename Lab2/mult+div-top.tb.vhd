--- @Author: OWEN DAIGLE
--- @Inputs: NONE
--- @Outputs: NONE
--- @Function: TESTBENCH FOR top div and mult

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mult_div_top_TB IS

END ENTITY mult_div_top_TB;

ARCHITECTURE test OF mult_div_top_TB IS
    SIGNAL A, B: STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL DIV, Gclk, Greset : STD_LOGIC;
    SIGNAL O: STD_LOGIC_VECTOR(7 downto 0);
BEGIN
    dut : ENTITY work.mult_div_top(main)
        PORT MAP (
            --- a => a
            A => A,
            B => B,
            DIV => DIV,
            Gclk => Gclk,
            Greset => Greset,
            O => O
        );

    test_process : PROCESS IS
    BEGIN
        --- test code here
        DIV <= '0'; A <= "0000"; B <= "0000";
        Greset <= '1';
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Greset <= '0';
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        --- it is reset
        --- try mult op to get 0001 1100
        A <= "0100"; B <= "0111";
        Greset <= '1';
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Greset <= '0';
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE

        --- try div op to get 0001 0011
        A <= "0111"; B <= "0010"; DIV <= '1';
        Greset <= '1';
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Greset <= '0';
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE

        --- try mult op with (-) to get 11100100
        A <= "0100"; B <= "1001"; DIV <= '0';
        Greset <= '1';
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Greset <= '0';
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE

        --- try mult op with (-) to get 11100100
        A <= "1001"; B <= "0100"; DIV <= '0';
        Greset <= '1';
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Greset <= '0';
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE

        --- try mult op with (-) and (-) to get 0001 1100
        A <= "1100"; B <= "1001"; DIV <= '0';
        Greset <= '1';
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Greset <= '0';
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE

        --- try div op with (-) to get 1110 1111
        A <= "0111"; B <= "1011"; DIV <= '1';
        Greset <= '1';
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Greset <= '0';
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 10 NS; Gclk <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        WAIT;
    END PROCESS test_process;
END ARCHITECTURE test;
