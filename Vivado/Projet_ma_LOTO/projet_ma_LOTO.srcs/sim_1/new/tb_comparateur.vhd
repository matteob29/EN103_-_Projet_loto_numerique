----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2025 06:01:49 PM
-- Design Name: 
-- Module Name: tb_comparateur - Behavioral
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

entity tb_comparateur is
end tb_comparateur;

architecture Behavioral of tb_comparateur is
    -- Déclaration des signaux pour les entrées et sorties du module à tester
    signal nb_prst : STD_LOGIC_VECTOR (5 downto 0);
    signal val1 : STD_LOGIC_VECTOR (5 downto 0);
    signal val2 : STD_LOGIC_VECTOR (5 downto 0);
    signal val3 : STD_LOGIC_VECTOR (5 downto 0);
    signal val4 : STD_LOGIC_VECTOR (5 downto 0);
    signal val5 : STD_LOGIC_VECTOR (5 downto 0);
    signal val6 : STD_LOGIC_VECTOR (5 downto 0);
    signal result_comp : STD_LOGIC;

    -- Déclaration du composant à tester
    component comparateur
        Port (
            nb_prst : in  STD_LOGIC_VECTOR (5 downto 0);
            val1 : in STD_LOGIC_VECTOR (5 downto 0);
            val2 : in STD_LOGIC_VECTOR (5 downto 0);
            val3 : in STD_LOGIC_VECTOR (5 downto 0);
            val4 : in STD_LOGIC_VECTOR (5 downto 0);
            val5 : in STD_LOGIC_VECTOR (5 downto 0);
            val6 : in STD_LOGIC_VECTOR (5 downto 0);
            result_comp : out STD_LOGIC
        );
    end component;

begin
    -- Instanciation du module à tester
    uut: comparateur
        port map (nb_prst => nb_prst,
            val1 => val1,
            val2 => val2,
            val3 => val3,
            val4 => val4,
            val5 => val5,
            val6 => val6,
            result_comp => result_comp);

    -- Processus de stimuli
    val1 <= "000000";
    val2 <= "000001";
    val3 <= "000001";
    val4 <= "000011";
    val5 <= "000100";
    val6 <= "000101";
    
    process
    begin
        nb_prst <= "000000";
        wait for 100 ns;
        nb_prst <= "000001";
        wait for 100ns;
        nb_prst <= "100001";
        wait for 100 ns;
        nb_prst <= "000011";
        wait for 100ns;
        nb_prst <= "000100";
        wait for 100ns;
        nb_prst <= "000101";
        wait for 100ns;
        nb_prst <= "000110";
        wait for 100ns;
        nb_prst <= "000111";
        wait for 100ns;
    end process;
end Behavioral;