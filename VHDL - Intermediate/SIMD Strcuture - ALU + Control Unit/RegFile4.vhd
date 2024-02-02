----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/28/2023 05:36:05 PM
-- Design Name: 
-- Module Name: RegFile4 - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegFile4 is
    generic (
        Dwidth : integer := 4;
        Awidth : integer := 4
    );
    
    Port ( 
        ReadA : IN std_logic_vector(Awidth-1 downto 0);
        DataOut : OUT std_logic_vector(Dwidth-1 downto 0);
        CLK : in std_logic
    );
end RegFile4;

architecture Behavioral of RegFile4 is
type memType is array(0 to 2**Awidth-1) of std_logic_vector(Dwidth-1 downto 0);

-- The first 8 locations are initialized, the rest set to 0.

signal memory: memType := (
    "0000",  -- "0000"
    "0100",  -- "0001"
    "1101",  -- "0010"
    "1111",  -- "0011"
    "1000",  -- "0100"
    "0111",  -- "0101"
    "1111",  -- "0110"
    "1110",  -- "0111"
    "0111",  -- "1000"
    "0101",  -- "1001"
    "1010",  -- "1010"
    "0110",  -- "1011"
    "1111",  -- "1100"
    others => "1001");
begin
    process(CLK)
    begin
    
    if (clk'event and clk = '1') then
        DataOut <= memory(conv_integer(ReadA));
    end if;
    
    end process;


end Behavioral;
