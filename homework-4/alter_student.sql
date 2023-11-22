-- 1. Создать таблицу student с полями student_id serial, first_name varchar, last_name varchar, birthday date, phone varchar
create table student
(
	student_id serial,
	first_name varchar(50),
	last_name varchar(50),
	birthday date,
	phone varchar(15)
);

-- 2. Добавить в таблицу student колонку middle_name varchar
alter table student add column middle_name varchar(50);

-- 3. Удалить колонку middle_name
alter table student drop column middle_name;

-- 4. Переименовать колонку birthday в birth_date
alter table student rename birthday to birth_date;

-- 5. Изменить тип данных колонки phone на varchar(32)
alter table student alter column phone set data type varchar(32);

-- 6. Вставить три любых записи с автогенерацией идентификатора
insert into student (first_name, last_name, birth_date, phone)
values 
	('Ivan', 'Ivanov', '1990-01-05', '89998887766'),
	('Petr', 'Petrov', '1991-02-10', '89997776655'),
	('Sergey', 'Sergeev', '1992-03-15', '89996665544');

-- 7. Удалить все данные из таблицы со сбросом идентификатор в исходное состояние
truncate table student restart identity;

