DROP TABLE CARGA_ITRACK_TMP;
SELECT * INTO CARGA_ITRACK_TMP FROM (
SELECT IT.*
FROM NOTAFISCAL NF
JOIN CARGA_ITRACK IT ON IT.DANFE = NF.DANFE
WHERE NF.IDCARGA = 0
) Z

-- SELECT * FROM CARGA_ITRACK_TMP





