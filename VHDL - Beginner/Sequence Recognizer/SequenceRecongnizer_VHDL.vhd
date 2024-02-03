library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity SequenceRecongnizer_VHDL is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           X : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end SequenceRecongnizer_VHDL;

architecture Structural of SequenceRecongnizer_VHDL is
	type statetype is (A,B,C,D,E);
	signal present_state, next_state: statetype;
	
Begin

clk_process: process( reset, clk)
begin
	if reset = '1' then -- Check for reset and initialize state
		present_state <= A;
	Elsif (rising_edge(clk)) then -- wait until the rising edge
		present_state <= next_state;
	end if;
end process clk_process;


next_state_process: process( present_state, X) is
begin
	case present_state is -- depending upon current state
	when A => -- set next state
		if X = '0' then
			next_state <= A;
		else
			next_state <= B;
	end if;
		when B =>
			if X = '0' then
				next_state <= A;
			else
				next_state <= C;
	end if;
		when C =>
			if X = '0' then
				next_state <= D;
			else
				next_state <= C;
	end if;
		when D =>
			if X = '0' then
				next_state <= A;
			else
				next_state <= E;
	end if;
		when E =>
			if X = '0' then
				next_state <= A;
			else
				next_state <= C;
	end if;
	end case;
end process next_state_process;


output_process: process( present_state) is
begin
		case present_state is -- depending upon current state
		when A => -- set output signals
			Y<= '0';
		when B =>
			Y<= '0';
		when C =>
			Y<= '0';
		when D =>
			Y<= '0';
		when E =>
			Y<= '1';
		end case;
end process output_process;




end Structural;

