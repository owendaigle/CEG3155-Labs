--- @Author: OWEN DAIGLE
--- @Inputs: NONE
--- @Outputs: NONE
--- @Function: TESTBENCH FOR

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY bit8RippleFullAdderSubtractor_TB IS

END ENTITY bit8RippleFullAdderSubtractor_TB;

ARCHITECTURE test OF bit8RippleFullAdderSubtractor_TB IS
    SIGNAL sub, cout, overflow: STD_LOGIC;
    SIGNAL x, y, s: STD_LOGIC_VECTOR (7 downto 0);
BEGIN
    dut : ENTITY work.bit8RippleFullAdderSubtractor(main)
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
        -- Addition tests (sub = '0')
        sub <= '0'; x <= "00000001"; y <= "00001110"; WAIT FOR 20 NS; -- Expected Output: cout 0, s 00001111
        sub <= '0'; x <= "01111111"; y <= "10000000"; WAIT FOR 20 NS; -- Expected Output: cout 0, s 11111111
        sub <= '0'; x <= "11111111"; y <= "00000001"; WAIT FOR 20 NS; -- Expected Output: cout 1, s 00000000
        sub <= '0'; x <= "10000000"; y <= "10000000"; WAIT FOR 20 NS; -- Expected Output: cout 1, s 00000000
        sub <= '0'; x <= "00000000"; y <= "00000000"; WAIT FOR 20 NS; -- Expected Output: cout 0, s 00000000
        sub <= '0'; x <= "11111111"; y <= "11111111"; WAIT FOR 20 NS; -- Expected Output: cout 1, s 11111110
        sub <= '0'; x <= "01111111"; y <= "01111111"; WAIT FOR 20 NS; -- Expected Output: cout 0, s 11111110
        sub <= '0'; x <= "01010101"; y <= "10101010"; WAIT FOR 20 NS; -- Expected Output: cout 0, s 11111111
        sub <= '0'; x <= "10011001"; y <= "01100110"; WAIT FOR 20 NS; -- Expected Output: cout 0, s 11111111
        sub <= '0'; x <= "10000000"; y <= "01111111"; WAIT FOR 20 NS; -- Expected Output: cout 0, s 11111111
        sub <= '0'; x <= "00000000"; y <= "11111111"; WAIT FOR 20 NS; -- Expected Output: cout 0, s 11111111
        sub <= '0'; x <= "11111111"; y <= "00000000"; WAIT FOR 20 NS; -- Expected Output: cout 0, s 11111111
        sub <= '0'; x <= "10000000"; y <= "10000000"; WAIT FOR 20 NS; -- Expected Output: cout 1, s 00000000
        sub <= '0'; x <= "00000000"; y <= "00000000"; WAIT FOR 20 NS; -- Expected Output: cout 0, s 00000000
        sub <= '0'; x <= "11111111"; y <= "11111111"; WAIT FOR 20 NS; -- Expected Output: cout 1, s 11111110
        sub <= '0'; x <= "01100110"; y <= "00110011"; WAIT FOR 20 NS; -- Expected Output: cout 0, s 10011001
        sub <= '0'; x <= "10110011"; y <= "00000001"; WAIT FOR 20 NS; -- Expected Output: cout 0, s 10110100

        -- reset
        sub <= '0'; x <= "00000000"; y <= "00000000"; WAIT FOR 100 NS;

        -- Subtraction tests (sub = '1')
        sub <= '1'; x <= "00000001"; y <= "00001110"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 11110111
        sub <= '1'; x <= "01111111"; y <= "10000000"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 01111111
        sub <= '1'; x <= "11111111"; y <= "00000001"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 11111110
        sub <= '1'; x <= "10000000"; y <= "10000000"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 00000000
        sub <= '1'; x <= "00000000"; y <= "00000000"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 00000000
        sub <= '1'; x <= "11111111"; y <= "11111111"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 00000000
        sub <= '1'; x <= "01111111"; y <= "01111111"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 00000000
        sub <= '1'; x <= "01010101"; y <= "10101010"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 10101011
        sub <= '1'; x <= "10011001"; y <= "01100110"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 00110011
        sub <= '1'; x <= "10000000"; y <= "01111111"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 00000001
        sub <= '1'; x <= "00000000"; y <= "11111111"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 00000001
        sub <= '1'; x <= "11111111"; y <= "00000000"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 11111111
        sub <= '1'; x <= "10000000"; y <= "10000000"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 00000000
        sub <= '1'; x <= "00000000"; y <= "00000000"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 00000000
        sub <= '1'; x <= "11111111"; y <= "11111111"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 00000000
        sub <= '1'; x <= "01100110"; y <= "00110011"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 00110101
        sub <= '1'; x <= "10110011"; y <= "00000001"; WAIT FOR 20 NS; -- Expected Output: overflow 0, s 10110010




        WAIT;
    END PROCESS test_process;
END ARCHITECTURE test;
