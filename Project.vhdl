--Author : Anubhab Chakraborty

library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;

entity SSD_DISPLAY is
	port(CLK_IN : in std_logic; -- Input clock
           RSTN : in std_logic; -- Active low reset
		UP_DN : in std_logic;
		STOP : in std_logic;
		Q : out std_logic_vector(6 downto 0)); 
end entity;


architecture FUNCTIONALITY of SSD_DISPLAY is

signal temp: std_logic_vector(3 downto 0); -- temp variable to store the bcd output of counter
signal F: std_logic;                       --variable for invalid bit while converting bcd to ssd
signal D: std_logic_vector(3 downto 0);    --variable which stores the load input   


begin

	D(0)<='0';
	D(1)<='0';
	D(2)<='0';
	D(3)<='0';

	U0: COUNTER_SYNC port map(CLK_IN,RSTN,UP_DN,'1',STOP,D,temp);
	U1: BCD2SSD port map(temp,Q,F);
	
end architecture;