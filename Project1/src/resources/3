SELECT sum(developers.income) AS  'Java Developers Salary'
FROM developers, skills, developers_skills
WHERE
  developers.id = developers_skills.developer_id AND
  developers_skills.skill_id = skills.id AND
  skills.name = 'Java';


