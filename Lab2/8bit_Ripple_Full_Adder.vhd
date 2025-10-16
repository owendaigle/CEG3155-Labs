--- @Author: OWEN DAIGLE
--- @Inputs: cin is carry in, x and y are the two 8 bit values to be added
--- @Outputs: cout is the carry out, cout_prev is the previous carry (for 3rd bit), s is the 8 bit value sum
--- @Function: this is a 8 bit ripple carry adder. adds 2 8 bit vectors x and y
--- @Tested ON

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY bit8RippleFullAdder IS
    PORT (
        cin: IN STD_LOGIC;
        x, y: IN STD_LOGIC_VECTOR(7 downto 0);
        cout, cout_prev: OUT STD_LOGIC;
        s: OUT STD_LOGIC_VECTOR(7 downto 0)
        );
END ENTITY bit8RippleFullAdder;

ARCHITECTURE main OF bit8RippleFullAdder IS
    ---convenience signals
    SIGNAL c0, c1, c2, c3, c4, c5, c6, c7: STD_LOGIC;
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
    fa4 : ENTITY work.onebit_FA(main)
        PORT MAP (
            ci => c3,
            xi => x(4),
            yi => y(4),
            so => s(4),
            co => c4
        );
    fa5 : ENTITY work.onebit_FA(main)
        PORT MAP (
            ci => c4,
            xi => x(5),
            yi => y(5),
            so => s(5),
            co => c5
        );
    fa6 : ENTITY work.onebit_FA(main)
        PORT MAP (
            ci => c5,
            xi => x(6),
            yi => y(6),
            so => s(6),
            co => c6
        );
    fa7 : ENTITY work.onebit_FA(main)
        PORT MAP (
            ci => c6,
            xi => x(7),
            yi => y(7),
            so => s(7),
            co => c7
        );
    cout <= c7;
    cout_prev <= c6;
END ARCHITECTURE main;
