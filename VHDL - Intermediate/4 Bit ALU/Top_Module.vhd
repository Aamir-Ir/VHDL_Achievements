----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/19/2023 12:09:34 PM
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
        SW : in STD_LOGIC_VECTOR(10 downto 0);
        LED : out STD_LOGIC_VECTOR(10 downto 0);
        AN : out STD_LOGIC_VECTOR(7 downto 0);
        Cathode : out STD_LOGIC_VECTOR(6 downto 0);
        carryLED : out STD_LOGIC
    );
end Top_Module;

architecture Behavioral of Top_Module is
    signal sum : STD_LOGIC_VECTOR(5 downto 0); --changed range
    signal carry_out : STD_LOGIC;

    -- For Operands
--    signal operand1 : STD_LOGIC_VECTOR(3 downto 0);
--    signal operand2 : STD_LOGIC_VECTOR(3 downto 0);
    
    signal operand1SegmentDis : STD_LOGIC_VECTOR (6 downto 0);
    signal operand2SegmentDis : STD_LOGIC_VECTOR (6 downto 0);
    
    -- For Ans
    signal lowBits : STD_LOGIC_VECTOR(3 downto 0);
    signal highBits : STD_LOGIC_VECTOR(3 downto 0);
    signal lowSegmentDis : STD_LOGIC_VECTOR (6 downto 0);
    signal highSegmentDis : STD_LOGIC_VECTOR (6 downto 0);
    
    signal num : integer := 0;
    signal counter : integer range 0 to 32000 := 0;
begin
    carryLED <= carry_out;  -- using the first LED as carry indicator
    LED(10 downto 0) <= SW(10 downto 0);

    -- Instantiate the ripple carry adder
    Adder : entity work.FourBitAU port map (
        A_FBAU => SW(6 downto 3),   --SW(6 downto 3)
        B_FBAU => SW(10 downto 7),  --SW(10 downto 7)
        Cin_FBAU => SW(2),
        G_FBAU => sum(3 downto 0),
        Cout_FBAU => carry_out,
        S0_FBAU => SW(1),
        S1_FBAU => SW(0)
    );
    lowBits <= sum(3 downto 0);
    sum(4) <= carry_out; --added
    highBits <= "000" & sum(4); --changed to sum6
    
    decode_op1 : entity work.BCD_7SegDecoder port map (
            Input_7SD => SW(6 downto 3),
            a_to_g => operand1SegmentDis
    );
    
    decode_op2 : entity work.BCD_7SegDecoder port map (
        Input_7SD => SW(10 downto 7),
        a_to_g => operand2SegmentDis
    );
    
--    lowBits <= sum(3 downto 0);
--    highBits <= "000" & sum(4); --changed to sum6
    
    decode_low : entity work.BCD_7SegDecoder port map (
        Input_7SD => lowBits,
        a_to_g => lowSegmentDis
    );
        
    decode_high : entity work.BCD_7SegDecoder port map (
        Input_7SD => highBits,
        a_to_g => highSegmentDis
    );

process(clk) 
begin
    if rising_edge(clk) then 
        if counter >= 5000 then -- 5 ms assuming 100 MHz clock 
            if num = 0 then 
                num <= 1; 
                AN <= "11111110"; -- rightmost digit 
                Cathode <= lowSegmentDis; 
            elsif num = 1 then -- Use "elsif" instead of "else if" 
                num <= 2; 
                AN <= "11111101"; -- second rightmost digit 
                Cathode <= highSegmentDis; 
            elsif num = 2 then -- Use "elsif" instead of "else if" 
                num <= 3; 
                AN <= "11101111"; -- second rightmost digit 
                Cathode <= operand1SegmentDis; 
            else 
                num <= 0; 
                AN <= "10111111"; -- second rightmost digit 
                Cathode <= operand2SegmentDis; 
            end if; 
            counter <= 0; 
        else 
            counter <= counter + 1; 
        end if; 
    end if; 

end process; 
        

end Behavioral;
