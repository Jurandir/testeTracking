USE [SIC]
GO

CREATE TABLE TOKEN_ITRACK (
  CNPJ                  VARCHAR(20) NOT NULL PRIMARY KEY,
  USUARIO               VARCHAR(40) NOT NULL,
  SENHA                 VARCHAR(40),
  NOME                  VARCHAR(60) NOT NULL,
  TOKEN                 VARCHAR(250),
  DT_ATUAL              DATETIME DEFAULT CURRENT_TIMESTAMP,
  VALIDO                INT DEFAULT 0,
);

INSERT INTO TOKEN_ITRACK( CNPJ, USUARIO, SENHA, NOME )
SELECT CONCAT(CGC,''),CONCAT(CGC,''),'TERMACO789',CONCAT('TERMACO ',CGC) FROM CARGASSQL.dbo.EMP WHERE LONGITUDE IS NOT NULL GROUP BY CGC 
;

SELECT * FROM TOKEN_ITRACK
;

UPDATE TOKEN_ITRACK
SET VALIDO = 0,
    NOME = 'TERMACO - FILIAL SÃO PAULO',
    DT_ATUAL = CURRENT_TIMESTAMP
WHERE CNPJ = '11552312000710'
;

UPDATE TOKEN_ITRACK
SET DT_ATUAL = NULL
WHERE VALIDO = 0
;

UPDATE TOKEN_ITRACK
SET NOME = 'TERMACO - MATRIZ FORTALEZA'
WHERE CNPJ = '11552312000124'
;
