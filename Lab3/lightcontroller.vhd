--- @Author: OWEN DAIGLE
--- @Inputs: CLK and RESET are clock and reset.
---     MSC and SSC are 4 bit counters start value. So if we input 1100, it will count from 1100 to 1101 1110 1111.
---     SSCS is sensor input for side street
--- @Outputs: MSTL and SSTL are main and side street traffic light inputs with MSTL(2) being RED, MSTL(1) YELLOW, MSTL(0) GREEN
--- @Function: Traffic light controller for two traffic lights as described in the CEG3155 Lab 3 Manual
--- @Tested ON Oct 31 2025

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY lightcontroller IS
    PORT (
        CLK, RESET, SSCS: IN STD_LOGIC;
        MSC, SSC: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        MSTL, SSTL: OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
        );
END ENTITY lightcontroller;

ARCHITECTURE main OF lightcontroller IS
    ---convenience signals
    SIGNAL D_int, P_int: STD_LOGIC_VECTOR(1 DOWNTO 0); --- D_int is input to state flip flops (next state), P_int is output from state flip flops (current state)
    SIGNAL T, LD : STD_LOGIC; --- T is the timer expired, and LD will load the inputs to the timer.
    SIGNAL TIMER_INPUT, TIMER_OUTPUT: STD_LOGIC_VECTOR (3 DOWNTO 0); -- inputs and outputs to timer
    SIGNAL MSTL_int, SSTL_int: STD_LOGIC_VECTOR(2 DOWNTO 0); -- internal traffic light outputs to be read and written
    SIGNAL YELLOWC: STD_LOGIC_VECTOR(3 DOWNTO 0); -- hardcoded value for yellow
BEGIN
    -- hardcode yellow timer
    YELLOWC <= "1100";

    -- states
    d0 : entity work.DFlipFlop(main)
        port map (
            EN=>'1',
            D=>D_int(0),
            clk=>CLK,
            asyncR=>RESET,
            asyncS=>'0',
            q0=>P_int(0)
        );
    d1 : entity work.DFlipFlop(main)
        port map (
            EN=>'1',
            D=>D_int(1),
            clk=>CLK,
            asyncR=>RESET,
            asyncS=>'0',
            q0=>P_int(1)
        );

    -- timer
    timer : ENTITY work.bit4countertimer(rtl)
        PORT MAP (
            --- a => a
            LD => LD,
            RESET => RESET,
            CLK => CLK,
            T => T,
            Q => TIMER_OUTPUT,
            I => TIMER_INPUT
        );

    -- next state inputs
    D_int(0) <= (NOT P_int(1) AND P_int(0)) OR (T AND SSCS AND NOT P_int(1)) OR (P_int(0) AND NOT T);
    D_int(1) <= (P_int(1) AND P_int(0)) OR (P_int(1) AND NOT T) OR (P_int(0) AND T);

    -- get traffic light states based on current state
    MSTL_int(2) <= P_int(1); -- R
    MSTL_int(1) <= NOT P_int(1) AND P_int(0); -- Y
    MSTL_int(0) <= NOT P_int(1) AND NOT P_int(0); -- G
    SSTL_int(2) <= NOT P_int(1); -- R
    SSTL_int(1) <= P_int(1) AND NOT P_int(0); -- Y
    SSTL_int(0) <= P_int(1) AND P_int(0); -- G

    -- find which timer should be loaded based on current light (state) and inputs
    GEN_TIMER_INPUT :
        FOR i IN 0 TO 3 GENERATE
        TIMER_INPUT(i) <=
            (YELLOWC(i) AND (
                (MSTL_int(0) AND SSTL_int(2) AND SSCS) OR
                (MSTL_int(2) AND SSTL_int(0))
            )) OR
            (MSC(i) AND (
                (MSTL_int(0) AND SSTL_int(2) AND NOT SSCS) OR
                (MSTL_int(2) AND SSTL_int(1))
            )) OR
            (SSC(i) AND (MSTL_int(1) AND SSTL_int(2)));
        END GENERATE;

    -- set load to load whenever the timer expires
    LD <= T;


    -- bind internals to outputs
    MSTL <= MSTL_int;
    SSTL <= SSTL_int;

END ARCHITECTURE main;
