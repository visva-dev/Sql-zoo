SELECT
  name
FROM
  teacher
WHERE dept IS NULL;

SELECT
  teacher.name, dept.name
FROM
  teacher
  INNER JOIN
  dept ON (teacher.dept=dept.id);

SELECT
  teacher.name, dept.name
FROM
  teacher
  LEFT JOIN
  dept ON (teacher.dept=dept.id);

SELECT
  teacher.name, dept.name
FROM
  teacher
  RIGHT JOIN
  dept ON (teacher.dept=dept.id);

SELECT
  teacher.name, COALESCE(mobile, '07986 444 2266')
FROM
  teacher;

SELECT
  teacher.name, COALESCE(dept.name, 'None')
FROM
  teacher
  LEFT JOIN
  dept ON (teacher.dept = dept.id);

SELECT
  COUNT(teacher.name), COUNT(teacher.mobile)
FROM
  teacher;

SELECT
  dept.name, COUNT(teacher.name)
FROM
  teacher
  RIGHT JOIN
  dept ON (teacher.dept = dept.id)
GROUP BY
  dept.name;

SELECT
  teacher.name,
  CASE WHEN
  dept.id = 1
THEN
  'Sci'
WHEN
  dept.id = 2
THEN
  'Sci'
ELSE
  'Art'
END
FROM
  teacher
  LEFT JOIN
  dept ON (dept.id = teacher.dept);

SELECT
  teacher.name,
  CASE WHEN
  dept.id = 1
THEN
  'Sci'
WHEN
  dept.id = 2
THEN
  'Sci'
WHEN
  dept.id = 3
THEN
  'Art'
ELSE
  'None'
END
FROM
  teacher
  LEFT JOIN
  dept ON (dept.id = teacher.dept);
  