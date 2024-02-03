library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity regfile_tb is
end regfile_tb;

architecture Behavioral of regfile_tb is
 component regfile
      generic (
      Dwidth : integer := 16;
      Awidth : integer := 4);
     
      port (
      ReadA1, ReadA2, WriteA : in std_logic_vector (Awidth-1 downto 0);
      Data01, Data02 : out std_logic_vector (Dwidth-1 downto 0);
      DataIn : in std_logic_vector (Dwidth-1 downto 0);
      WE,CLK : in std_logic);
  end component;
 
      signal ReadA1, ReadA2, WriteA : std_logic_vector (3 downto 0);
      signal Data01, Data02 : std_logic_vector (15 downto 0);
      signal DataIn : std_logic_vector (15 downto 0);
      signal WE,CLK : std_logic;
  
  
begin

uut : regfile 
    generic map(16,4)
    port map(
    WE => WE,
    CLK => CLK,
    DataIn => DataIn,
    ReadA1 => ReadA1,
    ReadA2 => ReadA2,
    WriteA => WriteA,
    Data01 => Data01,
    Data02 => Data02
    );
stim_proc : process
begin

CLK<='0';
WE <= '0';
DataIn <="0000000000000000";
ReadA1 <="0000";
ReadA2 <="0000";
WriteA <="0000";

wait for 100 ns;

CLK<='1';

wait for 100 ns;

CLK<='0';

wait for 100 ns;

ReadA1 <= "0001";
ReadA2 <= "0010";
CLK<='1';

wait for 100 ns;

CLK<='0';

wait for 100 ns;

WE<='1';
DataIn <= "0000000000001000";
WriteA<= "0001";
CLK <='1';

wait for 100 ns;

CLK<='0';

wait for 100 ns;

WE<='0';
CLK<='1';



wait;
end process;
end Behavioral;
