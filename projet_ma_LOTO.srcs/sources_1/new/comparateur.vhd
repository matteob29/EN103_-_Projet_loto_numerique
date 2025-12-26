----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2025 05:43:02 PM
-- Design Name: 
-- Module Name: comparateur - Behavioral
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

entity comparateur is
    Port ( nb_prst : in STD_LOGIC_VECTOR (5 downto 0);
           val1 : in STD_LOGIC_VECTOR (5 downto 0);
           val2 : in STD_LOGIC_VECTOR (5 downto 0);
           val3 : in STD_LOGIC_VECTOR (5 downto 0);
           val4 : in STD_LOGIC_VECTOR (5 downto 0);
           val5 : in STD_LOGIC_VECTOR (5 downto 0);
           val6 : in STD_LOGIC_VECTOR (5 downto 0);
           result_comp : out STD_LOGIC);
end comparateur;

architecture Behavioral of comparateur is
begin

    process (nb_prst, val1, val2, val3, val4, val5, val6)
    begin
        if (unsigned(val1) = unsigned(nb_prst)) or 
           (unsigned(val2) = unsigned(nb_prst)) or 
           (unsigned(val3) = unsigned(nb_prst)) or 
           (unsigned(val4) = unsigned(nb_prst)) or 
           (unsigned(val5) = unsigned(nb_prst)) or 
           (unsigned(val6) = unsigned(nb_prst)) then
            result_comp <= '1';
        else
            result_comp <= '0';
        end if;
    end process;

end Behavioral;
