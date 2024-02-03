Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;

Entity signed_adder is
port(	
		A	:	in	std_logic;
		B	:	in	std_logic;
		Cin	:	in	std_logic;
		Sout	:	out std_logic;
		Cout:	out	std_logic;
		OVF : out std_logic
);
End;

Architecture behavior of signed_adder is

Begin


	Sout <= A xor B xor Cin;
	Cout <= (A and B) or ((A Xor B) and Cin);
	OVF <= Cin xor ((A and B) or ((A Xor B) and Cin));

	
End;

