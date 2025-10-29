----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2025 04:42:45 PM
-- Design Name: 
-- Module Name: mux6 - Behavioral
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

entity mux6 is
    Port ( E0 : in STD_LOGIC_VECTOR (5 downto 0);
           E1 : in STD_LOGIC_VECTOR (5 downto 0);
           E2 : in STD_LOGIC_VECTOR (5 downto 0);
           E3 : in STD_LOGIC_VECTOR (5 downto 0);
           E4 : in STD_LOGIC_VECTOR (5 downto 0);
           E5 : in STD_LOGIC_VECTOR (5 downto 0);
           cmd : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (5 downto 0));
end mux6;

architecture Behavioral of mux6 is

begin
	cal_cmd : process(cmd)
    begin
        case cmd is
			when "000" =>
				S <= E0;
			when "001" =>
				S <= E1;
			when "010" =>
				S <= E2;
			when "011" =>
				S <= E3;
			when "100" =>
                S <= E4;
            when "101" =>
                S <= E5;
			when others =>
                S <= "000000";
		end case;
	end process;
end Behavioral;
