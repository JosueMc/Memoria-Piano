library ieee;
use ieee.std_logic_1164.all;

Entity display is
	Port(	w: in std_logic_vector(4 downto 0);
			en: in std_logic;
			Q1,q2: out std_logic_vector(6 downto 0));
end display;


Architecture sol of display is
Signal F,g: std_logic_vector(6 downto 0);
Begin
	With w select
		F<="1111001" when "00001",
			"0100100" when "00010",
			"0110000" when "00011",
			"0011001" when "00100",
			"0010010" when "00101",
			"0000010" when "00110",
			"1111000" when "00111",
			"0000000" when "01000",
			"0010000" when "01001",
			
			"1111001" when "01010",
			"0100100" when "01011",
			"0110000" when "01100",
			"0011001" when "00100",
			"0010010" when "00101",
			"0000010" when "00110",
			"1111000" when "00111",
			"0000000" when "01000",
			"0010000" when "01001",
			
			"1000000" when others;
	Q1<=F when en='1' else "0000000";
end sol;