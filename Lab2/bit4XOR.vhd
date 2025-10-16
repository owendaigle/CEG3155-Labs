--- @Author: OWEN DAIGLE
--- @Inputs: A, B are 4 bits
--- @Outputs: O is 4 bits
--- @Function: A OR B
--- Tested on OCT 16 2025

library ieee;
use ieee.std_logic_1164.all;

entity bit4XOr is
  port (
    A, B: in STD_LOGIC_VECTOR(3 downto 0);
    O : out STD_LOGIC_VECTOR(3 downto 0)
  );
end bit4XOr;

architecture main of bit4XOr is
begin
  O <= A XOR B;  -- Bitwise OR operation on the vectors
end architecture main;
