library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity TB_AddSub_Unit is
--  Port ( );
end TB_AddSub_Unit;

architecture Behavioral of TB_AddSub_Unit is

    Component AddSub_Unit_4bit
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Ctrl : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
    End component;

    Signal A, B, S : STD_LOGIC_VECTOR (3 downto 0);
    Signal Ctrl,Overflow,Zero : STD_LOGIC ;

begin

    UUT : AddSub_Unit_4bit port map(
        A => A,
        B => B,
        S => S,
        Ctrl => Ctrl,
        Overflow => Overflow,
        Zero => Zero        
    );
    
    process begin
        
        Ctrl <= '0';
        
        -- Index no: 190482 --> 10 1110 1000 0001 0010
        A <= "0010";
        B <= "0001";
        wait for 200 ns;--ans: Cout = 0 | S = 0011
        
        A<= "1000";
        B<= "1110";
        wait for 200 ns;--ans: Cout = 1 | S = 0110
        
        A<= "0111";
        B<= "0111";       
        wait for 200 ns;---ans: Cout = 1 | S = 1110
        
        A<= "0000";
        B<= "0000";       
        wait for 200 ns;---ans: Cout = 0 | S = 0000
        
        
         Ctrl <= '1';
        
        A<= "0001";
        B<= "0100";       
        wait for 200 ns;---ans: Cout = 0 | S = 1101
        
        wait;

    end process;

end Behavioral;
