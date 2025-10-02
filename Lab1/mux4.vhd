--- @Author: OWEN DAIGLE
--- @Inputs: i0, i1, i2, i3, s1, s0, S1 is MSB
--- @Outputs: o
--- @Function: 4-1 multiplexer
--- Tested as of Sep 21, 2025

LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 

entity MUX4 is 
	port (i0, i1, i2, i3, s0, s1: IN STD_LOGIC; o: OUT STD_LOGIC);
end MUX4;

architecture main of MUX4 is
	--- These signals are just to simplify the code
	
begin
	--- This adheres to the diagram created in the Lab 1 Charts file
	O <= (i0 AND NOT s1 AND NOT s0) OR (i1 AND NOT s1 AND s0) OR (i2 AND s1 AND NOT s0) OR (i3 AND s1 AND s0);

end architecture main;