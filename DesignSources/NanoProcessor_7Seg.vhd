library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NanoProcessor_7Seg is

    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           LED_Out : out STD_LOGIC_VECTOR (3 downto 0);
           Out_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           Anode_7Seg : out STD_LOGIC_VECTOR (3 downto 0)
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
    Signal LUT_Out : STD_LOGIC_VECTOR (6 downto 0);
    
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
        data => LUT_Out);
    
    SlowClock : Slow_Clk
    port map(
        Clk_in => Clk,
        Clk_out => Clock);
        
    LED_Out <= R7;

    process(R7, Clock)
    begin
        if R7(3) = '1' then -- display negative numbers
            Case Clock is
                When '1'=> 
                    Anode_7Seg <= "1101"; -- activate display1 when clock is 1
                    Out_7Seg <= "1111110"; -- (-) sign to represent negative numbers
                When others => 
                    Anode_7Seg <= "1110"; --activate display2 when clock is 0
                    Out_7Seg <= LUT_Out; -- diaplay value of R7 in Decimal
            End Case;
        else
                Anode_7Seg <= "1110"; -- activate display1 when R7 is positive
                Out_7Seg <= LUT_Out; -- diaplay value of R7 in Decimal
        end if;
    end process;
    
end Behavioral;
