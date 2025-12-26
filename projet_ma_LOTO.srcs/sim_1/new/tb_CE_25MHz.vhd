----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2025 12:02:14 PM
-- Design Name: 
-- Module Name: tb_CE_25MHz - Behavioral
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

entity tb_CE_25MHz is
end tb_CE_25MHz;

architecture Behavioral of tb_CE_25MHz is

component CE_25MHz is
    port(clk, rst : in std_logic;
        tick : out std_logic);
end component;

signal s_clk : std_logic := '0';
signal s_rst, s_tick : std_logic;

begin
    UUT : CE_25MHz
        port map(clk => s_clk,
                rst => s_rst,
                tick => s_tick);
                
    s_rst <= '1', '0' after 3 ns;
    s_clk <= not(s_clk) after 5 ns;
	
end Behavioral;
