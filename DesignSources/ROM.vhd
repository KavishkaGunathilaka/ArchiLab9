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
        "1000000", -- instruction 0
        "1111001", -- instruction 1
        "0100100", -- instruction 2
        "0110000", -- instruction 3
        "0011001", -- instruction 4
        "0010010", -- instruction 5
        "0000010", -- instruction 6
        "1111000" -- instruction 7
    );
     
begin

    Instruction_Bus <= Program_ROM(to_integer(unsigned(Mem_Select)));

end Behavioral;
