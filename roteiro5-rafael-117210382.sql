--Q1
SELECT COUNT (*) FROM employee WHERE sex = 'F';
--Q2
SELECT  FROM employee WHERE sex = 'M' AND address LIKE '%TX';
--Q3
SELECT s.ssn AS ssn_supervisior, COUNT(e.superssn) AS qtd_supervisionados FROM employee AS e, employee AS s WHERE e.superssn = s.ssn GROUP BY s.ssn, e.superssn ORDER BY COUNT(e.superssn) ASC, s.ssn ASC; 