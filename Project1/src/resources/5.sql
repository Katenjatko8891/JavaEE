SELECT company_id, customer_id, min(profit)
FROM
  (SELECT company_id, customer_id, (income - spendings) AS profit
   FROM
     (SELECT company_id, customer_id, sum(temp4.sum) AS spendings, sum(cost) AS income
      FROM
        (SELECT company_id, customer_id, temp3.project_id, sum(salary) AS sum
         FROM
           (SELECT temp2.company_id, customer_id, project_id, developer_id, salary
            FROM
              (SELECT company_id, temp.customer_id, temp.project_id
               FROM
                 (SELECT company_id, companies_customers.customer_id, project_id
                  FROM
                    companies_customers
                    LEFT JOIN
                    customers_projects
                      ON
                        companies_customers.customer_id = customers_projects.customer_id) AS temp
                 INNER JOIN
                 customers_projects
                   ON customers_projects.customer_id = temp.customer_id
                      AND customers_projects.project_id = temp.project_id) AS temp2
              LEFT JOIN
              companies_developers
                ON  companies_developers.company_id = temp2.company_id) AS temp3
           INNER JOIN
           projects_developers
             ON projects_developers.developer_id = temp3.developer_id
                AND projects_developers.project_id = temp3.project_id
         GROUP BY company_id, customer_id, project_id) AS temp4
        LEFT JOIN
        projects
          ON projects.id = temp4.project_id
      GROUP BY company_id, customer_id) AS temp5
   GROUP BY company_id, customer_id
   ORDER BY profit ASC) AS temp6
GROUP BY company_id;