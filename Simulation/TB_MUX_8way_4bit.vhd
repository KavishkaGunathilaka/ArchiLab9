----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2018 02:56:56 PM
-- Design Name: 
-- Module Name: TB_MUX_8way_4bit - Behavioral
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

entity TB_MUX_8way_4bit is
--  Port ( );
end TB_MUX_8way_4bit;

architecture Behavioral of TB_MUX_8way_4bit is

COMPONENT MUX_8way_4bit
Port ( Reg0 : in STD_LOGIC_VECTOR (3 downto 0);
       Reg1 : in STD_LOGIC_VECTOR (3 downto 0);
       Reg2 : in STD_LOGIC_VECTOR (3 downto 0);
       Reg3 : in STD_LOGIC_VECTOR (3 downto 0);
       Reg4 : in STD_LOGIC_VECTOR (3 downto 0);
       Reg5 : in STD_LOGIC_VECTOR (3 downto 0);
       Reg6 : in STD_LOGIC_VECTOR (3 downto 0);
       Reg7 : in STD_LOGIC_VECTOR (3 downto 0);
       EN : in STD_LOGIC;
       RegSel : in STD_LOGIC_VECTOR (2 downto 0);
       Output : out STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

SIGNAL reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7 : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL regsel : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL en : STD_LOGIC;
SIGNAL output : STD_LOGIC_VECTOR (3 downto 0);

begin

UUT : MUX_8way_4bit port map(
Reg0 => reg0,
Reg1 => reg1,
Reg2 => reg2,
Reg3 => reg3,
Reg4 => reg4,
Reg5 => reg5,
Reg6 => reg6,
Reg7 => reg7,
RegSel => regsel,
EN => en,
Output => output
);

process
begin
reg0 <= "1000";
reg1 <= "1001";
reg2 <= "0010";
reg3 <= "0011";
reg4 <= "0100";
reg5 <= "0101";
reg6 <= "0110";
reg7 <= "0111";
en <= '1';

regsel <="000";

wait for 100 ns;
regsel <="001";

wait for 100 ns;
regsel <="010";

wait for 100 ns;
regsel <="011";

wait for 100 ns;
regsel <="100";

wait for 100 ns;
regsel <="101";

wait for 100 ns;
regsel <="110";

wait for 100 ns;
regsel <="111";

wait;
end process;
end Behavioral;
