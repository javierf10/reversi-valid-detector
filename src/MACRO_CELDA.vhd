-- Javier Falcó Díez 797613 y Jorge Hernando Zueco 841766

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MACRO_CELDA is 
    Port ( up_in : in STD_LOGIC_VECTOR (1 downto 0);
           down_in : in STD_LOGIC_VECTOR (1 downto 0);
           left_in : in STD_LOGIC_VECTOR (1 downto 0);
           right_in : in STD_LOGIC_VECTOR (1 downto 0);
           up_left_in : in STD_LOGIC_VECTOR (1 downto 0);
           up_right_in : in STD_LOGIC_VECTOR (1 downto 0);
           down_left_in : in STD_LOGIC_VECTOR (1 downto 0);
           down_right_in : in STD_LOGIC_VECTOR (1 downto 0);
           up_out : out STD_LOGIC_VECTOR (1 downto 0);
           down_out : out STD_LOGIC_VECTOR (1 downto 0);
           left_out : out STD_LOGIC_VECTOR (1 downto 0);
           right_out : out STD_LOGIC_VECTOR (1 downto 0);
           up_left_out : out STD_LOGIC_VECTOR (1 downto 0);
           up_right_out : out STD_LOGIC_VECTOR (1 downto 0);
           down_left_out : out STD_LOGIC_VECTOR (1 downto 0);
           down_right_out : out STD_LOGIC_VECTOR (1 downto 0);
           input : in STD_LOGIC_VECTOR (1 downto 0); -- casilla
           output : out std_logic); -- colocar ficha
end MACRO_CELDA;

architecture Behavioral of MACRO_CELDA is
component CELDA_BASE is
    Port ( INFO_IN : in STD_LOGIC_VECTOR (1 downto 0);
           celda : in STD_LOGIC_VECTOR (1 downto 0);
           INFO_OUT : out STD_LOGIC_VECTOR (1 downto 0);
           salida : out STD_LOGIC
           );
end component;
signal INFO_IN, celda, INFO_OUT : std_logic_vector (1 downto 0);
signal output_1, output_2, output_3, output_4, output_5, output_6, output_7, output_8 : std_logic;
begin
    celda_upleft: celda_base port map (INFO_IN => up_left_in, celda => input, SALIDA => output_1, INFO_OUT => down_right_out);
    celda_up: celda_base port map (INFO_IN => up_in, celda => input, SALIDA => output_2, INFO_OUT => down_out);
    celda_upright: celda_base port map (INFO_IN => up_right_in, celda => input, SALIDA => output_3, INFO_OUT => down_left_out);
    celda_left: celda_base port map (INFO_IN => left_in, celda => input, SALIDA => output_4, INFO_OUT => right_out);
    celda_right: celda_base port map (INFO_IN => right_in, celda => input, SALIDA => output_5, INFO_OUT => left_out);
    celda_downleft: celda_base port map (INFO_IN => down_left_in, celda => input, SALIDA => output_6, INFO_OUT => up_right_out);
    celda_down: celda_base port map (INFO_IN => down_in, celda => input, SALIDA => output_7, INFO_OUT => up_out);
    celda_downright: celda_base port map (INFO_IN => down_right_in, celda => input, SALIDA => output_8, INFO_OUT => up_left_out);
    output <= output_1 or output_2 or output_3 or output_4 or output_5 or output_6 or output_7 or output_8;
end Behavioral;


