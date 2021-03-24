----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2018 03:32:02 PM
-- Design Name: 
-- Module Name: TB_MUX_2way_4bit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_MUX_2way_4bit is
--  Port ( );
end TB_MUX_2way_4bit;

architecture Behavioral of TB_MUX_2way_4bit is

COMPONENT MUX_2way_4bit
Port ( Val0 : in STD_LOGIC_VECTOR (3 downto 0);
       Val1 : in STD_LOGIC_VECTOR (3 downto 0);
       EN : in STD_LOGIC;
       LoadSel : in STD_LOGIC;
       Output : out STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

SIGNAL val0, val1 : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL loadsel : STD_LOGIC ;
SIGNAL en : STD_LOGIC;
SIGNAL output : STD_LOGIC_VECTOR (3 downto 0);


begin

UUT : MUX_2way_4bit port map(
Val0 => val0,
Val1 => val1,
EN => en,
LoadSel => loadsel,
Output => output
);

process begin

en <= '1';
val0 <= "0011";
val1 <= "1000";

LoadSel <= '0';
wait for 200 ns;
LoadSel <= '1';
wait for 200 ns;
wait;

end process;

end Behavioral;
