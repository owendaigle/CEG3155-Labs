--- @Author: OWEN DAIGLE
--- @Inputs: A, B are 8 bits
--- @Outputs: O is 8 bits
--- @Function: A OR B
--- Tested on OCT 25 2025

library ieee;
use ieee.std_logic_1164.all;

entity bit8XOr is
  port (
    A, B: in STD_LOGIC_VECTOR(7 downto 0);
    O : out STD_LOGIC_VECTOR(7 downto 0)
  );
end bit8XOr;

architecture main of bit8XOr is
begin
  O <= A XOR B;  -- Bitwise OR operation on the vectors
end architecture main;
