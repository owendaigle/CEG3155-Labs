--- @Author: OWEN DAIGLE
--- @Inputs: NONE
--- @Outputs: NONE
--- @Function: TESTBENCH FOR

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY bit4RippleFullAdder_TB IS

END ENTITY bit4RippleFullAdder_TB;

ARCHITECTURE test OF bit4RippleFullAdder_TB IS
    SIGNAL cin, cout, cout_prev: STD_LOGIC;
    SIGNAL x, y, s: STD_LOGIC_VECTOR (3 downto 0);
BEGIN
    dut : ENTITY work.bit4RippleFullAdder(main)
        PORT MAP (
            --- a => a
            cin => cin,
            cout => cout,
            cout_prev => cout_prev,
            x => x,
            y => y,
            s => s
        );

    test_process : PROCESS IS
    BEGIN
        --- test code here
        x <= "0001"; y <= "1110"; cin <= '0'; WAIT FOR 20 NS; -- Expected Output: cout 0, s 1111
        x <= "0001"; y <= "1110"; cin <= '0'; WAIT FOR 20 NS; -- Expected Output: cout 0, s 1111
        x <= "0111"; y <= "1000"; cin <= '0'; WAIT FOR 20 NS; -- Expected Output: cout 0, s 1111
        x <= "1111"; y <= "0001"; cin <= '0'; WAIT FOR 20 NS; -- Expected Output: cout 1, s 0000
        x <= "1000"; y <= "1000"; cin <= '0'; WAIT FOR 20 NS; -- Expected Output: cout 1, s 0000
        x <= "0000"; y <= "0000"; cin <= '0'; WAIT FOR 20 NS; -- Expected Output: cout 0, s 0000
        x <= "1111"; y <= "1111"; cin <= '0'; WAIT FOR 20 NS; -- Expected Output: cout 1, s 1110
        x <= "0111"; y <= "0111"; cin <= '0'; WAIT FOR 20 NS; -- Expected Output: cout 0, s 1110
        x <= "0101"; y <= "1010"; cin <= '0'; WAIT FOR 20 NS; -- Expected Output: cout 0, s 1111
        x <= "1001"; y <= "0110"; cin <= '0'; WAIT FOR 20 NS; -- Expected Output: cout 0, s 1111
        x <= "1000"; y <= "0111"; cin <= '0'; WAIT FOR 20 NS; -- Expected Output: cout 0, s 1111
        x <= "0000"; y <= "1111"; cin <= '0'; WAIT FOR 20 NS; -- Expected Output: cout 0, s 1111
        x <= "1111"; y <= "0000"; cin <= '0'; WAIT FOR 20 NS; -- Expected Output: cout 0, s 1111
        x <= "1000"; y <= "1000"; cin <= '1'; WAIT FOR 20 NS; -- Expected Output: cout 1, s 0001
        x <= "0000"; y <= "0000"; cin <= '1'; WAIT FOR 20 NS; -- Expected Output: cout 0, s 0001
        x <= "1111"; y <= "1111"; cin <= '1'; WAIT FOR 20 NS; -- Expected Output: cout 1, s 1111

        WAIT;
    END PROCESS test_process;
END ARCHITECTURE test;
