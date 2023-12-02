--author: Anubhab Chakraborty
library ieee;
use ieee.std_logic_1164.all;
use work.cs210.all;
entity xnor2 is
    port (I0,I1 :in std_logic;
          O0: out std_logic);
end xnor2;
architecture Functionality of xnor2 is
signal s0,s1,s2,s3:std_logic;
begin
  U0:NOT1 port map (I0,s0);
  U1:NOT1 port map (I1,s1);
  U2:AND2 port map (s0,s1,s2);
  U3:AND2 port map (I0,I1,s3);
U4:OR2 port map(s2,s3,O0);
end Functionality;