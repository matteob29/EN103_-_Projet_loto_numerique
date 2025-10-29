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

entity top_lvl_aff is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           bouton : in STD_LOGIC;
           SEG : out STD_LOGIC_VECTOR (6 downto 0);
           AN : out STD_LOGIC_VECTOR (7 downto 0));
end top_lvl_aff;

architecture Behavioral of top_lvl_aff is

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

component mux6 is
    port ( E0 : in STD_LOGIC_VECTOR (5 downto 0);
           E1 : in STD_LOGIC_VECTOR (5 downto 0);
           E2 : in STD_LOGIC_VECTOR (5 downto 0);
           E3 : in STD_LOGIC_VECTOR (5 downto 0);
           E4 : in STD_LOGIC_VECTOR (5 downto 0);
           E5 : in STD_LOGIC_VECTOR (5 downto 0);
           cmd : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (5 downto 0));
end component;

component mux4_7 is
    port ( E0 : in STD_LOGIC_VECTOR (6 downto 0);
           E1 : in STD_LOGIC_VECTOR (6 downto 0);
           E2 : in STD_LOGIC_VECTOR (6 downto 0);
           E3 : in STD_LOGIC_VECTOR (6 downto 0);
           cmd : in STD_LOGIC_VECTOR (1 downto 0);
           S : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component conv_b2_b10 is
    port ( E : in STD_LOGIC_VECTOR (5 downto 0);
           D : out STD_LOGIC_VECTOR (3 downto 0);
           U : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component chiffre_7segments is
    port ( E : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component increment is
    port ( E : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component compteur_mod6 is
    port ( CE : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           cmpt : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component compteur_mod4 is
    port ( ce : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           cmpt : out STD_LOGIC_VECTOR (1 downto 0));
end component;

component mux4_4 is
    port ( E0 : in STD_LOGIC_VECTOR (3 downto 0);
           E1 : in STD_LOGIC_VECTOR (3 downto 0);
           E2 : in STD_LOGIC_VECTOR (3 downto 0);
           E3 : in STD_LOGIC_VECTOR (3 downto 0);
           cmd : in STD_LOGIC_VECTOR (1 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0));
end component;


component top_lvl_tirage is
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
end component;

--anode
signal AN_4 : STD_LOGIC_VECTOR (3 downto 0);
-- clk enable
signal clk_1Hz, clk_3kHz, clk_25MHz  : std_logic;
signal bouton_sync : std_logic;
--mux6
signal E0_6, E1_6, E2_6, E3_6, E4_6, E5_6, S_6 : STD_LOGIC_VECTOR (5 downto 0);
--mux4_7
signal cmd4 : STD_LOGIC_VECTOR (1 downto 0);
--conv_b2_b10
signal D, U : STD_LOGIC_VECTOR (3 downto 0); -- la sortie est S_6
--chiffre_7segments
signal E0_47, E1_47, E2_47, E3_47: STD_LOGIC_VECTOR (6 downto 0);
signal INC_4 : STD_LOGIC_VECTOR (3 downto 0);
--increment
signal INC_3 : STD_LOGIC_VECTOR (2 downto 0);
--compteur_mod6
signal MOD_6,val_tirage : STD_LOGIC_VECTOR (2 downto 0);
--mux4_4
signal E0_44, E1_44, E2_44, E3_44: STD_LOGIC_VECTOR (3 downto 0);

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
                
    UUT4 : mux6
        port map(E0 => E0_6,
            E1 => E1_6,
            E2 => E2_6,
            E3 => E3_6,
            E4 => E4_6,
            E5 => E5_6,
            cmd => MOD_6,
            S => S_6);
                
    UUT5 : mux4_7
        port map(E0 => E0_47,
            E1 => E1_47,
            E2 => E2_47,
            E3 => E3_47,
            cmd => cmd4,
            S => SEG);
            
    UUT6 : conv_b2_b10
        port map(E => S_6,
            D => D,
            U => U);

    UUT7 : chiffre_7segments --dixaines
        port map(E => D,
            S => E2_47);

    UUT8 : chiffre_7segments --unitées
        port map(E => U,
            S => E3_47);

    UUT9 : chiffre_7segments
        port map(E => INC_4,
            S => E0_47);

    UUT10 : compteur_mod6
        port map(CE => clk_1Hz,
            clk => clk,
            rst => rst,
            cmpt => MOD_6);

    UUT11 : compteur_mod4
        port map(CE => clk_3kHz,
            clk => clk,
            rst => rst,
            cmpt => cmd4);

    UUT12 : increment
        port map(E => MOD_6,
            S => INC_3);

    UUT13 : mux4_4
        port map(E0 => E0_44,
            E1 => E1_44,
            E2 => E2_44,
            E3 => E3_44,
            cmd => cmd4,
            S => AN_4);
            
    UUT14 : top_lvl_tirage
        Port map( bouton => bouton,
           ce => clk_3kHz,
           clk => clk,
           rst => rst,
           val_tirage => val_tirage,
           val1 => E0_6,
           val2 => E1_6,
           val3 => E2_6,
           val4 => E3_6,
           val5 => E4_6,
           val6 => E5_6);   
            
         
    
    INC_4 <= '0' & INC_3;
    
    AN <= "1111" & AN_4;
    
    E1_47 <= "0111111";
    
    
    E0_44 <= "1110";
    E1_44 <= "1101";
    E2_44 <= "1011";
    E3_44 <= "0111";
    
end Behavioral;
