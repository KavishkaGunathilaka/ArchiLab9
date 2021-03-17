library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUX_2Way_4Bit is
    Port ( S : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0);
           D0 : in STD_LOGIC_VECTOR (3 downto 0);
           D1 : in STD_LOGIC_VECTOR (3 downto 0));
end MUX_2Way_4Bit;

architecture Behavioral of MUX_2Way_4Bit is

    component MUX_2_to_1 port(
        S : in STD_LOGIC;
        D : in STD_LOGIC_VECTOR (1 downto 0);
        Q : out STD_LOGIC);
    end component;
    
begin

     MUX_0 : MUX_2_to_1                   
        port map (                 
            S => S,       
            Q => Q(0),          
            D(0) => D0(0),
            D(1) => D1(0));
   
    MUX_1 : MUX_2_to_1                   
        port map (                 
            S => S,       
            Q => Q(1),          
            D(0) => D0(1), 
            D(1) => D1(1));
               
    MUX_2 : MUX_2_to_1                   
        port map (                 
            S => S,       
            Q => Q(2),          
            D(0) => D0(2), 
            D(1) => D1(2));
    
    MUX_3 : MUX_2_to_1                   
        port map (                 
            S => S,       
            Q => Q(3),          
            D(0) => D0(3), 
            D(1) => D1(3));
            

end Behavioral;
