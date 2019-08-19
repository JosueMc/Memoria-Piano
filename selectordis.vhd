LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY selectordis IS
PORT(p: IN STD_LOGIC_VECTOR (6 downto 0);

		
		salida: out STD_LOGIC_VECTOR (3 downto 0));
END selectordis;

ARCHITECTURE sol OF selectordis IS
		BEGIN
	   PROCESS (p) IS

		begin 
		CASE p IS

			WHEN "0000001" => salida<="1111";
			WHEN "0000010" => salida<="1111";
			WHEN "0000100" => salida<="1111";
			WHEN "0001000" => salida<="1111";
			WHEN "0010000" => salida<="1111";
			WHEN "0100000" => salida<="1111";
			WHEN "1000000" => salida<="1111";
			
			WHEN others => salida<="1111";
		end case;
		end PROCESS;
end sol;
				