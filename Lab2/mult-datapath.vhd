--- @Author: OWEN DAIGLE
--- @Inputs:
--- @Outputs:
--- @Function: datapath for multiplier
--- @Tested ON

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mult_datapath IS
    PORT (
        A, B: IN STD_LOGIC_VECTOR(3 downto 0); --- multiplier and multiplicand
        L: OUT STD_LOGIC_VECTOR(2 downto 0); --- counter outputs
        P: OUT STD_LOGIC_VECTOR(7 downto 0); --- product
        Gclk, Greset : IN STD_LOGIC;
        RESETP, RESETLOOP, LDP, LSHA, LOOPPP, LDA, RSHB, LDB : IN STD_LOGIC; --- received control signals
        B0 : OUT STD_LOGIC --- to go to cp
        );
END ENTITY mult_datapath;

ARCHITECTURE main OF mult_datapath IS
    ---convenience signals
    signal L_int: STD_LOGIC_VECTOR(2 downto 0);
    signal A_int: STD_LOGIC_VECTOR (7 downto 0);
    signal P_int, SUM_int, A_extended: STD_LOGIC_VECTOR (7 downto 0);
    SIGNAL B_int : STD_LOGIC_VECTOR(3 downto 0);
BEGIN
    A_extended <= "0000" & A; --- extends the sign on A to convert from 4 bit to 8 bit.

    B_reg : ENTITY work.bit4reg_w_right_shift(main)
		port map (
			A => B,
			O => B_int,
			Gclk => Gclk,
			LD => LDB,
			SH => RSHB
		);

    B0 <= B_int(0);

    A_reg : ENTITY work.bit8reg_w_left_shift_logical(main) port map (
        A => A_extended,
        O => A_int,
        LD => LDA,
        SH => LSHA,
        Gclk => Gclk
    );

    Main_adder : ENTITY work.bit8RippleFullAdderSubtractor(main) PORT MAP (
        sub => '0',
        x => A_int,
        y => P_int,
        s => SUM_int
    );

    P_reg : ENTITY work.bit8reg_w_reset(main) port map (
        A => SUM_int,
        O => P_int,
        LD => LDP,
        SHL => '0',
        Gclk => Gclk,
        RESET => RESETP
    );

    LoopCounter : ENTITY work.bit3counter(main) PORT MAP (
        INC => LOOPPP,
        RESET => RESETLOOP,
        CLK => Gclk,
        s => L_int
    );

    L <= L_int;
    P <= P_int;



END ARCHITECTURE main;
