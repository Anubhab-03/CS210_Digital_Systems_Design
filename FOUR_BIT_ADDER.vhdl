-- Author: Anubhab Chakraborty

library IEEE;
use IEEE.std_logic_1164.all;
use work.CS210.all;

entity FOUR_BIT_ADDER is
	port(A, B: in std_logic_vector(3 downto 0);
		carry: in std_logic;
		S: out std_logic_vector(4 downto 0));

end entity;

architecture FUNCTIONALITY of FOUR_BIT_ADDER is

signal S0, S1, S2: std_logic;

begin

	U0: FULL_ADDER port map(A(0), B(0), carry, S(0), S0);
	U1: FULL_ADDER port map(A(1), B(1), S0, S(1), S1);
	U2: FULL_ADDER port map(A(2), B(2), S1, S(2), S2);
	U3: FULL_ADDER port map(A(3), B(3), S2, S(3), S(4));

end FUNCTIONALITY;


	
