--author : Anubhab Chakraborty
library IEEE;
use IEEE.std_logic_1164.all;
use work.CS210.all;

entity BCD2SSD is -- Entity declaration
	port(B : in std_logic_vector(3 downto 0); -- Input BCD number
           Y : out std_logic_vector(6 downto 0); -- Output SSD code
          F : out std_logic); -- Invalid input indicator
end BCD2SSD;




architecture STRUCTURE of BCD2SSD is

signal S : std_logic_vector(27 downto 0);

begin

	U0: OR2 port map(B(0),B(2),S(0));
	U1: AND2 port map(B(1),B(3),S(1));
	U2: OR2 port map(S(0),S(1),S(2));
	U3: NOT1 port map(B(1),S(3));
	U4: NOT1 port map(B(3),S(4));
	U5: AND2 port map(S(3),S(4),S(5));
	U6: OR2 port map(S(0),S(1),S(6));
	U7: OR2 port map(S(6),S(5),Y(0));

	U8: NOT1 port map(B(2),S(7));
	U9: AND2 port map(S(7),S(4),S(8));
	U10: AND2 port map(B(3),B(2),S(9));
	U11: OR2 port map(S(3),S(8),S(10));
	U12: OR2 port map(S(10),S(9),Y(1));

	U13: OR2 port map(B(1),S(7),S(11));
	U14: OR2 port map(B(3),S(11),Y(2));

	U15: AND2 port map(S(4),S(3),S(12));
	U16: AND2 port map(B(1),S(4),S(13));
	U17: AND2 port map(S(7),B(3),S(14));
	U18: AND2 port map(S(14),B(1),S(15));
	U19: AND2 port map(B(2),B(0),S(16));
	U20: AND2 port map(S(3),S(16),S(17));
	U21: OR2 port map(S(17),S(15),S(18));
	U22: OR2 port map(S(12),S(13),S(19));
	U23: OR2 port map(S(18),S(19),Y(3));

	U24: OR2 port map(S(5),S(13),Y(4));

	U25: OR2 port map(B(0),S(8),S(20));
	U26: AND2 port map(B(1),S(7),S(21));
	U27: AND2 port map(B(1),S(4),S(22));
	U28: OR2 port map(S(20),S(21),S(23));
	U29: OR2 port map(S(23),S(22),Y(5));

	U30: OR2 port map(B(0),S(21),S(24));
	U31: OR2 port map(S(24),S(13),S(25));
	U32: AND2 port map(S(3),B(2),S(26));
	U33: OR2 port map(S(25),S(26),Y(6));

	U34: OR2 port map(B(2),B(1),S(27));
	U35: AND2 port map(B(3),S(27),F);


end STRUCTURE;