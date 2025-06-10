#LOG_IN
- find total time from 1st login to last login 
- find the accurate working hours 
```
CREATE TABLE swipe (
    employee_id INT,
    activity_type VARCHAR(10),
    activity_time datetime
);

-- Insert sample data
INSERT INTO swipe (employee_id, activity_type, activity_time) VALUES
(1, 'login', '2024-07-23 08:00:00'),
(1, 'logout', '2024-07-23 12:00:00'),
(1, 'login', '2024-07-23 13:00:00'),
(1, 'logout', '2024-07-23 17:00:00'),
(2, 'login', '2024-07-23 09:00:00'),
(2, 'logout', '2024-07-23 11:00:00'),
(2, 'login', '2024-07-23 12:00:00'),
(2, 'logout', '2024-07-23 15:00:00'),
(1, 'login', '2024-07-24 08:30:00'),
(1, 'logout', '2024-07-24 12:30:00'),
(2, 'login', '2024-07-24 09:30:00'),
(2, 'logout', '2024-07-24 10:30:00');


select * from swipe;
with cte as(
select *,
case when lead(activity_type) over(partition by employee_id order by day(activity_time)) = 'logout' then 
datediff(hour,activity_time , lead(activity_time) over(partition by employee_id order by day(activity_time))) else null end as b
from swipe
)
select employee_id,cast(activity_time as date) as date,datediff(hour,min(activity_time),max(activity_time)) as login_time,
sum(b) as productive_hrs
from cte
group by employee_id,cast(activity_time as date)
order by employee_id
```
```
Output:

employee_id activity_type activity_time          
----------- ------------- -----------------------
          1 login         2024-07-23 08:00:00.000
          1 logout        2024-07-23 12:00:00.000
          1 login         2024-07-23 13:00:00.000
          1 logout        2024-07-23 17:00:00.000
          2 login         2024-07-23 09:00:00.000
          2 logout        2024-07-23 11:00:00.000
          2 login         2024-07-23 12:00:00.000
          2 logout        2024-07-23 15:00:00.000
          1 login         2024-07-24 08:30:00.000
          1 logout        2024-07-24 12:30:00.000
          2 login         2024-07-24 09:30:00.000
          2 logout        2024-07-24 10:30:00.000

employee_id date             login_time  productive_hrs
----------- ---------------- ----------- --------------
          1       2024-07-23           9              8
          1       2024-07-24           4              4
          2       2024-07-23           6              5
          2       2024-07-24           1              1
```
Certainly! Let's break down the SQL query step by step to understand how it works, using key SQL concepts and keywords:

### 1. **Initial Selection from `swipe` Table**
The query begins by selecting all columns (`*`) from a table named `swipe`. This table presumably records employee swipe activities, such as login and logout times.

### 2. **Common Table Expression (CTE)**
A Common Table Expression (CTE) is used here, denoted by `WITH cte AS (...)`. A CTE is a temporary result set that you can refer to within a `SELECT`, `INSERT`, `UPDATE`, or `DELETE` statement. It helps in organizing complex queries and improving readability.

### 3. **Case Statement and Window Functions**
Inside the CTE:
- The `CASE` statement is used to check if the next `activity_type` (using `LEAD()`) is 'logout'. `LEAD()` is a window function that provides access to a row at a specified physical offset following the current row within a result set.
- If the next `activity_type` is 'logout', the difference in hours between the current and next `activity_time` is calculated using `DATEDIFF(hour, activity_time, lead(activity_time)...)`. This difference represents the duration of time logged in during a session.
- The result is stored in a new column `b`; if the next activity isn't a 'logout', `b` is set to `NULL`.

### 4. **Main Query**
The main query selects data from the CTE:
- `employee_id`: The unique identifier for each employee.
- `cast(activity_time as date) as date`: Converts the `activity_time` (which is a timestamp) to a date format, representing the day of the activity.
- `DATEDIFF(hour, min(activity_time), max(activity_time)) as login_time`: Calculates the total time (in hours) the employee was logged in on a particular day by finding the difference between the earliest and latest `activity_time`.
- `SUM(b) as productive_hrs`: Sums the values in column `b` for each employee and date, representing the total productive hours (i.e., hours between login and logout).
- `GROUP BY employee_id, cast(activity_time as date)`: Groups the results by `employee_id` and the date to aggregate the data accordingly.
- `ORDER BY employee_id`: Orders the final result by `employee_id`.

### **Keywords and Concepts:**

- **CTE (Common Table Expression)**: Used for defining temporary result sets.
- **CASE**: Used for conditional logic within SQL queries.
- **LEAD()**: A window function to access data from subsequent rows.
- **DATEDIFF()**: A function that calculates the difference between two dates or times.
- **CAST()**: Converts data from one type to another (here, from datetime to date).
- **GROUP BY**: Aggregates data based on specified columns.
- **ORDER BY**: Sorts the result set by one or more columns.

### Learning and Practice Tips:
1. **Understand SQL Basics**: Ensure you are familiar with basic SQL operations like `SELECT`, `FROM`, `WHERE`, `GROUP BY`, `ORDER BY`, and functions like `SUM()`, `COUNT()`, etc.
2. **Practice Window Functions**: Window functions like `LEAD()`, `LAG()`, `ROW_NUMBER()`, etc., are powerful for analyzing data in SQL.
3. **Use Real Data**: Practice with real or simulated datasets to understand the application of these concepts.
4. **Experiment**: Modify existing queries, add new columns, or change conditions to see how the output changes. This helps solidify your understanding.

By consistently practicing and experimenting with different queries and data sets, you'll improve your SQL skills and become more comfortable writing and understanding complex queries.
---
#AGGREGATE FUNCTION:
## SUM:
- ![image](https://github.com/user-attachments/assets/e33f8861-21b9-43a2-847f-9057015238fd)
> table is shown and we need to sum all the amount each salesperson has made
- ![image](https://github.com/user-attachments/assets/3089f3df-8a27-4123-a483-ba45fed0e979)
> here group by is used to group each salesperson after adding the amount

##USING WINDOW FOR SUM:
- ![image](https://github.com/user-attachments/assets/c67ef67e-1613-4367-b071-7ffac123de35)

> here we use over() which add all the amount since its usen after sum(amount)
> but since partition by id parameter the result will add all the amount for unique id

