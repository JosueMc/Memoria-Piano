LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY comparador IS
	PORT(clock,enable,reset: IN STD_LOGIC;
			notain: in STD_LOGIC_VECTOR (6 downto 0);
			n0,n1,n2,n3,n4,n5,n6,n7,n8,n9: in STD_LOGIC_VECTOR (6 downto 0);
			reiniciogano,zz: IN STD_LOGIC;-- ayuda a salir de led_error
		 conteo, aciertos : Buffer STD_LOGIC_VECTOR (4 downto 0);--conteo de errores, cuenta de aciertos
		 
		 led_error,error,gano,fin: out STD_LOGIC);-- error se activa al 3 intento, menos 1 x cada fallo, gano se activa al finalizar la melodia
END comparador;


ARCHITECTURE sol OF comparador IS
signal cuenta,conteofinal,cuentaErrores:STD_LOGIC_VECTOR (4 downto 0);
BEGIN
	PROCESS(clock,reset,reiniciogano,zz)
	BEGIN
		if reset='0' then cuenta<="00000";led_error<='0';fin<='0';conteofinal<="00000";conteo<="00000";aciertos<="00000";error<='0';gano<='0';cuentaErrores<="00000";
  		
		elsif reiniciogano='1' then gano<='0';cuenta<="00000";
		elsif zz='1'then led_error<='0';
		
		elsif (clock'event and clock='1') then
			if enable='1' then
				
				if cuentaErrores="11" then error <='1';
				elsif conteofinal="01010" then fin<='1';--maximo de veces jugadas canciones
			
				elsif (cuenta="00000") then
					if notain = n0 then conteo<=conteo;	
					else conteo<=conteo+1;cuentaErrores<=cuentaErrores+1;led_error<='1';end if;--sumamos un punto si se equivoca
					
				elsif (cuenta="00001") then
					if notain = n1 then conteo<=conteo;
					else cuentaErrores<=cuentaErrores+1;conteo<=conteo+1;led_error<='1';end if;
					
				elsif (cuenta="00010") then
					if notain = n2 then conteo<=conteo;
					else cuentaErrores<=cuentaErrores+1;conteo<=conteo+1;led_error<='1';end if;
				
				elsif (cuenta="00011") then
					if notain = n3 then conteo<=conteo;
					else cuentaErrores<=cuentaErrores+1;conteo<=conteo+1;led_error<='1';end if;
				
				elsif (cuenta="00100") then
					if notain = n4 then conteo<=conteo;
					else cuentaErrores<=cuentaErrores+1;conteo<=conteo+1;led_error<='1';end if;
				
				elsif (cuenta="00101") then
					if notain = n5 then conteo<=conteo;
					else cuentaErrores<=cuentaErrores+1;conteo<=conteo+1;led_error<='1';end if;
					
				elsif (cuenta="00110") then
					if notain = n6 then conteo<=conteo;
					else cuentaErrores<=cuentaErrores+1;conteo<=conteo+1;led_error<='1';end if;
				
				elsif (cuenta="00111") then
					if notain = n7 then conteo<=conteo;
					else cuentaErrores<=cuentaErrores+1;conteo<=conteo+1;led_error<='1';end if;
				
				elsif (cuenta="01000") then
					if notain = n8 then conteo<=conteo;
					else cuentaErrores<=cuentaErrores+1;conteo<=conteo+1;led_error<='1';end if;
					
				elsif (cuenta="01001") then
					if notain = n9 then gano<='1';
					aciertos<=aciertos+"00011";-- sumamos 3 puntos al acabar la cancion
					conteofinal<=conteofinal+"00001";--uno cada vez que acabe una cancion
					cuentaErrores<="00000";

					else cuentaErrores<=cuentaErrores+1;conteo<=conteo+1;led_error<='1';end if;	
			
				end if;
				 cuenta<=cuenta+1;
			end if;
		end if;
	END PROCESS;
END sol;