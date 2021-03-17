library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUX_2_to_1 is
    Port ( S : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (1 downto 0);
           Q : out STD_LOGIC);
end MUX_2_to_1;

architecture Behavioral of MUX_2_to_1 is

begin
    
  with S select
  Q <= D(0) when '0',
       D(1) when '1';
        
end Behavioral;
