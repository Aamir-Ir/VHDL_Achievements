LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CPU_3380_Test IS
END ENTITY CPU_3380_Test;

ARCHITECTURE mixed OF CPU_3380_Test IS
    CONSTANT  tick          : TIME := 100 ns;
    SIGNAL    reset, clock  : STD_LOGIC;
    SIGNAL    instruction   : STD_LOGIC_VECTOR(0 TO 15);

BEGIN
    CPU_3380_Sim : ENTITY work.CPU_3380
        port map(
            clk		      => clock,
            clear	      => reset,
            instruction => instruction
        );

    driver : PROCESS IS
    BEGIN
        -- reset the system
        reset <= '0'; instruction <= x"0000"; WAIT FOR 50 ns;
        reset <= '1';

        -- ADD r2, r1, r1
        instruction <= x"0211"; WAIT FOR tick;

        -- ADD r3, r2, r1
        instruction <= x"0321"; WAIT FOR tick;

        -- ADD r4, r3, r2
        instruction <= x"0432"; WAIT FOR tick;

        -- Sub r5, r4, r3
        instruction <= x"1543"; WAIT FOR tick;

        -- Sub r1, r5, r1
        instruction <= x"1151"; WAIT FOR tick;

        -- Sub r0, r3, r0
        instruction <= x"1030"; WAIT FOR tick;

		  -- And r6, r1, r1
        instruction <= x"2611"; WAIT FOR tick;

		  -- And r7, r3, r0
        instruction <= x"2730"; WAIT FOR tick;

 		  -- OR r8, r4, r1
        instruction <= x"3841"; WAIT FOR tick;
        WAIT;
    END PROCESS driver;

    clock_p : PROCESS IS
    BEGIN
        FOR i IN 0 TO 18 LOOP
            clock <= '1'; WAIT FOR  tick/2;
            clock <= '0'; WAIT FOR  tick/2;
        END LOOP;
        WAIT;
    END PROCESS clock_p;
END ARCHITECTURE mixed;
