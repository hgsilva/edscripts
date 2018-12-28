select	*
from	IE_CALENDARIO_IESB
where	ANO      = '2018'
and		SEMESTRE = '2'
and		EXCLUIDO is null
and		(DESCRICAO_EVENTO like '%Início das aulas%calouros%'
		or
		TITULO_EVENTO     like '%Início das aulas%calouros%')
order by DATA_INI