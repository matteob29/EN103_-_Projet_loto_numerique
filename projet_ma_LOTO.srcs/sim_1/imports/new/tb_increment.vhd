----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2025 02:37:41 PM
-- Design Name: 
-- Module Name: tb_increment - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_increment is
end tb_increment;

architecture Behavioral of tb_increment is
    -- Déclaration des signaux pour les entrées et sorties du module à tester
    signal E : STD_LOGIC_VECTOR (2 downto 0);
    signal S : STD_LOGIC_VECTOR (2 downto 0);

    -- Déclaration du composant à tester
    component increment
        Port (
            E : in STD_LOGIC_VECTOR (2 downto 0);
            S : out STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;

begin
    -- Instanciation du module à tester
    uut: increment
        port map (
            E => E,
            S => S);

    -- Processus de stimuli
    E <= "000", "001" after 5 ns, "010" after 10ns, "011" after 15 ns, "100" after 20ns, "101" after 25 ns, "110" after 30 ns, "111" after 40 ns;
end Behavioral;