# Write your MySQL query statement below
SELECT 
    st.student_id,
    st.student_name,
    sb.subject_name,
    count(ex.subject_name) AS attended_exams
FROM Students AS st
CROSS JOIN Subjects AS sb
LEFT JOIN Examinations AS ex
ON ex.student_id =  st.student_id AND ex.subject_name = sb.subject_name
GROUP BY st.student_id,sb.subject_name,st.student_name
ORDER BY st.student_id , sb.subject_name ASC

-- select
-- st.student_id,
-- st.student_name,
-- s.subject_name,
-- count(e.subject_name) attended_exams
-- from
-- students st
-- cross join subjects s
-- left join Examinations e
-- on
-- e.student_id=st.student_id and
-- e.subject_name =s.subject_name
-- group by st.student_id,s.subject_name,st.student_name
-- order by st.student_id,s.subject_name
