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
           JMPAddress : out STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           ChkJmp_Test : out STD_LOGIC_VECTOR (3 downto 0));
end Instruction_Decoder;
    
architecture Behavioral of Instruction_Decoder is
    
     SHARED VARIABLE CheckJump : STD_LOGIC_VECTOR (3 downto 0);
--    Signal CheckJump : STD_LOGIC_VECTOR (3 downto 0);
    
begin
    
    process(Instruction) 
    begin   
            CheckJump := CheckJMP;
            RegSelect1 <= Instruction (9 downto 7);
            RegSelect2 <= Instruction (6 downto 4);
            ImmediateVal <= Instruction (3 downto 0);
            JMPAddress <= Instruction (2 downto 0); 
            
            case Instruction(11 downto 10) is
                -- Add
                when "00" =>
                ChkJmp_Test <= CheckJump;   
                    AddSubSelect <= '0';
                    LoadSelect <= '0';
                    JMPFlag <= '0';
                    RegEnable <= Instruction(9 downto 7);
                -- NEG
                when "01" =>
                ChkJmp_Test <= CheckJump;
                    AddSubSelect <= '1';
                    LoadSelect <= '0';
                    JMPFlag <= '0';
                    RegEnable <= Instruction(9 downto 7);
                -- MOVL
                when "10" =>
                ChkJmp_Test <= CheckJump;
                    LoadSelect <= '1';
                    JMPFlag <= '0';
                    RegEnable <= Instruction(9 downto 7);
                -- JZR
                when "11" =>
                ChkJmp_Test <= CheckJump;
                    AddSubSelect <= '0';
                    LoadSelect <= '0';
                    RegEnable <= "000";
                    JMPFlag <= '1'; 
                when others => 
            end case;
            
            
  end process;
  
    

end Behavioral;
    