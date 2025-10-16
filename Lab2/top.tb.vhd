--- @Author: OWEN DAIGLE
--- @Inputs: NONE
--- @Outputs: NONE
--- @Function: TESTBENCH FOR TOP of mult/div/sub/add

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY top_TB IS

END ENTITY top_TB;

ARCHITECTURE test OF top_TB IS
    SIGNAL A, B: STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL OPSEL : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL O: STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL C, V, Z, GCLK, GRESET: STD_LOGIC;
BEGIN
    dut : ENTITY work.top(main)
        PORT MAP (
            --- a => a
            A => A,
            B => B,
            OPSEL => OPSEL,
            O => O,
            C => C,
            V => V,
            Z => Z,
            GCLK => GCLK,
            GRESET => GRESET
        );

    test_process : PROCESS IS
    BEGIN
        --- test code here
        GRESET <= '1'; A <= "0000"; B <= "0000"; OPSEL <= "00";
        GCLK <= '1'; WAIT FOR 20 NS; GCLK <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE
        GRESET <= '0';
        GCLK <= '1'; WAIT FOR 20 NS; GCLK <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE

        --- ADD TO GET 0101
        A <= "0010"; B <= "0011"; OPSEL <= "00";
        GCLK <= '1'; WAIT FOR 20 NS; GCLK <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE

        --- SUB TO GET 0001
        A <= "0111"; B <= "0110"; OPSEL <= "01";
        GCLK <= '1'; WAIT FOR 20 NS; GCLK <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE

        --- ADD TO GET 1110
        A <= "1111"; B <= "1111"; OPSEL <= "00";
        GCLK <= '1'; WAIT FOR 20 NS; GCLK <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE

        --- ADD TO GET OVERFLO
        A <= "0111"; B <= "0111"; OPSEL <= "00";
        GCLK <= '1'; WAIT FOR 20 NS; GCLK <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE

        --- SUB TO GET 0000
        A <= "1111"; B <= "1111"; OPSEL <= "01";
        GCLK <= '1'; WAIT FOR 20 NS; GCLK <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE

        --- ADD TO GET 0000
        A <= "1011"; B <= "0101"; OPSEL <= "00";
        GCLK <= '1'; WAIT FOR 20 NS; GCLK <= '0'; WAIT FOR 20 NS; --- CLOCK PULSE


        --- try mult op to get 0001 1100
        A <= "0100"; B <= "0111"; OPSEL <= "10";
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
        A <= "0111"; B <= "0010"; OPSEL <= "11";
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
        A <= "0100"; B <= "1001"; OPSEL <= "10";
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
        A <= "1001"; B <= "0100"; OPSEL <= "10";
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
        A <= "1100"; B <= "1001"; OPSEL <= "10";
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
        A <= "0111"; B <= "1011"; OPSEL <= "11";
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
