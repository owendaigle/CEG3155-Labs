--- @Author: OWEN DAIGLE
--- @Inputs:
--- @Outputs:
--- @Function:
--- @Tested ON

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY div_datapathV3 IS
    PORT (
        A, B: IN STD_LOGIC_VECTOR(3 downto 0);
        L: OUT STD_LOGIC_VECTOR(2 downto 0);
        Q: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        Gclk, Greset : IN STD_LOGIC;
        RMB, R: OUT STD_LOGIC_VECTOR(3 downto 0);
        RESETR, RESETLOOP, RESETQ, LDA, LDB, LSHR, LSHA, LSHQ1, SUB, LOOPPP, LDR, LSHQ0: IN STD_LOGIC
        );
END ENTITY div_datapathV3;

ARCHITECTURE main OF div_datapathV3 IS
    ---convenience signals
    signal L_int: STD_LOGIC_VECTOR(2 downto 0);
    signal A_int, B_int: STD_LOGIC_VECTOR (3 downto 0);
    signal R_int, SUM_int: STD_LOGIC_VECTOR (3 downto 0);
    SIGNAL Q_int, RMB_int : STD_LOGIC_VECTOR(3 downto 0);
BEGIN
    B_reg : ENTITY work.bit4reg_w_right_shift_logical(main) port map (
        A => B,
        O => B_int,
        LD => LDB,
        SH => '0',
        Gclk => Gclk
    );

    A_reg : ENTITY work.bit4reg_w_left_shift_serial(main) port map (
        A => A,
        O => A_int,
        LD => LDA,
        SH => LSHA,
        Gclk => Gclk,
        Greset => '0',
        w => '0'
    );

    Main_adder : ENTITY work.bit4RippleFullAdderSubtractor(main) PORT MAP (
        sub => SUB,
        x => R_int,
        y => B_int,
        s => SUM_int
    );


    R_reg : ENTITY work.bit4reg_w_left_shift_serial(main) port map (
        A => SUM_int,
        O => R_int,
        LD => LDR,
        SH => LSHR,
        w => A_int(3),
        Gclk => Gclk,
        Greset => RESETR
    );

    LoopCounter : ENTITY work.bit3counter(main) PORT MAP (
        INC => LOOPPP,
        RESET => RESETLOOP,
        CLK => Gclk,
        s => L_int
    );

    Q_reg : ENTITY work.bit4reg_w_weird_left_shift(main) PORT MAP (
        A => "0000",
        O => Q_int,
        SH1 => LSHQ1,
        SH0 => LSHQ0,
        Gclk => Gclk,
        Greset => Greset,
        LD => RESETQ
    );

    RMB_adder : ENTITY work.bit4RippleFullAdderSubtractor(main) PORT MAP (
        sub => '1',
        x => R_int,
        y => B_int,
        s => RMB_int
    );

    RMB <= RMB_int;
    L <= L_int;
    R <= R_int;
    Q(0) <= Q_int(0);
    Q(1) <= Q_int(1);
    Q(2) <= Q_int(2);
    Q(3) <= Q_int(3);
    Q(4) <= R_int(0);
    Q(5) <= R_int(1);
    Q(6) <= R_int(2);
    Q(7) <= R_int(3);
END ARCHITECTURE main;
