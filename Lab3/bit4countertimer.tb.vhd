--- @Author: OWEN DAIGLE
--- @Inputs: NONE
--- @Outputs: NONE
--- @Function: TESTBENCH FOR bit4countertimer

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY bit4countertimer_tb IS

END ENTITY bit4countertimer_tb;

ARCHITECTURE rtl OF bit4countertimer_tb IS
        SIGNAL LD, RESET, CLK, T: STD_LOGIC;
        SIGNAL Q, I: STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
    dut : ENTITY work.bit4countertimer(rtl)
        PORT MAP (
            --- a => a
            LD => LD,
            RESET => RESET,
            CLK => CLK,
            T => T,
            Q => Q,
            I => I
        );

    test_process : PROCESS IS
    BEGIN
        --- test code here
        CLK <= '0'; RESET <= '1'; LD <= '0'; I <= "1000"; WAIT FOR 20 NS;
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 20 NS;
        RESET <= '0';
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 20 NS;
        LD <= '1';
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 20 NS;
        LD <= '0';
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 20 NS;
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 20 NS;
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 20 NS;
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 20 NS;
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 20 NS;
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 20 NS;
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 20 NS; --- 15 T=1

        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 10 NS;
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 10 NS;
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 10 NS;
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 10 NS;
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 10 NS;
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 10 NS;
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 10 NS;
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 10 NS;
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 10 NS;
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 10 NS;
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 10 NS;
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 10 NS;
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 10 NS;
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 10 NS;
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 10 NS;
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 10 NS; --- 15 T=1
        LD <= '1'; I <= "1110";
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 20 NS;
        LD <= '0';
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 20 NS; --- 15 T=1
        RESET <= '1';
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 20 NS;
        RESET <= '0';
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 20 NS;
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 20 NS;
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 20 NS;
        RESET <= '1';
        CLK <= '0'; WAIT FOR 10 NS; CLK <= '1'; WAIT FOR 20 NS;
        RESET <= '0';


        WAIT;
    END PROCESS test_process;
END ARCHITECTURE rtl;
