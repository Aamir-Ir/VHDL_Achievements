----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/19/2023 10:14:10 AM
-- Design Name: 
-- Module Name: ArithmeticInputLogicA - Behavioral
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

entity ArithmeticInputLogicA is
    Port ( S0_AILA : in STD_LOGIC;
           Ain_AILA : in STD_LOGIC;
           Aout_AILA : out STD_LOGIC);
end ArithmeticInputLogicA;

architecture Behavioral of ArithmeticInputLogicA is

begin

    -- Logic required to handle A depending on select lines. No need for Cin_AILA and S1in_AILA as if you do K-map it is irrelavant. 
    
    Aout_AILA <= Ain_AILA when (S0_AILA = '0')
        else (not Ain_AILA) when (S0_AILA = '1');

end Behavioral;
