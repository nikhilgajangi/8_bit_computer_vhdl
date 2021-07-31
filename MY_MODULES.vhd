LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;


PACKAGE MY_MODULES IS
-------CONTROL UNIT-------------
COMPONENT CONTROL_UNIT IS
PORT( 
	CONTROL_BITS: OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
	CU_CLK: IN STD_LOGIC;
	OPCODE: IN STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END COMPONENT;

-----------REGISTER----------------
COMPONENT REG IS
PORT(
	REG_CLK: IN STD_LOGIC;
	A_IN: IN STD_LOGIC;
	A_OUT: IN STD_LOGIC;
	INPUT_DATA: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	OUTPUT_DATA:  OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	OUTPUT: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	
);
END COMPONENT;

---------------ALU-----------------
COMPONENT ALU IS 
PORT(
	ALU_CLK: IN STD_LOGIC;
	A: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	B: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	ALU_OUT: IN STD_LOGIC;
	OUTPUT_DATA: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	ARITH_SELECT: IN STD_LOGIC
);
END COMPONENT;

------------ID--------------------
COMPONENT ID IS
PORT(
	ID_IN:IN STD_LOGIC;
	ID_OUT:IN STD_LOGIC;
	ID_DATA_IN:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	ID_DATA_OUT: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	ID_CLK: IN STD_LOGIC;
	ID_OPCODE:OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END COMPONENT;

------------PROGRAM COUNTER------------
COMPONENT PROGRAM IS
PORT(
	PC_CLK: IN STD_LOGIC;
	PC_OUT: IN STD_LOGIC;
	PC_INC: IN STD_LOGIC;

	PC_ADDRESS: OUT STD_LOGIC_VECTOR( 7 DOWNTO 0)
);
END COMPONENT;

------------RAM--------------------
COMPONENT RAM IS
PORT(
	ADDRESS: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	DATA_IN: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	DATA_OUT: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	RAM_IN: IN STD_LOGIC;
	RAM_OUT: IN STD_LOGIC;
	RAM_CLK: IN STD_LOGIC;
	ADDRESS_IN:IN STD_LOGIC

);
END COMPONENT;


END MY_MODULES;