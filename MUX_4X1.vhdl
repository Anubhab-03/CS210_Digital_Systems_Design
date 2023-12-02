--author: Anubhab Chakraborty
library IEEE;
use IEEE.std_logic_1164.all;
use work.CS210.all;

entity MUX_4X1 is
	port(I: in std_logic_vector(3 downto 0);
	 S: in std_logic_vector(1 downto 0);
	  O0:out std_logic);
end MUX_4X1;
	
architecture FUNCTIONALITY of MUX_4X1 is
	
signal t1,t2:std_logic; 
begin
	U0 : MuX_2X1 port map(I(0),I(1),S(0),t1);
	U1 : MuX_2X1 port map(I(2),I(3),S(0),t2);
	U2 : MuX_2X1 port map(t1,t2,s(1),O0);
	
end FUNCTIONALITY;