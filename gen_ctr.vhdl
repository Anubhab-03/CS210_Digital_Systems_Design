library ieee;
use ieee.std_logic_1164.all; 

use work.cs210.all;




entity COUNTER_SYNC is -- Entity declaration
	port(CLK : in std_logic; -- Clock input of the counter
          RSTN : in std_logic; -- Active low reset input of the counter
          UP_DN : in std_logic; -- Count up if UP_DN is high, down if low
          LDN : in std_logic; -- Load D to the counter if LDN is low
          E : in std_logic; -- Count if E is high, retain otherwise
          D : in std_logic; -- Count to load when LDN is low
	
          Q : inout std_logic); -- Output state of the counter
end COUNTER_SYNC;



architecture FUNCTIONALITY of COUNTER_SYNC is

	signal CLK_OUT : std_logic;


begin

	C0: CLK_DVD port map(CLK,RSTN,CLK_OUT);
	C1: NOT1 port map(Q,Q');

	U0: MuX_2X1 port map(Q',Q,UP_DN,S(0));
	U1: XOR2 port map(E,Q,S(1));
	U2: MuX_2X1 port map(D,S(1),LDN,S(2));
	U3: MuX_2X1 port map(R,S(2),RSTN,S(3));
	U4: D_FF port map(S(3),CLK_OUT,'1','1',Q,Q');