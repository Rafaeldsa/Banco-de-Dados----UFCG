/*
    Roteiro 05
    
    Fino do fino @EuclidesRamos
*/

-- Question01
SELECT COUNT(sex) 
FROM employee 
WHERE sex = 'F';

-- Question02
SELECT AVG(salary) 
FROM employee 
WHERE adress LIKE '%, TX' AND sex = 'M';

-- Question03
SELECT e.superssn as ssn_super, COUNT(e.ssn) AS qnt_sub
FROM employee AS e
GROUP BY e.superssn
ORDER BY COUNT(*) ASC;

-- Question04
SELECT s.fname as nome_supervisor, COUNT(*) AS qnt_sub
FROM (empolyee AS s JOIN empolyee AS e ON s.ssn = e.superssn)
GROUP BY s.ssn
ORDER BY COUNT(*) ASC;

-- Question05
SELECT s.fname as nome_supervisor, COUNT(*) AS qnt_sub
FROM (empolyee AS s RIGHT OUTER JOIN empolyee AS e ON s.ssn = e.superssn)
GROUP BY s.ssn
ORDER BY COUNT(*) ASC;

-- Question06
SELECT MIN(COUNT) AS qtd
FROM (
    SELECT COUNT(*)
    FROM works_on
    GROUP BY pno
) AS res;

-- Question07
SELECT pno AS num_projeto, qtd AS qtd_func
FROM (
    (
        SELECT pno, COUNT(*)
        FROM works_on
        GROUP BY pno
    ) AS pnc

    JOIN

    (
        SELECT MIN(COUNT) AS qtd
        FROM (
            SELECT COUNT(*)
            FROM works_on
            GROUP BY pno
        ) t
    ) AS minimum

    ON pnc.COUNT = minimum.qtd
);

-- Question08
SELECT w.pno AS num_projeto, AVG(e.salary) AS media_sal
FROM works_on AS w JOIN employee AS e ON (w.essn = e.ssn)
GROUP BY w.pno;

-- Question09
SELECT w.pno AS proj_num, p.pname AS proj_nome, AVG(e.salary) AS media_sal
FROM project AS p JOIN (works_on AS w JOIN employee AS e ON (w.essn = e.ssn)) ON (p.pnumber = w.pno)
GROUP BY w.pno, p.pname
ORDER BY AVG(e.salary) ASC;

-- Question10
SELECT e.fname, e.salary
FROM employee AS e
WHERE e.salary > ALL (
    SELECT e.salary
    FROM works_on AS w JOIN employee AS e ON (w.essn = e.ssn AND w.pno = 92)
);

-- Question11
SELECT e.ssn, COUNT(w.pno)
FROM employee AS e LEFT OUTER JOIN works_on AS w ON (e.ssn = w.essn)
GROUP BY e.ssn
ORDER BY COUNT(w.pno) ASC;

-- Question12
SELECT pno AS num_proj, COUNT AS qtd_func
FROM (
    SELECT pno, COUNT(*)
    FROM employee AS e LEFT OUTER JOIN works_on AS w ON (w.essn = e.ssn) 
    GROUP BY pno
) AS sel
WHERE sel.count < 5;

-- Question13
SELECT fname
FROM (
    SELECT eS.ssn
    FROM (
        SELECT e.ssn
        FROM (
            SELECT w.essn
            FROM (
                SELECT p.pnumber AS pnumb
                FROM project AS p
                WHERE p.plocation = 'Sugarland'
            ) AS proj, works_on AS w
            WHERE w.pno = proj.pnumb
        ) AS sW, employee AS e
        WHERE sW.essn = e.ssn
    ) AS eS, dependent AS d
    WHERE eS.ssn = d.essn
    GROUP BY eS.ssn
) AS fin, employee AS e
WHERE fin.ssn = e.ssn;

-- Question14
SELECT d.dname
FROM department AS d 
WHERE NOT EXISTS(
    SELECT *
    FROM project AS p
    WHERE p.dnum = d.dnumber
);

-- Question15
SELECT d.dname
FROM department AS d 
WHERE NOT EXISTS(
    SELECT *
    FROM project AS p
    WHERE p.dnum = d.dnumber
);
