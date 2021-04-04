library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity TB_NanoProcessor is
--  Port ( );
end TB_NanoProcessor;

architecture Behavioral of TB_NanoProcessor is

    component NanoProcessor
    Port ( Clk : in STD_LOGIC;                          
           Reset : in STD_LOGIC;                        
           Overflow : out STD_LOGIC;                    
           Zero : out STD_LOGIC;                        
           LED_Out : out STD_LOGIC_VECTOR (3 downto 0)
           );
   end component;
   
   Signal Clk, Reset, Overflow, Zero : std_logic;
   Signal LED_Out : std_logic_vector (3 downto 0);
   constant clock_period : time := 50 ns;
   
begin
    
    UUT : NanoProcessor port map(
        Clk => Clk,
        Overflow => Overflow,
        Reset => Reset,
        Zero => Zero,
        LED_Out => LED_Out
    );
    
    clock_process : process
    begin
        Clk <= '0';
        wait for clock_period/2;
        Clk <= '1';
        wait for clock_period/2;
    end process;

    
    process begin
        Reset <= '1';
        wait for 30ns;
        Reset <= '0';
        wait;
    end process;
end Behavioral;
