library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Instruction_Decoder is
    library IEEE;
    use IEEE.STD_LOGIC_1164.ALL;
    
    entity Instruction_Decoder is
        Port ( Instruction : in STD_LOGIC_VECTOR (11 downto 0);
               RegJmp : in STD_LOGIC_VECTOR (3 downto 0);
               RegEnable : out STD_LOGIC_VECTOR (2 downto 0);
               LoadSel : out STD_LOGIC;
               ImVal : out STD_LOGIC_VECTOR (3 downto 0);
               RegSel1 : out STD_LOGIC_VECTOR (2 downto 0);
               RegSel2 : out STD_LOGIC_VECTOR (2 downto 0);
               AddSubSel : out STD_LOGIC;
               JumpFlag : out STD_LOGIC;
               JumpAddr : out STD_LOGIC_VECTOR (2 downto 0));
    end Instruction_Decoder;
    
    architecture Behavioral of Instruction_Decoder is
    
    component Decoder_2_to_4
        port(
            I: in std_logic_vector(1 downto 0);
            En: in std_logic;
            Y: out std_logic_vector(3 downto 0));
        end component;
    
    Signal add, neg, mov, jzr : std_logic;
    Signal var1 : std_logic;
    
    begin
    
    Decoder_2_to_4_0 : Decoder_2_to_4
        port map (
        I(0) => Instruction(10),
        I(1) => Instruction(11),
        EN => '1',
        Y(0)=> add,
        Y(1) => neg,
        Y(2) => mov,
        Y(3) => jzr);
        
    LoadSel <= mov;
    AddSubSel <= neg;
    JumpFlag <= jzr and  (not (RegJmp(0) or RegJmp(1) or RegJmp(2) or RegJmp(0)));
    JumpAddr <= Instruction (2 downto 0);
    
    var1 <= add or neg or mov;
    RegisterEnable(0) <= var1 and Instruction(7);
    RegisterEnable(1) <= var1 and Instruction(8);
    RegisterEnable(2) <= var1 and Instruction(9);
    ImVal <= Instruction (3 downto 0);
    
    RegSel1 <= Instruction (9 downto 7);
    RegSel2 <= Instruction (6 downto 4);
    
    end Behavioral;
    