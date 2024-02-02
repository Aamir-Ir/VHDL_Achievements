----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/28/2023 05:47:17 PM
-- Design Name: 
-- Module Name: Top_Module - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top_Module is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        state : in STD_LOGIC;
        SW : in STD_LOGIC_VECTOR(7 downto 0);
        LED : out STD_LOGIC_VECTOR(7 downto 0);
        AN : out STD_LOGIC_VECTOR(7 downto 0);
        Cathode : out STD_LOGIC_VECTOR(6 downto 0);
        carryLED1 : out STD_LOGIC;
        carryLED2 : out STD_LOGIC;
        SC_LED : out STD_LOGIC;
        S1_LED : out STD_LOGIC;
        S0_LED : out STD_LOGIC
    );
end Top_Module;

architecture Behavioral of Top_Module is
    signal sum : STD_LOGIC_VECTOR(5 downto 0); --changed range
    signal carry_out : STD_LOGIC;
    
    signal sum2 : STD_LOGIC_VECTOR(5 downto 0); --changed range
    signal carry_out2 : STD_LOGIC;

    signal SCin_top : STD_LOGIC;
    signal S1_top : STD_LOGIC;
    signal S0_top : STD_LOGIC;
    
    -- For Operands
    signal operand1 : STD_LOGIC_VECTOR(3 downto 0);
    signal operand2 : STD_LOGIC_VECTOR(3 downto 0);
    signal operand3 : STD_LOGIC_VECTOR(3 downto 0);
    signal operand4 : STD_LOGIC_VECTOR(3 downto 0);
    
    signal operand1SegmentDis : STD_LOGIC_VECTOR (6 downto 0);
    signal operand2SegmentDis : STD_LOGIC_VECTOR (6 downto 0);
    signal operand3SegmentDis : STD_LOGIC_VECTOR (6 downto 0);
    signal operand4SegmentDis : STD_LOGIC_VECTOR (6 downto 0);
    
    -- For Ans
    signal lowBits : STD_LOGIC_VECTOR(3 downto 0);
    signal highBits : STD_LOGIC_VECTOR(3 downto 0);
    signal lowSegmentDis : STD_LOGIC_VECTOR (6 downto 0);
--    signal highSegmentDis : STD_LOGIC_VECTOR (6 downto 0);
    signal lowBits2 : STD_LOGIC_VECTOR(3 downto 0);
    signal highBits2 : STD_LOGIC_VECTOR(3 downto 0);
    signal lowSegmentDis2 : STD_LOGIC_VECTOR (6 downto 0);
    
    signal num : integer := 0;
    signal counter : integer range 0 to 32000 := 0;
    
    signal debounce_state : STD_LOGIC;
begin
    carryLED1 <= carry_out;  -- using the first LED as carry indicator
    carryLED2 <= carry_out2;
    LED(7 downto 0) <= SW(7 downto 0);
    
    SC_LED <= SCin_top; 
    S1_LED <= S1_top; 
    S0_LED <= S0_top; 
    

    dbounce : entity work.dbounce port map (
            push_bt => state,
            clk => clk,
            debounce_out => debounce_state                        
    );
    
    reg1 : entity work.RegFile1 port map (
            ReadA => SW(3 downto 0), --SW(7 downto 4)
            DataOut => operand1,
            CLK => clk
    );
    
    reg2 : entity work.RegFile2 port map (
            ReadA => SW(7 downto 4), --SW(3 downto 0)
            DataOut => operand2,
            CLK => clk
    );
    
    reg3 : entity work.RegFile3 port map (
            ReadA => SW(3 downto 0),
            DataOut => operand3,
            CLK => clk
    );
    
    reg4 : entity work.RegFile4 port map (
            ReadA => SW(7 downto 4),
            DataOut => operand4,
            CLK => clk
    );
    
    ControlUnit : entity work.controlUnit port map (
            clk => clk,
            reset => reset,
            stateStop => debounce_state,
            SCin_CU => SCin_top,
            S0_CU => S0_top,
            S1_CU => S1_top
    );
    
    -- Instantiate the Four Bit Arithmetic Unit.
    FBAU_1 : entity work.FourBitAU port map (
        A_FBAU => operand1,   
        B_FBAU => operand2,  
        Cin_FBAU => SCin_top,
        G_FBAU => sum(3 downto 0),
        Cout_FBAU => carry_out,
        S0_FBAU => S0_top, 
        S1_FBAU => S1_top  
    );
    lowBits <= sum(3 downto 0);
    sum(4) <= carry_out; --added
    highBits <= "000" & sum(4); --changed to sum6
    
    decode_op1 : entity work.BCD_7SegDecoder port map (
            Input_7SD => operand1,
            a_to_g => operand1SegmentDis
    );
    
    decode_op2 : entity work.BCD_7SegDecoder port map (
        Input_7SD => operand2,
        a_to_g => operand2SegmentDis
    );
    
--    lowBits <= sum(3 downto 0);
--    highBits <= "000" & sum(4); --changed to sum6
    
    decode_low : entity work.BCD_7SegDecoder port map (
        Input_7SD => lowBits,
        a_to_g => lowSegmentDis
    );
        
--    decode_high : entity work.BCD_7SegDecoder port map (
--        Input_7SD => highBits,
--        a_to_g => highSegmentDis
--    );

-- Register 3 and 4 

 -- Instantiate the Four Bit Arithmetic Unit.
    FBAU_2 : entity work.FourBitAU port map (
        A_FBAU => operand3,   
        B_FBAU => operand4,  
        Cin_FBAU => SCin_top,
        G_FBAU => sum2(3 downto 0),
        Cout_FBAU => carry_out2,
        S0_FBAU => S0_top, 
        S1_FBAU => S1_top 
    );
    lowBits2 <= sum2(3 downto 0);
    sum2(4) <= carry_out2; --added
    highBits2 <= "000" & sum(4); --changed to sum6
    
    decode_op3 : entity work.BCD_7SegDecoder port map (
            Input_7SD => operand3,
            a_to_g => operand3SegmentDis
    );
    
    decode_op4 : entity work.BCD_7SegDecoder port map (
        Input_7SD => operand4,
        a_to_g => operand4SegmentDis
    );
    
--    lowBits <= sum(3 downto 0);
--    highBits <= "000" & sum(4); --changed to sum6
    
    decode_low2 : entity work.BCD_7SegDecoder port map (
        Input_7SD => lowBits2,
        a_to_g => lowSegmentDis2
    );
        
--    decode_high : entity work.BCD_7SegDecoder port map (
--        Input_7SD => highBits,
--        a_to_g => highSegmentDis
--    );



process(clk) 
begin
    if rising_edge(clk) then 
        if counter >= 5000 then -- 5 ms assuming 100 MHz clock 
            if num = 0 then 
                num <= 1; 
                AN <= "11101111"; -- rightmost digit 
                Cathode <= lowSegmentDis; 
            elsif num = 1 then -- Use "elsif" instead of "else if" 
                num <= 2; 
                AN <= "01111111"; -- Operand 1 from reg 1 
                Cathode <= operand1SegmentDis; 
            elsif num = 2 then
                num <= 3; 
                AN <= "10111111"; -- Operand 2 From reg 2 
                Cathode <= operand2SegmentDis; 
            elsif num = 3 then
                num <= 4; 
                AN <= "11111110"; -- Operand 2 From reg 2 
                Cathode <= lowSegmentDis2;
            elsif num = 4 then
                num <= 5; 
                AN <= "11110111"; -- Operand 2 From reg 2 
                Cathode <= operand3SegmentDis;
            else
                num <= 0; 
                AN <= "11111011"; -- Operand 2 From reg 2 
                Cathode <= operand4SegmentDis; 
            end if; 
            counter <= 0; 
        else 
            counter <= counter + 1; 
        end if; 
    end if; 

end process; 
        

end Behavioral;
