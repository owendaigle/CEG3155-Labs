--- @Author: OWEN DAIGLE
--- @Inputs: NONE
--- @Outputs: NONE
--- @Function: TESTBENCH

LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 

entity DFlipFlop_TB is
end entity DFlipFlop_TB;

architecture testV1 of DFlipFlop_TB is
	signal D, asyncS, asyncR, clk, EN, q0: STD_LOGIC;

begin
	dut : entity work.DFlipFlop(main)
		port map (EN=>EN, D=>D, clk=>clk, asyncR=>asyncR, asyncS=>asyncS, q0=>q0);
	
	test_process : process is
	begin
		--- test code here
		EN <= '1'; clk <= '0'; asyncS <= '0'; asyncR <= '0'; --- defaults
		D <= '1'; wait for 20 ns; --- 0
		clk <= '1'; wait for 20 ns; --- 1
		D <= '0'; wait for 20 ns; --- 1
		clk <= '0'; wait for 20 ns; --- 1
		clk <= '1'; wait for 20 ns; --- 0
		asyncS <= '1'; wait for 20 ns; --- 1
		asyncS <= '0'; wait for 20 ns; --- 0
		D <= '1'; wait for 20 ns; --- 0
		clk <= '0'; wait for 20 ns; --- 0
		clk <= '1'; wait for 20 ns; --- 1
		asyncR <= '1'; wait for 20 ns; --- 0
		asyncR <= '0'; wait for 20 ns; --- 1
		EN <= '0'; wait for 20 ns; --- 1
		D <= '0'; wait for 20 ns; --- 1
		clk <= '0'; wait for 20 ns; --- 1
		clk <= '1'; wait for 20 ns; --- 1
		EN <= '1'; wait for 20 ns;--- 1
		clk <= '0'; wait for 20 ns; --- 1
		clk <= '1'; wait for 20 ns; --- 0
		wait;
	end process test_process;
end architecture testV1;