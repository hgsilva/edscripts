select	*
from	IE_CALENDARIO_IESB
where	ANO      = '2018'
and		SEMESTRE = '2'
and		EXCLUIDO is null
and		(DESCRICAO_EVENTO like '%In�cio das aulas%calouros%'
		or
		TITULO_EVENTO     like '%In�cio das aulas%calouros%')
order by DATA_INI