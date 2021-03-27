library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all; 


entity ROM_8 is
    Port ( Mem_Select : in STD_LOGIC_VECTOR(2 downto 0);
           Instruction_Bus : out STD_LOGIC_VECTOR(11 downto 0));
end ROM_8;

architecture Behavioral of ROM_8 is

    type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);

    signal Program_ROM : rom_type := (
        "000000000001", -- instruction 0
        "000000000010", -- instruction 1
        "000000000011", -- instruction 2
        "000000000100", -- instruction 3
        "000000000101", -- instruction 4
        "000000000110", -- instruction 5
        "000000000111", -- instruction 6
        "000000001000" -- instruction 7
    );
     
begin

    Instruction_Bus <= Program_ROM(to_integer(unsigned(Mem_Select)));

end Behavioral;
