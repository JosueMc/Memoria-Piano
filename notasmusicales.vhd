LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY notasmusicales IS
    PORT(nota: in STD_LOGIC_VECTOR(6 DOWNTO 0);
			clock1MHz, enable,reset: in STD_LOGIC;
			salida: out STD_LOGIC);
end notasmusicales;
architecture sol of notasmusicales is
signal suma: std_logic_vector(11 downto 0);
signal buf: std_logic;
begin
	PROCESS(clock1MHz,reset)
		BEGIN
		if reset='0' then salida<= '0';suma<="000000000000";buf<='0';
		elsif (clock1MHz'event and clock1MHz='1') then
				if(enable='1') then 
					suma<=suma + 1;
					if (nota="0000001") and (suma="1111011010") and (buf='0')then--subida de do, 986
						salida<='1';buf<='1';suma<="000000000000";
					elsif (nota="0000001") and (suma="1111011010") and (buf='1')then--bajada de do,986--
						salida<='0';buf<='0';suma<="000000000000";
						
					elsif (nota="0000010") and (suma="1101010011") and (buf='0')then--subida de re, 851
						salida<='1';buf<='1';suma<="000000000000";
					elsif (nota="0000010") and (suma="1101010011") and (buf='1')then--bajada de re, 851--
						salida<='0';buf<='0';suma<="000000000000";
					
					elsif (nota="0000100") and (suma="1011110110") and (buf='0')then--subida de mi, 758
						salida<='1';buf<='1';suma<="000000000000";
					elsif (nota="0000100") and (suma="1011110110") and (buf='1')then--bajada de mi, 758--
						salida<='0';buf<='0';suma<="000000000000";
						
					elsif (nota="0001000") and (suma="1011001100") and (buf='0')then--subida de fa, 716
						salida<='1';buf<='1';suma<="000000000000";
					elsif (nota="0001000") and (suma="1011001100") and (buf='1')then--bajada de fa, 716--
						salida<='0';buf<='0';suma<="000000000000";
					
					elsif (nota="0010000") and (suma="1001111110") and (buf='0')then--subida de sol, 638
						salida<='1';buf<='1';suma<="000000000000";
					elsif (nota="0010000") and (suma="1001111110") and (buf='1')then--bajada de sol, 638--
						salida<='0';buf<='0';suma<="000000000000";
						
					elsif (nota="0100000") and (suma="1000111000") and (buf='0')then--subida de la, 568
						salida<='1';buf<='1';suma<="000000000000";
					elsif (nota="0100000") and (suma="1000111000") and (buf='1')then--bajada de la, 568--
						salida<='0';buf<='0';suma<="000000000000";
					
					elsif (nota="1000000") and (suma="0111111010") and (buf='0')then--subida de si, 506
						salida<='1';buf<='1';suma<="000000000000";
					elsif (nota="1000000") and (suma="0111111010") and (buf='1')then--bajada de si, 506--
						salida<='0';buf<='0';suma<="000000000000";end if;
					else salida<='0';
				end if;
		end if;
	end process;
end sol;

					