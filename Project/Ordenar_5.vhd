library IEEE; 
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Ordenar5 is
	port( clk       : in  std_logic;
			new_set   : in  std_logic;
			in0       : in  std_logic_vector(5 downto 0);
			in1       : in  std_logic_vector(5 downto 0);
			in2       : in  std_logic_vector(5 downto 0);
			in3       : in  std_logic_vector(5 downto 0);
			in4       : in  std_logic_vector(5 downto 0);
			out0      : out std_logic_vector(5 downto 0);
			out1      : out std_logic_vector(5 downto 0);
			out2      : out std_logic_vector(5 downto 0);
			out3    	 : out std_logic_vector(5 downto 0);
			out4      : out std_logic_vector(5 downto 0);
			is_sorted : out std_logic); 
end Ordenar5;

architecture Structural of Ordenar5 is
    signal mux_even0 : std_logic_vector(5 downto 0);
    signal mux_even1 : std_logic_vector(5 downto 0);
    signal mux_even2 : std_logic_vector(5 downto 0);
    signal mux_even3 : std_logic_vector(5 downto 0);
    signal mux_even4 : std_logic_vector(5 downto 0);
    signal even_odd0 : std_logic_vector(5 downto 0);
    signal even_odd1 : std_logic_vector(5 downto 0);
    signal even_odd2 : std_logic_vector(5 downto 0);
    signal even_odd3 : std_logic_vector(5 downto 0);
    signal even_odd4 : std_logic_vector(5 downto 0);
	 signal s_out0    :  std_logic_vector(5 downto 0);
	 signal s_out1    :  std_logic_vector(5 downto 0);
	 signal s_out2    :  std_logic_vector(5 downto 0);
	 signal s_out3    :  std_logic_vector(5 downto 0);
	 signal s_out4    :  std_logic_vector(5 downto 0);
	 

begin		
	new_sort: entity work.NewSort(Behavioral)
	port map(new_set  => new_set,
				old_in0  => in0,
				old_in1  => in1,
				old_in2  => in2,
				old_in3  => in3,
				old_in4  => in4,
				new_in0  => s_out0,
				new_in1  => s_out1,
				new_in2  => s_out2,
				new_in3  => s_out3,
				new_in4  => s_out4,
				mux_out0 => mux_even0,
				mux_out1 => mux_even1,
				mux_out2 => mux_even2,
				mux_out3 => mux_even3,
				mux_out4 => mux_even4);

	even_sort: entity work.Even_Sort(Behavioral)
	port map(clk       => clk,
				even_in0  => mux_even0,
				even_in1  => mux_even1,
				even_in2  => mux_even2,
				even_in3  => mux_even3,
				even_in4  => mux_even4,
				even_out0 => even_odd0,
				even_out1 => even_odd1,
				even_out2 => even_odd2,
				even_out3 => even_odd3,
				even_out4 => even_odd4);

	odd_sort: entity work.Odd_Sort(Behavioral)
	port map(clk      => clk,
				odd_in0  => even_odd0,
				odd_in1  => even_odd1,
				odd_in2  => even_odd2,
				odd_in3  => even_odd3,
				odd_in4  => even_odd4,
				odd_out0 => s_out0,
				odd_out1 => s_out1,
				odd_out2 => s_out2,
				odd_out3 => s_out3,
				odd_out4 => s_out4);

	sort_done: entity work.Sort_Done(Behavioral)
	port map(sort_in0  => s_out0,
				sort_in1  => s_out1,
				sort_in2  => s_out2,
				sort_in3  => s_out3,
				sort_in4  => s_out4,
				is_sorted => is_sorted);
	
	
			out0 <= s_out0;
			out1 <= s_out1;
			out2 <= s_out2;
			out3 <= s_out3;
			out4 <= s_out4;

end Structural;