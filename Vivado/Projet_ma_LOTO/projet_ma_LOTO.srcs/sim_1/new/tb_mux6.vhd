----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2025 04:46:16 PM
-- Design Name: 
-- Module Name: tb_mux6 - Behavioral
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

entity tb_mux6 is
end tb_mux6;

architecture Behavioral of tb_mux6 is
    -- Déclaration des signaux pour les entrées et sorties du module à tester
    signal E0 : STD_LOGIC_VECTOR(5 downto 0);
    signal E1 : STD_LOGIC_VECTOR(5 downto 0);
    signal E2 : STD_LOGIC_VECTOR(5 downto 0);
    signal E3 : STD_LOGIC_VECTOR(5 downto 0);
    signal E4 : STD_LOGIC_VECTOR(5 downto 0);
    signal E5 : STD_LOGIC_VECTOR(5 downto 0);
    signal cmd : STD_LOGIC_VECTOR(2 downto 0);
    signal S : STD_LOGIC_VECTOR(5 downto 0);

    -- Déclaration du composant à tester
    component mux6
        Port (
            E0 : in STD_LOGIC_VECTOR(5 downto 0);
            E1 : in STD_LOGIC_VECTOR(5 downto 0);
            E2 : in STD_LOGIC_VECTOR(5 downto 0);
            E3 : in STD_LOGIC_VECTOR(5 downto 0);
            E4 : in STD_LOGIC_VECTOR(5 downto 0);
            E5 : in STD_LOGIC_VECTOR(5 downto 0);
            cmd : in STD_LOGIC_VECTOR(2 downto 0);
            S : out STD_LOGIC_VECTOR(5 downto 0)
        );
    end component;

begin
    -- Instanciation du module à tester
    uut: mux6
        port map (
            E0 => E0,
            E1 => E1,
            E2 => E2,
            E3 => E3,
            E4 => E4,
            E5 => E5,
            cmd => cmd,
            S => S);

    -- Initialisation des entrées
    E0 <= "000001"; -- 1
    E1 <= "000010"; -- 2
    E2 <= "000011"; -- 3
    E3 <= "000100"; -- 4
    E4 <= "000101"; -- 5
    E5 <= "000110"; -- 6
    --cmd <= "00";  -- Sélectionne E0

    -- Processus de stimuli
    process
    begin
        cmd <= "000";
        wait for 100 ns;
        cmd <= "001";
        wait for 100ns;
        cmd <= "010";
        wait for 100 ns;
        cmd <= "011";
        wait for 100ns;
        cmd <= "100";
        wait for 100ns;
        cmd <= "101";
        wait for 100ns;
        cmd <= "110";
        wait for 100ns;
        cmd <= "111";
        wait for 100ns;
    end process;
end Behavioral;
