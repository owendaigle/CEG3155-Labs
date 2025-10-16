--- @Author: OWEN DAIGLE
--- @Inputs: NONE
--- @Outputs: NONE
--- @Function: TESTBENCH FOR

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY bit4RippleFullAdderSubtractor_TB IS

END ENTITY bit4RippleFullAdderSubtractor_TB;

ARCHITECTURE test OF bit4RippleFullAdderSubtractor_TB IS
    SIGNAL sub, cout, overflow: STD_LOGIC;
    SIGNAL x, y, s: STD_LOGIC_VECTOR (3 downto 0);
BEGIN
    dut : ENTITY work.bit4RippleFullAdderSubtractor(main)
        PORT MAP (
            --- a => a
            sub => sub,
            cout => cout,
            overflow => overflow,
            x => x,
            y => y,
            s => s
        );

    test_process : PROCESS IS
    BEGIN
        --- test code here
        -- addition tests
        sub <= '0'; x <= "0001"; y <= "1110"; WAIT FOR 20 NS; -- Expected Output: cout 0, s 1111
        sub <= '0'; x <= "0111"; y <= "1000"; WAIT FOR 20 NS; -- Expected Output: cout 0, s 1111
        sub <= '0'; x <= "1111"; y <= "0001"; WAIT FOR 20 NS; -- Expected Output: cout 1, s 0000
        sub <= '0'; x <= "1000"; y <= "1000"; WAIT FOR 20 NS; -- Expected Output: cout 1, s 0000
        sub <= '0'; x <= "0000"; y <= "0000"; WAIT FOR 20 NS; -- Expected Output: cout 0, s 0000
        sub <= '0'; x <= "1111"; y <= "1111"; WAIT FOR 20 NS; -- Expected Output: cout 1, s 1110
        sub <= '0'; x <= "0111"; y <= "0111"; WAIT FOR 20 NS; -- Expected Output: cout 0, s 1110
        sub <= '0'; x <= "0101"; y <= "1010"; WAIT FOR 20 NS; -- Expected Output: cout 0, s 1111
        sub <= '0'; x <= "1001"; y <= "0110"; WAIT FOR 20 NS; -- Expected Output: cout 0, s 1111
        sub <= '0'; x <= "1000"; y <= "0111"; WAIT FOR 20 NS; -- Expected Output: cout 0, s 1111
        sub <= '0'; x <= "0000"; y <= "1111"; WAIT FOR 20 NS; -- Expected Output: cout 0, s 1111
        sub <= '0'; x <= "1111"; y <= "0000"; WAIT FOR 20 NS; -- Expected Output: cout 0, s 1111
        sub <= '0'; x <= "1000"; y <= "1000"; WAIT FOR 20 NS; -- Expected Output: cout 1, s 0000
        sub <= '0'; x <= "0000"; y <= "0000"; WAIT FOR 20 NS; -- Expected Output: cout 0, s 0000
        sub <= '0'; x <= "1111"; y <= "1111"; WAIT FOR 20 NS; -- Expected Output: cout 1, s 1110
        sub <= '0'; x <= "0110"; y <= "0011"; WAIT FOR 20 NS; -- Expected Output: cout 0, s 1001

        -- reset
        sub <= '0'; x <= "0000"; y <= "0000"; WAIT FOR 100 NS;

        -- subtraction tests
        sub <= '1'; x <= "1111"; y <= "0010"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 0011
        sub <= '1'; x <= "0111"; y <= "1000"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 1111
        sub <= '1'; x <= "1111"; y <= "0001"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 1110
        sub <= '1'; x <= "1000"; y <= "1000"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 0000
        sub <= '1'; x <= "0000"; y <= "0000"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 0000
        sub <= '1'; x <= "1111"; y <= "1111"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 0000
        sub <= '1'; x <= "0111"; y <= "0111"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 0000
        sub <= '1'; x <= "0101"; y <= "1010"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 1011
        sub <= '1'; x <= "1001"; y <= "0110"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 0011
        sub <= '1'; x <= "1000"; y <= "0111"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 0001
        sub <= '1'; x <= "0000"; y <= "1111"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 0001
        sub <= '1'; x <= "1111"; y <= "0000"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 1111
        sub <= '1'; x <= "1000"; y <= "1000"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 0000
        sub <= '1'; x <= "0000"; y <= "0000"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 0000
        sub <= '1'; x <= "1111"; y <= "1111"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 0000
        sub <= '1'; x <= "0110"; y <= "0011"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 0011
	sub <= '0'; x <= "1011"; y <= "0001"; WAIT FOR 20 NS;



        WAIT;
    END PROCESS test_process;
END ARCHITECTURE test;
