--- @Author: OWEN DAIGLE
--- @Inputs: A, B are 8 bits
--- @Outputs: O is 8 bits
--- @Function: A OR B
--- Tested on OCT 12 2025

library ieee;
use ieee.std_logic_1164.all;

entity bit8Or is
  port (
    A, B: in STD_LOGIC_VECTOR(7 downto 0);
    O : out STD_LOGIC_VECTOR(7 downto 0)
  );
end bit8Or;

architecture main of bit8Or is
begin
  O <= A OR B;  -- Bitwise OR operation on the vectors
end architecture main;
