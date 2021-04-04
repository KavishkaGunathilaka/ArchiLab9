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
--        -- MOVL R7, 10  R7 <-- 2
        "101110000010", -- instruction 0    b82
        
--        -- MOVL R2, 1   R2 <-- 1
        "100100000001", -- instruction 1    901
        
--        -- NEG R2       R2 <-- -R2
        "010100000000", -- instruction 3    500
        
--         -- ADD R7, R2   R7 <-- R7 + R2
        "001110100000", -- instruction 2    3a0
        
--        -- JZR R1, 7    If R1 = 0 jump to line 7   
        "110010000111", -- instruction 5    c87 
        
--        -- JZR R0, 3    If R1 = 0 jump to line 7
        "000000010011", -- instruction 6    13
        
        "000000000000", -- instruction 7     0
       
        "000000000000" -- instruction 4    0
        
    );
     
begin

    Instruction_Bus <= Program_ROM(to_integer(unsigned(Mem_Select)));

end Behavioral;
