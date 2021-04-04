library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NanoProcessor is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           LED_Out : out STD_LOGIC_VECTOR (3 downto 0)
           );
end NanoProcessor;

architecture Behavioral of NanoProcessor is
    
    component Reg_Bank_8 Port ( 
        Data_In : in STD_LOGIC_VECTOR (3 downto 0);
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
    end component;
    
    component AddSub_Unit_4bit port(
        A : in STD_LOGIC_VECTOR (3 downto 0);
        B : in STD_LOGIC_VECTOR (3 downto 0);
        Ctrl : in STD_LOGIC;
        Overflow : out STD_LOGIC;
        Zero : out STD_LOGIC;
        S : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component MUX_8Way_4Bit port (
        S : in STD_LOGIC_VECTOR (2 downto 0);
        En : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (3 downto 0);
        D0 : in STD_LOGIC_VECTOR (3 downto 0);
        D1 : in STD_LOGIC_VECTOR (3 downto 0);
        D2 : in STD_LOGIC_VECTOR (3 downto 0);
        D3 : in STD_LOGIC_VECTOR (3 downto 0);
        D4 : in STD_LOGIC_VECTOR (3 downto 0);
        D5 : in STD_LOGIC_VECTOR (3 downto 0);
        D6 : in STD_LOGIC_VECTOR (3 downto 0);
        D7 : in STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component MUX_2Way_4Bit port(
        S : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (3 downto 0);
        D0 : in STD_LOGIC_VECTOR (3 downto 0);
        D1 : in STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component Adder_3bit port(
        A : in STD_LOGIC_VECTOR(2 downto 0);
        B : in STD_LOGIC_VECTOR(2 downto 0);
        S : out STD_LOGIC_VECTOR(2 downto 0);
        C_out : out STD_LOGIC);
    end component;
    
    component MUX_2Way_3Bit port(
        S : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (2 downto 0);
        D0 : in STD_LOGIC_VECTOR (2 downto 0);
        D1 : in STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component PC port(
        Clk : in STD_LOGIC;
        Address : in STD_LOGIC_VECTOR (2 downto 0);
        Reset : in STD_LOGIC;
        MemorySelect : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component Instruction_Decoder port(
        Instruction : in STD_LOGIC_VECTOR (11 downto 0);
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
    
    component ROM_8 port(
        Mem_Select : in STD_LOGIC_VECTOR(2 downto 0);        
        Instruction_Bus : out STD_LOGIC_VECTOR(11 downto 0));
    end component;
    
    
    Signal PCAddress, NextAddress, JumpAddress : std_logic_vector(2 downto 0);
    Signal MemorySelect : std_logic_vector(2 downto 0);
    
    Signal InstructionBus : std_logic_vector(11 downto 0);                       
    Signal JumpFlag, AddSubSelect, LoadSelect : std_logic;
    Signal RegisterSelect0, RegisterSelect1 : std_logic_vector(2 downto 0);
    Signal ImmediateVal : std_logic_vector(3 downto 0);
    Signal RegEnable : std_logic_vector(2 downto 0);
    
    Signal D0, D1, D2, D3, D4, D5, D6, D7 : std_logic_vector(3 downto 0);
    Signal Operand0, Operand1, Result, RegBankDataIn : std_logic_vector(3 downto 0);
    
       
begin

    RegBank : Reg_Bank_8
                    port map (  
                        Data_In => RegBankDataIn,
                        Clk => Clk,
                        Reset => Reset,
                        Data_Out_0 => D0,
                        Data_Out_1 => D1,
                        Data_Out_2 => D2,
                        Data_Out_3 => D3,
                        Data_Out_4 => D4,
                        Data_Out_5 => D5,
                        Data_Out_6 => D6,
                        Data_Out_7 => D7,
                        Reg_En => RegEnable);
      
    AddSubUnit : AddSub_Unit_4bit 
                    port map (  
                        A => Operand1,
                        B => Operand0,
                        Ctrl => AddSubSelect,
                        Overflow => Overflow,
                        Zero => Zero,
                        S => Result);
                    
    Mux8Way4Bit_0 : MUX_8Way_4Bit
                        port map (  
                        S => RegisterSelect0,
                        En => '1',
                        Q => Operand0,
                        D0 => D0,
                        D1 => D1,
                        D2 => D2,
                        D3 => D3,
                        D4 => D4,
                        D5 => D5,
                        D6 => D6,
                        D7 => D7);

    Mux8Way4Bit_1 : MUX_8Way_4Bit
                        port map (  
                        S => RegisterSelect1,
                        En => '1',
                        Q => Operand1,
                        D0 => D0,
                        D1 => D1,
                        D2 => D2,
                        D3 => D3,
                        D4 => D4,
                        D5 => D5,
                        D6 => D6,
                        D7 => D7);

    MUX2Way4Bit : MUX_2Way_4Bit
                    port map (  
                        S => LoadSelect,
                        Q => RegBankDataIn,
                        D0 => Result,
                        D1 => ImmediateVal);
                          
    Adder3Bit : Adder_3bit
                    port map (  
                        A => MemorySelect,
                        B => "001",
                        S => NextAddress,
                        C_out => open );
    
    MUX2Way3Bit : MUX_2Way_3Bit
                    port map (  
                        S => JumpFlag,
                        Q => PCAddress,
                        D0 => NextAddress,
                        D1 => JumpAddress);

    ProgramCounter : PC
            port map (  
                Clk => Clk,
                Address => PCAddress,
                Reset => Reset,
                MemorySelect => MemorySelect);

    InstructionDecoder : Instruction_Decoder
                            port map (
                                Instruction => InstructionBus,
                                CheckJMP => Operand0,
                                RegEnable => RegEnable,
                                LoadSelect => LoadSelect,
                                ImmediateVal => ImmediateVal,
                                RegSelect1 => RegisterSelect0,
                                RegSelect2 => RegisterSelect1,
                                AddSubSelect => AddSubSelect,
                                JMPFlag => JumpFlag,
                                JMPAddress => JumpAddress);

    ROM : ROM_8
            port map (  
                Mem_Select => MemorySelect,
                Instruction_Bus => InstructionBus);
                
    LED_Out <= D7;
             
end Behavioral;
