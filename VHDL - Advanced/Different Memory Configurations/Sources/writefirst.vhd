library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity writefirst is 
    generic ( Dwidth : integer := 16; -- Each location is 16 bits
              Awidth : integer := 8); -- 8 Address lines (i.e., 64 locations)
    port ( we,clk: in std_logic;
           addr: in std_logic_vector(Awidth-1 downto 0);
           din: in std_logic_vector(Dwidth-1 downto 0);
           dout: out std_logic_vector(Dwidth-1 downto 0) );
end writefirst;

architecture Behavioural of writefirst is
type memType is array(0 to 2**Awidth-1) of std_logic_vector(Dwidth-1 downto 0);

-- The first 8 locations are initialized, the rest set to 0.
signal memory: memType:= ( "0000000000000001",
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
    process(clk)
    begin
        if(rising_edge(clk)) then            
            if(we='1') then
                memory(conv_integer(addr)) <= din; 
                dout <= din; 
            else
                dout <= memory(conv_integer(addr)); 
            end if; 
        end if; 
    end process;
end Behavioural;      