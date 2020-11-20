USE [SIC]
GO

CREATE TABLE NOTAFISCAL (
  DANFE                 VARCHAR(44) NOT NULL PRIMARY KEY,
  DOCUMENTO             VARCHAR(20) NOT NULL,
  CNPJ_EMITENTE         VARCHAR(14) NOT NULL,
  NUMERO                VARCHAR(20) NOT NULL,
  CNPJ_DESTINATARIO     VARCHAR(14) NOT NULL,
  DT_ATUAL              DATETIME DEFAULT CURRENT_TIMESTAMP,
  COMPROVANTE_ENVIADO   INT DEFAULT 0,
  COMPROVANTE_ORIGEM    VARCHAR(20),
  DT_ENVIO              DATETIME, 
  QTDE_LOAD             INT DEFAULT 0,
  QTDE_SEND             INT DEFAULT 0,
  PROTOCOLO             VARCHAR(80),
  IDCARGA               INT DEFAULT 0,
  MANIFESTO             VARCHAR(20),
  DT_MANIFESTO          DATETIME,
  DT_BAIXA_MANIFESTO    DATETIME
);

 -- 20/11/2020
ALTER TABLE NOTAFISCAL ADD MANIFESTO VARCHAR(20);
ALTER TABLE NOTAFISCAL ADD DT_MANIFESTO DATETIME;
ALTER TABLE NOTAFISCAL ADD DT_BAIXA_MANIFESTO DATETIME;
