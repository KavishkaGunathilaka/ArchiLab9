library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

    
entity Instruction_Decoder is
    Port ( Instruction : in STD_LOGIC_VECTOR (11 downto 0);
           CheckJMP : in STD_LOGIC_VECTOR (3 downto 0);
           RegEnable : out STD_LOGIC_VECTOR (2 downto 0);
           LoadSelect : out STD_LOGIC;
           ImmediateVal : out STD_LOGIC_VECTOR (3 downto 0);
           RegSelect1 : out STD_LOGIC_VECTOR (2 downto 0);
           RegSelect2 : out STD_LOGIC_VECTOR (2 downto 0);
           AddSubSelect : out STD_LOGIC;
           JMPFlag : out STD_LOGIC;
           JMPAddress : out STD_LOGIC_VECTOR (2 downto 0));
end Instruction_Decoder;
    
architecture Behavioral of Instruction_Decoder is
        
begin
    
    RegSelect1 <= Instruction (9 downto 7);
    RegSelect2 <= Instruction (6 downto 4);
    ImmediateVal <= Instruction (3 downto 0);
    JMPAddress <= Instruction (2 downto 0);

    AddSubSelect <= '1' WHEN 
        Instruction(11 downto 10) = "01" 
    ELSE -- NEG Instruction
        '0';
    
    LoadSelect <= '1' WHEN 
        Instruction(11 downto 10) = "10" 
    ELSE -- MOVL Instruction
        '0';

    JMPFlag <= '1' WHEN 
        Instruction(11 downto 10) = "11" and CheckJMP = "0000" 
    ELSE -- NEG Instruction
        '0';
    
    RegEnable <= "000" WHEN 
        Instruction(11 downto 10) = "11" 
    ELSE -- JZR Instruction
         Instruction(9 downto 7);

end Behavioral;
    