library IEEE;
use IEEE.STD_LOGIC_1164.all;
-- Entidade sem portos
entity demooTB is
end demooTB;

architecture Stimulus of demooTB is
	 -- Sinais para ligar as entradas da uut
	 signal s_clk : std_logic;
	 signal s_key0,s_key1: std_logic;
	 -- Sinal para ligar ÃƒÂ s saÃƒÂ­das da uut
	 signal s_HEX4, s_HEX5, s_HEX6, s_HEX7 : std_logic_vector(6 downto 0);
begin
	 -- Instanciao da Unit Under Test (UUT)
	 uut: entity work.Proj_demo(Shell)
							 port map(CLOCK_50 => s_clk,
										 KEY(0) => s_key0,
										 KEY(1) => s_key1,
										 HEX4 => s_HEX4,
										 HEX5 => s_HEX5,
										 HEX6 => s_HEX6,
										 HEX7 => s_HEX7);

	--Process stim
	
	clk_proc: process
	begin
		wait for 1 ns;
		s_clk <= '0';
		wait for 1 ns;
		s_clk <= '1';
	end process;
	
	 stim_proc : process
	 begin
		 wait for 10 ns;
		 s_key1 <= '1';
		 wait for 10 ns;
		 s_key1 <= '0';
		 wait for 100 ns;
		 s_key0 <= '0';
		 wait for 10 ns;
		 s_key0 <= '1';
		 wait for 10 ns;
		 s_key0 <= '0';
		 wait for 100000 ns;
	 end process;
end Stimulus;