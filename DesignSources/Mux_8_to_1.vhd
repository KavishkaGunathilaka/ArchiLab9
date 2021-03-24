library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_8_to_1 is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (7 downto 0);
           En : in STD_LOGIC;
           Y : out STD_LOGIC);
end Mux_8_to_1;

architecture Behavioral of Mux_8_to_1 is
    
    component Decoder_3_to_8
    port (  I : in STD_LOGIC_VECTOR (2 downto 0);
            En : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    signal DecOut, OrOut : std_logic_vector (7 downto 0);
    
begin
    Decoder_3_to_8_0 : Decoder_3_to_8
        port map (
            I(2 downto 0) => S(2 downto 0),
            En => En,
            Y(7 downto 0) => DecOut(7 downto 0));
    
    OrOut(0) <= DecOut(0) AND D(0);
    OrOut(1) <= DecOut(1) AND D(1);
    OrOut(2) <= DecOut(2) AND D(2);
    OrOut(3) <= DecOut(3) AND D(3);
    OrOut(4) <= DecOut(4) AND D(4);
    OrOut(5) <= DecOut(5) AND D(5);
    OrOut(6) <= DecOut(6) AND D(6);
    OrOut(7) <= DecOut(7) AND D(7);
    
    Y <= (OrOut(0) OR OrOut(1) OR OrOut(2) OR OrOut(3) OR OrOut(4) OR OrOut(5) OR OrOut(6) OR OrOut(7)) AND En;
    
end Behavioral;
