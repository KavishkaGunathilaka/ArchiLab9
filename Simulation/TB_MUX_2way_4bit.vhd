library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity TB_MUX_2Way_4Bit is
--  Port ( );
end TB_MUX_2Way_4Bit;

architecture Behavioral of TB_MUX_2Way_4Bit is

    Component MUX_2Way_4Bit
    Port ( D1 : in STD_LOGIC_VECTOR (3 downto 0);
           D0 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
    End component;

    Signal D0, D1 : STD_LOGIC_VECTOR (3 downto 0);
    Signal S : STD_LOGIC ;
    Signal Q : STD_LOGIC_VECTOR (3 downto 0);

begin

    UUT : MUX_2Way_4Bit port map(
        D0 => D0,
        D1 => D1,
        S => S,
        Q => Q
    );
    
    process begin
        -- Index no: 190205 --> 10 1110 0110 1111 1101
        D0 <= "1101";
        D1 <= "1111";
        S <= '0';
        wait for 200 ns;
        
        S <= '1';
        wait for 200 ns;
        
        D0 <= "0110";
        D1 <= "1110";        
        wait for 200 ns;

        S <= '0';
        wait for 200 ns;
        wait;

    end process;

end Behavioral;
