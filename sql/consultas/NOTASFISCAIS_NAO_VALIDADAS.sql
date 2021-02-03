SELECT FIS.*,
       EMP.CGC CNPJ_USER,TKN.VALIDO,TKN.TOKEN 
FROM SIC.dbo.NOTAFISCAL FIS
JOIN CARGASSQL.dbo.EMP on EMP.CODIGO = substring(FIS.DOCUMENTO,1,3)
JOIN SIC.dbo.TOKEN_ITRACK TKN on TKN.CNPJ = EMP.CGC
WHERE FIS.IDCARGA = 0 AND 
     ( FIS.DT_VALIDACAO IS NULL OR DATEDIFF(minute,FIS.DT_VALIDACAO, CURRENT_TIMESTAMP) > 30)
  AND TKN.VALIDO <> 0     
  AND FIS.DANFE IS NOT NULL
  AND LEN(FIS.DANFE) > 0