-- Author : Anubhab Chakraborty

library IEEE;
use IEEE.std_logic_1164.all;
use work.CS210.all;

entity VALID_BCD is
	port (A : in std_logic_vector(3 downto 0);
		O : out std_logic);

end VALID_BCD;

architecture func of VALID_BCD is

signal A3_N, A1_N, A0_N, X0,AA0, AA1, AN0, AN1,AOR: std_logic;

begin 
	A0 : NOT1 port map (A(0),A0_N);
	A1 : NOT1 port map (A(1),A1_N);
	A2 : NOT1 port map (A(3),A3_N);

	A3 : XOR2 port map (A(3),A(2),X0);
	
	A4 : AND2 port map(A(3),A(1),AA0);
	A5 : AND2 port map(A3_N, A1_N, AN0);
	A6 : AND2 port map(AA0, A(0), AA1);
	A7 : AND2 port map(AN0, A0_N, AN1);
	
	A8 : OR2 port map(AA1, AN1, AOR);
	A9 : OR2 port map(AOR, X0, O);

end func;