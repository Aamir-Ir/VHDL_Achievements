LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY ALU_16Bit_test IS
END ALU_16Bit_test;
 
ARCHITECTURE behavior OF ALU_16Bit_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT ALU_16Bit
		port(	
			A		:	in		std_logic_vector(15 downto 0);
			B		:	in		std_logic_vector(15 downto 0);
			Cin	:	in		std_logic;
			S		:	in		std_logic_vector(1 downto 0);			
			Sout	:	out	std_logic_vector(15 downto 0);
			Cout	:	out	std_logic
			);
	END COMPONENT;

   --Inputs
   signal A 	: std_logic_vector(15 downto 0) := x"0000";
   signal B 	: std_logic_vector(15 downto 0) := x"0000";
   signal Cin 	: std_logic := '0';
   signal S		: std_logic_vector(1 downto 0);
   
 	--Outputs
   signal Sout	: std_logic_vector(15 downto 0);
   signal Cout	: std_logic;
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_16Bit PORT MAP (
			A		=>	A,
			B		=>	B,
			Cin	=>	Cin,
			S		=> S,
			Sout	=>	Sout,
			Cout	=>	Cout
        );

   -- Stimulus process
   stim_proc: process
   begin		
		A		<=	x"0064";	-- 100
		B		<=	x"00E6";	-- 230
		Cin	<=	'0';
		S		<=	"00";		-- Add
		wait for 100 ns;	

		wait;
   end process;

END;
