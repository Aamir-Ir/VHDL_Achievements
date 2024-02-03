library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity memoryimplementation is
    Port ( address : in STD_LOGIC_VECTOR (7 downto 0);
            clock : in STD_LOGIC;
           ssd : out STD_LOGIC_VECTOR (6 downto 0);
           n1,n2,n3,n4,n5,n6,n7 : out STD_LOGIC
            );
end memoryimplementation;
architecture Behavioral of memoryimplementation is

COMPONENT writefirst
    generic ( Dwidth : integer := 16; -- Each location is 16 bits
              Awidth : integer := 8); -- 8 Address lines (i.e., 64 locations)
    port ( we,clk: in std_logic;
           addr: in std_logic_vector(Awidth-1 downto 0);
           din: in std_logic_vector(Dwidth-1 downto 0);
           dout: out std_logic_vector(Dwidth-1 downto 0) );
END COMPONENT;
signal input : std_logic_vector (15 downto 0);
signal output : std_logic_vector (15 downto 0);
begin

mymem : writefirst
    generic map(16,8)
    port map(
    we => '0',
    clk => clock,
    addr => address,
    din => input,
    dout => output
    );
    
n1<='1';
n2<='1';
n3<='1';
n4<='1';
n5<='1';
n6<='1';
n7<='1';


ssd <= "1000000" when output="0000000000000000" else ---0
"1111001" when output="0000000000000001" else ---1
"0100100" when output="0000000000000010" else ---2
"0011001" when output="0000000000000100" else ---4
"0000000" when output="0000000000001000" else ---8
"1111111";

end Behavioral;
