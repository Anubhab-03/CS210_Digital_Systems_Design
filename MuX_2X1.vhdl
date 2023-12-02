--author: Anubhab Chakraborty
library IEEE;
use IEEE.std_logic_1164.all;
use work.CS210.all;

entity MUX_2X1 is
	port(I0, I1,s0 : in std_logic;
	 O0: out std_logic);
end entity;
	
architecture FUNCTIONALITY of MUX_2X1 is
	
signal s1,s2,s3:std_logic; 
begin
	U0 : NOT1 port map( S0, S1);
	U1 : AND2 port map(I0,S1,S2);
	U2 : AND2 port map(I1,S0,S3);
	U3 : OR2 port map(s2,s3,O0);
end FUNCTIONALITY;