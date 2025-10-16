--- @Author: OWEN DAIGLE
--- @Inputs: NONE
--- @Outputs: NONE
--- @Function: TESTBENCH FOR Dividor 4 bit

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY div_top_tbV3 IS

END ENTITY div_top_tbV3;

ARCHITECTURE test OF div_top_tbV3 IS
    SIGNAL Gclk, Greset: STD_LOGIC;
    SIGNAL DONE: STD_LOGIC;
    SIGNAL A, B : STD_LOGIC_VECTOR (3 downto 0);
    SIGNAL O : STD_LOGIC_VECTOR(7 downto 0);
BEGIN
    dut : ENTITY work.div_topV3(main)
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
        Greset <= '1'; A <= "0111"; B <= "0100";
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Greset <= '0';
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        --- 0011 0001
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
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE

        Greset <= '1'; A <= "0011"; B <= "0001";
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Greset <= '0';
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        --- 0000 0011
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
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE

        Greset <= '1'; A <= "0111"; B <= "0010";
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Greset <= '0';
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        --- 0001 0011
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
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE

        Greset <= '1'; A <= "0111"; B <= "0011";
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Greset <= '0';
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        --- 0001 0010
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
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE

        Greset <= '1'; A <= "0111"; B <= "0101";
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Greset <= '0';
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        --- 0010 0001
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
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        Gclk <= '1'; WAIT FOR 20 NS; Gclk <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE

        WAIT;
    END PROCESS test_process;
END ARCHITECTURE test;
