--author: Anubhab Chakraborty
library IEEE;
use IEEE.std_logic_1164.all;
use work.CS210.all;

entity DEMUX_1X2 is
	port(I0,s0 : in std_logic;
	 O0,O1: out std_logic);
end DEMUX_1X2;
	
architecture FUNCTIONALITY of DEMUX_1X2 is
	
signal t1:std_logic; 
begin
	U0 : NOT1 port map( S0, t1);
	U1 : AND2 port map(I0,t1,O0);
	U2 : AND2 port map(I0,S0,O1);
end FUNCTIONALITY;