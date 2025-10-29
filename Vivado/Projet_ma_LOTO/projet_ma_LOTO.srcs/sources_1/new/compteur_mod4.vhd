----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2025 03:58:01 PM
-- Design Name: 
-- Module Name: compteur_mod4 - Behavioral
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

entity compteur_mod4 is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           ce : in STD_LOGIC;
           cmpt : out STD_LOGIC_VECTOR (1 downto 0));
end compteur_mod4;

architecture Behavioral of compteur_mod4 is

signal r_prst : unsigned (1 downto 0) := to_unsigned(0, 2);
signal r_next : unsigned (1 downto 0);

begin
    process(clk, rst)
    begin
        if (rst = '1') then
            r_prst <= to_unsigned(0,2);
        elsif (clk'event and clk='1') then
            if (CE='1') then
                r_prst <= r_next;
            end if;
        end if;
     end process;

    cal_sortie : process(r_prst)
     begin
        cmpt <= std_logic_vector(r_prst);
     end process cal_sortie;
    
    cal_next : process(r_prst)
    begin
        --if (r_prst = to_unsigned(5,3)) then
            --r_next <= to_unsigned(0,3);
        --else
            r_next <= r_prst + 1;
        --end if;
    end process;

end Behavioral;