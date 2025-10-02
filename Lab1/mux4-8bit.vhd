--- @Author: OWEN DAIGLE
--- @Inputs: i0, i1, i2, i3 are 8 bits signals, s0, s1 are selectors
--- @Outputs: O is 8 bits
--- @Function: MUX of i0, i1, i2, i3
--- Tested on Sep 22, 2025

library ieee;
use ieee.std_logic_1164.all;

entity mux4_8bit is
  port (
    i0, i1, i2, i3: in STD_LOGIC_VECTOR(7 downto 0);
    s1, s0: in STD_LOGIC;
    O : out STD_LOGIC_VECTOR(7 downto 0)
  );
end mux4_8bit;

architecture main of mux4_8bit is
begin
	mux4_0 : entity work.MUX4(main)
		port map (
			i0 => i0(0), 
			i1 => i1(0),
			i2 => i2(0),
			i3 => i3(0),
			s0 => s0, 
			s1 => s1, 
			o => o(0)
		);
	mux4_1 : entity work.MUX4(main)
		port map (
			i0 => i0(1), 
			i1 => i1(1),
			i2 => i2(1),
			i3 => i3(1),
			s0 => s0, 
			s1 => s1, 
			o => o(1)
			);
	mux4_2 : entity work.MUX4(main)
		port map (
			i0 => i0(2), 
			i1 => i1(2),
			i2 => i2(2),
			i3 => i3(2),
			s0 => s0, 
			s1 => s1, 
			o => o(2)
			);
	mux4_3 : entity work.MUX4(main)
		port map (
			i0 => i0(3), 
			i1 => i1(3),
			i2 => i2(3),
			i3 => i3(3),
			s0 => s0, 
			s1 => s1, 
			o => o(3)
			);
	mux4_4 : entity work.MUX4(main)
		port map (
			i0 => i0(4), 
			i1 => i1(4),
			i2 => i2(4),
			i3 => i3(4),
			s0 => s0, 
			s1 => s1, 
			o => o(4)
			);
	mux4_5 : entity work.MUX4(main)
		port map (
			i0 => i0(5), 
			i1 => i1(5),
			i2 => i2(5),
			i3 => i3(5),
			s0 => s0, 
			s1 => s1, 
			o => o(5)
			);
	mux4_6 : entity work.MUX4(main)
		port map (
			i0 => i0(6), 
			i1 => i1(6),
			i2 => i2(6),
			i3 => i3(6),
			s0 => s0, 
			s1 => s1, 
			o => o(6)
			);
	mux4_7 : entity work.MUX4(main)
		port map (
			i0 => i0(7), 
			i1 => i1(7),
			i2 => i2(7),
			i3 => i3(7),
			s0 => s0, 
			s1 => s1, 
			o => o(7)
			);
	
end architecture main;