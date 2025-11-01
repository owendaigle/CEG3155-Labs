--- @Author: OWEN DAIGLE
--- @Inputs: LD is to load 4 bit input of I. CLK and RESET are to reset to 0000, and the clock which increments the counter eacy cycle
--- @Outputs: Q is a 4 bit output with Q(3) as MSB. T is 1 if Q is at max (0d15 - 0b1111)
--- @Function: A counter to count 0000 0001 0010 0011 ... We can load the starting value from I using LD. So if I = 1100, and we LD, then we go 1100 1101 1110 1111 ...
--- @Tested ON OCT 31 2025

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY bit4countertimer IS
    PORT (
        LD, RESET, CLK: IN STD_LOGIC;
        T: OUT STD_LOGIC;
        Q: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        I: IN STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
END ENTITY bit4countertimer;

ARCHITECTURE rtl OF bit4countertimer IS
    ---convenience signals
    signal D_int, Q_int:  STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
    d3 : entity work.DFlipFlop(main)
        port map (
            EN=>'1',
            D=>D_int(3),
            clk=>CLK,
            asyncR=>RESET,
            asyncS=>'0',
            q0=>Q_int(3)
        );
    d2 : entity work.DFlipFlop(main)
		port map (
            EN=>'1',
            D=>D_int(2),
            clk=>CLK,
            asyncR=>RESET,
            asyncS=>'0',
            q0=>Q_int(2)
        );
    d1 : entity work.DFlipFlop(main)
		port map (
            EN=>'1',
            D=>D_int(1),
            clk=>CLK,
            asyncR=>RESET,
            asyncS=>'0',
            q0=>Q_int(1)
        );
    d0 : entity work.DFlipFlop(main)
		port map (
            EN=>'1',
            D=>D_int(0),
            clk=>CLK,
            asyncR=>RESET,
            asyncS=>'0',
            q0=>Q_int(0)
        );
    T <= Q_int(0) AND Q_int(1) AND Q_int(2) AND Q_int(3);
    Q <= Q_int;
    D_int(3) <= (NOT LD AND ((Q_int(3) AND NOT Q_int(2)) OR (Q_int(3) AND NOT Q_int(1)) OR (Q_int(3) AND NOT Q_int(0)) OR (NOT Q_int(3) AND Q_int(2) AND Q_int(1) AND Q_int(0)))) OR (LD AND I(3));
    D_int(2) <= (NOT LD AND ((Q_int(2) AND NOT Q_int(1)) OR (Q_int(2) AND NOT Q_int(0)) OR (NOT Q_int(2) AND Q_int(1) AND Q_int(0)))) OR (LD AND I(2));
    D_int(1) <= (NOT LD AND (Q_int(1) XOR Q_int(0))) OR (LD AND I(1));
    D_int(0) <= (NOT LD AND (NOT Q_int(0))) OR (LD AND I(0));


END ARCHITECTURE rtl;
