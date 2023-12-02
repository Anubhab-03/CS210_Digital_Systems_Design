--author: Anubhab Chakraborty
library IEEE;
use IEEE.std_logic_1164.all;
use work.CS210.all;

entity FULL_ADDER is
	port(I0, I1, CIN : in std_logic;
	SUM, COUT : out std_logic);
end entity;
	
architecture FUNCTIONALITY of FULL_ADDER is

	component HALF_ADDER is
		port(A,B : in std_logic;
			S, C : out std_logic);
	end component;

signal S0 , C0 , C1 : std_logic;
begin
	HA0 : HALF_ADDER port map(I0, I1 , S0 , C0);
	HA1 : HALF_ADDER port map(S0, CIN, SUM, C1);
	U0 : OR2 port map(C0, C1, COUT);
end FUNCTIONALITY;