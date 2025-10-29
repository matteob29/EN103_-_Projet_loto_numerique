----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2025 02:49:00 PM
-- Design Name: 
-- Module Name: mem - Behavioral
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

entity mem is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           ce : in STD_LOGIC;
           enregistre : in STD_LOGIC;
           valid : in STD_LOGIC_VECTOR (2 downto 0);
           nb_prst : in STD_LOGIC_VECTOR (5 downto 0);
           val1 : out STD_LOGIC_VECTOR (5 downto 0);
           val2 : out STD_LOGIC_VECTOR (5 downto 0);
           val3 : out STD_LOGIC_VECTOR (5 downto 0);
           val4 : out STD_LOGIC_VECTOR (5 downto 0);
           val5 : out STD_LOGIC_VECTOR (5 downto 0);
           val6 : out STD_LOGIC_VECTOR (5 downto 0));
end mem;

architecture Behavioral of mem is

begin

    process(clk, rst)
    begin
        if (rst = '1') then
           val1 <= "000000";
           val2 <= "000000";
           val3 <= "000000";
           val4 <= "000000";
           val5 <= "000000";
           val6 <= "000000";

             
        elsif (clk'event and clk='1') then
            if (ce='1') then
                if (enregistre = '1') then
                    if (valid = "001") then
                        val1 <= nb_prst;
                    elsif (valid = "010") then
                        val2 <= nb_prst;
                    elsif (valid = "011") then
                        val3 <= nb_prst;
                    elsif (valid = "100") then
                        val4 <= nb_prst;
                    elsif (valid = "101") then
                        val5 <= nb_prst;
                    elsif (valid = "110") then
                        val6 <= nb_prst;
                    end if;
                end if;
            end if;
        end if;
     end process;
        
end Behavioral;
