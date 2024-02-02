----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/19/2023 10:11:22 AM
-- Design Name: 
-- Module Name: FullAdder - Behavioral
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

entity FullAdder is
    Port ( A_Full : in STD_LOGIC;
           B_Full : in STD_LOGIC;
           CarryIn_Full : in STD_LOGIC;
           Sum_Full : out STD_LOGIC;
           CarryOut_Full : out STD_LOGIC);
end FullAdder;

architecture Behavioral of FullAdder is
    
    -- Component and Output signals needed for between operations.
    
    component HalfAdder is
        Port ( A_Half : in STD_LOGIC;
               B_Half : in STD_LOGIC;
               Sum_Half : out STD_LOGIC;
               CarryOut_Half : out STD_LOGIC);
    end component HalfAdder;
    
    signal sum_half_tmp : STD_LOGIC;
    signal CarryOut_half0 : STD_LOGIC;
    signal CarryOut_half1 : STD_LOGIC;
    
begin

    -- Logic for a FullAdder.
    
    ha1: HalfAdder
        port map(A_Half => A_Full, B_Half => B_Full, Sum_Half => sum_half_tmp, CarryOut_Half => CarryOut_half0);

    ha2: HalfAdder
        port map(A_Half => sum_half_tmp, B_Half => CarryIn_Full, Sum_Half => Sum_Full, CarryOut_Half => CarryOut_half1);
        
    CarryOut_Full <= CarryOut_half1 OR CarryOut_half0;

end Behavioral;
