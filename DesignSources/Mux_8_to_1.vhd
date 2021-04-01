library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_8_to_1 is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (7 downto 0);
           En : in STD_LOGIC;
           Y : out STD_LOGIC);
end Mux_8_to_1;

architecture Behavioral of Mux_8_to_1 is
    
    Signal SelectedD : std_logic;
    
begin

    with S select
    SelectedD <= D(0) when "000",
                 D(1) when "001",
                 D(2) when "010",
                 D(3) when "011",
                 D(4) when "100",
                 D(5) when "101",
                 D(6) when "110",
                 D(7) when others;
    
    Y <= SelectedD AND En;
    
end Behavioral;
