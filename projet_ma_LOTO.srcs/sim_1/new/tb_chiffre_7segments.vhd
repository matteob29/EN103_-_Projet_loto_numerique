----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2025 05:34:02 PM
-- Design Name: 
-- Module Name: tb_chiffre_7segments - Behavioral
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

entity tb_chiffre_7segments is
end tb_chiffre_7segments;

architecture Behavioral of tb_chiffre_7segments is
    -- Déclaration des signaux pour les entrées et sorties du module à tester
    signal E : STD_LOGIC_VECTOR (3 downto 0);
    signal S : STD_LOGIC_VECTOR (6 downto 0);

    -- Déclaration du composant à tester
    component chiffre_7segments
        Port (
            E : in STD_LOGIC_VECTOR (3 downto 0);
            S : out STD_LOGIC_VECTOR (6 downto 0)
        );
    end component;

begin
    -- Instanciation du module à tester
    uut: chiffre_7segments
        port map (
            E => E,
            S => S);

    -- Processus de stimuli
    process
    begin
        E <= "0000";
        wait for 100 ns;
        E <= "0001";
        wait for 100ns;
        E <= "0010";
        wait for 100 ns;
        E <= "0011";
        wait for 100ns;
        E <= "0100";
        wait for 100ns;
        E <= "0101";
        wait for 100ns;
        E <= "0110";
        wait for 100ns;
        E <= "0111";
        wait for 100ns;
        E <= "1000";
        wait for 100ns;
        E <= "1001";
        wait for 100ns;
    end process;
end Behavioral;