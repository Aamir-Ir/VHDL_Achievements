----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/19/2023 10:23:43 AM
-- Design Name: 
-- Module Name: OneBitAU - Behavioral
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

entity OneBitAU is
    Port ( Ain_AU : in STD_LOGIC;
           Bin_AU : in STD_LOGIC;
           Cin_AU : in STD_LOGIC;
           SCin_AU : in STD_LOGIC;
           S1_AU : in STD_LOGIC;
           S0_AU : in STD_LOGIC;
           G_AU : out STD_LOGIC;
           Cout_AU : out STD_LOGIC);
end OneBitAU;

architecture Behavioral of OneBitAU is

    component ArithmeticInputLogicA is
        Port ( S0_AILA : in STD_LOGIC;
               Ain_AILA : in STD_LOGIC;
               Aout_AILA : out STD_LOGIC);
    end component;
    
    component ArithmeticInputLogicB is
        Port ( SCin_AILB : in STD_LOGIC;
               S1_AILB : in STD_LOGIC;
               S0_AILB : in STD_LOGIC;
               Bin_AILB : in STD_LOGIC;
               Bout_AILB : out STD_LOGIC);
    end component;


    component FullAdder is
    Port ( A_Full : in STD_LOGIC;
           B_Full : in STD_LOGIC;
           CarryIn_Full : in STD_LOGIC;
           Sum_Full : out STD_LOGIC;
           CarryOut_Full : out STD_LOGIC);
    end component;

    SIGNAL Apostlogic:STD_LOGIC;
    SIGNAL Bpostlogic:STD_LOGIC;
	
begin
    -- All Logic required for OneBitAU according to my diagram Sir Aamir Irfan's diagram ( I AM HIM )
ALogic:ArithmeticInputLogicA PORT MAP(S0_AILA=>S0_AU, Ain_AILA=>Ain_AU, Aout_AILA=>Apostlogic);
BLogic:ArithmeticInputLogicB PORT MAP(SCin_AILB=>SCin_AU, S1_AILB=>S1_AU, S0_AILB=>S0_AU, Bin_AILB=>Bin_AU, Bout_AILB=>Bpostlogic);
FA1:FullAdder PORT MAP(A_Full => Apostlogic, B_Full => Bpostlogic, CarryIn_Full => Cin_AU, Sum_Full => G_AU,CarryOut_Full => Cout_AU);


end Behavioral;
