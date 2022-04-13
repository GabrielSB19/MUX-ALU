library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity VHDL_P2 is
    port(
        A: IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0100";
        B: IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0001";
        R: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
end entity VHDL_P2;

architecture rtl of VHDL_P2 is
    signal OP: unsigned(2 downto 0) := "000";
begin
    process is
    begin
        wait for 10 ns;
        OP <= OP + 1;
        wait for 10 ns;
        OP <= OP + 1;
        wait for 10 ns;
        OP <= OP + 1;
        wait for 10 ns;
        OP <= OP + 1;
        wait for 10 ns;
        OP <= OP + 1;
        wait for 10 ns;
        OP <= OP + 1;
        wait for 10 ns;
        OP <= OP + 1;
        wait for 10 ns;
        OP <= OP+1;
        wait;
    end process;
    
    mux: process (A, B, OP)
    begin
        case OP is
            when "000" =>
                R <= "0000";
            when "001" =>
                R <= "1111";
            when "010" =>
                R <= STD_LOGIC_VECTOR(SIGNED(A) - SIGNED(B));
            when "011" =>
                R <= STD_LOGIC_VECTOR(SIGNED(A) + SIGNED(B));
            when "100" =>
                R <= A AND B;
            when "101" =>
                R <= not(A AND B);
            when "110" =>
                R <= A OR B;
            when others =>
                R <= not(A OR B);
        end case;
    end process;
end architecture rtl;


