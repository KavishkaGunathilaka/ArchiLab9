
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Reg_Bank_8 is
--  Port ( );
end TB_Reg_Bank_8;

architecture Behavioral of TB_Reg_Bank_8 is
    Component Reg_Bank_8
    Port ( Data_In : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Data_Out_0 : out STD_LOGIC_VECTOR (3 downto 0);
           Data_Out_1 : out STD_LOGIC_VECTOR (3 downto 0);
           Data_Out_2 : out STD_LOGIC_VECTOR (3 downto 0);
           Data_Out_3 : out STD_LOGIC_VECTOR (3 downto 0);
           Data_Out_4 : out STD_LOGIC_VECTOR (3 downto 0);
           Data_Out_5 : out STD_LOGIC_VECTOR (3 downto 0);
           Data_Out_6 : out STD_LOGIC_VECTOR (3 downto 0);
           Data_Out_7 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_En : in STD_LOGIC_VECTOR (2 downto 0));
    End component;

Signal Data_In, Data_Out_0, Data_Out_1, Data_Out_2, Data_Out_3, Data_Out_4, Data_Out_5, Data_Out_6, Data_Out_7 : STD_LOGIC_VECTOR (3 downto 0);
Signal Reg_En : STD_LOGIC_VECTOR(2 downto 0);
Signal Clk,Reset : STD_LOGIC ;
constant clock_period : time := 50 ns;

begin
clock_process : process
    begin
        Clk <= '0';
        wait for clock_period/2;
        Clk <= '1';
        wait for clock_period/2;
    end process;
    
    UUT : Reg_Bank_8 port map(
        Clk => Clk,
        Data_In => Data_In,
        Reset => Reset,
        Data_Out_0 => Data_Out_0,
        Data_Out_1 => Data_Out_1,
        Data_Out_2 => Data_Out_2,
        Data_Out_3 => Data_Out_3,
        Data_Out_4 => Data_Out_4,
        Data_Out_5 => Data_Out_5,
        Data_Out_6 => Data_Out_6,
        Data_Out_7 => Data_Out_7,
        Reg_En => Reg_En
    );
    
        process begin
            
            Reset <= '1';
            wait for 50ns;
            Reset <= '0';
            
            Data_In <= "0101";
            Reg_En <= "001";

            wait for 100 ns;
            
            Data_In <= "0101";
            Reg_En <= "010";
        
            wait for 100 ns;
            
            Data_In <= "0101";
            Reg_En <= "011";
        
            wait for 100 ns;
            
        
            Data_In <= "0101";
            Reg_En <= "100";
            
            wait for 100 ns;
            
            Data_In <= "0101";
            Reg_En <= "101";
                 
            wait for 100 ns;
            
            Data_In <= "0101";
            Reg_En <= "110";
                 
            wait for 100 ns;
            
            Data_In <= "0101";
            Reg_En <= "111";
                 
            wait for 100 ns;
            
            Data_In <= "1111";
            Reg_En <= "001";

            wait for 100 ns;
            
            Reset <= '1';
            wait;

        end process;


end Behavioral;
