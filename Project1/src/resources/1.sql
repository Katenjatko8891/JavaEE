ALTER TABLE developers
ADD
  income DECIMAL NOT NULL;

UPDATE developers
SET income =
(
  SELECT sum(salary)
  FROM companies_developers
  WHERE id = companies_developers.developer_id
);
