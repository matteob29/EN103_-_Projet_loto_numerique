----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2025 05:27:23 PM
-- Design Name: 
-- Module Name: tb_compteur_mod50 - Behavioral
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

entity tb_compteur_mod50 is
end tb_compteur_mod50;

architecture Behavioral of tb_compteur_mod50 is

component compteur_mod50 is
    port(clk, rst, CE, bouton : in std_logic;
        S : out std_logic_vector (5 downto 0));
end component;

signal s_clk, s_rst, s_ce, s_bouton : std_logic := '0';
signal s_S : std_logic_vector (5 downto 0);

begin
    UUT : compteur_mod50
        port map(clk => s_clk,
                rst => s_rst,
                S => s_S,
                bouton => s_bouton,
                ce => s_ce);
    
    s_rst <= '1', '0' after 3 ns;
    s_clk <= not(s_clk) after 5 ns;
    s_ce <= '0', '1' after 10 ns, '0' after 30 ns, '1' after 40 ns;
    s_bouton <= '0', '1' after 15 ns;
end Behavioral;