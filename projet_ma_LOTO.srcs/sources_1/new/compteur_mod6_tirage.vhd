----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2025 02:09:58 PM
-- Design Name: 
-- Module Name: compteur_mod6_tirage - Behavioral
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

entity compteur_mod6_tirage is
    Port ( ce : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           inc : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0));
end compteur_mod6_tirage;

architecture Behavioral of compteur_mod6_tirage is

signal r_prst : unsigned (2 downto 0) := to_unsigned(1, 3);
signal r_next : unsigned (2 downto 0);

begin
    process(clk, rst)
    begin
        if (rst = '1') then
            r_prst <= to_unsigned(1,3);
        elsif (clk'event and clk='1') then
            if (ce='1') then
                if (inc = '1') then
                    r_prst <= r_next;
                end if;
            end if;
        end if;
     end process;

    cal_sortie : process(r_prst)
     begin
        S <= std_logic_vector(r_prst);
     end process cal_sortie;
    
    cal_next : process(r_prst)
    begin
        if (r_prst = to_unsigned(6,3)) then
            r_next <= to_unsigned(1,3);
        else
            r_next <= r_prst + 1;
        end if;
    end process;

end Behavioral;