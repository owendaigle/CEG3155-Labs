--- @Author: OWEN DAIGLE
--- @Inputs: A and B are the two numbers where A is first number, and B is second number. OPSEL1 and OPSEL0 are selectors. 00 SUM, 01 DIFF, 10 PRODUCT, 11 QUOT
--- @Outputs: O is the 8 bit output. V is overflow flag, C is carry flag, Z is zero flag.
--- @Function: Adds, Subtracts, Multiplies, or Divides 4 bit numbers. These numbers are signed using 2s complement form
--- @Tested ON

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY top IS
    PORT (
        A, B: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        OPSEL : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        O: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        C, V, Z: OUT STD_LOGIC;
        GCLK, GRESET : IN STD_LOGIC
        );
END ENTITY top;

ARCHITECTURE main OF top IS
    ---convenience signals
    SIGNAL ADD_OUT, MULT_OUT, OUT_INT : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL ADD_OUT_PRE : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL C_INT, V_INT : STD_LOGIC;
BEGIN
    ADD_OUT(0) <= ADD_OUT_PRE(0); ADD_OUT(1) <= ADD_OUT_PRE(1); ADD_OUT(2) <= ADD_OUT_PRE(2); ADD_OUT(3) <= ADD_OUT_PRE(3);
    ADD_OUT(4) <= '0'; ADD_OUT(5) <= '0'; ADD_OUT(6) <= '0'; ADD_OUT(7) <= '0'; --- CONVERTS 4 BIT TO 8 BIT.

    --- FIND ZERO FLAG
    Z <= NOT ((OPSEL(1) AND (MULT_OUT(0) OR MULT_OUT(1) OR MULT_OUT(2) OR MULT_OUT(3) OR MULT_OUT(4) OR MULT_OUT(5) OR MULT_OUT(6) OR MULT_OUT(7))) OR (NOT OPSEL(1) AND (ADD_OUT(0) OR ADD_OUT(1) OR ADD_OUT(2) OR ADD_OUT(3) OR ADD_OUT(4) OR ADD_OUT(5) OR ADD_OUT(6) OR ADD_OUT(7))));

    --- GET OUTPUT
    gen_o : for i in 0 to 7 generate
        O(i) <= (OPSEL(1) AND MULT_OUT(i)) OR (NOT OPSEL(1) AND ADD_OUT(i));
    end generate gen_o;

    --- GET CARRY
    C <= C_INT AND NOT OPSEL(1);

    --- GET OVERFLO
    V <= V_INT AND NOT OPSEL(1);

    --- MULT
    MULTER : ENTITY work.mult_div_top(main)
        PORT MAP (
            --- a => a
            A => A,
            B => B,
            DIV => OPSEL(0),
            Gclk => GCLK,
            Greset => GRESET,
            O => MULT_OUT
        );

    --- ADDER
    ADDER : ENTITY work.bit4RippleFullAdderSubtractor(main)
        PORT MAP (
            --- a => a
            sub => OPSEL(0),
            cout => C_INT,
            overflow => V_INT,
            x => A,
            y => B,
            s => ADD_OUT_PRE
        );

END ARCHITECTURE main;
