----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2025 02:17:13 PM
-- Design Name: 
-- Module Name: tb_compteur_mod6_tirage - Behavioral
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

entity tb_compteur_mod6_tirage is
end tb_compteur_mod6_tirage;

architecture Behavioral of tb_compteur_mod6_tirage is

component compteur_mod6_tirage is
    port(clk, rst, ce, inc : in std_logic;
        S : out std_logic_vector (2 downto 0));
end component;

signal s_clk, s_rst, s_ce, s_inc : std_logic := '0';
signal s_S : std_logic_vector (2 downto 0);

begin
    UUT : compteur_mod6_tirage
        port map(clk => s_clk,
                rst => s_rst,
                S => s_S,
                ce => s_ce,
                inc => s_inc);
    
    s_rst <= '1', '0' after 3 ns;
    s_clk <= not(s_clk) after 5 ns;
    s_ce <= '0', '1' after 40 ns, '0' after 120 ns;
    s_inc <= '0', '1' after 50 ns, '0' after 65 ns, '1' after 73 ns;

end Behavioral;