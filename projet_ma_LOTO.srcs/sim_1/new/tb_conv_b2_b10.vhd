----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2025 02:11:49 PM
-- Design Name: 
-- Module Name: tb_conv_b2_b10 - Behavioral
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

entity tb_conv_b2_b10 is
end tb_conv_b2_b10;

architecture Behavioral of tb_conv_b2_b10 is
    -- Déclaration des signaux pour les entrées et sorties du module à tester
    signal E : STD_LOGIC_VECTOR (5 downto 0);
    signal D : STD_LOGIC_VECTOR (3 downto 0);
    signal U : STD_LOGIC_VECTOR (3 downto 0);

    -- Déclaration du composant à tester
    component conv_b2_b10
        Port (
            E : in STD_LOGIC_VECTOR (5 downto 0);
            D : out STD_LOGIC_VECTOR (3 downto 0);
            U : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

begin
    -- Instanciation du module à tester
    uut: conv_b2_b10
        port map (
            E => E,
            D => D,
            U => U);

    -- Processus de stimuli
    E <= "000000", "000001" after 10 ns, "011000" after 20 ns, "111111" after 25 ns;
end Behavioral;