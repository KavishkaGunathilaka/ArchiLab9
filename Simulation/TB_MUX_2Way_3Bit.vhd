library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity TB_MUX_2Way_3Bit is
--  Port ( );
end TB_MUX_2Way_3Bit;

architecture Behavioral of TB_MUX_2Way_3Bit is

    Component MUX_2Way_3Bit
        Port ( S : in STD_LOGIC;
               Q : out STD_LOGIC_VECTOR (2 downto 0);
               D0 : in STD_LOGIC_VECTOR (2 downto 0);
               D1 : in STD_LOGIC_VECTOR (2 downto 0));
    End component;

    Signal D0, D1, Q : STD_LOGIC_VECTOR (2 downto 0);
    Signal S : STD_LOGIC;
    
begin
    
    UUT: MUX_2Way_3Bit Port map(
        S => S,
        Q => Q,
        D0 => D0,
        D1 => D1
    );
    
    process begin
        -- Index no: 190205 --> 101 110 011 011 111 101
        D0 <= "101";
        D1 <= "111";
        S <= '0';
        wait for 200 ns;
        
        S <= '1';
        wait for 200 ns;
        
        D0 <= "011";
        D1 <= "110";
        wait for 200 ns;
        
        S <= '0';
        wait for 200 ns;
        wait;
    end process;

end Behavioral;
