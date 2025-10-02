--- @Author: OWEN DAIGLE
--- @Inputs: NONE
--- @Outputs: NONE
--- @Function: TESTBENCH

library ieee;
use ieee.std_logic_1164.all;

entity mux4_8bit_TB is
end entity mux4_8bit_TB;

architecture testV1 of mux4_8bit_TB is
	--- DECLARITIVE
	--- define the signals for testing
	signal i0, i1, i2, i3, O: STD_LOGIC_VECTOR(7 downto 0);
	signal s1, s0: STD_LOGIC;

begin
	--- STATEMENT PART
	--- instanciate the device under test
	dut : entity work.mux4_8bit(main)
		port map (i0 => i0, i1 => i1, i2 => i2, i3 => i3, s1 => s1, s0 => s0, O => O);

	--- process that will be doing the actual testing
	test_process : process is
	begin
		i0 <= "11111111";  
  		i1 <= "00000000"; 	
		i2 <= "11110000";
		i3 <= "10101010";
		wait for 20 ns;

		s1 <= '0'; s0 <= '0'; wait for 100 ns; --- should output 11111111
		s1 <= '0'; s0 <= '1'; wait for 100 ns; --- should output 00000000
		s1 <= '1'; s0 <= '0'; wait for 100 ns; --- should output 11110000
		s1 <= '1'; s0 <= '1'; wait for 100 ns; --- should output 10101010

		wait;

	end process test_process;
end architecture testV1;