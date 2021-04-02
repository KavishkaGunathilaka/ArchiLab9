library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity TB_NanoProcessor_7Seg is
--  Port ( );
end TB_NanoProcessor_7Seg;

architecture Behavioral of TB_NanoProcessor_7Seg is

    component NanoProcessor_7Seg
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           LED_Out : out STD_LOGIC_VECTOR (3 downto 0);
           Out_7Seg1 : out STD_LOGIC_VECTOR (6 downto 0);
           Out_7Seg2 : out STD_LOGIC_VECTOR (6 downto 0);
           Anode_7Seg : out STD_LOGIC_VECTOR (3 downto 0);
           TestClock : out std_logic
           );
   end component;
   
   Signal Clk, Reset, Overflow, Zero, TestClock : std_logic;
   Signal LED_Out : std_logic_vector (3 downto 0);
   Signal Out_7Seg1 : STD_LOGIC_VECTOR (6 downto 0);
   Signal Out_7Seg2 : STD_LOGIC_VECTOR (6 downto 0);
   Signal Anode_7Seg : STD_LOGIC_VECTOR (3 downto 0);
   constant clock_period : time := 5 ns;
   
     
begin

    UUT : NanoProcessor_7Seg 
    port map(   Clk => Clk,
                Overflow => Overflow,
                Reset => Reset,
                Zero => Zero,
                LED_Out => LED_Out,
                Out_7Seg1 => Out_7Seg1,
                Anode_7Seg => Anode_7Seg,
                Out_7Seg2 => Out_7Seg2,
                TestClock => TestClock);
    
    clock_process : process
    begin
        Clk <= '0';
        wait for clock_period/2;
        Clk <= '1';
        wait for clock_period/2;
    end process;
        
    process begin
        Reset <= '1';
        wait for 100ns;
        Reset <= '0';
        wait;
    end process;
        
end Behavioral;
