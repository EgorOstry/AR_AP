delete_from_dst = f'''
DELETE FROM ReceivablePayableBalanceReport 
WHERE created_at = CONVERT(DATE, GETDATE())
'''

truncate_stage = '''
TRUNCATE TABLE ReceivablePayableBalanceReportStage;
'''


load_from_stage_to_dst = '''
-- OUTER APPLY здесь нужен чтобы отобрать только TOP 1 запись ORDER BY LastUpd DESC
-- через JOIN так сделать не получится
with ct1 AS
(
SELECT 
	replace(replace(replace(NameAn, 'ё', 'е'), 'Ё', 'Е'), 'Наталия', 'Наталья') COLLATE Cyrillic_General_CI_AS as NameAn
	,Kod
	,LastUpd
	,Sost
	--,row_number() OVER (PARTITION BY NameAn ORDER BY LastUpd DESC) AS rn
FROM
	[sqldrm].[ecmdrm].[dbo].[MBAnalit]
WHERE 
	Vid = 3119
),
ct2 AS 
(
SELECT
    s.PartnerID,
    s.PartnerName,
    s.ContractID,
    s.ContractName,
    s.ContractType,
    s.DocID,
    s.DocType,
    s.DocNumber,
    s.DocDate,
    s.DebitCreditRubSum,
    s.DebitCreditCurSum,
    s.Contract_allowed_debt_period,
    s.DelayDays,
    s.Currency,
    s.agency_factoring,
    s.payment_on_sale,
    s.ResponsibleByContract_ID,
    s.ResponsibleByContract_Code,
    replace(replace(replace(s.ResponsibleByContract_Name, 'ё', 'е'), 'Ё', 'Е'), 'Наталия', 'Наталья') as ResponsibleByContract_Name,
    s.ResponsibleByPartnerManagerBinding_ID,
    s.ResponsibleByPartnerManagerBinding_Code,
    replace(replace(replace(s.ResponsibleByPartnerManagerBinding_Name, 'ё', 'е'), 'Ё', 'Е'), 'Наталия', 'Наталья') as ResponsibleByPartnerManagerBinding_Name,
    s.ResponsibleByOrder_ID,
    s.ResponsibleByOrder_Code,
    replace(replace(replace(s.ResponsibleByOrder_Name, 'ё', 'е'), 'Ё', 'Е'), 'Наталия', 'Наталья') as ResponsibleByOrder_Name,
    s.ResponsibleByDoc_ID,
    s.ResponsibleByDoc_Code,
    replace(replace(replace(s.ResponsibleByDoc_Name, 'ё', 'е'), 'Ё', 'Е'), 'Наталия', 'Наталья') as ResponsibleByDoc_Name,
    s.ResponsibleByPartner_ID,
    s.ResponsibleByPartner_Code,
    replace(replace(replace(s.ResponsibleByPartner_Name, 'ё', 'е'), 'Ё', 'Е'), 'Наталия', 'Наталья') as ResponsibleByPartner_Name,
    s.ResponsibleByTransport_ID,
    s.ResponsibleByTransport_Code,
    replace(replace(replace(s.ResponsibleByTransport_Name, 'ё', 'е'), 'Ё', 'Е'), 'Наталия', 'Наталья') as ResponsibleByTransport_Name,    
    s.ResponsibleDepartment_ID,
    s.ResponsibleDepartment_Name,
    s.is_offsets,
    old.comment,
    CAST(GETDATE() as date) AS created_at
FROM 
	[SRVSAP].[CSSAPDB2].[dbo].[ReceivablePayableBalanceReportStage] AS s
	LEFT JOIN (
	    SELECT
	        PartnerID,
	        ContractID,
	        DocID,
	        comment,
	        ROW_NUMBER() OVER (
	            PARTITION BY PartnerID, ContractID, DocID
	            ORDER BY created_at DESC
	        ) AS rn
	    FROM 
	    	dbo.ReceivablePayableBalanceReport
	    -- WHERE 
	    	-- comment IS NOT NULL
	) AS old ON 
		s.PartnerID = old.PartnerID
    	AND s.ContractID = old.ContractID
    	AND s.DocID = old.DocID
WHERE old.rn = 1 OR old.rn IS NULL
)
INSERT INTO dbo.ReceivablePayableBalanceReport
(
    PartnerID,
    PartnerName,
    ContractID,
    ContractName,
    ContractType,
    DocID,
    DocType,
    DocNumber,
    DocDate,
    DebitCreditRubSum,
    DebitCreditCurSum,
    Contract_allowed_debt_period,
    DelayDays,
    Currency,
    agency_factoring,
    payment_on_sale,
    ResponsibleByContract_ID,
    ResponsibleByContract_Code,
    ResponsibleByContract_Name,
    ResponsibleByContract_Directum_Code,
    ResponsibleByContract_Directum_Sost,
    ResponsibleByPartnerManagerBinding_ID,
    ResponsibleByPartnerManagerBinding_Code,
    ResponsibleByPartnerManagerBinding_Name,
    ResponsibleByPartnerManagerBinding_Directum_Code,
    ResponsibleByPartnerManagerBinding_Directum_Sost,
    ResponsibleByOrder_ID,
    ResponsibleByOrder_Code,
    ResponsibleByOrder_Name,
    ResponsibleByOrder_Directum_Code,
    ResponsibleByOrder_Directum_Sost,
    ResponsibleByDoc_ID,
    ResponsibleByDoc_Code,
    ResponsibleByDoc_Name,
    ResponsibleByDoc_Directum_Code,
    ResponsibleByDoc_Directum_Sost,
    ResponsibleByPartner_ID,
    ResponsibleByPartner_Code,
    ResponsibleByPartner_Name,
    ResponsibleByPartner_Directum_Code,
    ResponsibleByPartner_Directum_Sost,
    ResponsibleByTransport_ID,    
    ResponsibleByTransport_Code,
    ResponsibleByTransport_Name,
    ResponsibleByTransport_Directum_Code,
    ResponsibleByTransport_Directum_Sost,    
    ResponsibleDepartment_ID,
    ResponsibleDepartment_Name,
    is_offsets,
    comment,
    created_at
)
select
    ct2.PartnerID,
    ct2.PartnerName,
    ct2.ContractID,
    ct2.ContractName,
    ct2.ContractType,
    ct2.DocID,
    ct2.DocType,
    ct2.DocNumber,
    ct2.DocDate,
    ct2.DebitCreditRubSum,
    ct2.DebitCreditCurSum,
    ct2.Contract_allowed_debt_period,
    ct2.DelayDays,
    ct2.Currency,
    ct2.agency_factoring,
    ct2.payment_on_sale,    
    ct2.ResponsibleByContract_ID,
    ct2.ResponsibleByContract_Code,
    ct2.ResponsibleByContract_Name,
    t1.Kod AS ResponsibleByContract_Directum_Code,
    t1.Sost AS ResponsibleByContract_Directum_Sost,
    ct2.ResponsibleByPartnerManagerBinding_ID,
    ct2.ResponsibleByPartnerManagerBinding_Code,
    ct2.ResponsibleByPartnerManagerBinding_Name,
    t2.Kod AS ResponsibleByPartnerManagerBinding_Directum_Code,
    t2.Sost AS ResponsibleByPartnerManagerBinding_Directum_Sost,
    ct2.ResponsibleByOrder_ID,
    ct2.ResponsibleByOrder_Code,
    ct2.ResponsibleByOrder_Name,
    t3.Kod AS ResponsibleByOrder_Directum_Code,
    t3.Sost AS ResponsibleByOrder_Directum_Sost,
    ct2.ResponsibleByDoc_ID,
    ct2.ResponsibleByDoc_Code,
    ct2.ResponsibleByDoc_Name,
    t4.Kod AS ResponsibleByDoc_Directum_Code,
    t4.Sost AS ResponsibleByDoc_Directum_Sost,
    ct2.ResponsibleByPartner_ID,
    ct2.ResponsibleByPartner_Code,
    ct2.ResponsibleByPartner_Name,
    t5.Kod AS ResponsibleByPartner_Directum_Code,
    t5.Sost AS ResponsibleByPartner_Directum_Sost,
    ct2.ResponsibleByTransport_ID,
    ct2.ResponsibleByTransport_Code,
    ct2.ResponsibleByTransport_Name,
    t6.Kod AS ResponsibleByTransport_Directum_Code,
    t6.Sost AS ResponsibleByTransport_Directum_Sost,    
    ct2.ResponsibleDepartment_ID,
    ct2.ResponsibleDepartment_Name,
    ct2.is_offsets,
    ct2.comment,
    ct2.created_at
from
	ct2
    OUTER APPLY (
       SELECT TOP 1 Kod, Sost
       FROM ct1
       WHERE NameAn = ct2.ResponsibleByContract_Name
       ORDER BY LastUpd DESC
    ) AS t1
    OUTER APPLY (
       SELECT TOP 1 Kod, Sost
       FROM ct1
       WHERE NameAn = ct2.ResponsibleByPartnerManagerBinding_Name
       ORDER BY LastUpd DESC
    ) AS t2
    OUTER APPLY (
       SELECT TOP 1 Kod, Sost
       FROM ct1
       WHERE NameAn = ct2.ResponsibleByOrder_Name
       ORDER BY LastUpd DESC
    ) AS t3
    OUTER APPLY (
       SELECT TOP 1 Kod, Sost
       FROM ct1
       WHERE NameAn = ct2.ResponsibleByDoc_Name
       ORDER BY LastUpd DESC
    ) AS t4
    OUTER APPLY (
       SELECT TOP 1 Kod, Sost
       FROM ct1
       WHERE NameAn = ct2.ResponsibleByPartner_Name
       ORDER BY LastUpd DESC
    ) AS t5
    OUTER APPLY (
       SELECT TOP 1 Kod, Sost
       FROM ct1
       WHERE NameAn = ct2.ResponsibleByTransport_Name
       ORDER BY LastUpd DESC
    ) AS t6    
ORDER BY 
	ct2.PartnerID, ct2.ContractID, ct2.DocID
;
'''

select_from_dst_with_comments = '''
SELECT
    PartnerID,
    PartnerName,
    ContractID,
    ContractName,
    ContractType,
    DocID,
    DocType,
    DocNumber,
    DocDate,
    DebitCreditRubSum,
    DebitCreditCurSum,    
    Contract_allowed_debt_period,
    DelayDays,
    Currency,
    agency_factoring,
    payment_on_sale,
    ResponsibleByContract_ID,
    ResponsibleByContract_Code,
    ResponsibleByContract_Name,
    ResponsibleByContract_Directum_Code,
    ResponsibleByPartnerManagerBinding_ID,
    ResponsibleByPartnerManagerBinding_Code,
    ResponsibleByPartnerManagerBinding_Name,
    ResponsibleByPartnerManagerBinding_Directum_Code,
    ResponsibleByOrder_ID,
    ResponsibleByOrder_Code,
    ResponsibleByOrder_Name,
    ResponsibleByOrder_Directum_Code,
    ResponsibleByDoc_ID,
    ResponsibleByDoc_Code,
    ResponsibleByDoc_Name,
    ResponsibleByDoc_Directum_Code,
    ResponsibleByPartner_ID,
    ResponsibleByPartner_Code,
    ResponsibleByPartner_Name,
    ResponsibleByPartner_Directum_Code,
    ResponsibleByTransport_ID,
    ResponsibleByTransport_Code,
    ResponsibleByTransport_Name,
    ResponsibleByTransport_Directum_Code,    
    ResponsibleDepartment_ID,
    ResponsibleDepartment_Name,
    is_offsets,
    comment,
    created_at
FROM dbo.ReceivablePayableBalanceReport
WHERE created_at = CAST(GETDATE() as date)
;
'''


select_from_dst_for_excels = '''
SELECT 
	PartnerID AS Контрагент_ID
	,PartnerName AS Контрагент
	,ContractID AS Договор_ID
	,ContractName AS Договор
	,COALESCE(ResponsibleByPartnerManagerBinding_Name, ResponsibleByTransport_Name, ResponsibleByContract_Name, ResponsibleByOrder_Name, ResponsibleByDoc_Name) AS Ответственный
	,CONCAT(DocType, ' ', DocNumber, ' от ', FORMAT(DocDate, 'dd.MM.yyyy H:mm:ss')) AS "Документ расчета с контрагентом"
	,CASE 
		WHEN DelayDays > 0 AND DelayDays <= 10 AND DebitCreditRubSum > 0 
		THEN DebitCreditRubSum
		ELSE 0
	END AS "<= 10 дней"
	,CASE 
		WHEN DelayDays > 10 AND DebitCreditRubSum > 0 
		THEN DebitCreditRubSum
		ELSE 0
	END AS "> 10 дней"
	,CASE 
		WHEN DelayDays > 0 AND DelayDays <= 10 AND DebitCreditRubSum > 0 
		THEN DebitCreditRubSum
		ELSE 0
	END
	+
	CASE 
		WHEN DelayDays > 10 AND DebitCreditRubSum > 0 
		THEN DebitCreditRubSum
		ELSE 0
	END AS Итог
	,CASE 
		WHEN DebitCreditRubSum < 0 AND is_offsets = 1
		THEN DebitCreditRubSum
		ELSE 0
	END AS "Сумма взаимозачетов"
	,CASE 
		WHEN DelayDays > 0 AND DelayDays <= 10 AND DebitCreditRubSum > 0 
		THEN DebitCreditRubSum
		ELSE 0
	END
	+
	CASE 
		WHEN DelayDays > 10 AND DebitCreditRubSum > 0 
		THEN DebitCreditRubSum
		ELSE 0
	END
	+
	CASE 
		WHEN DebitCreditRubSum < 0 AND is_offsets = 1
		THEN DebitCreditRubSum
		ELSE 0
	END AS "Итог с учетом взаимозачетов"
	,comment AS "Актуальный комментарий"
FROM 
	ReceivablePayableBalanceReport t1
WHERE 
	created_at = CAST(GETDATE() as date) 
	AND ((DebitCreditRubSum > 0 AND DelayDays > 0) OR (DebitCreditRubSum < 0 AND is_offsets = 1)) 
	AND COALESCE(ResponsibleByPartnerManagerBinding_Directum_Sost, ResponsibleByTransport_Directum_Sost, ResponsibleByContract_Directum_Sost,ResponsibleByOrder_Directum_Sost, ResponsibleByDoc_Directum_Sost) <> 'З'
	AND agency_factoring = 0
	AND payment_on_sale = 0
'''

get_users_list = '''
select distinct 
    NameAn, Kod
from 
	[dbo].[MBAnalit] 
Where 
	Vid = 3119 
;
'''

insert_task_id = '''
UPDATE ReceivablePayableBalanceReport
SET task_id = :task_id
WHERE
    created_at = CAST(GETDATE() AS Date)
    AND COALESCE(ResponsibleByPartnerManagerBinding_Directum_Code, ResponsibleByTransport_Directum_Code, ResponsibleByContract_Directum_Code, ResponsibleByOrder_Directum_Code, ResponsibleByDoc_Directum_Code) = :user_code
    AND ((DebitCreditRubSum > 0 AND DelayDays > 0) OR (DebitCreditRubSum < 0 AND is_offsets = 1))
;
'''

get_tasks_to_export = '''
SELECT DISTINCT
    task_id
FROM
    ReceivablePayableBalanceReport
WHERE
    created_at = 
        (
        SELECT MAX(created_at) as last_date
        FROM ReceivablePayableBalanceReport
        )
    AND task_id is not NULL
;
'''

truncate_comments_stage = '''
truncate table ReceivablePayableBalanceReportCommentsStage;
'''

update_comments = '''
UPDATE rp
SET rp.comment = cs.comment
FROM ReceivablePayableBalanceReport rp
LEFT JOIN ReceivablePayableBalanceReportCommentsStage cs ON 
    COALESCE(rp.ResponsibleByPartnerManagerBinding_Directum_Code, rp.ResponsibleByTransport_Directum_Code, rp.ResponsibleByContract_Directum_Code, rp.ResponsibleByOrder_Directum_Code, rp.ResponsibleByDoc_Directum_Code) = cs.UserCode
    AND rp.PartnerName = cs.PartnerName
WHERE
    rp.created_at = (SELECT MAX(created_at) FROM ReceivablePayableBalanceReport)
'''

truncate_mapping = '''
truncate table ReceivablePayableBalanceReportTasksExcelsMapping;
'''

insert_mapping = '''
insert into ReceivablePayableBalanceReportTasksExcelsMapping VALUES
(:task_id, :excel_report_name);
'''

select_mapping = '''
select * from ReceivablePayableBalanceReportTasksExcelsMapping
;
'''