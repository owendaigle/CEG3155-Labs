--- @Author: OWEN DAIGLE
--- @Inputs:
--- @Outputs:
--- @Function: register with a left shift bringing in 0s or 1s from the LSB
--- Tested on OCT 13 2025

library ieee;
use ieee.std_logic_1164.all;

entity bit4reg_w_weird_left_shift is
	port (
		A : in STD_LOGIC_VECTOR(3 downto 0);
		O : out STD_LOGIC_VECTOR(3 downto 0);
		Gclk, LD, SH1, SH0, Greset : in STD_LOGIC
 	);
end bit4reg_w_weird_left_shift;

architecture main of bit4reg_w_weird_left_shift is
	signal q_int, d_in : STD_LOGIC_VECTOR(3 downto 0);
begin
	ff_0: entity work.DFlipFlop(main) port map (
        	D      => d_in(0),
        	clk    => Gclk,
        	asyncR => Greset,
        	asyncS => '0',
       		EN     => '1',
       		q0     => q_int(0)
     	);
	ff_1: entity work.DFlipFlop(main) port map (
        	D      => d_in(1),
        	clk    => Gclk,
        	asyncR => Greset,
        	asyncS => '0',
       		EN     => '1',
       		q0     => q_int(1)
     	);
	ff_2: entity work.DFlipFlop(main) port map (
        	D      => d_in(2),
        	clk    => Gclk,
        	asyncR => Greset,
        	asyncS => '0',
       		EN     => '1',
       		q0     => q_int(2)
     	);
	ff_3: entity work.DFlipFlop(main) port map (
        	D      => d_in(3),
        	clk    => Gclk,
        	asyncR => Greset,
        	asyncS => '0',
       		EN     => '1',
       		q0     => q_int(3)
     	);

	--- define output
	O <= q_int;

	--- define inputs to all flip flops
	d_in(0) <= ('0' AND SH0) OR ('1' AND SH1) OR (A(0) AND LD) OR (q_int(0) AND NOT LD AND NOT SH0 AND NOT SH1);
	d_in(1) <= (q_int(0) AND SH0) OR (q_int(0) AND SH1) OR (A(1) AND LD) OR (q_int(1) AND NOT LD AND NOT SH0 AND NOT SH1);
	d_in(2) <= (q_int(1) AND SH0) OR (q_int(1) AND SH1) OR (A(2) AND LD) OR (q_int(2) AND NOT LD AND NOT SH0 AND NOT SH1);
	d_in(3) <= (q_int(2) AND SH0) OR (q_int(2) AND SH1) OR (A(3) AND LD) OR (q_int(3) AND NOT LD AND NOT SH0 AND NOT SH1);


end architecture main;
