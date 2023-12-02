-- Author: Anubhab Chakraborty
library IEEE;
use IEEE.std_logic_1164.all;
use work.CS210.all;

entity BCD_ADD_SUB is -- Entity declaration
	port(A, B : in std_logic_vector(3 downto 0);                               -- Input BCD numbers
		A_SBAR : in std_logic;								   -- 1 for addition, 0 for subtraction
            	Y : out std_logic_vector(7 downto 0);                                -- Output XS3 number
            	INVA : out std_logic;                                                           -- Invalid input A 
            	INVB : out std_logic);                                                          -- Invalid input B 

end BCD_ADD_SUB; 

architecture func of BCD_ADD_SUB is 

signal A_XS3, B_XS3,XS3, B_BIN, A_BIN, B_SUM,XS31 : std_logic_vector(3 downto 0);
signal S1 : std_logic_vector(4 downto 0);

signal T1, T2,T3,T4,T6,T5,T8,T7,T9,T10 : std_logic;
signal A_SBARN , A_VALID, B_VALID ,AB_VALID : std_logic;
signal SUM_ADD,SUM_ADD1, SUM_ADD2, SUM_ADD3, SUM_ADD4,SUM_ADD21, SUM_ADD22, SUM_ADD_21, SUM_ADD_22, VALID_SUM : std_logic_vector(7 downto 0);

begin
	-- Invalid signal check
	V0 : VALID_BCD port map (A, A_VALID);
	V1 : VALID_BCD port map (B, B_VALID);	
	V2 : AND2 port map (A_VALID, B_VALID, AB_VALID);

	-- Storing invalid signals
	INV0 : NOT1 port map (A_VALID, INVA);
	INV1 : NOT1 port map (B_VALID, INVB);
	
	-- XS3 form of A and B
	A_XS3(0) <= not A(0);
	A_XS3(1) <= not A(1);
	A_XS3(2) <= A(2);
	A_XS3(3) <= A(3);
	B_XS3(0) <= not B(0);
	B_XS3(1) <= not B(1);
	B_XS3(2) <= B(2);
	B_XS3(3) <= B(3);
	

	-- 2s complement form of 3
	XS3 <= '1' & '1' & '0' & '1';
	XS31<= '0' & '0' & '1' & '1';

	-- Converting A and B to binary form for subtraction
	FA0 : FOUR_BIT_ADDER port map(B_XS3, XS3, carry => '0', S(3 downto 0) => B_BIN, S(4) => T2);
	FA1 : FOUR_BIT_ADDER port map(A_XS3, XS3, carry => '0', S(3 downto 0) => A_BIN, S(4) => T1);
	
	-- Negation of operation signal
	A_SBARN <= not A_SBAR;

	-- B according to operation 
	P1 : for i in 0 to 3 generate 
	   X0 : XOR2 port map(B_BIN(i), A_SBARN, B_SUM(i));
	end generate;
	
	-- Performing subtraction and converting result to XS3
	FA2 : FOUR_BIT_ADDER port map(A_BIN, B_SUM, carry => A_SBARN, S => S1);
	FA3 : FOUR_BIT_ADDER port map(S1(3 downto 0), XS31 , carry => '0', S(4) => T9, S(3 downto 0) => SUM_ADD1(3 downto 0));
	
	-- default last 4 bits 
	SUM_ADD1(7 downto 4) <= '0' & '0' & '1' & '1';
	



	-- XS3 addition 
	FA4 : FOUR_BIT_ADDER port map (A_XS3, B_XS3, carry => '0', S => SUM_ADD(4 downto 0));
      	
	-- Carry out addition
    	FA5 : FOUR_BIT_ADDER port map(SUM_ADD(3 downto 0), XS31, carry => '0', S(4) =>T3, S(3 downto 0) => SUM_ADD21(3 downto 0));
    	FA6 : FOUR_BIT_ADDER port map(A(0) => '1', A(1) => '0', A(2) => '0', A(3) => '0', B => XS31, carry => '0', S(4) => T4, S(3 downto 0) => SUM_ADD21(7 downto 4));

	-- Checking addition by carry out of first BCD
	P2 : for i in 0 to 7 generate
		SUM_ADD_21(i) <= SUM_ADD(4) and SUM_ADD21(i);
	end generate;


	-- No carry out addition
    	FA7 : FOUR_BIT_ADDER port map (SUM_ADD(3 downto 0), XS3, carry => '0', S(4) => T10, S(3 downto 0) => SUM_ADD22(3 downto 0));
    	SUM_ADD22(7 downto 4) <= '0' & '0' & '1' & '1';
	
	-- Checking addition by carry out of first bit
	P3 : for i in 0 to 7 generate
		SUM_ADD_22(i) <= (not SUM_ADD(4)) and SUM_ADD22(i);
	end generate;
	
	-- Adding both the XS3 conditional answers to get final answer 
	F10 : FOUR_BIT_ADDER port map (SUM_ADD_21(3 downto 0), SUM_ADD_22(3 downto 0), carry => '0', S(4) => T7, S(3 downto 0) => SUM_ADD2(3 downto 0));
	F11 : FOUR_BIT_ADDER port map (SUM_ADD_21(7 downto 4), SUM_ADD_22(7 downto 4), carry => '0', S(4) => T8, S(3 downto 0) => SUM_ADD2(7 downto 4));
    	
	-- Checking the operator and storing results of operations if valid else 0s
	P4 : for i in 0 to 7 generate 
		SUM_ADD3(i) <= A_SBARN and SUM_ADD1(i);
		SUM_ADD4(i) <= A_SBAR and SUM_ADD2(i);
	end generate;

	-- Getting final result
	FA8 : FOUR_BIT_ADDER port map (SUM_ADD3(3 downto 0), SUM_ADD4(3 downto 0), carry => '0', S(4) => T5, S(3 downto 0) => VALID_SUM(3 downto 0));
	FA9 : FOUR_BIT_ADDER port map (SUM_ADD3(7 downto 4), SUM_ADD4(7 downto 4), carry => '0', S(4) => T6, S(3 downto 0) => VALID_SUM(7 downto 4));
	
	
	-- Display 0s for invalid outputs
	P5 : for i in 0 to 7 generate 
		FNL: AND2 port map (VALID_SUM(i), AB_VALID, Y(i));
	end generate;

end func;