-- Implementation #3
-- Moore Machine using Three processes 
library IEEE;
use IEEE.std_logic_1164.all;

entity state_machine is
port (reset, clk, x: in std_logic;
      z: out std_logic);
end entity state_machine;

architecture behavioral of state_machine is
    type statetype is (state0, state1);
    signal present_state, next_state: statetype:= state0;

begin

output_process: process(present_state) is
begin
   case present_state is               -- depending upon the current state only 
      when state0 =>                   -- set output signals 
         z <= '0';
      when state1 =>
         z <= '1';
   end case; 
end process output_process;

next_state_process: process(present_state,x) is
begin
   case present_state is               -- depending upon the current state and input
      when state0 =>                   -- set next state
         if x = '1' then
            next_state <= state0;
         else
            next_state <= state1;
         end if;
      when state1 =>
         if x = '1' then
            next_state <= state0;
         else
            next_state <= state1;
         end if;
   end case; 
end process next_state_process;

clk_process: process is
begin
    wait until (rising_edge(clk));       -- wait until the rising edge
    if reset = '1' then                  -- check for reset and initialize state
      present_state <= statetype'left;
    else
      present_state <= next_state;
    end if;
end process clk_process;
end architecture behavioral;
