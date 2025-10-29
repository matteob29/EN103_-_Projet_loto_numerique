----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2025 10:02:41 AM
-- Design Name: 
-- Module Name: CE_25MHz - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CE_25MHz is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           tick : out STD_LOGIC);
end CE_25MHz;

architecture Behavioral of CE_25MHz is

signal r_prst , r_next : unsigned (1 downto 0) := to_unsigned(0, 2);

begin
    process(clk, rst)
    begin
        if (rst = '1') then
            r_prst <= to_unsigned(0,2);
        elsif (clk'event and clk='1') then
            r_prst <= r_next;           
        end if;
     end process;
     
     cal_sortie : process(r_prst)
     begin
        if (r_prst = to_unsigned(3,2)) then
            tick <= '1';
        else
            tick <= '0';
        end if;
     end process cal_sortie;
    
    cal_next : process(r_prst)
    begin
        r_next <= r_prst + 1;
    end process;

end Behavioral;
