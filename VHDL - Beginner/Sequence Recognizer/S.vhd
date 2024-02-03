-- (Moore Machine of Sequence Recognizer)
library IEEE;
use IEEE.std_logic_1164.all;
entity SeqRec_Moore is
port (reset, clk, w: in std_logic;
z: out std_logic);
end entity SeqRec_Moore;
architecture behavioral of SeqRec_Moore is
type statetype is (A, B,C); -- define new type
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
next_state_process: process( present_state, w) is
begin
case present_state is -- depending upon current state
when A => -- set next state
if w = '0' then
next_state <= A;
else
next_state <= B;
end if;
when B =>
if w = '0' then
next_state <= A;
else
next_state <= C;
end if;
when C =>
if w = '0' then
next_state <= A;
else
next_state <= C;
end case;
end process next_state_process;
output_process: process( present_state) is
begin
case present_state is -- depending upon current state
when A => -- set output signals
z<= '0';
when B =>
z<= '0';
when C =>
z<= '1';
end case;
end process output_process;
End architecture behavioral,

