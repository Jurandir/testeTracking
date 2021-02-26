SELECT
    MEG.DATATU       AS DATAINICIOENTREGA,
	IME.DATABAIXAUSU AS DATAFINALIZACAO,
	NFR.DATA         AS DATAEMISSAODANFE,
	NFR.CHAVENFE     AS DANFE,
	CNH.CTRC         AS NROCTE,
	UPPER( ISNULL(IME.RECEBEDOR,'RESPONSÁVEL NA ENTREGA') ) AS NOMERECEBEDOR,
	'N.INFO'         AS DOCUMENTORECEBEDOR,
	VEI.TIPO         AS TIPOVEICULO,
	ISNULL(MOT.NOME,'TERMACO') AS MOTORISTA,
	MEG.VEI_PLACA    AS PLACAVEICULO,
    FIS.DOCUMENTO    AS DOCUMENTO,     
    FIS.IDCARGA      AS IDCARGA,
	EMP.CGC CNPJ_USER,TKN.VALIDO,TKN.TOKEN
FROM CARGASSQL.dbo.MEG
JOIN CARGASSQL.dbo.IME ON IME.EMP_CODIGO = MEG.EMP_CODIGO AND IME.MEG_CODIGO = MEG.CODIGO
JOIN CARGASSQL.dbo.CNH ON CNH.EMP_CODIGO = IME.EMP_CODIGO_CNH AND CNH.SERIE = IME.CNH_SERIE AND CNH.CTRC = IME.CNH_CTRC
JOIN CARGASSQL.dbo.NFR ON NFR.EMP_CODIGO = CNH.EMP_CODIGO AND NFR.CNH_SERIE = CNH.SERIE AND NFR.CNH_CTRC = CNH.CTRC
JOIN SIC.dbo.NOTAFISCAL FIS ON FIS.DANFE      = NFR.CHAVENFE
JOIN CARGASSQL.dbo.VEI ON VEI.PLACA = MEG.VEI_PLACA
LEFT JOIN CARGASSQL.dbo.MOT ON MOT.PRONTUARIO = MEG.MOT_PRONTUARIO
JOIN CARGASSQL.dbo.EMP on EMP.CODIGO = substring(FIS.DOCUMENTO,1,3)
JOIN SIC.dbo.TOKEN_ITRACK TKN on TKN.CNPJ = EMP.CGC
WHERE FIS.DANFE = '${danfe}'
