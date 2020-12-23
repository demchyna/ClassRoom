-- liquibase formatted sql

-- changeSet YabVol:change_data-1.0.0 endDelimiter:; splitStatements:true

-- INSERT TEACHERS
insert into users(name, password, email, created_at, updated_at)
values ('Teacher 1', 'password', 'teacher1@gmail.com', '2020-12-23 11:40:09', '2020-12-23 11:40:09');

insert into users(name, password, email, created_at, updated_at)
values ('Teacher 2', 'password2', 'teacher2@gmail.com', '2020-12-23 12:40:09', '2020-12-23 12:40:09');

insert into users(name, password, email, created_at, updated_at)
values ('Teacher 3', 'password3', 'teacher3@gmail.com', '2020-12-23 13:40:09', '2020-12-23 13:40:09');

-- INSERT STUDENTS
insert into users(name, password, email, created_at, updated_at)
values ('Student 1', 'password', 'student1@gmail.com', '2020-12-23 11:40:09', '2020-12-23 11:40:09');

insert into users(name, password, email, created_at, updated_at)
values ('Student 2', 'password2', 'student2@gmail.com', '2020-12-23 12:40:09', '2020-12-23 12:40:09');

insert into users(name, password, email, created_at, updated_at)
values ('Student 3', 'password3', 'student3@gmail.com', '2020-12-23 13:40:09', '2020-12-23 13:40:09');

insert into users(name, password, email, created_at, updated_at)
values ('Student 4', 'password3', 'student4@gmail.com', '2020-12-23 13:40:09', '2020-12-23 13:40:09');

-- INSERT COURSES
insert into courses(name, owner_id, created_at, updated_at)
values ('Java Course', '1', '2020-12-23 14:40:09', '2020-12-23 14:40:09');

insert into courses(name, owner_id, created_at, updated_at)
values ('C# Course', '2', '2018-10-15 14:40:09', '2020-12-23 14:40:09');

insert into courses(name, owner_id, created_at, updated_at)
values ('Ruby Course', '3', '2020-03-17 14:40:09', '2020-12-23 14:40:09');

-- INSERT STUDENT GROUPS
insert into student_groups(name, owner_id, created_at, updated_at)
values ('IF-118', '1', '2020-12-23 14:40:09', '2020-12-23 14:40:09');

insert into student_groups(name, owner_id, created_at, updated_at)
values ('LV-120', '2', '2020-12-23 14:40:09', '2020-12-23 14:40:09');

-- INSERT INTO GROUPS_USERS
insert into groups_users(group_id, user_id)
values ('1', '4');

insert into groups_users(group_id, user_id)
values ('1', '5');

insert into groups_users(group_id, user_id)
values ('2', '6');

insert into groups_users(group_id, user_id)
values ('2', '7');