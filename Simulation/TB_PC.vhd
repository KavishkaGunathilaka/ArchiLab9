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
            -- Index no: 190482 --> 10 1110 1000 0001 0010
            Address <= "010";
           
            wait for 100 ns;--ans: Cout = 0 | S = 0011
            
            Address <= "100";
    
            wait for 100 ns;--ans: Cout = 1 | S = 0110
            
            Address <= "111";
            wait for 100 ns;---ans: Cout = 1 | S = 1110
            
            Address <= "000";
            wait for 100 ns;---ans: Cout = 0 | S = 0000
            
            Address<= "001";       
            wait for 100 ns;---ans: Cout = 0 | S = 1101
            
            wait;

        end process;
    
end Behavioral;
