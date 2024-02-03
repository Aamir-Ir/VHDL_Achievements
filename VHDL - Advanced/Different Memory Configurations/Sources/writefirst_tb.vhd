library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity writefirst_tb is
end writefirst_tb;

architecture Behavioral of writefirst_tb is

COMPONENT writefirst
    generic ( Dwidth : integer := 16; -- Each location is 16 bits
              Awidth : integer := 8); -- 8 Address lines (i.e., 64 locations)
    port ( we,clk: in std_logic;
           addr: in std_logic_vector(Awidth-1 downto 0);
           din: in std_logic_vector(Dwidth-1 downto 0);
           dout: out std_logic_vector(Dwidth-1 downto 0) );
END COMPONENT;

signal we : std_logic := '0';
signal clk :std_logic := '0';
signal addr: std_logic_vector(7 downto 0);
signal din: std_logic_vector(15 downto 0);
signal dout: std_logic_vector(15 downto 0);

begin

uut : writefirst 
    generic map(16,8)
    port map(
    we => we,
    clk => clk,
    addr => addr,
    din => din,
    dout => dout
    );
stim_proc : process
begin

clk<='0';
we <= '0';
din <="0000000000000000";
addr <="00000000";

wait for 100 ns;

clk<='1';
we <= '0';
din <="0000000000000000";
addr <="00000001";

wait for 100 ns;

clk<='0';

wait for 100 ns;

clk<='1';
we <= '1';
din <="0000000000000100";
addr <="00000001";

wait for 100 ns;

clk<='0';

wait for 100 ns;

clk<='1';
we <= '1';
din <="0000000000001000";
addr <="00000010";

wait for 100 ns;

clk<='0';

wait for 100 ns;

clk<='1';
we <= '0';
din <="0000000000000000";
addr <="00000001";



wait;

end process;
end Behavioral;
