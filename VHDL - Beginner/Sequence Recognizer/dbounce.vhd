library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dbounce is
    Port ( push_bt : in  STD_LOGIC;
           cclk : in  STD_LOGIC;
           debounce_out : out  STD_LOGIC);
end dbounce;

architecture Behavioral of dbounce is
signal d1, d2, reset, cout : std_logic;
signal count : std_logic_vector(20 downto 0);
begin

reset <= d1 xor d2;

FF: process(cclk)
begin
if(cclk'event and cclk = '1') then
d1 <= push_bt;
d2 <= d1;
if(cout = '1') then
debounce_out <= d2;
end if;
end if;
end process;

CNTR: process(cclk, reset)
begin
if(reset='1') then
count <= (others=>'0');
elsif (cclk'event and cclk='1') then
if (cout = '0') then
count <= count + 1;
end if;
end if;
end process;

cout <= count(20);

end Behavioral;
