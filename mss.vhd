--MSS 

LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

entity MSS is
	port	(	clock, resetn, led_error,start,gano_led_fin,fin_led_error,test,consulta,error,gano,fin,cambioconsulta,salirconsulta: in std_logic;
				en_test,hold,en_ram,guardar_ram,mostrar_display,cancion: out std_logic;
				reset_todo, reset_test,led_verde,reset_consulta,en_consulta,led_rojo,zz,en_display,clockguardado,salto: out std_logic);
end MSS;


architecture sol of MSS is
type estado is (ta, tb, tc, td, te, te1, tf, tg0, tg, th,ti,ti1, tp,tp1,tq,tr);
signal y: estado;
begin
MSS_transiciones:process(resetn,clock)
	begin
		if (resetn='0') then y<=ta;
		elsif(clock'event and clock='1') then
			case y is
					when ta =>if start='1' then y<=tb;
										else y<=ta;end if;
						when tb =>if start='0' then y<=tc;
										else y<=tb;end if;
						when tc=> y<=td;
						when td=> if test='1' then y<=te;
										elsif consulta='1' then y<=tp1;
										else y<=td;end if;
						when te=> y<=te1;
						when te1=> y<=tf;
						when tf=> if led_error='1' then y<=tg;--si comete 1 error 
										elsif gano='1' then y<=th;-- si gano, cambia de cancion
										elsif fin='1' then y<=ti;-- si se acaba las canciones
										else y<=tf;end if;-- salimos si termina las canciones, es decir 20 veces, gano
						
						when tg=> if fin_led_error='1' then y<=tg0;-- encender led rojo x una equivocacion
										else y<=tg;end if;
						when tg0=> y<=tf;--para poder recibir la snal de error
						when th=> if gano_led_fin='1' then y<=tf;--encender led verde x una equivocacion
										else y<=th;end if;
						when ti=> y<=ti1;
						when ti1=> y<=td;
						when tp1=> y<=tp;
						when tp=> if cambioconsulta='1'then y<=tq;-- cambia cuando cambia una consulta
										else y<=tp;end if;
						when tq=> if salirconsulta='1' then y<=tr;-- cuando sea 10 se sale
										else y<=tp;end if;
						when tr=> y<=tc;--retornar a test/consulta
			end case;
		end if;
end process;


MSS_salidas: process (y)
		begin
			 reset_todo<='1';reset_test<='1';led_rojo<='0';zz<='0';en_display<='0';
			 mostrar_display<='0';en_ram<='0';guardar_ram<='0';en_test<='0';
			 reset_consulta<='1';en_consulta<='0';hold<='0';cancion<='1';led_verde<='0';clockguardado<='0';salto<='0';
			case y is 
					when ta =>
					when tb => reset_todo<='0';
					when tc =>
					when td => reset_test<='0';reset_consulta<='0';mostrar_display<='0';
					when te => en_test<='1';mostrar_display<='1';hold<='1';cancion<='0';
					when te1=> en_test<='1';en_display<='1';
					when tf => en_test<='1';mostrar_display<='1'; en_display<='1';en_ram<='1';

					when tg0 => zz<='1';en_display<='1';
					when tg => led_rojo<='1';mostrar_display<='1';en_display<='1';
					when th => cancion<='0';en_test<='1';led_verde<='1';hold<='1';mostrar_display<='1';en_display<='1';
					when ti => en_ram<='1';clockguardado<='1';mostrar_display<='1';guardar_ram<='1';en_display<='1';
					when ti1=> en_ram<='1';clockguardado<='1';mostrar_display<='1';guardar_ram<='1';en_display<='1';
					when tp1=> salto<='1';en_consulta<='1';en_display<='1';
					when tp => en_consulta<='1';en_display<='1';
					when tq => en_consulta<='1'; reset_consulta<='0';en_display<='1';salto<='1';
					when tr => reset_consulta<='0';en_display<='1';
					
			end case;
end process;
end sol;		