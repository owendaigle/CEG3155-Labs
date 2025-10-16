--- @Author: OWEN DAIGLE
--- @Inputs: NONE
--- @Outputs: NONE
--- @Function: TESTBENCH FOR 1 BIT FA

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY onebit_FA_TB IS

END ENTITY onebit_FA_TB;

ARCHITECTURE test OF onebit_FA_TB IS
    signal ci, xi, yi, so, co: STD_LOGIC;
BEGIN
    dut : ENTITY work.onebit_FA(main)
        PORT MAP (
            ci => ci,
            xi => xi,
            yi => yi,
            so => so,
            co => co
        );

    test_process : PROCESS IS
    BEGIN
        --- test code here
        ci <= '0'; xi <= '0'; yi <= '0'; WAIT FOR 20 NS; --- should output s 0 c 0
        ci <= '0'; xi <= '0'; yi <= '1'; WAIT FOR 20 NS; --- should output s 1 c 0
        ci <= '0'; xi <= '1'; yi <= '0'; WAIT FOR 20 NS; --- should output s 1 c 0
        ci <= '0'; xi <= '1'; yi <= '1'; WAIT FOR 20 NS; --- should output s 0 c 1
        ci <= '1'; xi <= '0'; yi <= '0'; WAIT FOR 20 NS; --- should output s 1 c 0
        ci <= '1'; xi <= '0'; yi <= '1'; WAIT FOR 20 NS; --- should output s 0 c 1
        ci <= '1'; xi <= '1'; yi <= '0'; WAIT FOR 20 NS; --- should output s 0 c 1
        ci <= '1'; xi <= '1'; yi <= '1'; WAIT FOR 20 NS; --- should output s 1 c 1
        WAIT;
    END PROCESS test_process;
END ARCHITECTURE test;
