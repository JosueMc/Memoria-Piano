-- este bloque resta los aciertoss con los errores.
LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY puntaje IS
	PORT(aciertos, errores: IN std_logic_vector(4 downto 0);
			final: out std_logic_vector(4 downto 0));
end puntaje;


ARCHITECTURE sol OF puntaje IS

BEGIN
	process(aciertos, errores) is
		begin
			if aciertos > "00010" then
				final<= aciertos - errores;
			else final<="00000";end if;
	end process;
	
end sol;