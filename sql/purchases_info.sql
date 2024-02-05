-- Create the view
DROP VIEW IF EXISTS purchases_info;

CREATE VIEW purchases_info AS
SELECT
    student_id,
    CASE 
        WHEN (date_end < '2021-04-01') OR (date_start > '2021-06-30') THEN 0
        ELSE 1 
    END AS paid_q2_2021,
    CASE 
        WHEN (date_end < '2022-04-01') OR (date_start > '2022-06-30') THEN 0
        ELSE 1 
    END AS paid_q2_2022
FROM
(
    -- Sub-query created in the task "II. Re-Calculating a Subscription's End Date"
	SELECT 
		*
	FROM 
		`student_purchases_view`
) b;
