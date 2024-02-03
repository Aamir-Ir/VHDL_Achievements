library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned;
use IEEE.NUMERIC_STD.ALL;

entity FinalALU is
generic (Dwidth : integer :=8);
 Port (
    IN1, IN2 : in std_logic_vector (Dwidth-1 downto 0);
    SEL : in std_logic_vector (2 downto 0);
    Cin : in std_logic;
    ALU_OUT : out std_logic_vector(Dwidth-1 downto 0);
    Zero, OVF : out std_logic
  );
end FinalALU;

architecture Behavioral of FinalALU is
component SingleFinalALU is
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
end component;
signal equal : std_logic_vector (Dwidth-1 downto 0);
signal carry : std_logic_vector (Dwidth-1 downto 0);
signal overflow : std_logic_vector (Dwidth-1 downto 0);
begin
alu01	:	SingleFinalALU	port map(IN1(0),		IN2(0),		SEL(0),			    SEL ,	ALU_OUT(0),		carry(0), overflow (0),equal(0));
alu02	:	SingleFinalALU	port map(IN1(1),		IN2(1),		carry(0),			SEL ,	ALU_OUT(1),		carry(1), overflow (1),equal(1));
alu03	:	SingleFinalALU	port map(IN1(2),		IN2(2),		carry(1),			SEL ,	ALU_OUT(2),		carry(2), overflow (2),equal(2));
alu04	:	SingleFinalALU	port map(IN1(3),		IN2(3),		carry(2),			SEL ,	ALU_OUT(3),		carry(3), overflow (3),equal(3));
alu05	:	SingleFinalALU	port map(IN1(4),		IN2(4),		carry(3),			SEL ,	ALU_OUT(4),		carry(4), overflow (4),equal(4));
alu06	:	SingleFinalALU	port map(IN1(5),		IN2(5),		carry(4),			SEL ,	ALU_OUT(5),		carry(5), overflow (5),equal(5));
alu07	:	SingleFinalALU	port map(IN1(6),		IN2(6),		carry(5),			SEL ,	ALU_OUT(6),		carry(6), overflow (6),equal(6));
alu08	:	SingleFinalALU	port map(IN1(7),		IN2(7),		carry(6),			SEL ,	ALU_OUT(7),		carry(7), overflow (7),equal(7));
OVF <= overflow(7);
Zero <= equal(0) and equal(1) and equal(2) and equal(3) and equal(4) and equal(5) and equal(6) AND equal(7);

end Behavioral;
