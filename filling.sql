USE DB_5sem;

INSERT INTO roles(name) VALUES ('admin')
INSERT INTO roles(name) VALUES ('moderator')

INSERT INTO permissions(name) VALUES ( 'Control accounts' )
INSERT INTO permissions(name) VALUES ( 'Control moderators' )
INSERT INTO permissions(name) VALUES ( 'Control sponsors' )
INSERT INTO permissions(name) VALUES ( 'Control partisipants' )
INSERT INTO permissions(name) VALUES ( 'Control competitions' )
INSERT INTO permissions(name) VALUES ( 'Control tasks' )
INSERT INTO permissions(name) VALUES ( 'Control results' )
INSERT INTO permissions(name) VALUES ( 'See results' )
INSERT INTO permissions(name) VALUES ( 'Take participation' )
INSERT INTO permissions(name) VALUES ( 'See logs' )

INSERT INTO roles_permissions(role, permission) SELECT 1, id FROM permissions
INSERT INTO roles_permissions(role, permission) 
SELECT 2, id FROM permissions 
WHERE name IN (
	'Control accounts',
	'Control sponsors',
	'Control partisipants',
	'See results',
	'See logs'
)

INSERT INTO accounts(email, password, role) VALUES ('admin@gmail.com', 'admin', 1)
INSERT INTO accounts(email, password, role) VALUES ('moderator@gmail.com', 'moderator', 2)
INSERT INTO accounts(email, password) VALUES ('sponsor@gmail.com', 'sponsor')
INSERT INTO accounts(email, password) VALUES ('participant1@gmail.com', 'participant')
INSERT INTO accounts(email, password) VALUES ('participant2@gmail.com', 'participant')

INSERT INTO sponsors(name) VALUES ('Sponsor name')

INSERT INTO educations(name, type) VALUES ('BSUIR', 'ÂÓÇ')

INSERT INTO participants(name, phone, education, education_time) VALUES
(
	'Participant name 1',
	'375223334567',
	1,
	2
)
INSERT INTO participants(name, phone, education, education_time) VALUES
(
	'Participant name 2',
	'375221311234',
	1,
	3
)

INSERT INTO relationed_accounts(account, sponsor, participant) VALUES 
(
	3,
	1,
	NULL
)
INSERT INTO relationed_accounts(account, sponsor, participant) VALUES 
(
	4,
	NULL,
	1
)
INSERT INTO relationed_accounts(account, sponsor, participant) VALUES 
(
	5,
	NULL,
	2
)

INSERT INTO competitions(name, sponsor) VALUES
(
	'Competition 1',
	1
)

INSERT INTO participation(competition, participant) VALUES
(
	1,
	1
)

INSERT INTO participation(competition, participant) VALUES
(
	1,
	2
)

INSERT INTO answer_types(name) VALUES ( 'RADIO' )
INSERT INTO answer_types(name) VALUES ( 'CHECKBOX' )
INSERT INTO answer_types(name) VALUES ( 'OPEN' )
INSERT INTO answer_types(name) VALUES ( 'CODE' )

INSERT INTO tasks(competition, text, answer_type) VALUES
(
	1,
	'Text for task 1(radiobox)',
	1
)
INSERT INTO tasks(competition, text, answer_type) VALUES
(
	1,
	'Text for task 2(checkbox)',
	2
)
INSERT INTO tasks(competition, text, answer_type) VALUES
(
	1,
	'Text for task 3(open)',
	3
)
INSERT INTO tasks(competition, text, answer_type) VALUES
(
	1,
	'Text for task 4(code)',
	4
)

INSERT INTO answer_options(task, text) VALUES
(
	1,
	'Radiobox answer 1'
)
INSERT INTO answer_options(task, text) VALUES
(
	1,
	'Radiobox answer 2'
)
INSERT INTO answer_options(task, text) VALUES
(
	1,
	'Radiobox answer 3'
)
INSERT INTO answer_options(task, text) VALUES
(
	2,
	'Checkbox answer 1'
)
INSERT INTO answer_options(task, text) VALUES
(
	2,
	'Checkbox answer 2'
)
INSERT INTO answer_options(task, text) VALUES
(
	2,
	'Checkbox answer 3'
)

INSERT INTO answers(participation, answer_option) VALUES 
(
	1,
	1
)
INSERT INTO answers(participation, answer_option) VALUES 
(
	1,
	4
)
INSERT INTO answers(participation, answer_option) VALUES 
(
	1,
	5
)
INSERT INTO answers(participation, answer_option) VALUES 
(
	2,
	2
)
INSERT INTO answers(participation, answer_option) VALUES 
(
	2,
	6
)

INSERT INTO results(participation, place_in_top, mark) VALUES
(
	1,
	1,
	2
)
INSERT INTO results(participation, place_in_top, mark) VALUES
(
	2,
	2,
	1
)

INSERT INTO logs(account, type, repr) VALUES
(
	'admin@gmail.com',
	'CREATE',
	'Create moderator asdas'
)

INSERT INTO logs(account, type, repr) VALUES
(
	'moderator@gmail.com',
	'UPDATE',
	'Something else'
)
