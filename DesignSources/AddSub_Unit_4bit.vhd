library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AddSub_Unit_4bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Ctrl : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end AddSub_Unit_4bit;

architecture Behavioral of AddSub_Unit_4bit is
    component FA
        port (
        A: in std_logic;
        B: in std_logic;
        C_in: in std_logic;
        S: out std_logic;
        C_out: out std_logic);
    end component;
    
    SIGNAL B_in, S_out : std_logic_vector(3 downto 0);
    SIGNAL FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C, FA3_S, FA3_C : std_logic;
    
    begin
        
        FA_0 : FA
            port map (
                A => A(0),
                B => B_in(0),
                C_in => Ctrl,
                S => S_out(0),
                C_Out => FA0_C);
                
        FA_1 : FA
            port map (
                A => A(1),
                B => B_in(1),
                C_in => FA0_C,
                S => S_out(1),
                C_Out => FA1_C);
                
        FA_2 : FA
            port map (
                A => A(2),
                B => B_in(2),
                C_in => FA1_C,
                S => S_out(2),
                C_Out => FA2_C);
                
        FA_3 : FA
            port map (
                A => A(3),
                B => B_in(3),
                C_in => FA2_C,
                S => S_out(3));
                
       
        B_in(0) <= B(0) XOR Ctrl;
        B_in(1) <= B(1) XOR Ctrl;
        B_in(2) <= B(2) XOR Ctrl;
        B_in(3) <= B(3) XOR Ctrl;
       
        S(0) <= S_out(0);
        S(1) <= S_out(1);
        S(2) <= S_out(2);
        S(3) <= S_out(3);
        
        Overflow <= ((A(3) XNOR (Ctrl XOR B(3))) AND (A(3) AND (Ctrl XOR B(3)))) XOR S_out(3);

        Zero <= not (S_out(0) or S_out(1) or S_out(2) or S_out(3));
        
end Behavioral;