ALTER TABLE projects ADD cost DECIMAL NOT NULL;

UPDATE projects SET cost = 10000 WHERE id = 1;
UPDATE projects SET cost = 20000 WHERE id = 2;
UPDATE projects SET cost = 15000 WHERE id = 3;
UPDATE projects SET cost = 14000 WHERE id = 4;
