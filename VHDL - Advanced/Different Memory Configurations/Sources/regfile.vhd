library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity regfile is
    generic (
    Dwidth : integer := 16;
    Awidth : integer :=4);
    port (
    ReadA1, ReadA2, WriteA : in std_logic_vector (Awidth-1 downto 0);
    Data01, Data02 : out std_logic_vector (Dwidth-1 downto 0);
    DataIn : in std_logic_vector (Dwidth-1 downto 0);
    WE,CLK : in std_logic);
end regfile;

architecture Behavioral of regfile is
    type registerFile is array(0 to 2**Awidth-1) of std_logic_vector(Dwidth-1 downto 0);
    signal memory: registerFile:= ( "0000000000000001",
                           "0000000000000010",
                           "0000000000000100",
                           "0000000000001000",
                           "0000000000010000",
                           "0000000000100000",
                           "0000000001000000",
                           "0000000010000000",
                        others=> "0000000000000000" ); 

attribute ram_style: string;
attribute ram_style of memory : signal is "block";
begin
regFile : process (clk) is
begin

    if rising_edge(clk) then
      Data01 <= memory(conv_integer(unsigned(ReadA1)));
      Data02 <= memory(conv_integer(unsigned(ReadA2)));
      if WE = '1' then
        memory(conv_integer(unsigned(WriteA))) <= DataIn; 
        if ReadA1 = WriteA then
          Data01 <= DataIn;
        end if;
        if ReadA2 = WriteA then
          Data02 <= DataIn;
        end if;
      end if;
    end if;
  end process;
end behavioral;
