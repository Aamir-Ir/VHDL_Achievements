----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/28/2023 04:35:41 PM
-- Design Name: 
-- Module Name: RegFile2 - Behavioral
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

entity RegFile2 is
    generic (
        Dwidth : integer := 4;
        Awidth : integer := 4
    );
    
    Port ( 
        ReadA : IN std_logic_vector(Awidth-1 downto 0);
        DataOut : OUT std_logic_vector(Dwidth-1 downto 0);
        CLK : in std_logic
    );
end RegFile2;

architecture Behavioral of RegFile2 is
type memType is array(0 to 2**Awidth-1) of std_logic_vector(Dwidth-1 downto 0);

-- The first 8 locations are initialized, the rest set to 0.

signal memory: memType := (
    "1100",  -- "0000"
    "1011",  -- "0001"
    "1010",  -- "0010"
    "1001",  -- "0011"
    "1000",  -- "0100"
    "0111",  -- "0101"
    "1101",  -- "0110"
    "0101",  -- "0111"
    "0100",  -- "1000"
    "0011",  -- "1001"
    "0010",  -- "1010"
    "0001",  -- "1011"
    "0000",  -- "1100"
    others => "0000");
begin
    process(CLK)
    begin
    
    if (clk'event and clk = '1') then
        DataOut <= memory(conv_integer(ReadA));
    end if;
    
    end process;
end Behavioral;
