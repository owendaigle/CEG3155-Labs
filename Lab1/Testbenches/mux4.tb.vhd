--- @Author: OWEN DAIGLE
--- @Inputs: NONE
--- @Outputs: NONE
--- @Function: TESTBENCH

LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 

entity MUX4_TB is
end entity MUX4_TB;

architecture testV1 of MUX4_TB is
	signal i0, i1, i2, i3, s0, s1, o: STD_LOGIC;

begin
	dut : entity work.MUX4(main)
		port map (i0=>i0, i1 => i1, i2 => i2, i3 => i3, s0 => s0, s1 => s1, o => o);
	
	test_process : process is
	begin
		--- test code here
		i0 <= '1'; i1 <= '0'; i2 <= '1'; i3 <= '0'; wait for 20 ns;
		s1 <= '0'; s0 <= '0'; wait for 20 ns; --- o=1
		s1 <= '0'; s0 <= '1'; wait for 20 ns; --- o=0		
		s1 <= '1'; s0 <= '0'; wait for 20 ns; --- o=1
		s1 <= '1'; s0 <= '1'; wait for 20 ns; --- o=0

		i0 <= '0'; i1 <= '1'; i2 <= '0'; i3 <= '1';
		s1 <= '0'; s0 <= '0'; wait for 20 ns; --- o=0
		s1 <= '0'; s0 <= '1'; wait for 20 ns; --- o=1
		s1 <= '1'; s0 <= '0'; wait for 20 ns; --- o=0
		s1 <= '1'; s0 <= '1'; wait for 20 ns; --- o=1

		wait;
	end process test_process;
end architecture testV1;