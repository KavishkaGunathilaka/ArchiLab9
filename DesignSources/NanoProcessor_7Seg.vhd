library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NanoProcessor_7Seg is
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
end NanoProcessor_7Seg;

architecture Behavioral of NanoProcessor_7Seg is
    
    component NanoProcessor
        Port ( Clk : in STD_LOGIC;
               Reset : in STD_LOGIC;
               Overflow : out STD_LOGIC;
               Zero : out STD_LOGIC;
               LED_Out : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component LUT_16_7
        Port ( address : in STD_LOGIC_VECTOR(3 downto 0);
               data : out STD_LOGIC_VECTOR(6 downto 0));
    end component;
    
    component Slow_Clk
        Port ( Clk_in : in STD_LOGIC;
               Clk_out : out STD_LOGIC);
    end component;
    
    Signal Clock : std_logic;
    Signal R7 : std_logic_vector (3 downto 0);
    constant RefreshPeriod : time := 50 ns;
    
begin

    CPU0 : NanoProcessor
    port map(
        Clk => Clock,                       
        Reset => Reset,                     
        Overflow => Overflow,            
        Zero => Zero,                  
        LED_Out => R7
        );
    
    LUT_16_7_0 : LUT_16_7
    port map(
        address => R7,
        data => Out_7Seg2);
    
    SlowClock : Slow_Clk
    port map(
        Clk_in => Clk,
        Clk_out => Clock);
        
    LED_Out <= R7;
    TestClock <= Clock;
    Out_7Seg1 <= "1111110"; -- (-) sign to represent negative numbers

    process(R7, Clock)
    begin
        if R7(3) = '1' then -- display negative numbers
            Case Clock is
                When '1'=> Anode_7Seg <= "1101"; -- display (-) sign when clock is 1
                When others => Anode_7Seg <= "1110"; -- display (-) number when clock is 0
            End Case;
        else
                Anode_7Seg <= "1110"; -- display positive numbers
        end if;
    end process;
    
end Behavioral;
