
CREATE TABLE developers(
  id INT             AUTO_INCREMENT,
  first_name VARCHAR(50)   NOT NULL,
  last_name VARCHAR(50)    NOT NULL,

  PRIMARY KEY (id)
);

CREATE TABLE skills(
  id INT             AUTO_INCREMENT,
  name VARCHAR(50)         NOT NULL,

  PRIMARY KEY (id)
);

CREATE TABLE projects(
  id INT             AUTO_INCREMENT,
  name VARCHAR(50)         NOT NULL,

  PRIMARY KEY (id)
);

CREATE TABLE companies(
  id INT             AUTO_INCREMENT,
  name VARCHAR(50)         NOT NULL,

  PRIMARY KEY (id)
);

CREATE TABLE customers(
  id INT             AUTO_INCREMENT,
  name VARCHAR(50)         NOT NULL,

  PRIMARY KEY (id)
);

CREATE TABLE developers_skills(
  developer_id INT,
  skill_id INT,

  PRIMARY KEY (developer_id, skill_id),
  FOREIGN KEY (developer_id) REFERENCES developers(id),
  FOREIGN KEY (skill_id) REFERENCES skills(id)
);

CREATE TABLE projects_developers(
  project_id INT,
  developer_id INT,

  PRIMARY KEY (project_id, developer_id),
  FOREIGN KEY (project_id) REFERENCES projects(id),
  FOREIGN KEY (developer_id) REFERENCES developers(id)
);

CREATE TABLE companies_projects(
  company_id INT,
  project_id INT,

  PRIMARY KEY (company_id, project_id),
  FOREIGN KEY (company_id) REFERENCES companies(id),
  FOREIGN KEY (project_id) REFERENCES projects(id)
);

CREATE TABLE customers_projects(
  project_id INT,
  customer_id INT,

  PRIMARY KEY (customer_id, project_id),
  FOREIGN KEY (project_id) REFERENCES projects (id),
  FOREIGN KEY (customer_id) REFERENCES customers (id)
);

CREATE TABLE companies_customers(
  company_id INT,
  customer_id INT,

  PRIMARY KEY (company_id, customer_id),
  FOREIGN KEY (company_id) REFERENCES companies (id),
  FOREIGN KEY (customer_id) REFERENCES customers (id)
);

CREATE TABLE companies_developers(
  company_id INT,
  developer_id INT,
  salary DECIMAL NOT NULL,

  PRIMARY KEY (company_id, developer_id),
  FOREIGN KEY (company_id) REFERENCES companies (id),
  FOREIGN KEY (developer_id) REFERENCES developers (id)
);


































