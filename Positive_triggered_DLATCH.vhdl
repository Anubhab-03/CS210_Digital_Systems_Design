--author: Anubhab Chakraborty

library IEEE;
use IEEE.std_logic_1164.all;



entity D_LATCH is                               -- Entity declaration 
	port( D : in std_logic;       		   -- Data input of the D latch 
            LTCH : in std_logic; 		         -- Latch input of the D latch 
           Q : buffer std_logic;   		   -- Q output of the D latch 
           QN : out std_logic);                 -- Q_bar output of the D latch 
end D_LATCH;  
	
architecture FUNCTIONALITY of D_LATCH is
	

begin
	
	process(D,LTCH)
	begin
		
		if LTCH = '1' then
			Q<=D;
		end if;
	end process;

	QN <= not Q;



end FUNCTIONALITY;