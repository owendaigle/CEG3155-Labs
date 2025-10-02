--- @Author: OWEN DAIGLE
--- @Inputs: NONE
--- @Outputs: NONE
--- @Function: TESTBENCH

LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 

entity datapathV2_TB is
end entity datapathV2_TB;

architecture testV1 of datapathV2_TB is
	signal SEL0, SEL1, LSHL, RSHR, LDD, LDL, LDR, GCLK, GRESET: STD_LOGIC;
	signal DisplayOut: STD_LOGIC_VECTOR(7 downto 0);

begin
	dut : entity work.datapath2(main)
		port map (
			Gclk => GCLK,
			Greset => GRESET,
			LSHL => LSHL,
			RSHR => RSHR,
			LDD => LDD,
			SEL0 => SEL0,
			SEL1 => SEL1, --- 1 is MSB
			LDL => LDL,
			LDR => LDR,
			DISPOUT => DisplayOut
		);
	
	test_process : process is
	begin
		---reset
		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 
		Greset <= '1';
    		LDD <= '1'; LSHL <= '0'; RSHR <= '0'; SEL0 <= '0'; SEL1 <= '1'; -- "10" -> ZERO
    		LDL <= '1'; LDR <= '1';

		---reset
		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 
		Greset <= '0'; LDL <= '0'; LDR <= '0';

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 
		LSHL <= '1'; RSHR <= '0'; LDD <= '1'; SEL0 <= '0'; SEL1 <= '0'; --- moving left
		
		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 
		--- 00000001		

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 
		--- 00000010		

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 
		--- 00000100

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 	

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 	

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 	
		
		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 	

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 	

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 	

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 	

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 	

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 	
		LSHL <= '0'; RSHR <= '1'; LDD <= '1'; SEL0 <= '1'; SEL1 <= '0'; --moving right

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 	

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 	

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 	

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 	
		
		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 
		
		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns;

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns;

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns;

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns;

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns;

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns;

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns;

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns;

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns;

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns;

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns;	
		LSHL <= '1'; RSHR <= '1'; LDD <= '1'; SEL0 <= '1'; SEL1 <= '1'; --moving right and left

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 	

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 	

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 	

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 	
		
		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 
		
		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns;

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns;

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns;

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns;

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns;

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns;

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns;

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns;

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns;
		LSHL <= '0'; RSHR <= '0'; LDD <= '1'; SEL0 <= '0'; SEL1 <= '1'; --moving right and left

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 	

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 	

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 	

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 	
		
		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 
		
		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns;

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns;

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns;

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns;

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns;

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns;

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns;

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns;

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns;

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns;

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns;
		Greset <= '1'; --reset
		LDD <= '1'; LSHL <= '0'; RSHR <= '0'; SEL0 <= '0'; SEL1 <= '1'; -- "10" -> ZERO
    		LDL <= '1'; LDR <= '1';

		---reset
		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 
		Greset <= '0'; LDL <= '0'; LDR <= '0';
		
		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 
		LSHL <= '1'; RSHR <= '0'; LDD <= '1'; SEL0 <= '0'; SEL1 <= '0'; --- moving left
		
		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 
		--- 00000001		

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 
		--- 00000010		

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 
		--- 00000100

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 

		GCLK <= '0'; wait for 10 ns;
		GCLK <= '1'; wait for 10 ns; 
		
		wait;
	end process test_process;
end architecture testV1;
