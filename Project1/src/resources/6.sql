SELECT company_id, project_id, max(sum) AS max, average
FROM
  (SELECT temp.company_id, project_id, sum(salary) AS sum, avg(salary) AS average
   FROM
     (SELECT company_id, companies_projects.project_id, developer_id
      FROM
        companies_projects
        LEFT JOIN
        projects_developers
          ON companies_projects.project_id = projects_developers.project_id) AS temp
     INNER JOIN
     companies_developers
       ON companies_developers.company_id = temp.company_id
          AND companies_developers.developer_id = temp.developer_id
   GROUP BY temp.company_id, temp.project_id
   ORDER BY sum DESC) AS temp2
GROUP BY company_id