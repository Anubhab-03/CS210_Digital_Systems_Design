--author: Anubhab Chakraborty
library IEEE;
use IEEE.std_logic_1164.all;
use work.CS210.all;

entity DEMUX_1X4 is
	port(I0: in std_logic;
	 S: in std_logic_vector(1 downto 0);
	  O:out std_logic_vector(3 downto 0));
end DEMUX_1X4;
	
architecture FUNCTIONALITY of DEMUX_1X4 is
	
signal t1,t2:std_logic; 
begin
	U0 : DEMUX_1X2 port map(I0,S(1),t1,t2);
	U1 : DEMUX_1X2 port map(t1,S(0),O(0),O(1));
	U2 : DEMUX_1X2 port map(t2,S(0),O(2),O(3));
	
end FUNCTIONALITY;