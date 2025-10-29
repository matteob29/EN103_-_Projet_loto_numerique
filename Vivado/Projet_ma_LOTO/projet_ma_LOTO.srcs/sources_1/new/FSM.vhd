----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2025 02:30:01 PM
-- Design Name: 
-- Module Name: FSM - Behavioral
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

entity FSM is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           ce : in STD_LOGIC;
           bouton : in STD_LOGIC;
           recommence : in STD_LOGIC;
           valid : in STD_LOGIC_VECTOR (2 downto 0);
           comptage : out STD_LOGIC;
           enregistre_val : out STD_LOGIC);
end FSM;

architecture Behavioral of FSM is

type state_type is (compter, enregistrer, recommencer, fin, neutre);
signal prst_state, next_state : state_type;

begin
    process(clk, rst)
    begin
        if (rst = '1') then
            prst_state <= neutre;
        elsif (clk'event and clk='1') then
            if (ce='1') then
                prst_state <= next_state;
            end if;
        end if;
     end process;


    cal_sortie : process(prst_state)
    begin
        case (prst_state) is
            when compter =>
                comptage <= '0';
                enregistre_val <= '0';
            when enregistrer =>
                comptage <= '1';
                enregistre_val <= '1';
            when recommencer =>
                comptage <= '0';
                enregistre_val <= '0';
            when fin =>
                comptage <= '0';
                enregistre_val <= '0';
            when neutre =>
                comptage <= '0';
                enregistre_val <= '0';
        end case;
    end process;

    cal_next_state : process(prst_state, bouton, recommence)
    begin
        case (prst_state) is
            when neutre =>
                if (bouton = '1') then
                    next_state <= compter;
                else
                    next_state <= neutre;
                end if;
                
            when recommencer =>
                if (recommence = '1') then
                    next_state <= neutre;
                else
                    next_state <= enregistrer;
                end if;
                
            when enregistrer =>
                if (valid = "110") then
                    next_state <= fin;
                else
                    next_state <= neutre;
                end if;
                
            when compter =>
                if (bouton = '1') then
                    next_state <= compter;
                else
                    next_state <= recommencer;
                end if;
                
            when fin =>
                next_state <= fin;
                    
            when others =>
                next_state <= neutre;
                
        end case;
    end process;

end Behavioral;