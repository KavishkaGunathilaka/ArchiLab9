library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_ROM is
end TB_ROM;

architecture Behavioral of TB_ROM is
    Component ROM_8
    Port ( 
       Mem_Select : in STD_LOGIC_VECTOR(2 downto 0);
       Instruction_Bus : out STD_LOGIC_VECTOR(11 downto 0));
    End component;

Signal Mem_Select : STD_LOGIC_VECTOR (2 downto 0);
Signal Instruction_Bus : STD_LOGIC_VECTOR (11 downto 0);


begin
    UUT : ROM_8 port map(
        Mem_Select => Mem_Select,
        Instruction_Bus => Instruction_Bus
    );

    process begin
        
        
        Mem_Select <= "000";
        wait for 100 ns;
        
        Mem_Select<= "001";
        wait for 100 ns;
        
        Mem_Select<= "010";
        wait for 100 ns;
        
        Mem_Select<= "011";
        wait for 100 ns;
        
        Mem_Select<= "100";
        wait for 100 ns;
        
        Mem_Select<= "101";
        wait for 100 ns;
                
        Mem_Select<= "110";
        wait for 100 ns;
                              
        Mem_Select<= "111";
        wait for 100 ns;

        wait;

    end process;
end Behavioral;
