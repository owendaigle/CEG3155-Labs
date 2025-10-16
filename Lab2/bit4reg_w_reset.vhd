--- @Author: OWEN DAIGLE
--- @Inputs:
--- @Outputs:
--- @Function: register with a reset and left shift
--- Tested on

library ieee;
use ieee.std_logic_1164.all;

entity bit4reg_w_reset is
	port (
		A : in STD_LOGIC_VECTOR(3 downto 0);
		O : out STD_LOGIC_VECTOR(3 downto 0);
		Gclk, LD, SHL, RESET : in STD_LOGIC
 	);
end bit4reg_w_reset;

architecture main of bit4reg_w_reset is
	signal q_int, d_in : STD_LOGIC_VECTOR(3 downto 0);
begin
	ff_0: entity work.DFlipFlop(main) port map (
        	D      => d_in(0),
        	clk    => Gclk,
        	asyncR => RESET,
        	asyncS => '0',
       		EN     => '1',
       		q0     => q_int(0)
     	);
	ff_1: entity work.DFlipFlop(main) port map (
        	D      => d_in(1),
        	clk    => Gclk,
        	asyncR => RESET,
        	asyncS => '0',
       		EN     => '1',
       		q0     => q_int(1)
     	);
	ff_2: entity work.DFlipFlop(main) port map (
        	D      => d_in(2),
        	clk    => Gclk,
        	asyncR => RESET,
        	asyncS => '0',
       		EN     => '1',
       		q0     => q_int(2)
     	);
	ff_3: entity work.DFlipFlop(main) port map (
        	D      => d_in(3),
        	clk    => Gclk,
        	asyncR => RESET,
        	asyncS => '0',
       		EN     => '1',
       		q0     => q_int(3)
     	);


	--- define output
	O <= q_int;

	--- define inputs to all flip flops
	d_in(0) <= (q_int(3) AND SHL) OR (A(0) AND LD) OR (q_int(0) AND NOT LD AND NOT SHL);
	d_in(1) <= (q_int(0) AND SHL) OR (A(1) AND LD) OR (q_int(1) AND NOT LD AND NOT SHL);
	d_in(2) <= (q_int(1) AND SHL) OR (A(2) AND LD) OR (q_int(2) AND NOT LD AND NOT SHL);
	d_in(3) <= (q_int(2) AND SHL) OR (A(3) AND LD) OR (q_int(3) AND NOT LD AND NOT SHL);



end architecture main;
