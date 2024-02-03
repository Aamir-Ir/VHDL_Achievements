LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY FinalALU_test IS
END FinalALU_test;
 
ARCHITECTURE behavior OF FinalALU_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT FinalALU
    generic (Dwidth : integer :=8);
     Port (
        IN1, IN2 : in std_logic_vector (Dwidth-1 downto 0);
        SEL : in std_logic_vector (2 downto 0);
        Cin : in std_logic;
        ALU_OUT : out std_logic_vector(Dwidth-1 downto 0);
        Zero, OVF : out std_logic
      );
	END COMPONENT;

   --Inputs
   signal IN1 	: std_logic_vector(7 downto 0) := x"00";
   signal IN2 	: std_logic_vector(7 downto 0) := x"00";
   signal Cin 	: std_logic := '0';
   signal SEL		: std_logic_vector(2 downto 0);
   signal ALU_OUT :  std_logic_vector(7 downto 0);
   signal Zero : std_logic;
   signal OVF : std_logic;

   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FinalALU PORT MAP (
            IN1 => IN1,
            IN2 => IN2,
            SEL => SEL,
            Cin => Cin,
            ALU_OUT => ALU_OUT,
            Zero => Zero,
            OVF => OVF
        );

   -- Stimulus process
   stim_proc: process
   begin		
		IN1		<=	x"04";	-- 4
		IN2		<=	x"06";	-- 6
		Cin	<=	'0';
		SEL		<=	"010";		-- Add
		wait for 100 ns;	
		IN1		<=	x"14";	-- 4
		IN2		<=	x"06";	-- 6
		Cin	<=	'0';
		SEL		<=	"100";		-- subtract
		wait for 100 ns;		
		IN1		<=	x"04";	-- 4
		IN2		<=	x"06";	-- 6
		SEL		<=	"000";		-- and
		wait for 100 ns;
		IN1		<=	x"06";	-- 6
		IN2		<=	x"06";	-- 6
		SEL		<=	"000";		-- and
		wait for 100 ns;	
		IN1		<=	x"04";	-- 4
		IN2		<=	x"06";	-- 6
		SEL		<=	"000";		-- or
		wait for 100 ns;
		IN1		<=	x"06";	-- 6
		IN2		<=	x"06";	-- 6
		SEL		<=	"000";		-- or
		wait for 100 ns;	
		wait;
   end process;

END;
