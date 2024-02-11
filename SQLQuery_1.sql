WITH student_total_watched AS (
    SELECT
        student_id,
        ROUND(SUM(seconds_watched) / 60, 2) AS minutes_watched
    FROM
        student_video_watched
    WHERE
        YEAR(date_watched) BETWEEN 2021 AND 2022
    GROUP BY
        student_id
)


SELECT 
    stw.student_id,
    stw.minutes_watched,
    pi.paid_q2_2021,
    pi.paid_q2_2022,
from
    student_total_watched stw
join
    purchases_info  pi on stw.student_id=pi.student_id

INTO OUTFILE '/path/to/your/directory/result.csv'

SELECT * FROM student_total_watched;