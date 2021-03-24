library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUX_8Way_4Bit is
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
end MUX_8Way_4Bit;

architecture Behavioral of MUX_8Way_4Bit is

    component MUX_8_to_1 port(
        S : in STD_LOGIC_VECTOR (2 downto 0);
        D : in STD_LOGIC_VECTOR (7 downto 0);
        En : in STD_LOGIC;
        Y : out STD_LOGIC);
    end component;
    
begin

     MUX_0 : MUX_8_to_1                   
        port map ( 
            En => En,                
            S => S,
            D(0) => D0(0),
            D(1) => D1(0),
            D(2) => D2(0),
            D(3) => D3(0),
            D(4) => D4(0),
            D(5) => D5(0),
            D(6) => D6(0),
            D(7) => D7(0),
            Y => Q(0));
            
    MUX_1 : MUX_8_to_1                   
        port map (                 
            En => En,                
            S => S,
            D(0) => D0(1),
            D(1) => D1(1),
            D(2) => D2(1),
            D(3) => D3(1),
            D(4) => D4(1),
            D(5) => D5(1),
            D(6) => D6(1),
            D(7) => D7(1),
            Y => Q(1));
               
    MUX_2 : MUX_8_to_1                   
        port map (                 
            En => En,                
            S => S,
            D(0) => D0(2),
            D(1) => D1(2),
            D(2) => D2(2),
            D(3) => D3(2),
            D(4) => D4(2),
            D(5) => D5(2),
            D(6) => D6(2),
            D(7) => D7(2),
            Y => Q(2));
    
    MUX_3 : MUX_8_to_1                   
        port map (                 
            En => En,                
            S => S,
            D(0) => D0(3),
            D(1) => D1(3),
            D(2) => D2(3),
            D(3) => D3(3),
            D(4) => D4(3),
            D(5) => D5(3),
            D(6) => D6(3),
            D(7) => D7(3),
            Y => Q(3));
            

end Behavioral;
