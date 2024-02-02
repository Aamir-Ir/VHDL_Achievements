----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/19/2023 10:09:31 AM
-- Design Name: 
-- Module Name: HalfAdder - Behavioral
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

entity HalfAdder is
    Port ( A_Half : in STD_LOGIC;
           B_Half : in STD_LOGIC;
           Sum_Half : out STD_LOGIC;
           CarryOut_Half : out STD_LOGIC);
end HalfAdder;

architecture Behavioral of HalfAdder is

begin
    -- Logic inside a Half Adder.
    
    CarryOut_Half <= A_Half AND B_Half;
    Sum_Half <= A_Half XOR B_Half;

end Behavioral;
