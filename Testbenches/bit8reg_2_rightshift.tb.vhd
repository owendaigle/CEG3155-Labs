--- @Author: OWEN DAIGLE
--- @Inputs: NONE
--- @Outputs: NONE
--- @Function: TESTBENCH

LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 

entity bit8reg_2_rightshift_TB is
end entity bit8reg_2_rightshift_TB;

architecture testV1 of bit8reg_2_rightshift_TB is
	signal A, O: STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	signal Gclk, LD, SH : STD_LOGIC := '0';

begin
	dut : entity work.bit8reg_w_right_shift(main)
		port map (
			A => A,
			O => O,
			Gclk => Gclk, 
			LD => LD, 
			SH => SH
		);
	
	test_process : process is
	begin
		--- test code here
		A <= "10000000"; LD <= '1'; wait for 20 ns;
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		LD <= '0'; wait for 20 ns; --- 1000 0000
		SH <= '1';
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		--- 0100 0000
		SH <= '0'; wait for 20 ns;
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		SH <= '1'; wait for 20 ns;
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		--- 0010 0000
		SH <= '0'; wait for 20 ns; 
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		SH <= '1'; wait for 20 ns;
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		--- 0001 0000
		SH <= '0'; wait for 20 ns; 
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		SH <= '1'; wait for 20 ns;
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		--- 0000 1000
		SH <= '0'; wait for 20 ns; 
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		SH <= '1'; wait for 20 ns;
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		--- 0000 0100
		SH <= '0'; wait for 20 ns; 
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		SH <= '1'; wait for 20 ns;
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		--- 0000 0010
		SH <= '0'; wait for 20 ns; 
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		SH <= '1'; wait for 20 ns;
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		--- 0000 0001
		SH <= '0'; wait for 20 ns; 
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		SH <= '1'; wait for 20 ns;
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		--- 1000 0000
		SH <= '0'; wait for 20 ns; 
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		
		
		
		wait;
	end process test_process;
end architecture testV1;