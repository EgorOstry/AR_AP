SET QUOTED_IDENTIFIER ON;
GO
WITH
DocumentsUnion AS (
    SELECT
        d._IDRRef AS "DocumentID",
        d._Number AS "Номер документа",
		d._Fld11607 	  AS "Дата документа",
        d._Fld19905RRef AS "Документ основание",
        d._Fld11567RRef AS "Ответственный пользователь за документ",
        d._Fld11571RRef AS "Подразделение документ",
        NULL AS "Дата Поступления ППИ",
        COALESCE(t2._Fld33074_T, d._Fld11606) AS "Дата Оплаты РТУ",
        NULL AS "Дата КР док.основ"
    FROM _Document440 AS d
    LEFT JOIN _InfoRg33071 t2 ON d._IDRref = t2._Fld33072_RRRef AND CONVERT(varchar(36), t2._Fld33072_RTRef, 2) = '000001B8' AND t2._Fld33073 = 'ДатаОплаты'
    WHERE EXISTS (
        SELECT 1
        FROM _AccumRg16554 AS t1
        WHERE t1._Fld16557_RRRef = d._IDRRef
            AND CONVERT(nvarchar(20), t1._Fld16557_RTRef, 2) = '000001B8'
    )
    UNION ALL
    SELECT
        _IDRRef AS "DocumentID",
        _Number AS "Номер документа",
        _Date_Time AS "Дата документа",
        NULL AS "Документ основание",
        _Fld10271RRef AS "Ответственный пользователь за документ",
        _Fld10276RRef AS "Подразделение документ",
        NULL AS "Дата Поступления ППИ",
        NULL AS "Дата Оплаты РТУ",
        NULL AS "Дата КР док.основ"
    FROM _Document415 AS d
    WHERE EXISTS (
        SELECT 1
        FROM _AccumRg16554 AS t1
        WHERE t1._Fld16557_RRRef = d._IDRRef
            AND CONVERT(nvarchar(20), t1._Fld16557_RTRef, 2) = '0000019F'
    )
    UNION ALL
    SELECT
        _IDRRef AS "DocumentID",
        _Number AS "Номер документа",
        _Date_Time AS "Дата документа",
        _Fld7198_RRRef AS "Документ основание",
        _Fld7196RRef AS "Ответственный пользователь за документ",
        _Fld7192RRef AS "Подразделение документ",
        NULL AS "Дата Поступления ППИ",
        NULL AS "Дата Оплаты РТУ",
        NULL AS "Дата КР док.основ"
    FROM _Document345 AS d
    WHERE EXISTS (
        SELECT 1
        FROM _AccumRg16554 AS t1
        WHERE t1._Fld16557_RRRef = d._IDRRef
            AND CONVERT(nvarchar(20), t1._Fld16557_RTRef, 2) = '00000159'
    )
    UNION ALL
    SELECT
        _IDRRef AS "DocumentID",
        _Number AS "Номер документа",
        _Date_Time AS "Дата документа",
        _Fld10800_RRRef AS "Документ основание",
        _Fld10798RRef AS "Ответственный пользователь за документ",
        _Fld10785RRef AS "Подразделение документ",
        NULL AS "Дата Поступления ППИ",
        NULL AS "Дата Оплаты РТУ",
        NULL AS "Дата КР док.основ"
    FROM _Document422 AS d
    WHERE EXISTS (
        SELECT 1
        FROM _AccumRg16554 AS t1
        WHERE t1._Fld16557_RRRef = d._IDRRef
            AND CONVERT(nvarchar(20), t1._Fld16557_RTRef, 2) = '000001A6'
    )
    UNION ALL
    SELECT
        _IDRRef AS "DocumentID",
        _Number AS "Номер документа",
        _Date_Time AS "Дата документа",
        NULL AS "Документ основание",
        _Fld9911RRef AS "Ответственный пользователь за документ",
        _Fld9901RRef AS "Подразделение документ",
        NULL AS "Дата Поступления ППИ",
        NULL AS "Дата Оплаты РТУ",
        NULL AS "Дата КР док.основ"
    FROM _Document410 AS d
    WHERE EXISTS (
        SELECT 1
        FROM _AccumRg16554 AS t1
        WHERE t1._Fld16557_RRRef = d._IDRRef
            AND CONVERT(nvarchar(20), t1._Fld16557_RTRef, 2) = '0000019A'
    )
    UNION ALL
    SELECT
        _IDRRef AS "DocumentID",
        _Number AS "Номер документа",
        _Date_Time AS "Дата документа",
        _Fld34732_RRRef AS "Документ основание",
        _Fld6088RRef AS "Ответственный пользователь за документ",
        _Fld6087RRef AS "Подразделение документ",
        NULL AS "Дата Поступления ППИ",
        NULL AS "Дата Оплаты РТУ",
        NULL AS "Дата КР док.основ"
    FROM _Document313 AS d
    WHERE EXISTS (
        SELECT 1
        FROM _AccumRg16554 AS t1
        WHERE t1._Fld16557_RRRef = d._IDRRef
            AND CONVERT(nvarchar(20), t1._Fld16557_RTRef, 2) = '00000139'
    )
    UNION ALL
    SELECT
        _IDRRef AS "DocumentID",
        _Number AS "Номер документа",
        _Date_Time AS "Дата документа",
        NULL AS "Документ основание",
        _Fld6380RRef AS "Ответственный пользователь за документ",
        NULL AS "Подразделение документ",
        NULL AS "Дата Поступления ППИ",
        NULL AS "Дата Оплаты РТУ",
        NULL AS "Дата КР док.основ"
    FROM _Document318 AS d
    WHERE EXISTS (
        SELECT 1
        FROM _AccumRg16554 AS t1
        WHERE t1._Fld16557_RRRef = d._IDRRef
            AND CONVERT(nvarchar(20), t1._Fld16557_RTRef, 2) = '0000013E'
    )
    UNION ALL
    SELECT
        _IDRRef AS "DocumentID",
        _Number AS "Номер документа",
        _Date_Time AS "Дата документа",
        _Fld19732_RRRef AS "Документ основание",
        _Fld19734RRef AS "Ответственный пользователь за документ",
        NULL AS "Подразделение документ",
        NULL AS "Дата Поступления ППИ",
        NULL AS "Дата Оплаты РТУ",
        NULL AS "Дата КР док.основ"
    FROM _Document19731 AS d
    WHERE EXISTS (
        SELECT 1
        FROM _AccumRg16554 AS t1
        WHERE t1._Fld16557_RRRef = d._IDRRef
            AND CONVERT(nvarchar(20), t1._Fld16557_RTRef, 2) = '00004D13'
    )
    UNION ALL
    SELECT
        d._IDRRef AS "DocumentID",
        d._Number AS "Номер документа",
        d._Date_Time AS "Дата документа",
        NULL AS "Документ основание",
        d._Fld23878RRef AS "Ответственный пользователь за документ",
        d._Fld23864RRef AS "Подразделение документ",
        NULL AS "Дата Поступления ППИ",
        CASE
        	WHEN CONVERT(varchar(36), d._Fld23889_RTRef, 2) = '000001B8'
            THEN COALESCE(t4._Fld33074_T, t3._Fld11606)
            ELSE NULL
        END AS "Дата Оплаты РТУ",
        CASE
        	WHEN CONVERT(varchar(36), d._Fld23889_RTRef, 2) = '00005D31'
            THEN t2._Date_Time
            ELSE NULL
        END AS "Дата КР док.основ"
    FROM _Document23857 AS d
    LEFT JOIN _Document23857 t2 ON t2._IDRref = d._Fld23889_RRRef AND CONVERT(varchar(36), d._Fld23889_RTRef, 2) = '00005D31'
    LEFT JOIN _Document440 t3 ON t3._IDRref = d._Fld23889_RRRef AND CONVERT(varchar(36), d._Fld23889_RTRef, 2) = '000001B8'
    LEFT JOIN _InfoRg33071 t4 ON
    	CONVERT(varchar(36), d._Fld23889_RTRef, 2) = '000001B8'
        AND d._IDRref = t4._Fld33072_RRRef
        AND CONVERT(varchar(36), t4._Fld33072_RTRef, 2) = '000001B8'
        AND t4._Fld33073 = 'ДатаОплаты'
    WHERE EXISTS (
        SELECT 1
        FROM _AccumRg16554 AS t1
        WHERE t1._Fld16557_RRRef = d._IDRRef
            AND CONVERT(nvarchar(20), t1._Fld16557_RTRef, 2) = '00005D31'
    )
    UNION ALL
    SELECT
        _IDRRef AS "DocumentID",
        _Number AS "Номер документа",
        _Date_Time AS "Дата документа",
        NULL AS "Документ основание",
        _Fld24019RRef AS "Ответственный пользователь за документ",
        _Fld24020RRef AS "Подразделение документ",
        NULL AS "Дата Поступления ППИ",
        NULL AS "Дата Оплаты РТУ",
        NULL AS "Дата КР док.основ"
    FROM _Document23858 AS d
    WHERE EXISTS (
        SELECT 1
        FROM _AccumRg16554 AS t1
        WHERE t1._Fld16557_RRRef = d._IDRRef
            AND CONVERT(nvarchar(20), t1._Fld16557_RTRef, 2) = '00005D32'
    )
    UNION ALL
    SELECT
        _IDRRef AS "DocumentID",
        _Number AS "Номер документа",
        _Date_Time AS "Дата документа",
        _Fld9193_RRRef AS "Документ основание",
        _Fld9209RRef AS "Ответственный пользователь за документ",
        _Fld9226RRef AS "Подразделение документ",
        NULL AS "Дата Поступления ППИ",
        NULL AS "Дата Оплаты РТУ",
        NULL AS "Дата КР док.основ"
    FROM _Document398 AS d
    WHERE EXISTS (
        SELECT 1
        FROM _AccumRg16554 AS t1
        WHERE t1._Fld16557_RRRef = d._IDRRef
            AND CONVERT(nvarchar(20), t1._Fld16557_RTRef, 2) = '0000018E'
    )
    UNION ALL
    SELECT
        _IDRRef AS "DocumentID",
        _Number AS "Номер документа",
        _Date_Time AS "Дата документа",
        _Fld9276_RRRef AS "Документ основание",
        _Fld9288RRef AS "Ответственный пользователь за документ",
        _Fld9320RRef AS "Подразделение документ",
        _Fld19983 AS "Дата Поступления ППИ",
        NULL AS "Дата Оплаты РТУ",
        NULL AS "Дата КР док.основ"
    FROM _Document399 AS d
    WHERE EXISTS (
        SELECT 1
        FROM _AccumRg16554 AS t1
        WHERE t1._Fld16557_RRRef = d._IDRRef
            AND CONVERT(nvarchar(20), t1._Fld16557_RTRef, 2) = '0000018F'
    )
    UNION ALL
    SELECT
        _IDRRef AS "DocumentID",
        _Number AS "Номер документа",
        _Date_Time AS "Дата документа",
        _Fld9592_RRRef AS "Документ основание",
        _Fld9602RRef AS "Ответственный пользователь за документ",
        _Fld9622RRef AS "Подразделение документ",
        NULL AS "Дата Поступления ППИ",
        NULL AS "Дата Оплаты РТУ",
        NULL AS "Дата КР док.основ"
    FROM _Document403 AS d
    WHERE EXISTS (
        SELECT 1
        FROM _AccumRg16554 AS t1
        WHERE t1._Fld16557_RRRef = d._IDRRef
            AND CONVERT(nvarchar(20), t1._Fld16557_RTRef, 2) = '00000193'
    )
    UNION ALL
    SELECT
        _IDRRef AS "DocumentID",
        _Number AS "Номер документа",
        _Date_Time AS "Дата документа",
        NULL AS "Документ основание",
        _Fld8499RRef AS "Ответственный пользователь за документ",
        _Fld8503RRef AS "Подразделение документ",
        NULL AS "Дата Поступления ППИ",
        NULL AS "Дата Оплаты РТУ",
        NULL AS "Дата КР док.основ"
    FROM _Document374 AS d
    WHERE EXISTS (
        SELECT 1
        FROM _AccumRg16554 AS t1
        WHERE t1._Fld16557_RRRef = d._IDRRef
            AND CONVERT(nvarchar(20), t1._Fld16557_RTRef, 2) = '00000176'
    )
    UNION ALL
    SELECT
        _IDRRef AS "DocumentID",
        _Number AS "Номер документа",
        _Date_Time AS "Дата документа",
        NULL AS "Документ основание",
        _Fld9789RRef AS "Ответственный пользователь за документ",
        _Fld9793RRef AS "Подразделение документ",
        NULL AS "Дата Поступления ППИ",
        NULL AS "Дата Оплаты РТУ",
        NULL AS "Дата КР док.основ"
    FROM _Document409 AS d
    WHERE EXISTS (
        SELECT 1
        FROM _AccumRg16554 AS t1
        WHERE t1._Fld16557_RRRef = d._IDRRef
            AND CONVERT(nvarchar(20), t1._Fld16557_RTRef, 2) = '00000199'
    )
    UNION ALL
    SELECT
        _IDRRef AS "DocumentID",
        _Number AS "Номер документа",
        _Date_Time AS "Дата документа",
        NULL AS "Документ основание",
        _Fld8815RRef AS "Ответственный пользователь за документ",
        _Fld8816RRef AS "Подразделение документ",
        NULL AS "Дата Поступления ППИ",
        NULL AS "Дата Оплаты РТУ",
        NULL AS "Дата КР док.основ"
    FROM _Document384 AS d
    WHERE EXISTS (
        SELECT 1
        FROM _AccumRg16554 AS t1
        WHERE t1._Fld16557_RRRef = d._IDRRef
            AND CONVERT(nvarchar(20), t1._Fld16557_RTRef, 2) = '00000180'
    )
    UNION ALL
    SELECT
        _IDRRef AS "DocumentID",
        _Number AS "Номер документа",
        _Date_Time AS "Дата документа",
        NULL AS "Документ основание",
        _Fld2639RRef AS "Ответственный пользователь за документ",
        _Fld2632RRef AS "Подразделение документ",
        NULL AS "Дата Поступления ППИ",
        NULL AS "Дата Оплаты РТУ",
        NULL AS "Дата КР док.основ"
    FROM _Document211 AS d
    WHERE EXISTS (
        SELECT 1
        FROM _AccumRg16554 AS t1
        WHERE t1._Fld16557_RRRef = d._IDRRef
            AND CONVERT(nvarchar(20), t1._Fld16557_RTRef, 2) = '000000D3'
    )
    UNION ALL
    SELECT
        _IDRRef AS "DocumentID",
        _Number AS "Номер документа",
        _Date_Time AS "Дата документа",
        NULL AS "Документ основание",
        _Fld4171RRef AS "Ответственный пользователь за документ",
        _Fld4157RRef AS "Подразделение документ",
        NULL AS "Дата Поступления ППИ",
        NULL AS "Дата Оплаты РТУ",
        NULL AS "Дата КР док.основ"
    FROM _Document246 AS d
    WHERE EXISTS (
        SELECT 1
        FROM _AccumRg16554 AS t1
        WHERE t1._Fld16557_RRRef = d._IDRRef
            AND CONVERT(nvarchar(20), t1._Fld16557_RTRef, 2) = '000000F6'
    )
    UNION ALL
    SELECT
        _IDRRef AS "DocumentID",
        _Number AS "Номер документа",
        _Date_Time AS "Дата документа",
        _Fld11275_RRRef AS "Документ основание",
        _Fld11274RRef AS "Ответственный пользователь за документ",
        _Fld11258RRef AS "Подразделение документ",
        NULL AS "Дата Поступления ППИ",
        NULL AS "Дата Оплаты РТУ",
        NULL AS "Дата КР док.основ"
    FROM _Document431 AS d
    WHERE EXISTS (
        SELECT 1
        FROM _AccumRg16554 AS t1
        WHERE t1._Fld16557_RRRef = d._IDRRef
            AND CONVERT(nvarchar(20), t1._Fld16557_RTRef, 2) = '000001AF'
    )
    UNION ALL
    SELECT
        _IDRRef AS "DocumentID",
        _Number AS "Номер документа",
        _Date_Time AS "Дата документа",
        NULL AS "Документ основание",
        _Fld4046RRef AS "Ответственный пользователь за документ",
        _Fld4043RRef AS "Подразделение документ",
        NULL AS "Дата Поступления ППИ",
        NULL AS "Дата Оплаты РТУ",
        NULL AS "Дата КР док.основ"
    FROM _Document245 AS d
    WHERE EXISTS (
        SELECT 1
        FROM _AccumRg16554 AS t1
        WHERE t1._Fld16557_RRRef = d._IDRRef
            AND CONVERT(nvarchar(20), t1._Fld16557_RTRef, 2) = '000000F5'
    )
    UNION ALL
    SELECT
        _IDRRef AS "DocumentID",
        _Number AS "Номер документа",
        _Date_Time AS "Дата документа",
        _Fld9443_RRRef AS "Документ основание",
        _Fld9460RRef AS "Ответственный пользователь за документ",
        _Fld9479RRef AS "Подразделение документ",
        NULL AS "Дата Поступления ППИ",
        NULL AS "Дата Оплаты РТУ",
        NULL AS "Дата КР док.основ"
    FROM _Document401 AS d
    WHERE EXISTS (
        SELECT 1
        FROM _AccumRg16554 AS t1
        WHERE t1._Fld16557_RRRef = d._IDRRef
            AND CONVERT(nvarchar(20), t1._Fld16557_RTRef, 2) = '00000191'
    )
    UNION ALL
    SELECT
        _IDRRef AS "DocumentID",
        _Number AS "Номер документа",
        _Date_Time AS "Дата документа",
        NULL AS "Документ основание",
        _Fld3541RRef AS "Ответственный пользователь за документ",
        NULL AS "Подразделение документ",
        NULL AS "Дата Поступления ППИ",
        NULL AS "Дата Оплаты РТУ",
        NULL AS "Дата КР док.основ"
    FROM _Document230 AS d
    WHERE EXISTS (
        SELECT 1
        FROM _AccumRg16554 AS t1
        WHERE t1._Fld16557_RRRef = d._IDRRef
            AND CONVERT(nvarchar(20), t1._Fld16557_RTRef, 2) = '000000E6'
    )
    UNION ALL
    SELECT
        _IDRRef AS "DocumentID",
        _Number AS "Номер документа",
        _Date_Time AS "Дата документа",
        NULL AS "Документ основание",
        _Fld7884RRef AS "Ответственный пользователь за документ",
        _Fld7879RRef AS "Подразделение документ",
        NULL AS "Дата Поступления ППИ",
        NULL AS "Дата Оплаты РТУ",
        NULL AS "Дата КР док.основ"
    FROM _Document365 AS d
    WHERE EXISTS (
        SELECT 1
        FROM _AccumRg16554 AS t1
        WHERE t1._Fld16557_RRRef = d._IDRRef
            AND CONVERT(nvarchar(20), t1._Fld16557_RTRef, 2) = '0000016D'
    )
    UNION ALL
    SELECT
        _IDRRef AS "DocumentID",
        _Number AS "Номер документа",
        _Date_Time AS "Дата документа",
        _Fld4649RRef AS "Документ основание",
        NULL AS "Ответственный пользователь за документ",
        _Fld21487RRef AS "Подразделение документ",
        NULL AS "Дата Поступления ППИ",
        NULL AS "Дата Оплаты РТУ",
        NULL AS "Дата КР док.основ"
    FROM _Document263 AS d
    WHERE EXISTS (
        SELECT 1
        FROM _AccumRg16554 AS t1
        WHERE t1._Fld16557_RRRef = d._IDRRef
            AND CONVERT(nvarchar(20), t1._Fld16557_RTRef, 2) = '00000107'
    )
),
partners_managers_prep AS
(
SELECT DISTINCT
    t2._Fld34264RRef 			  AS "guid Контрагента"
    ,t4._IDRref					  AS "guid Ответственный Привязка"
    ,t4._Code			     	  AS "Ответственный Привязка КодОбмена"
    ,t4._Description 		  	  AS "Ответственный Привязка"
FROM
	_Document34260 t1
    left join _Document34260_VT34262 t2 ON t1._IDRref = t2._Document34260_IDRRef
    left join _Reference85 t3 ON t2._Fld34264RRef = t3._IDRref
    left join _Reference197 t4 ON t2._Fld34267RRef = t4._IDRref
WHERE
	t1._Number = '000000005'
    AND t2._Fld34267RRef IS NOT NULL
    AND t2._Fld34267RRef <> ''
),
partners_managers AS
(
select
	pmp.*
    ,COUNT(pmp.[guid Ответственный Привязка]) OVER (PARTITION BY pmp.[guid Контрагента]) AS "Ответственный Привязка Количество"
from
	partners_managers_prep pmp
),
transport_managers AS
(
select
	t2._Fld32915RRef 			AS "DocumentID"
    ,t4._IDRref	                AS "guid Ответственный тран"
	,t4._Code 	                AS "Ответственный тран КодОбмена"
	,t4._Description            AS "Ответственный тран"
	,ROW_NUMBER() OVER (PARTITION BY t2._Fld32915RRef ORDER BY t1._Date_Time) AS rn
from
	_Document20806 t1
    LEFT JOIN _Document20806_VT30052 t2 ON t1._IDRRef = t2._Document20806_IDRRef
    LEFT JOIN _Reference129 t3 ON t2._Fld32902RRef = t3._IDRRef
    LEFT JOIN _Reference197 t4 ON t3._Fld1914RRef = t4._IDRref
where
    CONVERT(nvarchar(32), t2._Fld32915RRef, 2) <> '00000000000000000000000000000000'
    AND t3._Fld1914RRef IS NOT NULL
    AND t2._Fld32915RRef IS NOT NULL
),
ct2 AS
(
SELECT
    t1._Period                        AS "Период"
    ,t1._RecordKind                   AS "ВидДвижения"
    ,t1._Fld16561RRef                 AS "guid Контрагента"
    ,t1._Fld16555RRef                 AS "guid Договора"
    ,t1._Fld16557_RRRef               AS "guid Документа расчетов"
    ,t1._Fld16562                     AS "СуммаВзаиморасчетов"
    ,t1._Fld16563                     AS "СуммаРегл"
    ,t1._LineNo					      AS "НомерСтроки"
    ,t1._Active					      AS "Активность"
    ,CASE
        WHEN CONVERT(NVARCHAR(50), t2._Fld1337RRef, 2) = 'AC8500304833A43311DC78A9B866A2FB'
            or CONVERT(NVARCHAR(50), t2._Fld1337RRef, 2) = 'A18450505450303011DABD67039647B8'
        THEN
            CASE t1._RecordKind
         	    WHEN 0 THEN t1._Fld16562
                ELSE 0 - t1._Fld16562
            END
        ELSE
            CASE t1._RecordKind
                WHEN 0 THEN t1._Fld16563
                ELSE 0 - t1._Fld16563
            END
        END AS "Сумма Расчетов Рубли"
    ,CASE t1._RecordKind
        WHEN 0 THEN t1._Fld16562
        ELSE 0 - t1._Fld16562
    END AS "Сумма Расчетов Валюта"
    ,CASE CONVERT(nvarchar(20), t1._Fld16557_RTRef, 2)
        WHEN '000001B8' THEN 'Реализация товаров и услуг'
        WHEN '0000019F' THEN 'Поступление товаров и услуг'
        WHEN '00000159' THEN 'Оплата от покупателя платежной картой'
        WHEN '000001A6' THEN 'Приходный кассовый ордер'
        WHEN '0000019A' THEN 'Поступление доп. расходов'
        WHEN '00000139' THEN 'Корректировка долга'
        WHEN '0000013E' THEN 'Корректировка записей регистров'
        WHEN '00004D13' THEN 'Сторно'
        WHEN '00005D31' THEN 'Корректировка реализации'
        WHEN '00005D32' THEN 'Корректировка поступления'
        WHEN '0000018E' THEN 'Платежное поручение входящее'
        WHEN '0000018F' THEN 'Платежное поручение исходящее'
        WHEN '00000193' THEN 'Платежный ордер на списание денежных средств'
        WHEN '00000176' THEN 'Передача ОС'
        WHEN '00000199' THEN 'Получение услуг по переработке'
        WHEN '00000180' THEN 'Переоценка валютных средств'
        WHEN '000000D3' THEN 'Авансовый отчет'
        WHEN '000000F6' THEN 'Возврат товаров поставщику'
        WHEN '000001AF' THEN 'Расходный кассовый ордер'
        WHEN '000000F5' THEN 'Возврат товаров от покупателя'
        WHEN '00000191' THEN 'Платежное требование полученное'
        WHEN '000000E6' THEN 'Ввод начальных остатков по взаиморасчетам'
        WHEN '0000016D' THEN 'Отчет комитенту (принципалу)'
        WHEN '00000107' THEN 'Документ расчетов с контрагентом (ручной учет)'
        ELSE 'Прочее'
    END AS "Тип документа расчетов"
    ,t2._Description			            AS "Договор Наименование"
    ,CASE
        WHEN t2._Fld1343 > 1095
        THEN 1095
        ELSE COALESCE(t2._Fld1343, 0)
    END                                     AS "Договор Отсрочка"
    ,t2.[_Fld1337RRef] 			            AS "Договор guidВалютаДоговора"
    ,t2."_Fld39158"				AS "Договор РасчетноеКоличествоДнейДоставки"
    ,t3.[_Description] 			            AS "Контрагент Наименование"
    ,du.[Номер документа]                   AS "Номер документа расчетов"
    ,du.[Дата документа]                    AS "Дата документа расчетов"
 	,t7._IDRref					            AS "guid Ответственный ДЗКЗ"
    ,t7.[_Code] 				            AS "Ответственный ДЗКЗ КодОбмена"
    ,t7.[_Description] 		  	            AS "Ответственный ДЗКЗ"
    ,t10._IDRref	                        AS "guid Ответственный ЗРС"
	,t10.[_Code] 	                        AS "Ответственный ЗРС КодОбмена"
	,t10._Description                       AS "Ответственный ЗРС"
	,t12._IDRref	                        AS "guid Ответственный док"
    ,t12.[_Code] 	                        AS "Ответственный док КодОбмена"
	,t12._Description                       AS "Ответственный док"
    ,t13._IDRref 		                    AS "guid Подразделения"
    ,t13._Description 	                    AS "Подразделение"
    ,t14.[guid Ответственный Привязка]
    ,t14.[Ответственный Привязка КодОбмена]
    ,t14.[Ответственный Привязка]
    ,t22.[guid Ответственный тран]
	,t22.[Ответственный тран КодОбмена]
	,t22.[Ответственный тран]
    ,CASE WHEN t15._Fld33073 IS NULL THEN 0 ELSE 1 END AS "Взаимозачеты"
    ,du.[Дата Поступления ППИ]
    ,du.[Дата Оплаты РТУ]
    ,du.[Дата КР док.основ]
    ,t17._IDRref	                        AS "guid Ответственный конт"
    ,t17._Code	                            AS "Ответственный конт КодОбмена"
	,t17._Description                       AS "Ответственный конт"
    ,CASE t18._EnumOrder
    	WHEN 0 THEN (CASE WHEN t15._Fld33073 IS NOT NULL THEN 'С покупателем' ELSE 'С поставщиком' END)
        WHEN 1 THEN 'С покупателем'
        WHEN 2 THEN 'С комитентом'
        WHEN 3 THEN 'С комиссионером'
        WHEN 4 THEN 'Прочее'
        WHEN 5 THEN 'С комиссионером (агентом) на закупку'
        WHEN 6 THEN 'С экспедитором на перевозку'
        ELSE 'не определено'
    	END									AS "Вид договора"
    ,CASE t19._Description
    	WHEN 'Руб' THEN 'RUB'
        WHEN 'руб.' THEN 'RUB'
        ELSE t19._Description
    END 									AS Currency
    ,t20._Fld14399_L						AS agency_factoring
    ,t21._Fld14399_L						AS payment_on_sale
FROM
	_AccumRg16554 t1
	LEFT JOIN CentralBaseUPP82.dbo._Reference52 as t2 on t1._Fld16555RRef = t2._IDRRef
	LEFT JOIN CentralBaseUPP82.dbo._Reference85 as t3 on t1._Fld16561RRef = t3._IDRRef
    LEFT JOIN DocumentsUnion du ON t1._Fld16557_RRRef = du.DocumentID
    LEFT JOIN CentralBaseUPP82.dbo._InfoRg14396 as t6 on
        t2._IDRRef = t6._Fld14397_RRRef
        AND convert(nvarchar(36), t6._Fld14398RRef, 2) = '86DECB0DDD21DF8646A84B32AEFB7095'
 	LEFT JOIN CentralBaseUPP82.dbo._Reference197 as t7 on t6._Fld14399_RRRef = t7._IDRRef
    LEFT JOIN _Document281 t8 ON du.[Документ основание] = t8._IDRref
    LEFT JOIN _Reference129 t9 ON t8._Fld5208RRef = t9._IDRRef
    LEFT JOIN _Reference197 t10 ON t9._Fld1914RRef = t10._IDRref
    LEFT JOIN _Reference129 t11 ON du.[Ответственный пользователь за документ] = t11._IDRRef
    LEFT JOIN _Reference197 t12 ON t11._Fld1914RRef = t12._IDRref
	LEFT JOIN _Reference126 t13 ON du.[Подразделение документ] = t13._IDRref
    LEFT JOIN partners_managers t14 ON t1._Fld16561RRef = t14.[guid Контрагента] AND t14.[Ответственный Привязка Количество] < 2
	LEFT JOIN _InfoRg33071 t15 ON
    	CONVERT(nvarchar(20), t1._Fld16557_RTRef, 2) = '0000019F'
    	AND t15._Fld33073 = 'Взаимозачет'
        AND t1._Fld16557_RRRef = t15._Fld33072_RRRef
    LEFT JOIN _InfoRg14396 as t16 on
    	t1._Fld16561RRef = t16._Fld14397_RRRef
    	AND CONVERT(varchar(36), t16._Fld14398RRef, 2) = '9D15FFB67F0EC9334314CC24782F4078'
    LEFT JOIN _Reference197 t17 ON t16._Fld14399_RRRef = t17._IDRref
    LEFT JOIN _Enum560 t18 ON t2._Fld1354RRef = t18._IDRRef
    LEFT JOIN _Reference17 t19 ON t2._Fld1337RRef = t19._IDRRef
    LEFT JOIN _InfoRg14396 as t20 on
        t2._IDRRef = t20._Fld14397_RRRef
        AND convert(nvarchar(36), t20._Fld14398RRef, 2) = 'BAA7A4BF012C04CD11EE069F42E1060B'
    LEFT JOIN _InfoRg14396 as t21 on
        t2._IDRRef = t21._Fld14397_RRRef
        AND convert(nvarchar(36), t21._Fld14398RRef, 2) = '82FDC7EAAFAB469545E88AA2F14F4AD2'
    LEFT JOIN transport_managers as t22 on
    	convert(nvarchar(20), t1._Fld16557_RTRef, 2) = '000001B8'
        AND t1._Fld16557_RRRef = t22.DocumentID
        AND t22.rn = 1
WHERE
	convert(nvarchar(36), t1._Fld16560RRef, 2) = 'A18650505450303011DABE16E4607CA0'
    AND t1._Active = 01
),
ct3 AS
(
SELECT DISTINCT
    "guid Контрагента"
    ,"Контрагент Наименование"
	,"guid Договора"
    ,"Договор Наименование"
	,"guid Документа расчетов"
    ,"Тип документа расчетов"
    ,"Номер документа расчетов"
    ,"Дата документа расчетов"
    ,"Вид договора"
	,"Currency"
    ,COALESCE(agency_factoring, 0) AS "agency_factoring"
    ,COALESCE(payment_on_sale, 0) AS "payment_on_sale"
    ,SUM("Сумма Расчетов Рубли") OVER (PARTITION BY "guid Документа расчетов", "guid Договора", "guid Контрагента") AS "Сумма Расчетов Рубли Итог"
    ,SUM("Сумма Расчетов Валюта") OVER (PARTITION BY "guid Документа расчетов", "guid Договора", "guid Контрагента") AS "Сумма Расчетов Валюта Итог"
	,COALESCE(
    	DATEDIFF(dd, "Дата Поступления ППИ", GETDATE()) + 1,
    	DATEDIFF(dd, "Дата Оплаты РТУ", GETDATE()) + 1,
        DATEDIFF(dd, DATEADD(dd, [Договор Отсрочка]-"Договор РасчетноеКоличествоДнейДоставки", CAST([Дата КР док.основ] AS DATE)), GETDATE()) + 1,
        DATEDIFF(dd, DATEADD(dd, "Договор Отсрочка"-"Договор РасчетноеКоличествоДнейДоставки", CAST("Дата документа расчетов" AS DATE)), GETDATE()) + 1
        ) AS "Просрочка"
 	,"Договор Отсрочка"
 	,CASE
 	    WHEN CONVERT(VARCHAR(36), "guid Контрагента", 2) = 'AC8500304833A43311DC78A9A4276ACC'
 	    THEN NULL
 	    ELSE "guid Ответственный ДЗКЗ"
 	END                                                         AS "guid Ответственный ДЗКЗ"
 	,CASE
 	    WHEN CONVERT(VARCHAR(36), "guid Контрагента", 2) = 'AC8500304833A43311DC78A9A4276ACC'
 	    THEN NULL
 	    ELSE CONVERT(VARCHAR(255), "Ответственный ДЗКЗ КодОбмена")
 	END                                                         AS "Ответственный ДЗКЗ КодОбмена"
 	,CASE
 	    WHEN CONVERT(VARCHAR(36), "guid Контрагента", 2) = 'AC8500304833A43311DC78A9A4276ACC'
 	    THEN 'Комиссия банка'
 	    ELSE CONVERT(VARCHAR(255), "Ответственный ДЗКЗ")
 	END                                                         AS "Ответственный ДЗКЗ"
 	,CASE
 	    WHEN CONVERT(VARCHAR(36), "guid Контрагента", 2) = 'AC8500304833A43311DC78A9A4276ACC'
 	    THEN NULL
 	    ELSE "guid Ответственный Привязка"
 	END                                                         AS "guid Ответственный Привязка"
 	,CASE
 	    WHEN CONVERT(VARCHAR(36), "guid Контрагента", 2) = 'AC8500304833A43311DC78A9A4276ACC'
 	    THEN NULL
 	    ELSE CONVERT(VARCHAR(255), "Ответственный Привязка КодОбмена")
 	END                                                         AS "Ответственный Привязка КодОбмена"
 	,CASE
 	    WHEN CONVERT(VARCHAR(36), "guid Контрагента", 2) = 'AC8500304833A43311DC78A9A4276ACC'
 	    THEN 'Комиссия банка'
 	    ELSE CONVERT(VARCHAR(255), "Ответственный Привязка")
 	END   														AS "Ответственный Привязка"
 	,CASE
 	    WHEN CONVERT(VARCHAR(36), "guid Контрагента", 2) = 'AC8500304833A43311DC78A9A4276ACC'
 	    THEN NULL
 	    ELSE "guid Ответственный ЗРС"
 	END                                                         AS "guid Ответственный ЗРС"
 	,CASE
 	    WHEN CONVERT(VARCHAR(36), "guid Контрагента", 2) = 'AC8500304833A43311DC78A9A4276ACC'
 	    THEN NULL
 	    ELSE CONVERT(VARCHAR(255), "Ответственный ЗРС КодОбмена")
 	END                                                         AS "Ответственный ЗРС КодОбмена"
 	,CASE
 	    WHEN CONVERT(VARCHAR(36), "guid Контрагента", 2) = 'AC8500304833A43311DC78A9A4276ACC'
 	    THEN 'Комиссия банка'
 	    ELSE CONVERT(VARCHAR(255), "Ответственный ЗРС")
 	END   														AS "Ответственный ЗРС"
 	,CASE
 	    WHEN CONVERT(VARCHAR(36), "guid Контрагента", 2) = 'AC8500304833A43311DC78A9A4276ACC'
 	    THEN NULL
 	    ELSE "guid Ответственный док"
 	END                                                         AS "guid Ответственный док"
 	,CASE
 	    WHEN CONVERT(VARCHAR(36), "guid Контрагента", 2) = 'AC8500304833A43311DC78A9A4276ACC'
 	    THEN NULL
 	    ELSE CONVERT(VARCHAR(255), "Ответственный док КодОбмена")
 	END                                                         AS "Ответственный док КодОбмена"
 	,CASE
 	    WHEN CONVERT(VARCHAR(36), "guid Контрагента", 2) = 'AC8500304833A43311DC78A9A4276ACC'
 	    THEN 'Комиссия банка'
 	    ELSE CONVERT(VARCHAR(255), "Ответственный док")
 	END   														AS "Ответственный док"
 	,CASE
 	    WHEN CONVERT(VARCHAR(36), "guid Контрагента", 2) = 'AC8500304833A43311DC78A9A4276ACC'
 	    THEN NULL
 	    ELSE "guid Ответственный конт"
 	END                                                         AS "guid Ответственный конт"
 	,CASE
 	    WHEN CONVERT(VARCHAR(36), "guid Контрагента", 2) = 'AC8500304833A43311DC78A9A4276ACC'
 	    THEN NULL
 	    ELSE CONVERT(VARCHAR(255), "Ответственный конт КодОбмена")
 	END                                                         AS "Ответственный конт КодОбмена"
 	,CASE
 	    WHEN CONVERT(VARCHAR(36), "guid Контрагента", 2) = 'AC8500304833A43311DC78A9A4276ACC'
 	    THEN 'Комиссия банка'
 	    ELSE CONVERT(VARCHAR(255), "Ответственный конт")
 	END   														AS "Ответственный конт"
 	,CASE
 	    WHEN CONVERT(VARCHAR(36), "guid Контрагента", 2) = 'AC8500304833A43311DC78A9A4276ACC'
 	    THEN NULL
 	    ELSE "guid Ответственный тран"
 	END                                                         AS "guid Ответственный тран"
 	,CASE
 	    WHEN CONVERT(VARCHAR(36), "guid Контрагента", 2) = 'AC8500304833A43311DC78A9A4276ACC'
 	    THEN NULL
 	    ELSE CONVERT(VARCHAR(255), "Ответственный тран КодОбмена")
 	END                                                         AS "Ответственный тран КодОбмена"
 	,CASE
 	    WHEN CONVERT(VARCHAR(36), "guid Контрагента", 2) = 'AC8500304833A43311DC78A9A4276ACC'
 	    THEN 'Комиссия банка'
 	    ELSE CONVERT(VARCHAR(255), "Ответственный тран")
 	END   														AS "Ответственный тран"
    ,"guid Подразделения"
    ,"Подразделение"
    ,"Взаимозачеты"
FROM
    ct2
WHERE
	CONVERT(Date, "Период") <= CONVERT(Date, GETDATE())
)
SELECT DISTINCT
    CONVERT(UNIQUEIDENTIFIER, "guid Контрагента")                                               AS "PartnerID"
    ,CONVERT(VARCHAR(255),  '"'+REPLACE("Контрагент Наименование", '"', '""')+'"') 	            AS "PartnerName"
	,CONVERT(UNIQUEIDENTIFIER, "guid Договора")                                                 AS "ContractID"
    ,CONVERT(VARCHAR(255),  '"'+REPLACE("Договор Наименование", '"', '""')+'"')		            AS "ContractName"
    ,CONVERT(VARCHAR(255),  '"'+REPLACE("Вид договора", '"', '""')+'"')		                    AS "ContractType"
	,CONVERT(UNIQUEIDENTIFIER, "guid Документа расчетов")                                       AS "DocID"
    ,CONVERT(VARCHAR(255),  '"'+REPLACE("Тип документа расчетов", '"', '""')+'"')	            AS "DocType"
    ,CONVERT(VARCHAR(255),  '"'+REPLACE("Номер документа расчетов", '"', '""')+'"')	            AS "DocNumber"
    ,CONVERT(DATETIME2,     "Дата документа расчетов")			                                AS "DocDate"
    ,CONVERT(DECIMAL(12,2), "Сумма Расчетов Рубли Итог")				                        AS "DebitCreditRubSum"
    ,CONVERT(DECIMAL(12,2), "Сумма Расчетов Валюта Итог")				                        AS "DebitCreditCurSum"
    ,CONVERT(INT,           "Договор Отсрочка")                                                 AS "Contract_allowed_debt_period"
 	,CONVERT(INT,           "Просрочка")						                                AS "DelayDays"
 	,CONVERT(VARCHAR(255),  '"'+REPLACE("Currency", '"', '""')+'"')	                            AS "Currency"
 	,CONVERT(TINYINT,       "agency_factoring")                                                 AS "agency_factoring"
 	,CONVERT(TINYINT,       "payment_on_sale")                                                  AS "payment_on_sale"
    ,CONVERT(UNIQUEIDENTIFIER, "guid Ответственный ДЗКЗ")			                            AS "ResponsibleByContract_ID"
    ,CONVERT(VARCHAR(255),  '"'+REPLACE("Ответственный ДЗКЗ КодОбмена", '"', '""')+'"') 		AS "ResponsibleByContract_Code"
    ,CONVERT(VARCHAR(255),  '"'+REPLACE("Ответственный ДЗКЗ", '"', '""')+'"') 					AS "ResponsibleByContract_Name"
	,CONVERT(UNIQUEIDENTIFIER, "guid Ответственный Привязка")	                                AS "ResponsibleByPartnerManagerBinding_ID"
    ,CONVERT(VARCHAR(255),  '"'+REPLACE("Ответственный Привязка КодОбмена", '"', '""')+'"')		AS "ResponsibleByPartnerManagerBinding_Code"
    ,CONVERT(VARCHAR(255),  '"'+REPLACE("Ответственный Привязка", '"', '""')+'"')				AS "ResponsibleByPartnerManagerBinding_Name"
	,CONVERT(UNIQUEIDENTIFIER, "guid Ответственный ЗРС")		                                AS "ResponsibleByOrder_ID"
	,CONVERT(VARCHAR(255),  '"'+REPLACE("Ответственный ЗРС КодОбмена", '"', '""')+'"')			AS "ResponsibleByOrder_Code"
	,CONVERT(VARCHAR(255),  '"'+REPLACE("Ответственный ЗРС", '"', '""')+'"')					AS "ResponsibleByOrder_Name"
	,CONVERT(UNIQUEIDENTIFIER, "guid Ответственный док")		                                AS "ResponsibleByDoc_ID"
    ,CONVERT(VARCHAR(255),  '"'+REPLACE("Ответственный док КодОбмена", '"', '""')+'"')			AS "ResponsibleByDoc_Code"
	,CONVERT(VARCHAR(255),  '"'+REPLACE("Ответственный док", '"', '""')+'"')					AS "ResponsibleByDoc_Name"
    ,CONVERT(UNIQUEIDENTIFIER, "guid Ответственный конт")		                                AS "ResponsibleByPartner_ID"
	,CONVERT(VARCHAR(255),  '"'+REPLACE("Ответственный конт КодОбмена", '"', '""')+'"')			AS "ResponsibleByPartner_Code"
	,CONVERT(VARCHAR(255),  '"'+REPLACE("Ответственный конт", '"', '""')+'"')					AS "ResponsibleByPartner_Name"
    ,CONVERT(UNIQUEIDENTIFIER, "guid Ответственный тран")		                                AS "ResponsibleByTransport_ID"
	,CONVERT(VARCHAR(255),  '"'+REPLACE("Ответственный тран КодОбмена", '"', '""')+'"')			AS "ResponsibleByTransport_Code"
	,CONVERT(VARCHAR(255),  '"'+REPLACE("Ответственный тран", '"', '""')+'"')					AS "ResponsibleByTransport_Name"
    ,CONVERT(UNIQUEIDENTIFIER, "guid Подразделения")                                            AS "ResponsibleDepartment_ID"
    ,CONVERT(VARCHAR(255),  '"'+REPLACE("Подразделение", '"', '""')+'"')			            AS "ResponsibleDepartment_Name"
    ,CONVERT(TINYINT,       "Взаимозачеты")                                                     AS "is_offsets"
FROM
    ct3
WHERE
    "Сумма Расчетов Рубли Итог" <> 0
    AND "Номер документа расчетов" IS NOT NULL
ORDER BY
	CONVERT(UNIQUEIDENTIFIER, "guid Контрагента")
	,CONVERT(UNIQUEIDENTIFIER, "guid Договора")
	,CONVERT(UNIQUEIDENTIFIER, "guid Документа расчетов")
;
GO