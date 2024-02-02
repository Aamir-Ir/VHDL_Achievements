
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator_VHDL is
    Port ( A1 : in  STD_LOGIC;
           A0 : in  STD_LOGIC;
           B1 : in  STD_LOGIC;
           B0 : in  STD_LOGIC;
           GT : out  STD_LOGIC;
           EQ : out  STD_LOGIC;
           LT : out  STD_LOGIC);
end comparator_VHDL;

architecture Behavioral of comparator_VHDL is

begin
GT<=((A1 and not B1) or (A0 and not B1 and not B0) or (A1 and A0 and not B0));
EQ<=((not A1 and not A0 and not B1 and not B0) or (not A1 and A0 and not B1 and B0) or(A1 and not A0 and B1 and not B0) or(A1 and A0 and B1 and B0) );
LT<=((B1 and not A1) or (B0 and not A1 and not A0) or (B1 and B0 and not A0));

end Behavioral;