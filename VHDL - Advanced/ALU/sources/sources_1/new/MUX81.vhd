Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;

entity MUX81 is
port(	
        Input1		:	in	std_logic;
		Input2		:	in	std_logic;
		Input3		:	in	std_logic;
		Input4		:	in	std_logic;
		Input5		:	in	std_logic;
		Input6		:	in	std_logic;
		Input7		:	in	std_logic;
		Input8		:	in	std_logic;
		S			:	in	std_logic_vector(2 downto 0);
		Sout		:	out	std_logic);
end MUX81;

architecture Behavioral of MUX81 is

Begin
--MUX81 Logic (using When - ElSE structure)
	Sout <=	Input1 when S="000" else
				Input2 when S="001" else
				Input3 when S="010" else
				Input4 when S="011" else
				Input5 when S="100" else
				Input6 when S = "101" else
				Input7 when S= "110" else
				Input8 when s = "111";


end Behavioral;

