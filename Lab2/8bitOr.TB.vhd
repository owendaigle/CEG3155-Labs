--- @Author: OWEN DAIGLE
--- @Inputs: NONE
--- @Outputs: NONE
--- @Function: TESTBENCH

library ieee;
use ieee.std_logic_1164.all;

entity bit8Or_TB is
end entity bit8Or_TB;

architecture testV1 of bit8Or_TB is
	--- DECLARITIVE
	--- define the signals for testing
	signal A, B, O: STD_LOGIC_VECTOR(7 downto 0);

begin
	--- STATEMENT PART
	--- instanciate the device under test
	dut : entity work.bit8Or(main)
		port map (A => A, B => B, O => O);

	--- process that will be doing the actual testing
	test_process : process is
	begin
		A <= "10010000";  
  		B <= "10100000"; 	
		--- Should output 10110000

		wait;

	end process test_process;
end architecture testV1;
