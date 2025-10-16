--- @Author: OWEN DAIGLE
--- @Inputs: A and B are the two numbers. DIV is 1 if dividing, 0 if mult. Gclk and Greset are clock and reset
--- @Outputs: O is the 8 bit output. For mult, it is the product, for div it is the Remainder and Quotient as in RRRRQQQQ 8 bits.
--- @Function: Multiplyer and Dividor for 4 bit twos complement signed numbers
--- @Tested ON OCT 16 2025

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mult_div_top IS
    PORT (
        A, B: IN STD_LOGIC_VECTOR(3 downto 0);
        DIV, Gclk, Greset : IN STD_LOGIC;
        O: OUT STD_LOGIC_VECTOR(7 downto 0)
        );
END ENTITY mult_div_top;

ARCHITECTURE main OF mult_div_top IS
    ---convenience signals
    SIGNAL A_mid_int, B_mid_int, A_twos_int, B_twos_int : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL MULT_out_int, DIV_out_int, OUT_mid_mult_int, OUT_mult_int, OUT_mid_div_int, OUT_div_int, OUT_int : STD_LOGIC_VECTOR (7 downto 0);
    SIGNAL AXORB, DONED, DONEM : STD_LOGIC;
    SIGNAL A3_4bit, B3_4bit, DIV_out_intR, DIV_out_intQ, OUT_mid_div_intR, OUT_mid_div_intQ, OUT_div_intR, OUT_div_intQ, AXORB_4bit: STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL AXORB_8bit : STD_LOGIC_VECTOR(7 downto 0);
BEGIN
    AXORB <= A(3) XOR B(3);
    AXORB_4bit(0) <= A(3) XOR B(3);
    AXORB_4bit(1) <= A(3) XOR B(3);
    AXORB_4bit(2) <= A(3) XOR B(3);
    AXORB_4bit(3) <= A(3) XOR B(3);
    AXORB_8bit(0) <= A(3) XOR B(3);
    AXORB_8bit(1) <= A(3) XOR B(3);
    AXORB_8bit(2) <= A(3) XOR B(3);
    AXORB_8bit(3) <= A(3) XOR B(3);
    AXORB_8bit(4) <= A(3) XOR B(3);
    AXORB_8bit(5) <= A(3) XOR B(3);
    AXORB_8bit(6) <= A(3) XOR B(3);
    AXORB_8bit(7) <= A(3) XOR B(3);
    A3_4bit(0) <= A(3); A3_4bit(1) <= A(3); A3_4bit(2) <= A(3); A3_4bit(3) <= A(3);
    B3_4bit(0) <= B(3); B3_4bit(1) <= B(3); B3_4bit(2) <= B(3); B3_4bit(3) <= B(3);


    --- negative number logic at start
    xor1 : entity work.bit4XOr(main)
		port map (
            A => A3_4bit,
            B => A,
            O => A_mid_int
        );

    inc1 : ENTITY work.bit4RippleFullAdder(main)
        PORT MAP (
            --- a => a
            cin => A(3),
            x => A_mid_int,
            y => "0000",
            s => A_twos_int
        );

    xor2 : entity work.bit4XOr(main)
		port map (
            A => B3_4bit,
            B => B,
            O => B_mid_int
        );

    inc2 : ENTITY work.bit4RippleFullAdder(main)
        PORT MAP (
            --- a => a
            cin => B(3),
            x => B_mid_int,
            y => "0000",
            s => B_twos_int
        );

    --- div
    d : ENTITY work.div_topV3(main)
        PORT MAP (
            --- a => a
            A => A_twos_int,
            B => B_twos_int,
            O => DIV_out_int,
            Gclk => Gclk,
            Greset => Greset,
            DONE => DONED
        );

    --- mult
    m : ENTITY work.mult_top(main)
        PORT MAP (
            --- a => a
            A => A_twos_int,
            B => B_twos_int,
            O => MULT_out_int,
            Gclk => Gclk,
            Greset => Greset,
           DONE => DONEM
        );

    --- negative number logic at the end for mult
    xor3 : entity work.bit8XOr(main)
		port map (
            A => AXORB_8bit,
            B => MULT_out_int,
            O => OUT_mid_mult_int
        );

    inc3 : ENTITY work.bit8RippleFullAdder(main)
        PORT MAP (
            --- a => a
            cin => AXORB,
            x => OUT_mid_mult_int,
            y => "00000000",
            s => OUT_mult_int
        );

    --- negative number logic at the end for div
    DIV_out_intQ(0) <= DIV_out_int(0);
    DIV_out_intQ(1) <= DIV_out_int(1);
    DIV_out_intQ(2) <= DIV_out_int(2);
    DIV_out_intQ(3) <= DIV_out_int(3);
    DIV_out_intR(0) <= DIV_out_int(4);
    DIV_out_intR(1) <= DIV_out_int(5);
    DIV_out_intR(2) <= DIV_out_int(6);
    DIV_out_intR(3) <= DIV_out_int(7);
    OUT_div_int(0) <= OUT_div_intQ(0);
    OUT_div_int(1) <= OUT_div_intQ(1);
    OUT_div_int(2) <= OUT_div_intQ(2);
    OUT_div_int(3) <= OUT_div_intQ(3);
    OUT_div_int(4) <= OUT_div_intR(0);
    OUT_div_int(5) <= OUT_div_intR(1);
    OUT_div_int(6) <= OUT_div_intR(2);
    OUT_div_int(7) <= OUT_div_intR(3);

    xor4 : entity work.bit4XOr(main) --- for R
		port map (
            A => AXORB_4bit,
            B => DIV_out_intR,
            O => OUT_mid_div_intR
        );

    inc4 : ENTITY work.bit4RippleFullAdder(main)
        PORT MAP (
            --- a => a
            cin => AXORB,
            x => OUT_mid_div_intR,
            y => "0000",
            s => OUT_div_intR
        );

    xor5 : entity work.bit4XOr(main) --- for Q
		port map (
            A => AXORB_4bit,
            B => DIV_out_intQ,
            O => OUT_mid_div_intQ
        );

    inc6 : ENTITY work.bit4RippleFullAdder(main)
        PORT MAP (
            --- a => a
            cin => AXORB,
            x => OUT_mid_div_intQ,
            y => "0000",
            s => OUT_div_intQ
        );

    O(0) <= (DONEM AND NOT DIV AND OUT_mult_int(0)) OR (DONED AND DIV AND OUT_div_int(0));
    O(1) <= (DONEM AND NOT DIV AND OUT_mult_int(1)) OR (DONED AND DIV AND OUT_div_int(1));
    O(2) <= (DONEM AND NOT DIV AND OUT_mult_int(2)) OR (DONED AND DIV AND OUT_div_int(2));
    O(3) <= (DONEM AND NOT DIV AND OUT_mult_int(3)) OR (DONED AND DIV AND OUT_div_int(3));
    O(4) <= (DONEM AND NOT DIV AND OUT_mult_int(4)) OR (DONED AND DIV AND OUT_div_int(4));
    O(5) <= (DONEM AND NOT DIV AND OUT_mult_int(5)) OR (DONED AND DIV AND OUT_div_int(5));
    O(6) <= (DONEM AND NOT DIV AND OUT_mult_int(6)) OR (DONED AND DIV AND OUT_div_int(6));
    O(7) <= (DONEM AND NOT DIV AND OUT_mult_int(7)) OR (DONED AND DIV AND OUT_div_int(7));


END ARCHITECTURE main;
