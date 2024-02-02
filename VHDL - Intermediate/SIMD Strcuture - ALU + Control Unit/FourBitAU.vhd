----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/19/2023 11:28:23 AM
-- Design Name: 
-- Module Name: FourBitAU - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FourBitAU is

    generic (N_BITS : integer := 4);
    
    Port ( A_FBAU : in STD_LOGIC_VECTOR (N_BITS-1 downto 0);
           B_FBAU : in STD_LOGIC_VECTOR (N_BITS-1 downto 0);
           Cin_FBAU : in STD_LOGIC;
           G_FBAU : out STD_LOGIC_VECTOR (N_BITS-1 downto 0);
           Cout_FBAU : out STD_LOGIC;
           S0_FBAU : in STD_LOGIC;
           S1_FBAU : in STD_LOGIC);
end FourBitAU;

architecture Behavioral of FourBitAU is

component OneBitAU is
    Port ( Ain_AU : in STD_LOGIC;
           Bin_AU : in STD_LOGIC;
           Cin_AU : in STD_LOGIC;
           SCin_AU : in STD_LOGIC;
           S1_AU : in STD_LOGIC;
           S0_AU : in STD_LOGIC;
           G_AU : out STD_LOGIC;
           Cout_AU : out STD_LOGIC);
end component;

signal SCin_FBAU : STD_LOGIC;
signal Carry : STD_LOGIC_VECTOR(N_BITS downto 0) := (others => '0'); --Set

begin
    SCin_FBAU <= Cin_FBAU;
    Carry(0) <= Cin_FBAU;
    make_each_AU: for i in 0 to N_BITS-1 generate            -- Loop through each 1 bit AU and port everything.
        signal CarryOut_i : STD_LOGIC;                       -- This will catch each output of every carry out for each 1 bit AU.
    begin
        OneBitAU_inst : OneBitAU                           -- hierarchy for One Bit AU + port (Make sure to look at the circuit and understand each ports.)
            port map (
                Ain_AU => A_FBAU(i),                          -- A(N) passed. Done For all 4 bits of operand 1
                Bin_AU => B_FBAU(i),                          -- B(N) passed. Done For all 4 bits of operand 2
                Cin_AU => Carry(i),                         -- Previous Carry in passed in from the update or Cin_FBAU initally.
                SCin_AU => SCin_FBAU,
                S0_AU => S0_FBAU,                      	    -- Selects never iterate for the One bit AU's.
                S1_AU => S1_FBAU,
                G_AU => G_FBAU(i), 			    -- G_AU(N) recives output of AU
                Cout_AU => CarryOut_i                  -- CarryOut_i updated and used a temp for carry vector.
            );
            Carry(i+1) <= CarryOut_i;         
     end generate make_each_AU;
     
     Cout_FBAU <= Carry(4);

end Behavioral;
