library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity TB_Adder_3bit is
--  Port ( );
end TB_Adder_3bit;

architecture Behavioral of TB_Adder_3bit is

    Component Adder_3bit
    Port ( A : in STD_LOGIC_VECTOR(2 downto 0);
           B : in STD_LOGIC_VECTOR(2 downto 0);
           S : out STD_LOGIC_VECTOR(2 downto 0);
           C_out : out STD_LOGIC);
    End component;

    Signal A, B, S : STD_LOGIC_VECTOR (2 downto 0);
    Signal C_out : STD_LOGIC ;

begin

    UUT : Adder_3bit port map(
        A => A,
        B => B,
        C_out => C_out,
        S => S
    );
    
    process begin
        
        -- Index no: 190482 --> 101 110 100 000 010 010
        A <= "010";
        B <= "010";
        wait for 200 ns;--ans: Cout = 0 | S = 100
        
        A<= "000";
        B<= "100";
        wait for 200 ns;--ans: Cout = 0 | S = 100
        
        A<= "110";
        B<= "101";       
        wait for 200 ns;---ans: Cout = 1 | S = 011 
        wait;

    end process;

end Behavioral;
