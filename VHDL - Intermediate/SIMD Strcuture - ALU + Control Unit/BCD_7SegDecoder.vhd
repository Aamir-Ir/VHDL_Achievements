----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:14:28 09/11/2017 
-- Design Name: 
-- Module Name:    Hex7SegDecoder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BCD_7SegDecoder is
    Port ( Input_7SD : in STD_LOGIC_VECTOR (3 downto 0);
           a_to_g : out STD_LOGIC_VECTOR (6 downto 0));
end BCD_7SegDecoder;

architecture Behavioral of BCD_7SegDecoder is

begin
   process(Input_7SD)
   begin   
     case Input_7SD is                                  -- a,b,c,d,e,f,g
         when "0000" => a_to_g <= "1000000"; --0
         when "0001" => a_to_g <= "1111001"; --1        1001111         1111001
         when "0010" => a_to_g <= "0100100"; --2     0010010  0100100
         when "0011" => a_to_g <= "0110000"; --3         
         when "0100" => a_to_g <= "0011001"; --4         
         when "0101" => a_to_g <= "0010010"; --5             
         when "0110" => a_to_g <= "0000010"; --6 
         when "0111" => a_to_g <= "1011000"; --7
         when "1000" => a_to_g <= "0000000"; --8
         when "1001" => a_to_g <= "0010000"; --9         
         when "1010" => a_to_g <= "0001000"; --A
         when "1011" => a_to_g <= "0000011"; --b         
         when "1100" => a_to_g <= "1000110"; --C         z
         when "1101" => a_to_g <= "0100001"; --d    
         when "1110" => a_to_g <= "0000110"; --E    
         when "1111" => a_to_g <= "0001110"; --F    
     end case;
   end process;
end Behavioral;
