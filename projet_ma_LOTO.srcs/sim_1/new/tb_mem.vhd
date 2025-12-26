----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2025 03:03:05 PM
-- Design Name: 
-- Module Name: tb_mem - Behavioral
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

entity tb_mem is
end tb_mem;

architecture Behavioral of tb_mem is

component mem is
    port(clk, rst, ce, enregistre : in std_logic;
        valid : in STD_LOGIC_VECTOR (2 downto 0);
        nb_prst : in STD_LOGIC_VECTOR (5 downto 0);
        val1 : out STD_LOGIC_VECTOR (5 downto 0);
        val2 : out STD_LOGIC_VECTOR (5 downto 0);
        val3 : out STD_LOGIC_VECTOR (5 downto 0);
        val4 : out STD_LOGIC_VECTOR (5 downto 0);
        val5 : out STD_LOGIC_VECTOR (5 downto 0);
        val6 : out STD_LOGIC_VECTOR (5 downto 0));
end component;

signal clk, rst, ce, enregistre : std_logic := '0';
signal valid : STD_LOGIC_VECTOR (2 downto 0);
signal nb_prst : STD_LOGIC_VECTOR (5 downto 0);
signal val1 : STD_LOGIC_VECTOR (5 downto 0);
signal val2 : STD_LOGIC_VECTOR (5 downto 0);
signal val3 : STD_LOGIC_VECTOR (5 downto 0);
signal val4 : STD_LOGIC_VECTOR (5 downto 0);
signal val5 : STD_LOGIC_VECTOR (5 downto 0);
signal val6 : STD_LOGIC_VECTOR (5 downto 0);

begin
    UUT : mem
        port map(clk => clk,
                rst => rst,
                ce => ce,
                enregistre => enregistre,
                nb_prst => nb_prst,
                valid => valid,
                val1 => val1,
                val2 => val2,
                val3 => val3,
                val4 => val4,
                val5 => val5,
                val6 => val6);
    
    rst <= '1', '0' after 3 ns, '1' after 120 ns, '0' after 130 ns;
    clk <= not(clk) after 5 ns;
    ce <= '0', '1' after 40 ns, '0' after 200 ns;
    enregistre <= not(enregistre) after 5 ns;
    nb_prst <= "001011";
    
    process
    begin
        valid <= "000";
        wait for 10 ns;
        valid <= "001";
        wait for 10ns;
        valid <= "010";
        wait for 10 ns;
        valid <= "011";
        wait for 10ns;
        valid <= "100";
        wait for 10ns;
        valid <= "101";
        wait for 10ns;
    end process;

end Behavioral;