----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2018 01:53:12 PM
-- Design Name: 
-- Module Name: TB_quad_tri_state_buffer - Behavioral
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

entity TB_quad_tri_state_buffer is
--  Port ( );
end TB_quad_tri_state_buffer;

architecture Behavioral of TB_quad_tri_state_buffer is

COMPONENT quad_tri_state_buffer
    PORT ( A : in STD_LOGIC_VECTOR (3 downto 0);
          EN : in STD_LOGIC;
          Y : out STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

SIGNAL a,y : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL en : STD_LOGIC;

begin

UUT: quad_tri_state_buffer PORT MAP(
    A => a,
    En => en,
    Y => y
);

process
begin

a <= "1010";
en <= '1';

wait for 10 ns;

en <= '0';

wait for 10 ns;

a <= "0000";
en <= '1';

wait for 10 ns;

en <= '0';

wait;
end process;

end Behavioral;
