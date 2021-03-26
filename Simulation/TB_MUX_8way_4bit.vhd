library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_MUX_8Way_4Bit is
--  Port ( );
end TB_MUX_8Way_4Bit;

architecture Behavioral of TB_MUX_8Way_4Bit is

    Component MUX_8Way_4Bit
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           En : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0);
           D0 : in STD_LOGIC_VECTOR (3 downto 0);
           D1 : in STD_LOGIC_VECTOR (3 downto 0);
           D2 : in STD_LOGIC_VECTOR (3 downto 0);
           D3 : in STD_LOGIC_VECTOR (3 downto 0);
           D4 : in STD_LOGIC_VECTOR (3 downto 0);
           D5 : in STD_LOGIC_VECTOR (3 downto 0);
           D6 : in STD_LOGIC_VECTOR (3 downto 0);
           D7 : in STD_LOGIC_VECTOR (3 downto 0));
    End component;

    Signal D0,D1,D2,D3,D4,D5,D6,D7 : STD_LOGIC_VECTOR (3 downto 0);
    Signal S : STD_LOGIC_VECTOR (2 downto 0);
    Signal En : STD_LOGIC;
    Signal Q : STD_LOGIC_VECTOR (3 downto 0);

begin

    UUT : MUX_8Way_4Bit port map(
        S => S,
        En => En,
        Q => Q,
        D0 => D0,
        D1 => D1,
        D2 => D2,
        D3 => D3,
        D4 => D4,
        D5 => D5,
        D6 => D6,
        D7 => D7
    );
    
    process begin
        -- Index no: 190205 --> 10 1110 0110 1111 1101
        D0 <= "1101";
        D1 <= "1111";
        D2 <= "0110";
        D3 <= "1110";
        -- Index no: 190482 --> 10 1110 1000 0001 0010
        D4 <= "0010";
        D5 <= "0001";
        D6 <= "1000";
        D7 <= "0010";
        En <= '1';
        
        S <="000";
        wait for 100 ns;
        
        S <="001";
        wait for 100 ns;
        
        S <="010";       
        wait for 100 ns;
        
        S <="011";        
        wait for 100 ns;
        
        S <="100";        
        wait for 100 ns;
        
        S <="101";       
        wait for 100 ns;
        
        S <="110";      
        wait for 100 ns;
        
        S <="111";
        wait for 100ns;
        wait;
        
    end process;
end Behavioral;
