library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder_3bit is
    Port ( ClockSig : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR (2 downto 0);
    X : out STD_LOGIC_VECTOR (2 downto 0));
end Adder_3bit;

architecture Behavioral of Adder_3bit is
    component HA
        port (
            A: in std_logic;
            B: in std_logic;
            S: out std_logic;
            C: out std_logic);
    end component;
    
SIGNAL C_out0 , C_out1: std_logic;

    begin
        HA_0 : HA
            port map (
                A => A(0),
                B => '1',
                S => X(0),
                C => C_out0);
            
        HA_1 : HA
            port map (
                A => A(1),
                B => C_out0,
                S => X(1),
                C => C_out1);
                
        HA_2 : HA
            port map (
                A => A(2),
                B => C_out1,
                S => X(2));
end Behavioral;

