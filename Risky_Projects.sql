
-- Identify projects that are at risk for going overbudget. 
-- A project is considered to be overbudget if the cost of all employees assigned to the project is greater than the budget of the project.
-- You'll need to prorate the cost of the employees to the duration of the project. 
-- For example, if the budget for a project that takes half a year to complete is $10K, 
-- then the total half-year salary of all employees assigned to the project should not exceed $10K. 
-- Salary is defined on a yearly basis, so be careful how to calculate salaries for the projects that last less or more than one year.
-- Output a list of projects that are overbudget with their project name, project budget, 
-- and prorated total employee expense (rounded to the next dollar amount).
-- HINT: to make it simpler, consider that all years have 365 days. You don't need to think about the leap years.

select title, max(budget) as budget, 
       sum(person_budget) as prorated_employee_expense
from(
    select a.id, title, budget, emp_id,
           salary/365 * datediff(end_date, start_date) as person_budget
    from linkedin_projects a
    left join linkedin_emp_projects b on a.id = b.project_id
    left join linkedin_employees c on b.emp_id = c.id
) a
group by title
having sum(person_budget) > max(budget)
order by title asc;

