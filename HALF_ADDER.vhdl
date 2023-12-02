--Author: Anubhab Chakraborty
library ieee; -- Library declaration
use ieee.std_logic_1164.all; -- Use std_logic_1164 package from ieee library

entity HALF_ADDER is -- Entity declaration
 port( A, B : in std_logic; 
 S, C : out std_logic); 
end HALF_ADDER;

architecture STRUCTURE of HALF_ADDER is 
	component AND2 is 
		port( I0, I1 : in std_logic; 
		O0 : out std_logic); 
	end component;
	
	component XOR2 is 
		port( I0, I1 : in std_logic; 
		O0 : out std_logic); 
	end component;



begin
	U0: XOR2 port map(A,B,S); 
	U1: AND2 port map(A,B,C);
end STRUCTURE; 
