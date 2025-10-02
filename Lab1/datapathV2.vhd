--- @Author: OWEN DAIGLE
--- @Inputs: 
--- @Outputs: 
--- @Function: Data path
--- Tested on 

library ieee;
use ieee.std_logic_1164.all;

entity datapath2 is
	port (
		Gclk, Greset: in STD_LOGIC;
		SEL0, SEL1, --- mux selectors, 1 is MSB, 0 is LSB
		LDD, LDR, LDL, --- load registers
		LSHL, RSHR : in STD_LOGIC; --- register shifts
		DISPOUT : out STD_LOGIC_VECTOR(7 downto 0)
	);
end datapath2;

architecture main of datapath2 is
	--- convenience signals
	signal LMASK_OUT, ---output of Lmask reg
		RMASK_OUT, ---output of Rmask reg
		LORR_OUT, ---output of LMASK_OUT OR RMASK_OUT
		MUX4_OUT: STD_LOGIC_VECTOR(7 downto 0); ---output of 4-1 MUX
	
begin
	--- state flip flops
	LMASK_REG : entity work.bit8reg_w_left_shift(main)
		port map (
			A => "00000001",
			O => LMASK_OUT,
			Gclk => Gclk, 
			LD => LDL, 
			SH => LSHL
		);
	RMASK_REG : entity work.bit8reg_w_right_shift(main)
		port map (
			A => "10000000",
			O => RMASK_OUT,
			Gclk => Gclk, 
			LD => LDR, 
			SH => RSHR
		);
	BIT8OR : entity work.bit8Or(main)
		port map (
			A => LMASK_OUT, 
			B => RMASK_OUT, 
			O => LORR_OUT
		);
	MUX4_8BIT : entity work.mux4_8bit(main)
		port map (
			i0 => LMASK_OUT, 
			i1 => RMASK_OUT, 
			i2 => "00000000", 
			i3 => LORR_OUT, 
			s1 => SEL1, 
			s0 => SEL0, 
			O => MUX4_OUT
		);
	OUTPUT_REG : entity work.bit8reg_w_left_shift(main)
		port map (
			A => MUX4_OUT,
			O => DISPOUT,
			Gclk => Gclk, 
			LD => LDD, 
			SH => '0' --- not using as shift register
		);

	
end architecture main;