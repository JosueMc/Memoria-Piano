LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY contador20musical IS-- para el boton de repeticion
	PORT(clock,enable,reset : IN STD_LOGIC;
			salida: out std_logic_vector(6 downto 0);
			q0,q1,q2,q3,q4,q5,q6,q7,q8,q9: in std_logic_vector(6 downto 0);
			termine:out STD_LOGIC;
		 Q : buffer STD_LOGIC_VECTOR (4 downto 0));
END contador20musical;

ARCHITECTURE sol OF contador20musical IS
BEGIN

	
	PROCESS(clock,reset)
	BEGIN
		if reset='0' then Q<="00000";termine<='0';salida<="1111111";
  		elsif (clock'event and clock='1') then
			if enable='1' then
				
				if (Q="00000")then termine<='1';salida<=q0;Q<=Q+1;
				elsif (Q="00001")then salida<=q1;Q<=Q+1;
				elsif (Q="00010")then salida<=q2;Q<=Q+1;
				elsif (Q="00011")then salida<=q3;Q<=Q+1;
				elsif (Q="00100")then salida<=q4;Q<=Q+1;
				elsif (Q="00101")then salida<=q5;Q<=Q+1;
				elsif (Q="00110")then salida<=q6;Q<=Q+1;
				elsif (Q="00111")then salida<=q7;Q<=Q+1;
				elsif (Q="01000")then salida<=q8;Q<=Q+1;
				elsif (Q="01001")then salida<=q9;Q<=Q+1;
				elsif (Q="01010")then salida<="0000000";termine<='0';end if;
			end if;
		end if;
	END PROCESS;
END sol;