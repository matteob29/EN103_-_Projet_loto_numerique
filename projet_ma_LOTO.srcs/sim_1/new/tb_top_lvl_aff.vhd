----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2025 03:41:05 PM
-- Design Name: 
-- Module Name: tb_top_lvl_aff - Behavioral
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

entity tb_top_lvl_aff is
end tb_top_lvl_aff;

architecture Behavioral of tb_top_lvl_aff is

component top_lvl_aff is
    port(clk, rst : in std_logic;
        AN : out std_logic_vector (3 downto 0);
        SEG : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal s_clk, s_rst : std_logic := '0';
signal s_an : std_logic_vector (3 downto 0);
signal s_seg : std_logic_vector (6 downto 0);

begin
    UUT : top_lvl_aff
        port map(clk => s_clk,
                rst => s_rst,
                AN => s_an,
                SEG => s_seg);
    
    s_rst <= '1', '0' after 3 ns;
    s_clk <= not(s_clk) after 5 ns;

end Behavioral;
