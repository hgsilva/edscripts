DELETE  DM_MKT.dbo.ACOMP_ACUM_VEST_DIARIO where ANO_INGRESSO IN (
																	SELECT	DISTINCT ANO
																    FROM	[POLARIS02\BDIESBPROD].LYCEUM.DBO.IE_LY_OPCOES_APP
																	WHERE	APLICACAO in ( 'VESTIBULAR')
																					)

insert into DM_MKT.dbo.ACOMP_ACUM_VEST_DIARIO
([CURSO]
,[NOME]
,[MODALIDADE]
,[TURNO]
,[CAMPUS]
,[SEMANAS_INICIO_AULA]
,[TIPO]
,[ANO_INGRESSO]
,[SEM_INGRESSO]
,[ANO_SEM]
,[TIPO_CONCURSO]
,[QTD])

SELECT A.CURSO
             ,A.NOME
             ,CASE  WHEN COALESCE(INEP_PRESENCIAL,'P') = 'P' THEN 'PRESENCIAL'
                    WHEN COALESCE(INEP_PRESENCIAL,'P') = 'S' THEN 'SEMIPRESENCIAL'
                    WHEN COALESCE(INEP_PRESENCIAL,'P') = 'D' THEN 'EAD'
                    END MODALIDADE
             ,case when A.TURNO = 'not' then 'Noturno'
	      else a.turno
	      end turno	
             ,CAMPUS
             ,SEMANAS_INICIO_AULA
             ,A.TIPO
             ,ANO_INGRESSO
             ,SEM_INGRESSO
             ,ANO_SEM
             ,TIPO_CONCURSO
             ,QTD 
FROM   [POLARIS02\BDIESBPROD].LYCEUM.DBO.VW_VISAO_SEMANAL A
JOIN   [POLARIS02\BDIESBPROD].LYCEUM.DBO.LY_CURSO B ON A.CURSO = B.CURSO
where  ANO_INGRESSO = (select distinct ano from [POLARIS02\BDIESBPROD].LYCEUM.DBO.ie_ly_opcoes_app with (nolock) where APLICACAO = 'vestibular' )  
/*and		SEM_INGRESSO = '1'*/
AND		B.CURSO NOT IN (
					SELECT	CURSO 
					FROM	[POLARIS02\BDIESBPROD].LYCEUM.DBO.LY_CURSO 
					WHERE	INEP_PRESENCIAL IN ('S','D')
					)
