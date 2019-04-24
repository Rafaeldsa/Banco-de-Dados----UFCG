--Q1
SELECT COUNT (*) FROM employee WHERE sex = 'F';
--Q2
SELECT  FROM employee WHERE sex = 'M' AND address LIKE '%TX';
--Q3
SELECT m.ssn AS ssn_supervisor, COUNT(*) AS qtd_supervisionados 
FROM (employee AS m RIGHT OUTER JOIN employee AS e ON (m.ssn = e.superssn))
GROUP BY m.ssn
ORDER BY COUNT(*) ASC;
--Q4
SELECT s.fname AS nome_supervisor, COUNT(*) AS qtd_supervisionados
FROM (employee AS s JOIN employee AS e ON (s.ssn = e.superssn))
GROUP BY s.ssn
ORDER BY COUNT (*) ASC;
--Q5
SELECT s.fname AS nome_supervisor, COUNT(*) AS qtd_supervisionados
FROM (employee AS s RIGHT OUTER JOIN employee AS e ON (s.ssn = e.superssn))
GROUP BY s.ssn
ORDER BY COUNT (*) ASC;
--Q6
SELECT DISTINCT COUNT(pno) AS qtd from works_on as w, project as m
WHERE w.pno = m.pnumber
GROUP BY m.pname
;
--Q7
SELECT m.pnumber, COUNT(pno) AS qtd_func from works_on as w, project as m
WHERE w.pno = m.pnumber
GROUP BY m.pnumber
ORDER BY COUNT(pno) ASC, m.pnumber ASC;