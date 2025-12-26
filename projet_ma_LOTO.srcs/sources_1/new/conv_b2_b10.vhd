----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2025 02:06:43 PM
-- Design Name: 
-- Module Name: conv_b2_b10 - Behavioral
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

entity conv_b2_b10 is
    Port ( E : in STD_LOGIC_VECTOR (5 downto 0);
           D : out STD_LOGIC_VECTOR (3 downto 0);
           U : out STD_LOGIC_VECTOR (3 downto 0));
end conv_b2_b10;

architecture Behavioral of conv_b2_b10 is

signal dix, un : unsigned (5 downto 0);

begin

dix <= unsigned(E) / to_unsigned(10,6);
D <= std_logic_vector(resize(dix,4));
un <= unsigned(E) rem to_unsigned(10,6); --reste de la div eucle de E par 10 sur 6 bits
U <= std_logic_vector(resize(un,4));


end Behavioral;
