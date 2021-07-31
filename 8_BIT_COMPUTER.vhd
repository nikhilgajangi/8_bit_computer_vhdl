LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE WORK.MY_MODULES.ALL;

ENTITY COMPUTER IS
PORT( 
	
	CLK: IN STD_LOGIC
	
	
);
END COMPUTER;


ARCHITECTURE COMPUTER OF COMPUTER IS 
SIGNAL CONTROL: STD_LOGIC_VECTOR(12 DOWNTO 0);
SIGNAL REGA_OUT:STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL REGB_OUT:STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL OPCODE:STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL COM_BUS: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL NOT_CLK: STD_LOGIC;
BEGIN
NOT_CLK<= NOT CLK;
CU: CONTROL_UNIT PORT MAP(CONTROL, CLK, OPCODE);
PC: PROGRAM PORT MAP(NOT_CLK, CONTROL(12), CONTROL(11), COM_BUS);
COM_ID: ID PORT MAP(CONTROL(10), CONTROL(9), COM_BUS, COM_BUS , NOT_CLK, OPCODE);
COM_RAM: RAM PORT MAP(COM_BUS(7 DOWNTO 4), COM_BUS, COM_BUS, CONTROL(2), CONTROL(1), NOT_CLK, CONTROL(0));

REG_A: REG PORT MAP(NOT_CLK, CONTROL(6), CONTROL(5), COM_BUS, COM_BUS, REGA_OUT);



REG_B: REG PORT MAP(NOT_CLK, CONTROL(4), CONTROL(3), COM_BUS, COM_BUS, REGB_OUT);

COM_ALU: ALU PORT MAP(NOT_CLK, REGA_OUT, REGB_OUT, CONTROL(7), COM_BUS, CONTROL(8));




END COMPUTER;

