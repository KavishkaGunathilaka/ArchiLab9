library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC is
    Port ( Clk : in STD_LOGIC;
           Address : in STD_LOGIC_VECTOR (2 downto 0);
           Reset : in STD_LOGIC;
           MemorySelect : out STD_LOGIC_VECTOR (2 downto 0));
end PC;

architecture Behavioral of PC is

    component D_FF  port (  
       D : in STD_LOGIC;
       Res : in STD_LOGIC;
       Clk : in STD_LOGIC;
       En : in STD_LOGIC;
       Q : out STD_LOGIC;
       Qbar : out STD_LOGIC);  
    end component;

begin

    DFF_0 : D_FF
        port map (  
            D => Address(0),  
            Res => Reset,
            Clk => Clk,
            En => '1',
            Q => MemorySelect(0)); 

    DFF_1 : D_FF
        port map (  
            D => Address(1),     
            Res => Reset,        
            Clk => Clk,
            En => '1', 
            Q => MemorySelect(1));
            
    DFF_2 : D_FF
        port map (  
            D => Address(2),     
            Res => Reset,        
            Clk => Clk,
            En => '1',
            Q => MemorySelect(2));

end Behavioral;
