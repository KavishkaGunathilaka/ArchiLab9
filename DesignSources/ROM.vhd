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
        -- MOVL R1, 5   R1 <-- 5
        "100010000101", -- instruction 0    885
        -- MOVL R7, 2   --R7 <-- 2
        "101110000010", -- instruction 1    b82
        -- ADD R7, R1   R7 <-- 7
        "001110010000", -- instruction 2    390
        -- NEG R7       R7 <-- -7
        "011110000000", -- instruction 3    780
--        "100100000000",
        -- MOVL R2, 4   R2 <-- 4
        "100100000100", -- instruction 4    904
        -- JZR R0       
        "110100000010", -- instruction 5    c02 
        -- ADD R7, R1   R7 <-- -2
        "001110010000", -- instruction 6    390
        -- ADD R7, R2   R7 <-- -3
        "001110100000" -- instruction 7     3a0
--        "000000000000",
--        "000000000000",
--        "000000000000",
--        "000000000000",
--        "000000000000",
--        "000000000000",
--        "000000000000"
    );
     
begin

    Instruction_Bus <= Program_ROM(to_integer(unsigned(Mem_Select)));

end Behavioral;
