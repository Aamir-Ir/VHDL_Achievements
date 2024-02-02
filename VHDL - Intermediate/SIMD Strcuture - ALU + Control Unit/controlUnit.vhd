----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/28/2023 03:54:27 PM
-- Design Name: 
-- Module Name: controlUnit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity controlUnit is
  Port ( clk : IN STD_LOGIC;
         reset : IN STD_LOGIC;
         stateStop : IN STD_LOGIC;
         SCin_CU : OUT STD_LOGIC;
         S0_CU : OUT STD_LOGIC;
         S1_CU : OUT STD_LOGIC);
end controlUnit;

architecture Behavioral of controlUnit is
    type statetype is (idle_state, A_plus_B, AComp_plus_B, A_minus_1, Acomp, A_minus_B, B_minus_A, A_plus_1, Acomp_plus_1);
    signal present_state, next_state: statetype;
Begin
clk_process: process(reset, clk)
begin
    if reset = '1' then -- Check for reset and initialize state.
        present_state <= idle_state;
    Elsif (rising_edge(clk)) then
        present_state <= next_state;
    end if;
end process clk_process;
                
next_state_process: process(present_state) is
begin
    case present_state is --depending on the current state. Just move to the next operation in line.
    when idle_state => -- set next state.
        if stateStop = '1' then
            next_state <= A_plus_B;
        else
            next_state <= idle_state;
        end if;     
    when A_plus_B => -- set next state.
        if stateStop = '1' then
            next_state <= AComp_plus_B;
        else
            next_state <= A_plus_B;
        end if;
    when AComp_plus_B =>
        if stateStop = '1' then
            next_state <= A_minus_1;
        else
            next_state <= AComp_plus_B;
        end if;
    when A_minus_1 =>
        if stateStop = '1' then
            next_state <= Acomp;
        else
            next_state <= A_minus_1;
        end if;
    when Acomp =>
        if stateStop = '1' then
            next_state <= A_minus_B;
        else
            next_state <= Acomp;
        end if;
    when A_minus_B =>
        if stateStop = '1' then
            next_state <= B_minus_A;
        else
            next_state <= A_minus_B;
        end if;
    when B_minus_A =>
        if stateStop = '1' then
            next_state <= A_plus_1;
        else
            next_state <= B_minus_A;
        end if;
    when A_plus_1 =>
        if stateStop = '1' then
            next_state <= Acomp_plus_1;
        else
            next_state <= A_plus_1;
        end if;
    when Acomp_plus_1 =>
        if stateStop = '1' then
            next_state <= A_plus_B;
        else
            next_state <= Acomp_plus_1;
        end if;
    end case;
end process next_state_process;   

output_process: process(present_state) is
begin
    case present_state is -- depending on the current state set select signals
    when idle_state =>

    when A_plus_B => -- select signals for F = A + B (add).
        SCin_CU <= '0';
        S0_CU <= '0';
        S1_CU <= '0';
    when AComp_plus_B => -- select signals for F = A' + B.
        SCin_CU <= '0';
        S0_CU <= '1';
        S1_CU <= '0';
    when A_minus_1 =>  -- select signals for F = A - 1.
        SCin_CU <= '0';
        S0_CU <= '0';
        S1_CU <= '1';
    when Acomp =>  -- select signals for F = A'.
        SCin_CU <= '0';
        S0_CU <= '1';
        S1_CU <= '1';
    when A_minus_B =>  -- select signals for F = A - B.
        SCin_CU <= '1';
        S0_CU <= '0';
        S1_CU <= '0';
    when B_minus_A =>   -- select signals for F = B - A.
        SCin_CU <= '1';
        S0_CU <= '1';
        S1_CU <= '0';
    when A_plus_1 =>     -- select signals for F = A + 1.
        SCin_CU <= '1';
        S0_CU <= '0';
        S1_CU <= '1';
    when Acomp_plus_1 =>    -- select signals for F = A' + 1.
        SCin_CU <= '1';
        S0_CU <= '1';
        S1_CU <= '1';
    end case;
end process output_process;

end Behavioral;
