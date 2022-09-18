# Описание сущностей

## Роли (Roles)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | NUMBER | PK |
| name | Название роли | VARCHAR(50) | NOT NULL |
| permission | Право | VARCHAR(50) | NOT NULL |
## Аккаунты (Accounts)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| email | Электронная почта пользователя | VARCHAR(50) | PK |
| password | Пароль пользователя | VARCHAR(255) | NOT NULL; SHA-256 |
## Организаторы (Sponsors)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | NUMBER | PK |
| account | Аккаунт организатора | VARCHAR(50) | FK; NOT NULL; UNIQUE |
| name | Имя спонсора | VARCHAR(128) | NOT NULL |
## Участники (Participants)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | NUMBER | PK  |
| account | Аккаунт участника | VARCHAR(50) | FK; NOT NULL; UNIQUE |
| name | ФИО участника | VARCHAR(128) | NOT NULL |
| phone | Мобильный телефон | VARCHAR(13) | NOT NULL |
| education | ВУЗ/ССУЗ | NUMBER | FK; NOT NULL |
| education_time | Год обучения | NUMBER | NOT NULL |
## Соревнования (Competitions)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | NUMBER | PK |
| name | Название соревнования | VARCHAR(128) | NOT NULL |
| sponsor | Организатор | NUMBER | FK; NOT NULL |
| participant | Участники | NUMBER | FK; NOT NULL |
## Вопросы к соревнованиям (Tasks)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | NUMBER | PK |
| competition | Соревнование | NUMBER | FK; NOT NULL |
| text | Текст вопроса | VARCHAR(500) | NOT NULL |
| answer_type | Тип ответа(один вариант/много вариантов/открытый/код) | VARCHAR(10) | NOT NULL; CHECK IN ('radio', 'checkbox', 'open', 'code') |
## Варианты ответов (Answer Options)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | NUMBER | PK |
| task | Вопрос | NUMBER | FK; NOT NULL |
| text | Содержимое ответа | VARCHAR(255) | NOT NULL |
## Ответы пользователей (Answers)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | NUMBER | PK |
| participant | Участник | NUMBER | FK; NOT NULL |
| answer_option | Вариант ответа | NUMBER | FK; NOT NULL |
## Результаты соревнований (Results)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | NUMBER | PK |
| participant | Участник | NUMBER | FK; NOT NULL |
| competition | Соревнование | NUMBER | FK; NOT NULL |
| place_in_top | Занятое место | NUMBER | NOT NULL |
## Учебные заведения (Educations)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | NUMBER | PK |
| name | Название учебного заведения | VARCHAR(128) | NOT NULL |
| type | Тип(ВУЗ/ССУЗ) | VARCHAR(5) | NOT NULL; CHECK IN ('ВУЗ', 'ССУЗ') |
## Логи (Logs)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | NUMBER | PK |
| user | Пользователь | NUMBER | FK; NOT NULL |
| type | Тип(СОЗДАТЬ/ОБНОВИТЬ/УДАЛИТЬ) | VARCHAR(6) | NOT NULL; CHECK IN ('CREATE', 'UPDATE', 'DELETE') |
| repr | Представление измененного кортежа в строковом виде | VARCHAR(500) | NOT NULL |
| creation_datetime | Время изменения | DATETIME | - |