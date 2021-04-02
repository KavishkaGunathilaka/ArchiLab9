library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all; 


entity LUT_16_7 is
    Port ( address : in STD_LOGIC_VECTOR(3 downto 0);
           data : out STD_LOGIC_VECTOR(6 downto 0));
end LUT_16_7;

architecture Behavioral of LUT_16_7 is

    type rom_type is array (0 to 15) of std_logic_vector(6 downto 0);

    signal sevenSegment_ROM : rom_type := (
        "1000000", -- 0
        "1111001", -- 1
        "0100100", -- 2
        "0110000", -- 3
        "0011001", -- 4
        "0010010", -- 5
        "0000010", -- 6
        "1111000", -- 7 
        "0000000", -- 8
        "1111000", -- 9 (-7)
        "0000010", -- a (-6)
        "0010010", -- b (-5)
        "0011001", -- c (-4)
        "0110000", -- d (-3)
        "0100100", -- e (-2)
        "1111001" -- f (-1)
    );
     
begin

    data <= sevenSegment_ROM(to_integer(unsigned(address)));

end Behavioral;
