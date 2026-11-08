-- Javier Falcó Díez 797613 y Jorge Hernando Zueco 841766

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CELDA_BASE is
Port (  INFO_IN : in STD_LOGIC_VECTOR (1 downto 0);
        celda : in STD_LOGIC_VECTOR (1 downto 0);
        INFO_OUT : out STD_LOGIC_VECTOR (1 downto 0);
        salida : out STD_LOGIC
        );
end CELDA_BASE;

architecture Behavioral of CELDA_BASE is
begin
    salida <= '1' WHEN (INFO_IN = "10") AND (celda = "00") else '0';
    INFO_OUT <= "00" WHEN (celda = "00") OR (celda = "10" AND INFO_IN = "00") else
        "01" WHEN celda = "01" else
        "10"; -- WHEN celda = "10" AND (INFO_IN = "10" OR INFO_IN = "01") else
end Behavioral;
