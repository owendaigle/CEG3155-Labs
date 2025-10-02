--- @Author: OWEN DAIGLE
--- @Inputs: d, clk, asyncR, asyncS, EN
--- @Outputs:q0
--- @Function: D Flip Flop where D is the in bit, and clk is the clock bit. 
--- 		asyncR and asyncS set and clear the flip flop asynchrnously
---		EN enables the ff. If 0, it takes the previous value, if 1, works normallys
--- Tested as of Sep 21, 2025

LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 

entity DFlipFlop is 
	port (D, clk, asyncR, asyncS, EN: IN STD_LOGIC; q0: OUT STD_LOGIC);
end DFlipFlop;

architecture main of DFlipFlop is
	--- These signals are just to simplify the code
	signal Deff, Qiint, Qiint_bar, Qfint, Qfint_bar: STD_LOGIC;
begin
	--- This adheres to the diagram created in the Lab 1 Charts file
	Qfint <= (Qiint NAND clk) NAND Qfint_bar;
	Qfint_bar <= (Qiint_bar NAND clk) NAND Qfint;
	Qiint <= (Deff NAND (NOT clk)) NAND Qiint_bar;
	Qiint_bar <= ((NOT Deff) NAND (NOT clk)) NAND Qiint;
	Deff <= (D AND EN) OR (NOT EN AND Qfint);
	
	q0 <= (Qfint OR asyncS) AND (NOT asyncR);

end architecture main;
