----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2025 05:15:37 PM
-- Design Name: 
-- Module Name: chiffre_7segments - Behavioral
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

entity chiffre_7segments is
    Port ( E : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (6 downto 0));
end chiffre_7segments;

architecture Behavioral of chiffre_7segments is

begin
	cal_cmd : process(E)
    begin
        case E is
			when "0000" =>
				S <= "1000000";--0
			when "0001" =>
				S <= "1111001";--1
			when "0010" =>
				S <= "0100100";--2
			when "0011" =>
				S <= "0110000";--3
			when "0100" =>
                S <= "0011001";--4
            when "0101" =>
                S <= "0010010";--5
            when "0110" =>
                S <= "0000010";--6
            when "0111" =>
                S <= "1111000";--7
            when "1000" =>
                S <= "0000000";--8
            when "1001" =>
                S <= "0010000";--9
			when others =>
                S <= "0000000";
		end case;
	end process;
end Behavioral;
