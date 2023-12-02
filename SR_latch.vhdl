--author: Anubhab Chakraborty

library IEEE;
use IEEE.std_logic_1164.all;


entity SR_LATCH is                               
	port( S: in std_logic;    --set signal   		    
            R : in std_logic;   --reset signal		          
           Q : buffer std_logic;   		   
           QN : out std_logic); --ouput signal                
end SR_LATCH;  
	
architecture FUNCTIONALITY of SR_LATCH is
	

begin
	
	process(Q,S,R)
	begin
		
		if S = '0' and R = '0' then
			Q<='1';
		elsif S = '0' and R = '1' then
			Q<='0';
		elsif S = '1' and R = '0' then  
			Q<='1';
		else
			Q<=Q;
		end if;
	end process;

	QN <= not Q;



end FUNCTIONALITY;