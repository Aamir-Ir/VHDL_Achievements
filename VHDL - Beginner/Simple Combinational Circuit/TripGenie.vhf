library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity TripGenie is
   port ( Hooterville : in    std_logic; 
          Mayberry    : in    std_logic; 
          MtPilot     : in    std_logic; 
          SilverCity  : in    std_logic; 
          HWY1        : out   std_logic; 
          HWY2        : out   std_logic; 
          HWY3        : out   std_logic; 
          HWY4        : out   std_logic; 
          HWY5        : out   std_logic; 
          HWY6        : out   std_logic);
end TripGenie;

architecture BEHAVIORAL of TripGenie is
   attribute BOX_TYPE   : string ;
   signal XLXN_52     : std_logic;
   signal XLXN_53     : std_logic;
   signal XLXN_54     : std_logic;
   signal XLXN_55     : std_logic;
   signal XLXN_56     : std_logic;
   signal XLXN_57     : std_logic;
   signal XLXN_58     : std_logic;
   signal XLXN_60     : std_logic;
   signal XLXN_64     : std_logic;
   signal XLXN_67     : std_logic;
   signal XLXN_71     : std_logic;
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component OR3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3 : component is "BLACK_BOX";
   
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
begin
   HWY4 <= '0';
   HWY5 <= '0';
   XLXI_18 : OR2
      port map (I0=>XLXN_53,
                I1=>XLXN_52,
                O=>HWY3);
   
   XLXI_19 : OR2
      port map (I0=>XLXN_55,
                I1=>XLXN_54,
                O=>HWY2);
   
   XLXI_20 : OR3
      port map (I0=>XLXN_56,
                I1=>XLXN_57,
                I2=>XLXN_58,
                O=>HWY1);
   
   XLXI_24 : AND4
      port map (I0=>SilverCity,
                I1=>XLXN_67,
                I2=>Mayberry,
                I3=>XLXN_60,
                O=>XLXN_52);
   
   XLXI_25 : AND4
      port map (I0=>SilverCity,
                I1=>XLXN_67,
                I2=>XLXN_64,
                I3=>Hooterville,
                O=>XLXN_53);
   
   XLXI_26 : AND4
      port map (I0=>SilverCity,
                I1=>XLXN_67,
                I2=>Mayberry,
                I3=>XLXN_60,
                O=>XLXN_58);
   
   XLXI_27 : AND4
      port map (I0=>XLXN_71,
                I1=>MtPilot,
                I2=>Mayberry,
                I3=>XLXN_60,
                O=>XLXN_57);
   
   XLXI_28 : AND4
      port map (I0=>XLXN_71,
                I1=>XLXN_67,
                I2=>Mayberry,
                I3=>Hooterville,
                O=>XLXN_56);
   
   XLXI_29 : AND4
      port map (I0=>XLXN_71,
                I1=>MtPilot,
                I2=>Mayberry,
                I3=>XLXN_60,
                O=>XLXN_54);
   
   XLXI_30 : AND4
      port map (I0=>XLXN_71,
                I1=>MtPilot,
                I2=>XLXN_64,
                I3=>Hooterville,
                O=>XLXN_55);
   
   XLXI_31 : AND4
      port map (I0=>SilverCity,
                I1=>MtPilot,
                I2=>XLXN_64,
                I3=>XLXN_60,
                O=>HWY6);
   
   XLXI_35 : INV
      port map (I=>Hooterville,
                O=>XLXN_60);
   
   XLXI_36 : INV
      port map (I=>Mayberry,
                O=>XLXN_64);
   
   XLXI_37 : INV
      port map (I=>MtPilot,
                O=>XLXN_67);
   
   XLXI_38 : INV
      port map (I=>SilverCity,
                O=>XLXN_71);
   
end BEHAVIORAL;


