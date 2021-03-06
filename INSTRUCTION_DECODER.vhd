LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ID IS
PORT(
	ID_IN:IN STD_LOGIC;
	ID_OUT:IN STD_LOGIC;
	ID_DATA_IN:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	ID_DATA_OUT: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	ID_CLK: IN STD_LOGIC;
	ID_OPCODE:OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END ID;


ARCHITECTURE ID OF ID IS


BEGIN

PROCESS(ID_CLK, ID_IN,ID_OUT)
VARIABLE ID_DATA:STD_LOGIC_VECTOR(7 DOWNTO 0);
VARIABLE DATA: STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN
IF(ID_OUT='1') THEN
	DATA:=ID_DATA_IN(3 DOWNTO 0)&"ZZZZ";
ELSE IF(ID_OUT='0') THEN
	DATA:="ZZZZZZZZ";
END IF;
END IF;

IF(ID_CLK'EVENT AND ID_CLK='0') THEN 
	IF(ID_IN='1') THEN
		ID_DATA:=ID_DATA_IN;
		ID_OPCODE<=ID_DATA(7 DOWNTO 4);
	END IF;
END IF;
IF(ID_CLK'EVENT AND ID_CLK='1') THEN 
ID_DATA_OUT<=DATA;
END IF;

END PROCESS;

END ID;

