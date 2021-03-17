library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC is
    Port ( Clk : in STD_LOGIC;
           Address : in STD_LOGIC_VECTOR (2 downto 0);
           Reset : in STD_LOGIC;
           MemorySelect : out STD_LOGIC_VECTOR (2 downto 0));
end PC;

architecture Behavioral of PC is

begin


end Behavioral;
