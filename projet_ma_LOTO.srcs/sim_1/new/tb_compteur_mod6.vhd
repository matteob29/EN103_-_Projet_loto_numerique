----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2025 02:41:24 PM
-- Design Name: 
-- Module Name: tb_compteur_mod6 - Behavioral
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

entity tb_compteur_mod6 is
end tb_compteur_mod6;

architecture Behavioral of tb_compteur_mod6 is

component compteur_mod6 is
    port(clk, rst, CE : in std_logic;
        cmpt : out std_logic_vector (2 downto 0));
end component;

signal s_clk, s_rst, s_ce : std_logic := '0';
signal s_cmpt : std_logic_vector (2 downto 0);

begin
    UUT : compteur_mod6
        port map(clk => s_clk,
                rst => s_rst,
                cmpt => s_cmpt,
                CE => s_ce);
    
    s_rst <= '1', '0' after 3 ns;
    s_clk <= not(s_clk) after 5 ns;
    s_ce <= '0', '1' after 40 ns;

end Behavioral;
