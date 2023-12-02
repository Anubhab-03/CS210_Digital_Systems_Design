--author: Anubhab Chakraborty
library ieee;
use ieee.std_logic_1164.all;
package CS210 is
    component NOT1 is
       port(I0:in std_logic;
            O0:out std_logic);
            end component;
    component OR2 is
       port(I0,I1:in std_logic;
            O0:out std_logic);
            end component;
    component AND2 is
       port(I0,I1:in std_logic;
            O0:out std_logic);
   end component;
    component XOR2 is
	 port(I0,I1:in std_logic;
            O0:out std_logic);
           end component;
    component MuX_2X1 is
	 port(I0,I1,s0:in std_logic;
            O0:out std_logic);
            end component;
   component DEMUX_1X2 is
	 port(I0,s0:in std_logic;
            O0,O1:out std_logic);
    		end component;
   component HALF_ADDER is
	 port( A, B : in std_logic; 
             S, C : out std_logic); 
   		end component;
   component FULL_ADDER is
       port(I0, I1, CIN : in std_logic;
	      SUM, COUT : out std_logic);
		end component;
   component FOUR_BIT_ADDER is
	 port (A: in std_logic_vector(3 downto 0);
       	 B: in std_logic_vector(3 downto 0);
		 carry: in std_logic;
		 S: out std_logic_vector(4 downto 0));
		end component;
   component VALID_BCD is
		port (A : in std_logic_vector(3 downto 0);
			O : out std_logic);

	end component;

   component BCD_ADD_SUB is -- Entity declaration
		port(A, B : in std_logic_vector(3 downto 0);                               -- Input BCD numbers
			A_SBAR : in std_logic;								   -- 1 for addition, 0 for subtraction
            		Y : out std_logic_vector(7 downto 0);                                -- Output XS3 number
            		INVA : out std_logic;                                                           -- Invalid input A 
            		INVB : out std_logic);                                                          -- Invalid input B 
	end component; 
   component CLK_DVD is
	port(CLK_IN : in std_logic; -- Input clock
           RSTN : in std_logic; -- Active low reset
           CLK_OUT : out std_logic); -- Output clock
	end component;

   component D_FF is                                
	port( D : in std_logic;       		    
            CLK : in std_logic; 		         
           CLRN : in std_logic;   		    
           PREN : in std_logic;
		Q : buffer std_logic;
		QN : out std_logic);                 
	end component;  

   component COUNTER_ASYNC is 

  	port(CLK, RSTN : in  std_logic;   -- Clock and reset signal input
        Q : inout std_logic_vector(3 downto 0));  -- Output state of the counter

	end component;
   component BCD2SSD is -- Entity declaration
	port(B : in std_logic_vector(3 downto 0); -- Input BCD number
           Y : out std_logic_vector(6 downto 0); -- Output SSD code
          F : out std_logic); -- Invalid input indicator
   end component;
   component COUNTER_SYNC is 									-- Entity declaration
	port(CLK : in std_logic; 							-- Clock input of the counter
		RSTN : in std_logic; 							-- Active low reset input of the counter
		UP_DN : in std_logic; 							-- Count up if UP_DN is high, down if low
		LDN : in std_logic; 							-- Load D to the counter if LDN is low
 		E : in std_logic; 							-- Count if E is high, retain otherwise
		D : in std_logic_vector(3 downto 0); 				-- Count to load when LDN is low
 		Q : inout std_logic_vector(3 downto 0)); 				-- Output state of the counter

    end component;


	
end CS210;