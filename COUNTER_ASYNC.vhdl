--author: Anubhab Chakraborty

library ieee;
use ieee.std_logic_1164.all; 

use work.cs210.all;
 
 
entity COUNTER_ASYNC is 

  port(CLK, RSTN : in  std_logic;   -- Clock and reset signal input
        Q2: buffer std_logic_vector(3 downto 0));  -- Output state of the counter

end COUNTER_ASYNC;

 
architecture FUNCTIONALITY of COUNTER_ASYNC is  

    signal Q1 : std_logic_vector(3 downto 0);
    --signal Q2 : std_logic_vector(3 downto 0);
    signal D : std_logic_vector(3 downto 0);
    signal CLK_OUT : std_logic;
begin

   C0: CLK_DVD port map(CLK,RSTN,CLK_OUT);
    D(0)<=Q1(0);
    D(1)<=Q1(1);
    D(2)<=Q1(2);
    D(3)<=Q1(3);
    
    
   E0: D_FF port map(D(0),CLK_OUT ,RSTN,'1',Q2(0),Q1(0));
  
   E1: D_FF port map(D(1),Q1(0),RSTN,'1',Q2(1),Q1(1));
  
   E2: D_FF port map(D(2),Q1(1),RSTN,'1',Q2(2),Q1(2));
   
   E3: D_FF port map(D(3),Q1(2),RSTN,'1',Q2(3),Q1(3)); 
     
   


end FUNCTIONALITY; 