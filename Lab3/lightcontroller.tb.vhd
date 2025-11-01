--- @Author: OWEN DAIGLE
--- @Inputs: NONE
--- @Outputs: NONE
--- @Function: TESTBENCH FOR lightcontroller

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY lightcontroller_TB IS

END ENTITY lightcontroller_TB;

ARCHITECTURE test OF lightcontroller_TB IS
    SIGNAL CLK, RESET, SSCS: STD_LOGIC;
    SIGNAL MSC, SSC: STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL MSTL, SSTL: STD_LOGIC_VECTOR(2 DOWNTO 0);
BEGIN
    dut : ENTITY work.lightcontroller(main)
        PORT MAP (
            --- a => a
            CLK => CLK,
            RESET => RESET,
            SSCS => SSCS,
            MSC => MSC,
            SSC => SSC,
            MSTL => MSTL,
            SSTL => SSTL
        );

    test_process : PROCESS IS
    BEGIN
        --- test code here
        RESET <= '1'; CLK <= '0'; MSC <= "0000"; SSC <= "1000"; SSCS <= '0';
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        RESET <= '0';
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE

        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE

        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE

        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE

        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        SSCS <= '1';

        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE

        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE

        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE

        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE

        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
SSCS <= '0';
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE

        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE

        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE

        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE
        CLK <= '1'; WAIT FOR 10 NS; CLK <= '0'; WAIT FOR 10 NS; --- CLOCK PULSE

        WAIT;
    END PROCESS test_process;
END ARCHITECTURE test;
