SELECT FIS.DANFE,FIS.DOCUMENTO,CONCAT(TRB.EMP_CODIGO,TRB.MNF_CODIGO) AS MANIFESTO,TRB.DATA AS DT_MANIFESTO
FROM NOTAFISCAL FIS
JOIN CARGASSQL.dbo.TRB ON  TRB.EMP_CODIGO     = SUBSTRING(FIS.DOCUMENTO,1,3) AND
                           TRB.CNH_SERIE      = SUBSTRING(FIS.DOCUMENTO,4,1) AND
     					   TRB.CNH_CTRC       = SUBSTRING(FIS.DOCUMENTO,5,10)
WHERE FIS.MANIFESTO IS NOT NULL AND FIS.DT_MANIFESTO IS NULL

---
SELECT FIS.DANFE,FIS.DOCUMENTO,FIS.MANIFESTO --,TRB.DATA AS DT_MANIFESTO
FROM NOTAFISCAL FIS
WHERE FIS.MANIFESTO IS NOT NULL AND FIS.DT_MANIFESTO IS NULL
