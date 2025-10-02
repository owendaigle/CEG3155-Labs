--- @Author: OWEN DAIGLE
--- @Inputs: NONE
--- @Outputs: NONE
--- @Function: TESTBENCH
--- Notes: Run for at least 400 ns

library ieee;
use ieee.std_logic_1164.all;

entity ctrl_path_tb is
end entity ctrl_path_tb;

architecture testV1 of ctrl_path_tb is
	--- DECLARITIVE
	--- define the signals for testing
	signal L, R, SEL1, SEL2, LDD, LDR, LDL, LSHL, RSHR, Greset, Gclk: STD_LOGIC; 

begin
	--- STATEMENT PART
	--- instanciate the device under test
	dut : entity work.ctrl_path(main)
		port map (
			L => L,
			R => R,
			SEL1 => SEL1, ---sel0
			SEL2 => SEL2, ---sel1
			LDD => LDD,
			LDR => LDR,
			LDL => LDL,
			LSHL => LSHL,
			RSHR => RSHR,
			Greset => Greset,
			Gclk => Gclk
		);

	--- process that will be doing the actual testing
	test_process : process is
	begin
		--- at start
		Greset <= '1'; wait for 20 ns;
		Greset <= '0';
		

		--- L=1, R=1
		wait for 80 ns;
		L <= '1'; R <= '1';

		--- L=1, R=0
		wait for 100 ns;
		R <= '0';

		--- L=0, R=1
		wait for 100 ns;
		L <= '0'; R <= '1';

		--- L=0, R=0
		wait for 100 ns;
		R <= '0';
		
		wait;

	end process test_process;

	clock_process : process is 
	begin
		--- repeat forever
		Gclk <= '1'; wait for 10 ns; Gclk <= '0'; wait for 10 ns;

	end process clock_process;
end architecture testV1;