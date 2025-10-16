--- @Author: OWEN DAIGLE
--- @Inputs: Carry in, x and y
--- @Outputs: Carry out, and Sum out
--- @Function: 1 Bit full adder
--- @Tested ON OCT 03 IN MODELSIM

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY onebit_FA IS
    PORT (
        ci, xi, yi: IN STD_LOGIC;
        so, co: OUT STD_LOGIC
        );
END ENTITY onebit_FA;

ARCHITECTURE main OF onebit_FA IS
    ---convenience signals
BEGIN
    so <= ci XOR (xi XOR yi);
    co <= ((ci) AND (xi XOR yi)) OR (xi AND yi);
END ARCHITECTURE main;
