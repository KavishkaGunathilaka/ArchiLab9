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
           LED_Out : out STD_LOGIC_VECTOR (3 downto 0);
           PC_Test : out STD_LOGIC_VECTOR (2 downto 0);
            Reg0_Test : out STD_LOGIC_VECTOR (3 downto 0);
            Reg1_Test : out STD_LOGIC_VECTOR (3 downto 0);
            Reg2_Test : out STD_LOGIC_VECTOR (3 downto 0);
            Reg3_Test : out STD_LOGIC_VECTOR (3 downto 0);
            Reg4_Test : out STD_LOGIC_VECTOR (3 downto 0);
            Reg5_Test : out STD_LOGIC_VECTOR (3 downto 0);
            Reg6_Test : out STD_LOGIC_VECTOR (3 downto 0);
            Reg7_Test : out STD_LOGIC_VECTOR (3 downto 0);
            Ins_Test : out STD_LOGIC_VECTOR (11 downto 0);
            Op0_Test : out STD_LOGIC_VECTOR (3 downto 0);
            Op1_Test : out STD_LOGIC_VECTOR (3 downto 0);
            Result_Test : out STD_LOGIC_VECTOR (3 downto 0);
            ChkJmp_Test : out STD_LOGIC_VECTOR (3 downto 0);
            RegEn_Test : out STD_LOGIC_VECTOR (2 downto 0);
            JumpFlag_Test : out STD_LOGIC);
   end component;
   
   Signal Clk, Reset, Overflow, Zero : std_logic;
   Signal LED_Out : std_logic_vector (3 downto 0);
   constant clock_period : time := 50 ns;
   
   Signal JumpFlag_Test : std_logic;
   Signal PC_Test, RegEn_Test : std_logic_vector (2 downto 0);
   Signal Op0_Test, Op1_Test, Result_Test, ChkJmp_Test : std_logic_vector (3 downto 0);
   Signal Ins_Test : std_logic_vector (11 downto 0);
   Signal Reg0_Test, Reg1_Test,  Reg2_Test, Reg3_Test, Reg4_Test,  Reg5_Test, Reg6_Test,  Reg7_Test: std_logic_vector (3 downto 0);
   
begin
    
    UUT : NanoProcessor port map(
        Clk => Clk,
        Overflow => Overflow,
        Reset => Reset,
        Zero => Zero,
        LED_Out => LED_Out,
        Ins_Test => Ins_Test,
        PC_Test => PC_Test,
        JumpFlag_Test => JumpFlag_Test,
        Reg0_Test => Reg0_Test,
        Reg1_Test => Reg1_Test,
        Reg2_Test => Reg2_Test,
        Reg3_Test => Reg3_Test,
        Reg4_Test => Reg4_Test,
        Reg5_Test => Reg5_Test,
        Reg6_Test => Reg6_Test,
        Reg7_Test => Reg7_Test,
        Result_Test => Result_Test,
        Op1_Test => Op1_Test,
        Op0_Test => Op0_Test,
        RegEn_Test => RegEn_Test,
        ChkJmp_Test => ChkJmp_Test
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
--        wait for 485ns;
--        Reset <= '1';
--        wait for 30ns;
--        Reset <= '0';
        wait;
    end process;
end Behavioral;
