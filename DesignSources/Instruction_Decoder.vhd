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

    component Decoder_2_to_4
        port(
            I: in std_logic_vector(1 downto 0);
            En: in std_logic;
            Y: out std_logic_vector(3 downto 0));
        end component;
    
begin
    
    process(Instruction) 
    begin
    
        RegSelect1 <= Instruction (9 downto 7);
        RegSelect2 <= Instruction (6 downto 4);
        ImmediateVal <= Instruction (3 downto 0);
        RegEnable <= Instruction(9 downto 7);
        JMPAddress <= Instruction (2 downto 0); 
       
        case Instruction(11 downto 10) is
            -- Add
            when "00" =>   
                AddSubSelect <= '0';
                LoadSelect <= '0';
            -- NEG
            when "01" =>
                AddSubSelect <= '1';
                LoadSelect <= '0';
            -- MOVL
            when "10" =>
                LoadSelect <= '1';
            when others =>
                AddSubSelect <= '0';
                LoadSelect <= '0';
                case CheckJMP is
                    when "0000" => JMPFlag <= '1';
                    when others => JMPFlag <= '0';
                end case;
        end case;
  end process;

end Behavioral;
    