USE DB_5sem

SELECT * FROM logs
WHERE type IN ('DELETE', 'UPDATE')

SELECT * FROM accounts
WHERE CHARINDEX('@gmail.com', email) > 0

SELECT CHARINDEX('@gmail.com', email) FROM accounts

UPDATE answer_options SET mark=5
WHERE text='Radiobox answer 1'

UPDATE answer_options SET mark=1
WHERE CHARINDEX('Checkbox', text) > 0

SELECT * FROM results
ORDER BY place_in_top

UPDATE answer_options SET mark=FLOOR(RAND()*(4)+1)
WHERE id % 2 = 0

SELECT * FROM answer_options

SELECT SUM(mark) FROM answer_options WHERE mark>0

UPDATE results SET mark=(SELECT SUM(mark) FROM answer_options WHERE mark>0)
WHERE id=1

SELECT * FROM tasks

INSERT INTO accounts(email, password) VALUES
(
	'testworgemail',
	'123'
)

DELETE FROM accounts
WHERE NOT CHARINDEX('@', email) > 0

INSERT INTO participants(name, phone, education, education_time) VALUES
(
	'Russian student',
	'71235451',
	1,
	4
)

SELECT name, phone, education FROM participants
WHERE phone NOT LIKE '375%'

SELECT name, phone, education, education_time FROM participants
WHERE education_time > 2
ORDER BY name

SELECT education_time, COUNT(education_time) count FROM participants
GROUP BY education_time
ORDER BY count
