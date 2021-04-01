library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NanoProcessor_7Seg is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           LED_Out : out STD_LOGIC_VECTOR (3 downto 0);
           Out_7Seg : out STD_LOGIC_VECTOR (6 downto 0));
end NanoProcessor_7Seg;

architecture Behavioral of NanoProcessor_7Seg is
    
    component NanoProcessor
        Port ( Clk : in STD_LOGIC;
               Reset : in STD_LOGIC;
               Overflow : out STD_LOGIC;
               Zero : out STD_LOGIC;
               LED_Out : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component LUT_16_7
        Port ( address : in STD_LOGIC_VECTOR(3 downto 0);
               data : out STD_LOGIC_VECTOR(6 downto 0));
    end component;
    
    Signal R7 : std_logic_vector (3 downto 0);
    
begin

    CPU0 : NanoProcessor
    port map(
        Clk => Clk,                       
        Reset => Reset,                     
        Overflow => Overflow,            
        Zero => Zero,                  
        LED_Out => R7);
    
    LUT_16_7_0 : LUT_16_7
    port map(
        address => R7,
        data => Out_7Seg);
        
    LED_Out <= R7;
    
end Behavioral;
