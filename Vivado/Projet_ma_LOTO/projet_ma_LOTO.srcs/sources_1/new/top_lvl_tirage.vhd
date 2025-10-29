----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2025 05:37:09 PM
-- Design Name: 
-- Module Name: top_lvl_tirage - Behavioral
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

entity top_lvl_tirage is
    Port ( bouton : in STD_LOGIC;
           ce : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           val_tirage : inout STD_LOGIC_VECTOR (2 downto 0);
           val1 : inout STD_LOGIC_VECTOR (5 downto 0);
           val2 : inout STD_LOGIC_VECTOR (5 downto 0);
           val3 : inout STD_LOGIC_VECTOR (5 downto 0);
           val4 : inout STD_LOGIC_VECTOR (5 downto 0);
           val5 : inout STD_LOGIC_VECTOR (5 downto 0);
           val6 : inout STD_LOGIC_VECTOR (5 downto 0));
end top_lvl_tirage;

architecture Behavioral of top_lvl_tirage is

component compteur_mod50 is
    port ( ce : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           bouton : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (5 downto 0));
end component;

component compteur_mod6_tirage is
    port ( ce : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           inc : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component comparateur is
    port (val1 : in STD_LOGIC_VECTOR (5 downto 0);
        val2 : in STD_LOGIC_VECTOR (5 downto 0);
        val3 : in STD_LOGIC_VECTOR (5 downto 0);
        val4 : in STD_LOGIC_VECTOR (5 downto 0);
        val5 : in STD_LOGIC_VECTOR (5 downto 0);
        val6 : in STD_LOGIC_VECTOR (5 downto 0);
        nb_prst : in STD_LOGIC_VECTOR (5 downto 0);
        result_comp : out STD_LOGIC);
end component;

component FSM is
    port ( ce : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           bouton : in STD_LOGIC;
           recommence : in STD_LOGIC;
           valid : in STD_LOGIC_VECTOR (2 downto 0);
           comptage : out STD_LOGIC;
           enregistre_val : out STD_LOGIC);
end component;

component mem is
    port ( clk : in STD_LOGIC;
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
end component;


signal nb_prst : STD_LOGIC_VECTOR (5 downto 0);
signal inc, recommence, enregistre : STD_LOGIC;

begin
    UUT1 : compteur_mod50
        port map ( ce => ce,
                clk => clk,
                rst => rst,
                bouton => bouton,
                S => nb_prst);

    UUT2 : compteur_mod6_tirage
        port map ( ce => ce,
                clk => clk,
                rst => rst,
                inc => inc,
                S => val_tirage);
                            
    UUT3 : comparateur
        port map (val1 => val1,
                val2 => val2,
                val3 => val3,
                val4 => val4,
                val5 => val5,
                val6 => val6,
                nb_prst => nb_prst,
                result_comp => recommence);

    UUT4 : mem
        port map (val1 => val1,
                val2 => val2,
                val3 => val3,
                val4 => val4,
                val5 => val5,
                val6 => val6,
                nb_prst => nb_prst,
                clk => clk,
                rst => rst,
                ce => ce,
                enregistre => enregistre,
                valid => val_tirage);

    UUT5 : FSM
        port map (clk => clk,
                rst => rst,
                ce => ce,
                bouton => bouton,
                enregistre_val => enregistre,
                recommence => recommence,
                valid => val_tirage,
                comptage => inc);

end Behavioral;
