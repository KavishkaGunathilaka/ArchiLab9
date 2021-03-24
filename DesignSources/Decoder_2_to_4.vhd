library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder_2_to_4 is
    Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
           En : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Decoder_2_to_4;

architecture Behavioral of Decoder_2_to_4 is
    SIGNAL NotI0, NotI1 : STD_LOGIC;
begin
    NotI0 <= NOT I(0);
    NotI1 <= NOT I(1);
    
    Y(0) <= NotI0 AND NotI1 AND En;
    Y(1) <= I(0) AND NotI1 AND En;
    Y(2) <= NotI0 AND I(1) AND En;
    Y(3) <= I(0) AND I(1) AND En;

end Behavioral;
