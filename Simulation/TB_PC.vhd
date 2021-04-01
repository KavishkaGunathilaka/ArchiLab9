library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_PC is
end TB_PC;

architecture Behavioral of TB_PC is

    Component PC
    Port ( Clk : in STD_LOGIC;
           Address : in STD_LOGIC_VECTOR (2 downto 0);
           Reset : in STD_LOGIC;
           MemorySelect : out STD_LOGIC_VECTOR (2 downto 0));
    End component;

    Signal Address, MemorySelect : STD_LOGIC_VECTOR (2 downto 0);
    Signal Clk,Reset : STD_LOGIC ;
    constant clock_period : time := 50 ns;


begin
    clock_process : process
    begin
        Clk <= '0';
        wait for clock_period/2;
        Clk <= '1';
        wait for clock_period/2;
    end process;


    UUT : PC port map(
        Clk => Clk,
        Address => Address,
        Reset => Reset,
        MemorySelect => MemorySelect
    );
    
    
        process begin
            Reset <= '0';
            -- Index no: 190482 --> 10 1110 1000 0001 0010
            Address <= "010"; 
            wait for 100 ns;
            
            Address <= "100";
            wait for 100 ns;
            
            Address <= "111";
            wait for 100 ns;
            
            Address <= "000";
            wait for 100 ns;
            
            Address<= "001";       
            wait for 100 ns;
            
            Reset <= '1';
            wait for 100 ns;
            
            Reset <= '0';
            Address <= "101";
            wait for 100 ns;
            
            Address<= "001";       
            wait for 100 ns;
            wait;

        end process;
    
end Behavioral;
