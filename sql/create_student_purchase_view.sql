use data_scientist_project;

-- Drop the view if it exists
DROP VIEW IF EXISTS student_purchases_view;

CREATE VIEW student_purchases_view AS
SELECT
    purchase_id,
    student_id,
    plan_id,
    date_purchased AS date_start,
    IF(date_refunded IS NOT NULL, date_refunded, 
        CASE
            WHEN plan_id = 0 THEN DATE_ADD(date_purchased, INTERVAL 1 MONTH)
            WHEN plan_id = 1 THEN DATE_ADD(date_purchased, INTERVAL 3 MONTH)
            WHEN plan_id = 2 THEN DATE_ADD(date_purchased, INTERVAL 12 MONTH)
            ELSE NULL
        END
    ) AS date_end,
    date_refunded
FROM
    student_purchases;
