library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity REG_8Bit is
    Port ( D_In : in STD_LOGIC_VECTOR (7 downto 0);
           D_Out : out STD_LOGIC_VECTOR (7 downto 0);
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC);
end REG_8Bit;

architecture Behavioral of REG_8Bit is

    component D_FF  port (  
       D : in STD_LOGIC;
       Res : in STD_LOGIC;
       Clk : in STD_LOGIC;
       Q : out STD_LOGIC;
       Qbar : out STD_LOGIC);  
    end component;
    
begin

    DFF_0 : D_FF
        port map (  
            D => D_In(0),  
            Res => Reset,
            Clk => Clk,
            Q => D_Out(0)); 

    DFF_1 : D_FF
        port map (  
            D => D_In(1),     
            Res => Reset,        
            Clk => Clk, 
            Q => D_Out(1));
            
    DFF_2 : D_FF
        port map (  
            D => D_In(2),     
            Res => Reset,        
            Clk => Clk,
            Q => D_Out(2));
            
    DFF_3 : D_FF
        port map (  
            D => D_In(3),  
            Res => Reset,
            Clk => Clk,
            Q => D_Out(3)); 
        
    DFF_4 : D_FF
        port map (  
            D => D_In(4),     
            Res => Reset,        
            Clk => Clk, 
            Q => D_Out(4));
        
    DFF_5 : D_FF
        port map (  
            D => D_In(5),     
            Res => Reset,        
            Clk => Clk,
            Q => D_Out(5));
    
    DFF_6 : D_FF
        port map (  
            D => D_In(6),     
            Res => Reset,        
            Clk => Clk, 
            Q => D_Out(6));
        
    DFF_7 : D_FF
        port map (  
            D => D_In(7),     
            Res => Reset,        
            Clk => Clk,
            Q => D_Out(7));

end Behavioral;
