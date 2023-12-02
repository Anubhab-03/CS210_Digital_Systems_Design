--author:Anubhab Chakraborty
library ieee; 
use ieee.std_logic_1164.all;
entity NOT1 is 
 port( I0: in std_logic; 
 O0 : out std_logic); 
end NOT1;
architecture FUNCTIONALITY of NOT1 is 
begin
 O0 <= not I0; 
 end FUNCTIONALITY;