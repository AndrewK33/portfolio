SELECT dp.dept_name, ROUND(AVG(sa.salary), 2) AS avg_salary
FROM salaries as sa, dept_emp as de, departments as dp 
WHERE de.emp_no = sa.emp_no AND sa.to_date = '9999-01-01' AND de.dept_no = dp.dept_no
GROUP BY de.dept_no, dp.dept_name
ORDER BY de.dept_no ASC;


SELECT CONCAT (emp.first_name,  ', ', emp.last_name) AS full_name, MAX(sa.salary) as max_salary
FROM employees as emp, salaries as sa
WHERE emp.emp_no = sa.emp_no
GROUP BY full_name
ORDER BY max_salary ASC;


SELECT COUNT(*) as emloyee_qty
FROM dept_emp
INNER JOIN departments on dept_emp.dept_no = departments.dept_no
WHERE 1 = 1 AND dept_emp.to_date = '9999-01-01';


SELECT COUNT(*) as emloyee_qty, SUM(salaries.salary) as total_salaries, departments.dept_name as department
FROM dept_emp
LEFT JOIN departments on dept_emp.dept_no = departments.dept_no
LEFT JOIN salaries on salaries.emp_no = dept_emp.emp_no
WHERE 1 = 1 AND dept_emp.to_date = '9999-01-01' AND salaries.to_date = '9999-01-01'
GROUP BY departments.dept_name;

