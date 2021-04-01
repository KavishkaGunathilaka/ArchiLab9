library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Instruction_Decoder is
end TB_Instruction_Decoder;

architecture Behavioral of TB_Instruction_Decoder is
    component Instruction_Decoder
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
   end component;
   
   Signal CheckJMP, ImmediateVal : STD_LOGIC_VECTOR (3 downto 0);
   Signal RegEnable, RegSelect1, RegSelect2, JMPAddress   : STD_LOGIC_VECTOR(2 downto 0);
   Signal LoadSelect, AddSubSelect, JMPFlag, Clk : STD_LOGIC ;
   Signal Instruction : STD_LOGIC_VECTOR (11 downto 0);
   constant clock_period : time := 50 ns;
   
begin

    UUT : Instruction_Decoder port map(
        Instruction => Instruction,
        CheckJMP => CheckJMP,
        RegEnable => RegEnable,
        LoadSelect => LoadSelect,
        ImmediateVal => ImmediateVal,
        RegSelect1 => RegSelect1,
        RegSelect2 => RegSelect2,
        AddSubSelect => AddSubSelect,
        JMPFlag => JMPFlag,
        JMPAddress => JMPAddress
    );

    clock_process : process
    begin
        Clk <= '0';
        wait for clock_period/2;
        Clk <= '1';
        wait for clock_period/2;
    end process;

    process begin


        Instruction <= "101010001101";
        CheckJMP <= "0001";
        wait for 100 ns;
        
        Instruction <= "000101100000";
        wait for 100 ns;
        
        Instruction <= "010010000000";
        wait for 100 ns;
        
        Instruction <= "111110000100";
        CheckJMP <= "0000";
        wait for 100 ns;

        wait;

    end process;
        
        
        
end Behavioral;
