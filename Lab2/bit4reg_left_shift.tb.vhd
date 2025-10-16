--- @Author: OWEN DAIGLE
--- @Inputs: NONE
--- @Outputs: NONE
--- @Function: TESTBENCH

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity bit4reg_w_leftshift_TB is
end entity bit4reg_w_leftshift_TB;

architecture testV1 of bit4reg_w_leftshift_TB is
	signal A, O: STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	signal Gclk, LD, SH : STD_LOGIC := '0';

begin
	dut : entity work.bit4reg_w_left_shift(main)
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
		A <= "1000"; LD <= '1'; wait for 20 ns;
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		LD <= '0'; wait for 20 ns; --- 1000
		SH <= '1';
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		--- 0001
		SH <= '0'; wait for 20 ns;
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		SH <= '1'; wait for 20 ns;
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		--- 0010
		SH <= '0'; wait for 20 ns;
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		SH <= '1'; wait for 20 ns;
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		--- 0100
		SH <= '0'; wait for 20 ns;
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		SH <= '1'; wait for 20 ns;
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		--- 1000



		wait;
	end process test_process;
end architecture testV1;
