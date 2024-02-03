library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

Entity Signextend is
	port(
		immIn		:	in	std_logic_vector( 3 downto 0);
		immOut		:	out	std_logic_vector(15 downto 0)
		);
End Signextend;

architecture syn of Signextend is

begin

	-- TODO 1: Implement the immOut(5) - immOut(15) (HINT: Look at the signal immOut(3))
	immOut(3)	<=	immIn(3);
	immOut(2)	<=	immIn(2);
	immOut(1)	<=	immIn(1);
	immOut(0)	<=	immIn(0);
	process ( immIn)
	begin 
	if (immIn(3) = '1') then
	immOut(15 downto 4) <= "111111111111";
	else
	immOut(15 downto 4) <= "000000000000";
	end if;
	end process;

end syn;
