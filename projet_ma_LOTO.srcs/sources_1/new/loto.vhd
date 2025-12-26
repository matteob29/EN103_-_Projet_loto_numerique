----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2025 08:44:32 PM
-- Design Name: 
-- Module Name: loto - Behavioral
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

entity loto is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           BOUTON : in STD_LOGIC;
           LED_OK : out STD_LOGIC;
           LED_recommence : out STD_LOGIC;
           Sept_Segments : out STD_LOGIC_VECTOR (6 downto 0);
           AN : out STD_LOGIC_VECTOR ( 3 downto 0));
end loto;

architecture Behavioral of loto is

component CE_1Hz is
    port(clk, rst : in std_logic;
        tick : out std_logic);
end component;

component CE_3kHz is
    port(clk, rst : in std_logic;
        tick : out std_logic);
end component;

component CE_25MHz is
    port(clk, rst : in std_logic;
        tick : out std_logic);
end component;

signal clk_1Hz, clk_3kHz, clk_25MHz  : std_logic;
signal bouton_sync : std_logic;
--signal  : std_logic;


begin
    UUT1 : CE_1Hz
        port map(clk => clk,
                rst => rst,
                tick => clk_1Hz);
    UUT2 : CE_3kHz
        port map(clk => clk,
                rst => rst,
                tick => clk_3kHz);
    UUT3 : CE_25MHz
        port map(clk => clk,
                rst => rst,
                tick => clk_25MHz);

    gstion_bouton : process(clk_3kHz)
    begin
        if (rst = '1') then
            bouton_sync <= '0';
        elsif (clk_3kHz'event and clk_3kHz='1') then
                bouton_sync <= BOUTON;
        end if;
    end process;
    
end Behavioral;
