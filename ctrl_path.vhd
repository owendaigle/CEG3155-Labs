--- @Author: OWEN DAIGLE
--- @Inputs: 
--- @Outputs: 
--- @Function: Control path
--- Tested on Sep 22, 2025

library ieee;
use ieee.std_logic_1164.all;

entity ctrl_path is
	port (
		L, R, Gclk, Greset: in STD_LOGIC;
		SEL1, SEL2, --- mux selectors
		LDD, LDR, LDL, --- load registers
		LSHL, RSHR : out STD_LOGIC --- register shifts
	);
end ctrl_path;

architecture main of ctrl_path is
	--- convenience signals
	signal S0, S1, S2, S3, S4, is0, is1, is2, is3, is4: STD_LOGIC;
begin
	--- state flip flops
	dff_S0 : entity work.DFlipFlop(main)
		port map (
			D => is0, 
			clk => Gclk,
			asyncR => '0',
			asyncS => Greset,
			EN => '1', 
			q0 => S0
		);
	dff_S1 : entity work.DFlipFlop(main)
		port map (
			D => is1, 
			clk => Gclk,
			asyncR => Greset,
			asyncS => '0',
			EN => '1', 
			q0 => S1
		);
	dff_S2 : entity work.DFlipFlop(main)
		port map (
			D => is2, 
			clk => Gclk,
			asyncR => Greset,
			asyncS => '0',
			EN => '1', 
			q0 => S2
		);
	dff_S3 : entity work.DFlipFlop(main)
		port map (
			D => is3, 
			clk => Gclk,
			asyncR => Greset,
			asyncS => '0',
			EN => '1', 
			q0 => S3
		);
	dff_S4 : entity work.DFlipFlop(main)
		port map (
			D => is4, 
			clk => Gclk,
			asyncR => Greset,
			asyncS => '0',
			EN => '1', 
			q0 => S4
		);

	--- inputs for state flip flops
	is0 <= '0';
	is1 <= NOT S0 AND (L AND R);
	is2 <= NOT S0 AND (L AND NOT R);
	is3 <= NOT S0 AND (R AND NOT L);
	is4 <= NOT S0 AND (NOT R AND NOT L);

	--- control signals gates.
	SEL1 <= S1 OR S3;
	SEL2 <= S0 OR S1 OR S4;
	LDD <= '1'; --- all states have LDD
	LDR <= S0;
	LDL <= S0;
	LSHL <= S1 OR S2;
	RSHR <= S1 OR S3;
	
end architecture main;