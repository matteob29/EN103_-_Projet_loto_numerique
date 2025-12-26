----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2025 05:38:33 PM
-- Design Name: 
-- Module Name: tb_CE_3kHz - Behavioral
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

entity tb_CE_3kHz is
end tb_CE_3kHz;

architecture Behavioral of tb_CE_3kHz is

component CE_3kHz is
    port(clk, rst : in std_logic;
        tick : out std_logic);
end component;

signal s_clk : std_logic := '0';
signal s_rst, s_tick : std_logic;

begin
    UUT : CE_3kHz
        port map(clk => s_clk,
                rst => s_rst,
                tick => s_tick);
                
    s_rst <= '1', '0' after 100 us;
    --s_rst <= '0';
    s_clk <= not(s_clk) after 5 ns;
	
end Behavioral;