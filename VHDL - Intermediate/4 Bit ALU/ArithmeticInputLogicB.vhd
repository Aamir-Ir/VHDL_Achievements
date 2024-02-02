----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/19/2023 10:16:57 AM
-- Design Name: 
-- Module Name: ArithmeticInputLogicB - Behavioral
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

entity ArithmeticInputLogicB is
    Port ( SCin_AILB : in STD_LOGIC;
           S1_AILB : in STD_LOGIC;
           S0_AILB : in STD_LOGIC;
           Bin_AILB : in STD_LOGIC;
           Bout_AILB : out STD_LOGIC);
end ArithmeticInputLogicB;

architecture Behavioral of ArithmeticInputLogicB is

begin

     -- Logic required to handle B_AU depending on select lines. Here we simply look at look up table given in lab. Can't optimize to many distincct cases.
     
    Bout_AILB <= Bin_AILB when (SCin_AILB = '0' and S1_AILB = '0' and S0_AILB = '0')
        else Bin_AILB when (SCin_AILB = '0' and S1_AILB = '0' and S0_AILB = '1')
        else '1' when (SCin_AILB = '0' and S1_AILB = '1' and S0_AILB = '0')
        else '0' when (SCin_AILB = '0' and S1_AILB = '1' and S0_AILB = '1')
        else (not Bin_AILB) when (SCin_AILB = '1' and S1_AILB = '0' and S0_AILB = '0')
        else Bin_AILB when (SCin_AILB = '1' and S1_AILB = '0' and S0_AILB = '1')
        else '0' when (SCin_AILB = '1' and S1_AILB = '1' and S0_AILB = '0')
        else '0' when (SCin_AILB = '1' and S1_AILB = '1' and S0_AILB = '1');

end Behavioral;
