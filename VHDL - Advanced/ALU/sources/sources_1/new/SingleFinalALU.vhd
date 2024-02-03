library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SingleFinalALU is
port(	
		A	:	in	std_logic;
		B	:	in	std_logic;
		Cin	:	in	std_logic;
		S	:	in	std_logic_vector(2 downto 0);
		alu_out:	out std_logic;
		Cout:	out	std_logic;
		OVF : out std_logic;
		zero : out std_logic
);
end SingleFinalALU;

architecture Behavioral of SingleFinalALU is
    COMPONENT full_adder
	port(	
		A	:	in	std_logic;
		B	:	in	std_logic;
		Cin	:	in	std_logic;
		Sout	:	out std_logic;
		Cout:	out	std_logic
		);
    END COMPONENT;
	component beq is
    port(	
            In1		:	in	std_logic;
            In2		:	in	std_logic;
            Sout	:	out	std_logic
    );
    End component;
	component MUX81
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
		Sout		:	out	std_logic
		);
	end component;
	
	component and_gate
	port(	
		In1		:	in	std_logic;
		In2		:	in	std_logic;
		Sout	:	out	std_logic
		);
	end component;
	component slt	
	port(	
		In1		:	in	std_logic;
		In2		:	in	std_logic;
		Sout	:	out	std_logic
    );
    end component;
	component or_gate
	port(	
		In1		:	in	std_logic;
		In2		:	in	std_logic;
		Sout	:	out	std_logic
		);
	end component;
	component xor_gate
	port(	
		In1		:	in	std_logic;
		In2		:	in	std_logic;
		Sout	:	out	std_logic
		);
	end component;
	component signed_adder
	port (
	   	A	:	in	std_logic;
		B	:	in	std_logic;
		Cin	:	in	std_logic;
		Sout	:	out std_logic;
		Cout:	out	std_logic;
		OVF : out std_logic
	);
	end component;
	
--Signals Defination
	signal Sout_full_adder	:	std_logic;
	signal Sout_signed_adder : std_logic;
	signal Sout_or_gate		:	std_logic;
	signal Sout_and_gate		:	std_logic;
	signal Sout_xor_gate   : std_logic;
	signal Sout_slt: std_logic;
	signal Sout_beq : std_logic;
	signal NB					:	std_logic;
Begin

	NB <= B xor S(0);
	
	C1:full_adder	port map(
		A		=>	A,
		B		=>	B,
		Cin	=>	Cin,
		Sout	=>	Sout_full_adder,
		Cout	=>	Cout
	);

	C2:and_gate	port map(
		In1	=>	A,
		In2	=> B,
		Sout	=> Sout_and_gate
	);
	
	C3:or_gate		port map(
		In1	=>	A,
		In2	=>	B,
		Sout	=>	Sout_or_gate
	);
	
	C4:MUX81		port map(
		Input1	=>	Sout_and_gate,
		Input2	=>	Sout_or_gate,
		Input3	=>	Sout_full_adder,
		Input4 =>   Sout_xor_gate,
		Input5 =>  Sout_signed_adder,
		Input6 =>   Sout_signed_adder,
		Input7 =>   Sout_slt,
		Input8 => Sout_beq,
		S			=>	S,
		Sout		=>	alu_out
	);
    C5 : xor_gate port map(
		In1	=>	A,
		In2	=>	B,
		Sout	=>	Sout_xor_gate
	);
	C6 : slt port map(
		In1	=>	A,
		In2	=>	B,
		Sout	=>	Sout_slt
	);
	C7 : beq port map(
		In1	=>	A,
		In2	=>	B,
		Sout	=>	Sout_beq
	);
	C8 : signed_adder port map
	(
		A		=>	A,
		B		=>	NB,
		Cin	=>	Cin,
		Sout	=>	Sout_full_adder,
		Cout	=>	Cout,
	    OVF => OVF
	);
	zero <= Sout_beq;
end Behavioral;
