library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_Bank_8 is
    Port ( Data_In : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Data_Out_0 : out STD_LOGIC_VECTOR (3 downto 0);
           Data_Out_1 : out STD_LOGIC_VECTOR (3 downto 0);
           Data_Out_2 : out STD_LOGIC_VECTOR (3 downto 0);
           Data_Out_3 : out STD_LOGIC_VECTOR (3 downto 0);
           Data_Out_4 : out STD_LOGIC_VECTOR (3 downto 0);
           Data_Out_5 : out STD_LOGIC_VECTOR (3 downto 0);
           Data_Out_6 : out STD_LOGIC_VECTOR (3 downto 0);
           Data_Out_7 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_En : in STD_LOGIC_VECTOR (2 downto 0));
end Reg_Bank_8;

architecture Behavioral of Reg_Bank_8 is

    component REG_4Bit  port (  
       D_In : in STD_LOGIC_VECTOR (3 downto 0);
       D_Out : out STD_LOGIC_VECTOR (3 downto 0);
       Reset : in STD_LOGIC;
       En : in STD_LOGIC;
       Clk : in STD_LOGIC); 
    end component;
    
    component Decoder_3_to_8
    port (  I : in STD_LOGIC_VECTOR (2 downto 0);
            En : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    signal Y : STD_LOGIC_VECTOR (7 downto 0);
begin
    
    Dec0 : Decoder_3_to_8
        port map (  
            I => Reg_En,  
            En => '1',
            Y => Y);
                
--    REG_0 : REG_4Bit
--        port map (  
--            D_In => Data_In,  
--            D_Out => Data_Out_0,
--            Reset => Reset,
--            En => Y(0),
--            Clk => Clk);

    Data_Out_0 <= "0000";
    
    REG_1 : REG_4Bit
        port map (  
            D_In => Data_In,  
            D_Out => Data_Out_1,
            Reset => Reset,
            En => Y(1),
            Clk => Clk);
    
    REG_2 : REG_4Bit
        port map (  
            D_In => Data_In,  
            D_Out => Data_Out_2,
            Reset => Reset,
            En => Y(2),
            Clk => Clk);
    
    REG_3 : REG_4Bit
        port map (  
            D_In => Data_In,  
            D_Out => Data_Out_3,
            Reset => Reset,
            En => Y(3),
            Clk => Clk);
    
    REG_4 : REG_4Bit
        port map (  
            D_In => Data_In,  
            D_Out => Data_Out_4,
            Reset => Reset,
            En => Y(4),
            Clk => Clk);
    
    REG_5 : REG_4Bit
        port map (  
            D_In => Data_In,  
            D_Out => Data_Out_5,
            Reset => Reset,
            En => Y(5),
            Clk => Clk);
    
    REG_6 : REG_4Bit
        port map (  
            D_In => Data_In,  
            D_Out => Data_Out_6,
            Reset => Reset,
            En => Y(6),
            Clk => Clk);
    
    REG_7 : REG_4Bit
        port map (  
            D_In => Data_In,  
            D_Out => Data_Out_7,
            Reset => Reset,
            En => Y(7),
            Clk => Clk);
            
end Behavioral;
