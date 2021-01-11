-- liquibase formatted sql

-- changeSet YabVol:structure-1.0 endDelimiter:; splitStatements:true

CREATE TABLE if not exists `courses`(
    `id`         int      NOT NULL AUTO_INCREMENT,
    `created_at` datetime NOT NULL,
    `updated_at` datetime                             DEFAULT NULL,
    `name`       varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
    `owner_id`   int                                  DEFAULT NULL,
    `disabled`   boolean                              DEFAULT false,
    PRIMARY KEY (`id`)
);

CREATE TABLE if not exists `authority`(
    `id`         int      NOT NULL AUTO_INCREMENT,
    `created_at` datetime NOT NULL,
    `updated_at` datetime                             DEFAULT NULL,
    `name`       varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE if not exists `student_groups`(
    `id`         int      NOT NULL AUTO_INCREMENT,
    `created_at` datetime NOT NULL,
    `updated_at` datetime                             DEFAULT NULL,
    `name`       varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
    `owner_id`   int                                  DEFAULT NULL,
    `disabled`   boolean                              DEFAULT false,
    PRIMARY KEY (`id`)
);

CREATE TABLE if not exists `users`(
    `id`         int      NOT NULL AUTO_INCREMENT,
    `created_at` datetime NOT NULL,
    `updated_at` datetime                             DEFAULT NULL,
    `email`      varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
    `name`       varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
    `password`   varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
    `disabled`   boolean                              DEFAULT false,
    PRIMARY KEY (`id`)
);

CREATE TABLE if not exists `material`(
    `id`         int      NOT NULL AUTO_INCREMENT,
    `owner_id`   int      NOT NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime                             DEFAULT NULL,
    `name`       varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
    `description`       varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
    `file_reference` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
    `course_id`  int                                  DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_course_material` (`course_id`),
    CONSTRAINT `fk_course_material` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
);

CREATE TABLE if not exists `role`(
    `id`         int      NOT NULL AUTO_INCREMENT,
    `created_at` datetime NOT NULL,
    `updated_at` datetime                             DEFAULT NULL,
    `name`       varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE if not exists `groups_courses`(
    `group_id`  int NOT NULL,
    `course_id` int NOT NULL,
    PRIMARY KEY (`group_id`, `course_id`),
    KEY `fk__courses__groups__course_id` (`course_id`),
    CONSTRAINT `fk__courses__groups__course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
    CONSTRAINT `fk__groups__courses__group_id` FOREIGN KEY (`group_id`) REFERENCES `student_groups` (`id`)
);

CREATE TABLE if not exists `groups_users`(
    `group_id` int NOT NULL,
    `user_id`  int NOT NULL,
    PRIMARY KEY (`group_id`, `user_id`),
    KEY `fk__groups__users__user_id` (`user_id`),
    CONSTRAINT `fk__groups__users__group_id` FOREIGN KEY (`group_id`) REFERENCES `student_groups` (`id`),
    CONSTRAINT `fk__groups__users__user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);

CREATE TABLE if not exists `roles_authorities`(
    `role_id`      int NOT NULL,
    `authority_id` int NOT NULL,
    PRIMARY KEY (`role_id`, `authority_id`),
    KEY `fk_authorities_roles_authority_id` (`authority_id`),
    CONSTRAINT `fk_authorities_roles_authority_id` FOREIGN KEY (`authority_id`) REFERENCES `authority` (`id`),
    CONSTRAINT `fk_roles_authorities_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
);

CREATE TABLE if not exists `users_courses`(
    `user_id`   int NOT NULL,
    `course_id` int NOT NULL,
    PRIMARY KEY (`user_id`, `course_id`),
    KEY `fk__courses__users__course_id` (`course_id`),
    CONSTRAINT `fk__courses__users__course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
    CONSTRAINT `fk__users__courses__user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);

CREATE TABLE if not exists `users_roles`(
    `user_id` int NOT NULL,
    `role_id` int NOT NULL,
    PRIMARY KEY (`user_id`, `role_id`),
    KEY `fk_roles_users_role_id` (`role_id`),
    CONSTRAINT `fk_roles_users_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
    CONSTRAINT `fk_users_roles_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);
