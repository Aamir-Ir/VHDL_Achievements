library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity topmod is
    Port ( clk_topmod : in  STD_LOGIC;
				reset_topmod : in  STD_LOGIC;
           topmod_out : out  STD_LOGIC;
           input_topmod : in  STD_LOGIC;
			  btn_in : in  STD_LOGIC);
end topmod;

architecture Behavioral of topmod is
	component dbounce is
		Port ( push_bt : in  STD_LOGIC;
           cclk : in  STD_LOGIC;
           debounce_out : out  STD_LOGIC);
	end component dbounce;

	component SequenceRecongnizer_VHDL is
		Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           X : in  STD_LOGIC;
           Y : out  STD_LOGIC);
	end component SequenceRecongnizer_VHDL;

signal tmp_clk : std_logic;

begin

dbounce_SR : dbounce
	port map(btn_in, clk_topmod, tmp_clk);

SR : SequenceRecongnizer_VHDL
	port map(tmp_clk, reset_topmod, input_topmod, topmod_out);

end Behavioral;

