--- @Author: OWEN DAIGLE
--- @Inputs: sub is 1 if subtracting, x and y are 4 bit inputs. y is the one being subtracted.
--- @Outputs: s is 4 bits sum, cout is carry out
--- @Function: 4 bit adder and subtractor. Subtracts if carry in is 1.
--- @Tested ON OCT 07 2025

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY bit4RippleFullAdderSubtractor IS
    PORT (
        sub: IN STD_LOGIC;
        cout, overflow: OUT STD_LOGIC;
        x, y: IN STD_LOGIC_VECTOR (3 downto 0);
        s: OUT STD_LOGIC_VECTOR (3 downto 0)
        );
END ENTITY bit4RippleFullAdderSubtractor;

ARCHITECTURE main OF bit4RippleFullAdderSubtractor IS
    ---convenience signals
    SIGNAL y_XORED: STD_LOGIC_VECTOR (3 downto 0); -- y XOR with subtract. Will invert if sub=1 else not
    SIGNAL cout_prev, cout_internal: STD_LOGIC; --- for overflow calcs
BEGIN
    adder : ENTITY work.bit4RippleFullAdder(main)
        PORT MAP (
            x => x,
            y => y_XORED,
            s => s,
            cout => cout_internal,
            cout_prev => cout_prev,
            cin => sub
        );

    cout <= cout_internal;
    overflow <= cout_internal XOR cout_prev;
    y_XORED(0) <= y(0) XOR sub;
    y_XORED(1) <= y(1) XOR sub;
    y_XORED(2) <= y(2) XOR sub;
    y_XORED(3) <= y(3) XOR sub;

END ARCHITECTURE main;
