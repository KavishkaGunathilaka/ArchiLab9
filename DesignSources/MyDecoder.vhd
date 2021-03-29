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
    
    Signal add, neg, movl, jzr : std_logic;
    Signal not_jzr : std_logic;
    
begin
    
    Decoder_2_to_4_0 : Decoder_2_to_4
        port map (
        I(0) => Instruction(10),
        I(1) => Instruction(11),
        EN => '1',
        Y(0)=> add,
        Y(1) => neg,
        Y(2) => movl,
        Y(3) => jzr);
        
    LoadSelect <= movl;
    AddSubSelect <= neg;
    JMPFlag <= jzr and  (not (CheckJMP(0) or CheckJMP(1) or CheckJMP(2) or CheckJMP(0)));
    JMPAddress <= Instruction (2 downto 0);
    
    not_jzr <= add or neg or movl;
    RegEnable(0) <= not_jzr and Instruction(7);
    RegEnable(1) <= not_jzr and Instruction(8);
    RegEnable(2) <= not_jzr and Instruction(9);
    ImmediateVal <= Instruction (3 downto 0);
    
    RegSelect1 <= Instruction (9 downto 7);
    RegSelect2 <= Instruction (6 downto 4);

end Behavioral;
    