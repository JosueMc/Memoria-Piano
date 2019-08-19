library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity selectorclock is--seleciona entrre el valor que se juega o el valor almacenado
	port(jugando,almacenado: in std_logic;
			salida: out  std_logic;
			modo: in std_logic);
end selectorclock;

architecture sol of selectorclock is
begin
		process(modo)
			begin
				if modo='1' then --jugando
					salida<= jugando;
				else salida<=almacenado;end if;--almacenado
		end process;
end sol;
						