--- @Author: OWEN DAIGLE
--- @Inputs: cin is carry in, x and y are the two 4 bit values to be added
--- @Outputs: cout is the carry out, cout_prev is the previous carry (for 3rd bit), s is the 4 bit value sum
--- @Function: this is a 4 bit ripple carry adder. adds 2 4 bit vectors x and y
--- @Tested ON OCT 03 2025

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY bit4RippleFullAdder IS
    PORT (
        cin: IN STD_LOGIC;
        x, y: IN STD_LOGIC_VECTOR(3 downto 0);
        cout, cout_prev: OUT STD_LOGIC;
        s: OUT STD_LOGIC_VECTOR(3 downto 0)
        );
END ENTITY bit4RippleFullAdder;

ARCHITECTURE main OF bit4RippleFullAdder IS
    ---convenience signals
    SIGNAL c0, c1, c2, c3: STD_LOGIC;
BEGIN
    fa0 : ENTITY work.onebit_FA(main)
        PORT MAP (
            ci => cin,
            xi => x(0),
            yi => y(0),
            so => s(0),
            co => c0
        );
    fa1 : ENTITY work.onebit_FA(main)
        PORT MAP (
            ci => c0,
            xi => x(1),
            yi => y(1),
            so => s(1),
            co => c1
        );
    fa2 : ENTITY work.onebit_FA(main)
        PORT MAP (
            ci => c1,
            xi => x(2),
            yi => y(2),
            so => s(2),
            co => c2
        );
    fa3 : ENTITY work.onebit_FA(main)
        PORT MAP (
            ci => c2,
            xi => x(3),
            yi => y(3),
            so => s(3),
            co => c3
        );
    cout <= c3;
    cout_prev <= c2;
END ARCHITECTURE main;
