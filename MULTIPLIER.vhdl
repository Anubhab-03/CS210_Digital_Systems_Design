--Author : Anubhab Chakraborty

library IEEE;
use IEEE.std_logic_1164.all;
use work.CS210.all;

entity MULTIPLIER is -- Entity declaration
		port(	A1, B1 : in std_logic_vector(3 downto 0); -- Inputs of the multiplier
				P : out std_logic_vector(7 downto 0)); -- Output of the multiplier
end MULTIPLIER;

architecture STRUCTURE of MULTIPLIER is

signal SIG : std_logic_vector(22 downto 0);
signal S0 : std_logic := '0';
begin 

	U0 : AND2 port map ( A1(0), B1(0), P(0));
	U1 : AND2 port map ( A1(1), B1(0), SIG(0));
	U2 : AND2 port map ( A1(2), B1(0), SIG(1));
	U3 : AND2 port map ( A1(3), B1(0), SIG(2));
	U4 : AND2 port map ( A1(0), B1(1), SIG(3));
	U5 : AND2 port map ( A1(1), B1(1), SIG(4));
	U6 : AND2 port map ( A1(2), B1(1), SIG(5));
	U7 : AND2 port map ( A1(3), B1(1), SIG(6));
	U8 : FOUR_BIT_ADDER port map ( A(0)=>SIG(0), A(1)=>SIG(1), A(2)=>SIG(2), A(3)=>S0, B(0)=>SIG(3), B(1)=>SIG(4), B(2)=>SIG(5), B(3)=>SIG(6), carry=>S0, S(0)=>P(1), S(1)=>SIG(7), S(2)=>SIG(8), S(3)=>SIG(9), S(4)=> SIG(10));
	U9 : AND2 port map ( A1(0), B1(2), SIG(11));
	U10 : AND2 port map ( A1(1), B1(2), SIG(12));
	U11 : AND2 port map ( A1(2), B1(2), SIG(13));
	U12 : AND2 port map ( A1(3), B1(2), SIG(14));
	U13 : FOUR_BIT_ADDER port map ( A(0)=>SIG(7), A(1)=>SIG(8), A(2)=>SIG(9), A(3)=>SIG(10), B(0)=>SIG(11), B(1)=>SIG(12), B(2)=>SIG(13), B(3)=>SIG(14), carry=>S0, S(0)=>P(2), S(1)=>SIG(15), S(2)=>SIG(16), S(3)=>SIG(17), S(4)=> SIG(18));
	U14 : AND2 port map ( A1(0), B1(3), SIG(19));
	U15 : AND2 port map ( A1(1), B1(3), SIG(20));
	U16 : AND2 port map ( A1(2), B1(3), SIG(21));
	U17 : AND2 port map ( A1(3), B1(3), SIG(22));
	U18 : FOUR_BIT_ADDER port map ( A(0)=>SIG(15), A(1)=>SIG(16), A(2)=>SIG(17), A(3)=>SIG(18), B(0)=>SIG(19), B(1)=>SIG(20), B(2)=>SIG(21), B(3)=>SIG(22), carry=>S0, S(0)=>P(3), S(1)=>P(4), S(2)=>P(5), S(3)=>P(6), S(4)=> P(7));
	
end STRUCTURE;