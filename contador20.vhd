LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY contador20 IS-- sirve para seleccionar la cancion aleatoria
	PORT(clock,enable,reset : IN STD_LOGIC;
		 hold : in STD_LOGIC;
		 Q : buffer STD_LOGIC_VECTOR (4 downto 0);
		 ram : out STD_LOGIC_VECTOR (4 downto 0));
END contador20;

ARCHITECTURE sol OF contador20 IS
BEGIN

	
	PROCESS(clock,reset,hold)
	BEGIN
		if reset='0' then Q<="00000";
		elsif hold='1' then ram<=Q;
  		elsif (clock'event and clock='1') then
			if enable='1' then
				if (Q="10011") then Q<="00000";
				else Q<=Q+1;
				end if;
			end if;
		end if;
	END PROCESS;
END sol;