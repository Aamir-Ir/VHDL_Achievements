----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/29/2023 03:35:40 PM
-- Design Name: 
-- Module Name: dbounce - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dbounce is
    Port ( push_bt : in STD_LOGIC;
           clk : in STD_LOGIC;
           debounce_out : out STD_LOGIC);
end dbounce;

architecture Behavioral of dbounce is
signal d1, d2, reset, cout : std_logic;
signal count : std_logic_vector(20 downto 0);
begin

reset <= d1 xor d2;

FF: process(clk)
begin
    if (clk'event and clk = '1') then
        d1 <= push_bt;
        d2 <= d1;
        if (cout = '1') then
            debounce_out <= d2;
        end if;
    end if;
end process;

CNTR: process(clk, reset)
begin
    if (reset='1') then
        count <= (others => '0');
    elsif (clk'event and clk = '1') then
        if (cout = '0') then
            count <= count + 1;
        end if;
    end if;
end process;

cout <= count(20);

end Behavioral;
