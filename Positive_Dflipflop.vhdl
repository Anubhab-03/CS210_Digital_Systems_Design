--author: Anubhab Chakraborty

library IEEE;
use IEEE.std_logic_1164.all;


entity D_FF is                                
	port( D : in std_logic;       		    
            CLK : in std_logic; 		         
           CLRN : in std_logic;   		    
           PREN : in std_logic;
		Q : buffer std_logic;
		QN : out std_logic);                 
end D_FF;  
	
architecture FUNCTIONALITY of D_FF is
	

begin
	
	process(CLRN,PREN,CLK)
	begin
		
		if CLRN = '0' then
			Q<='0';
		elsif PREN = '0' then 
			Q<='1';
		elsif CLK'event and CLK = '1' then 
			Q<=D;
	
		end if;
	end process;

	QN <= not Q;



end FUNCTIONALITY;