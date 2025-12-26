----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2025 04:31:27 PM
-- Design Name: 
-- Module Name: tb_mux4_4 - Behavioral
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

entity tb_mux4_4 is
end tb_mux4_4;

architecture Behavioral of tb_mux4_4 is
    -- Déclaration des signaux pour les entrées et sorties du module à tester
    signal E0 : STD_LOGIC_VECTOR(3 downto 0);
    signal E1 : STD_LOGIC_VECTOR(3 downto 0);
    signal E2 : STD_LOGIC_VECTOR(3 downto 0);
    signal E3 : STD_LOGIC_VECTOR(3 downto 0);
    signal cmd : STD_LOGIC_VECTOR(1 downto 0);
    signal S : STD_LOGIC_VECTOR(3 downto 0);

    -- Déclaration du composant à tester
    component mux4_4
        Port (
            E0 : in STD_LOGIC_VECTOR(3 downto 0);
            E1 : in STD_LOGIC_VECTOR(3 downto 0);
            E2 : in STD_LOGIC_VECTOR(3 downto 0);
            E3 : in STD_LOGIC_VECTOR(3 downto 0);
            cmd : in STD_LOGIC_VECTOR(1 downto 0);
            S : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

begin
    -- Instanciation du module à tester
    uut: mux4_4
        port map (
            E0 => E0,
            E1 => E1,
            E2 => E2,
            E3 => E3,
            cmd => cmd,
            S => S);

    -- Initialisation des entrées
    E0 <= "0001"; -- 1
    E1 <= "0010"; -- 2
    E2 <= "0011"; -- 3
    E3 <= "0100"; -- 4
    --cmd <= "00";  -- Sélectionne E0

    -- Processus de stimuli
    process
    begin
        cmd <= "00";
        wait for 100 ns;
        cmd <= "01";
        wait for 100ns;
        cmd <= "10";
        wait for 100 ns;
        cmd <= "11";
        wait for 100ns;
    end process;
end Behavioral;