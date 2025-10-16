--- @Author: OWEN DAIGLE
--- @Inputs: NONE
--- @Outputs: NONE
--- @Function: TESTBENCH

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity bit4reg_w_weird_left_shift_TB is
end entity bit4reg_w_weird_left_shift_TB;

architecture testV1 of bit4reg_w_weird_left_shift_TB is
	signal A, O: STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	signal Gclk, LD, SH0, SH1 : STD_LOGIC := '0';

begin
	dut : entity work.bit4reg_w_weird_left_shift(main)
		port map (
			A => A,
			O => O,
			Gclk => Gclk,
			LD => LD,
			SH0 => SH0,
			SH1 => SH1
		);

	test_process : process is
	begin
		--- test code here
		A <= "1111"; LD <= '1'; wait for 20 ns;
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		LD <= '0'; wait for 20 ns; --- 1111
		SH0 <= '1';
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		--- 1110
		SH0 <= '0'; wait for 20 ns;
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		SH0 <= '1'; wait for 20 ns;
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		--- 1100
		SH0 <= '0'; wait for 20 ns;
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		SH0 <= '1'; wait for 20 ns;
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		--- 1000
		SH0 <= '0'; wait for 20 ns;
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		SH0 <= '1'; wait for 20 ns;
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns;
		--- 0000
		SH0 <= '0'; SH1 <= '1';
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns; ----0001
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns; ---- 0011
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns; ---- 1000
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns; ---- 1111
		Gclk <= '0'; wait for 20 ns; Gclk <= '1'; wait for 20 ns; ---- 1111



		wait;
	end process test_process;
end architecture testV1;
