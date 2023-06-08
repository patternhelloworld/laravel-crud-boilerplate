-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.11.3-MariaDB-1:10.11.3+maria~ubu2204 - mariadb.org binary distribution
-- 서버 OS:                        debian-linux-gnu
-- HeidiSQL 버전:                  12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- laravel_crud_boilerplate 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `laravel_crud_boilerplate` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `laravel_crud_boilerplate`;

-- 테이블 laravel_crud_boilerplate.courses 구조 내보내기
CREATE TABLE IF NOT EXISTS `courses` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tutor_id` int(10) NOT NULL,
  `language` enum('en','cn') NOT NULL,
  `type` enum('Voice','Video','Chat') NOT NULL,
  `price` int(10) NOT NULL DEFAULT 0,
  `duration` int(10) DEFAULT NULL,
  `duration_measurement` enum('month','day') DEFAULT NULL,
  `lesson_minutes` int(10) NOT NULL,
  `available_from` datetime NOT NULL,
  `available_until` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `tutor_id` (`tutor_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 laravel_crud_boilerplate.courses:~0 rows (대략적) 내보내기

-- 테이블 laravel_crud_boilerplate.enrollments 구조 내보내기
CREATE TABLE IF NOT EXISTS `enrollments` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL,
  `course_id` int(10) NOT NULL,
  `purchase_date` datetime NOT NULL,
  `expiration_date` datetime NOT NULL,
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `student_id_course_id` (`student_id`,`course_id`),
  KEY `student_id` (`student_id`) USING BTREE,
  KEY `course_id` (`course_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 laravel_crud_boilerplate.enrollments:~0 rows (대략적) 내보내기

-- 테이블 laravel_crud_boilerplate.lessons 구조 내보내기
CREATE TABLE IF NOT EXISTS `lessons` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `enrollment_id` int(10) NOT NULL,
  `status` enum('Start','End') NOT NULL DEFAULT 'Start',
  `result` varchar(100) DEFAULT NULL,
  `recording` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `enrollment_id_status` (`enrollment_id`,`status`),
  KEY `enrollment_id` (`enrollment_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 laravel_crud_boilerplate.lessons:~0 rows (대략적) 내보내기

-- 테이블 laravel_crud_boilerplate.migrations 구조 내보내기
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 laravel_crud_boilerplate.migrations:~9 rows (대략적) 내보내기
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(5, '2014_10_12_000000_create_users_table', 1),
	(6, '2014_10_12_100000_create_password_resets_table', 1),
	(7, '2017_03_24_122715_create_article_table', 1),
	(8, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(9, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
	(10, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
	(11, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
	(12, '2016_06_01_000004_create_oauth_clients_table', 2),
	(13, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- 테이블 laravel_crud_boilerplate.oauth_access_tokens 구조 내보내기
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 laravel_crud_boilerplate.oauth_access_tokens:~0 rows (대략적) 내보내기

-- 테이블 laravel_crud_boilerplate.oauth_auth_codes 구조 내보내기
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 laravel_crud_boilerplate.oauth_auth_codes:~0 rows (대략적) 내보내기

-- 테이블 laravel_crud_boilerplate.oauth_clients 구조 내보내기
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 laravel_crud_boilerplate.oauth_clients:~2 rows (대략적) 내보내기
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Laravel React Boilerplate Personal Access Client', 'WlNQCBeS4ekQjCRcNfv9gEwM6RQFxCaQResLJpsZ', NULL, 'http://localhost', 1, 0, 0, '2023-06-07 02:24:42', '2023-06-07 02:24:42'),
	(2, NULL, 'Laravel React Boilerplate Password Grant Client', 'bmKYzw31L1BJc5EqjL1MY1yfVtfET3Ezg4iIzGhD', 'users', 'http://localhost', 0, 1, 0, '2023-06-07 02:24:42', '2023-06-07 02:24:42');

-- 테이블 laravel_crud_boilerplate.oauth_personal_access_clients 구조 내보내기
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 laravel_crud_boilerplate.oauth_personal_access_clients:~1 rows (대략적) 내보내기
INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2023-06-07 02:24:42', '2023-06-07 02:24:42');

-- 테이블 laravel_crud_boilerplate.oauth_refresh_tokens 구조 내보내기
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 laravel_crud_boilerplate.oauth_refresh_tokens:~0 rows (대략적) 내보내기

-- 테이블 laravel_crud_boilerplate.password_resets 구조 내보내기
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 laravel_crud_boilerplate.password_resets:~0 rows (대략적) 내보내기

-- 테이블 laravel_crud_boilerplate.personal_access_tokens 구조 내보내기
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 laravel_crud_boilerplate.personal_access_tokens:~0 rows (대략적) 내보내기

-- 테이블 laravel_crud_boilerplate.users 구조 내보내기
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `type` enum('Student','Tutor') NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `about` varchar(191) DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 laravel_crud_boilerplate.users:~28 rows (대략적) 내보내기
INSERT INTO `users` (`id`, `name`, `email`, `password`, `type`, `phone`, `about`, `is_admin`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Moeen Basra', 'tester@example.com', '$2y$10$lfmZO2CPeM.YW/8Dzqoa7OtK/WoZHaSLS1BI6dbJ8oclChQc1NuIm', 'Tutor', '(478) 321-3545', 'Animi iure dolorum consequatur voluptatibus voluptas et fugit asperiores.', 1, NULL, 'zpk8EYE7t3', '2021-07-25 19:08:52', '2021-07-25 19:08:52', NULL),
	(2, 'Aric Reinger', 'klebsack@example.com', '$2y$10$AniXPfhivwfJoU/Gw4PzCu581cgkF4tCB2JiatbXqDbwUr.xuXZP6', 'Student', '+1-958-203-1790', 'Nostrum veritatis dolores distinctio rem impedit dolorum aut.', 0, NULL, 'XK5ZZX8SPi', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(3, 'Green Green', 'leslie18@example.org', '$2y$10$8257lL3bLCefe8vrXcObm.AwfAGBhbOVNIZkvPHUpoUWiSvAr8Jky', 'Student', '+19903772004', 'Qui labore et quas excepturi fugiat possimus expedita esse tempora perspiciatis et sit.', 0, NULL, '4XzcGtbs0J', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(4, 'Jerrod Lowe', 'claudia88@example.org', '$2y$10$yOlHkoJZa9r8Gt3CnZPjA.uEUEGTGpS2hQJO9formCETbK0j2h.Xm', 'Student', '1-743-754-5516', 'Et omnis ea eos pariatur architecto voluptatum esse qui ut pariatur adipisci quis velit.', 0, NULL, '6wDoOkxlaN', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(5, 'Dr. Camilla Waelchi PhD', 'maynard19@example.org', '$2y$10$kRh7TVXVPYdCXLWf3txYeOrT.u55tZhpTnJxHKmxdqqWoqdbZQzaC', 'Student', '1-850-567-1509', 'Veritatis dicta amet veritatis nisi esse labore autem autem architecto.', 0, NULL, 'Vr0DGYwSHM', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(6, 'Mariam Jones', 'bechtelar.vaughn@example.org', '$2y$10$wSPBJM2rIrVsEJuVao5ITe8AKtWLVHyI9zsYltylizAZEa9/6d306', 'Student', '+1.235.778.2949', 'Quia sed eius ut suscipit est repellat.', 0, NULL, 'zCSVwSRvw0', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(7, 'Dr. Suzanne Kshlerin', 'anahi.bailey@example.com', '$2y$10$zZhsOjOxeZSa0KMbinM//.ZFjA.dpi77XrvckTmmiA.cU4T2IAAFG', 'Student', '+16564364181', 'Non et possimus dolorem autem esse ut et aut veritatis.', 0, NULL, 'XAzb8anRpG', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(8, 'Leanna Denesik', 'santos73@example.org', '$2y$10$AsljOiUPgl8eo2Vj3ArrrOaevxH1pZeN6walxj3UDYfRsWRrtLJp.', 'Student', '693.651.2791', 'Consequatur a optio deleniti vero veniam incidunt assumenda veniam quaerat cupiditate accusamus aut nam.', 0, NULL, 'w4k1kaDfW5', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(9, 'Prof. Antonette Wuckert', 'fohara@example.net', '$2y$10$UgmIanrw5WO6Muir294D0uq9gWG0ydbNI4SRQpNDkH7wEQaiiRKV6', 'Student', '(561) 389-9024', 'Iure a ut est harum consectetur dolorum necessitatibus quia eaque molestiae aspernatur est quo.', 0, NULL, 'BSdave1B0U', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(10, 'Prof. Demetrius Littel MD', 'rtoy@example.com', '$2y$10$r9lUo5N745nYPpsw4QzoMOtf.A1rT4Y006s9BLcWE.kJi9gvDi.DC', 'Student', '+1-697-597-5158', 'Quia expedita vitae et et et et error.', 0, NULL, 'JiLt8UUddw', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(11, 'Angie Barrows DDS', 'rippin.maxime@example.net', '$2y$10$N.BgswpgWpgmZ7RmSxPvluBS8fyIbom.au5ijC5hwpLqHNOl/wAgi', 'Student', '+12408996476', 'Assumenda architecto minus molestiae fugiat aut non ad est aut mollitia nihil quis.', 0, NULL, '0MR9hUp1EN', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(12, 'Prof. Adelle Larkin MD', 'eveline28@example.net', '$2y$10$w3Lla0ahKGTQf6/mQAijTOCWRxTmarVPpY/OkooAubzguiIZbgiSK', 'Student', '(526) 740-1921', 'Iure fugiat eaque quo et perferendis aperiam laudantium eum facere numquam.', 0, NULL, 'gS0QkUPZIB', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(13, 'Adelle O\'Reilly', 'elisa81@example.org', '$2y$10$OIixA.d/9kPu/H0TR1z2DOeA1HaIFQXuhDHWbg9EuZ9S4lukKzjGu', 'Student', '223-570-5131', 'Exercitationem architecto voluptas voluptates et quo autem vel sunt nesciunt rerum ea.', 0, NULL, 'AEYcWl7XV6', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(14, 'Hallie Eichmann PhD', 'zwintheiser@example.com', '$2y$10$JNqd25YfYoSlRxUG9dB8e.HZIVm1c/PjWB97mWfZTrujUKAHIEte.', 'Student', '+1.357.768.0048', 'Soluta aliquid ipsam voluptate ipsam qui beatae.', 0, NULL, 'M1rmWPRKYF', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(15, 'Adelbert Mertz', 'lschoen@example.com', '$2y$10$Tt.osUqOQm1eL/mp0mSgLOjzpAlmTGtUqB4MsuE9DP.MJEvlFCVQ6', 'Student', '+1-620-267-5129', 'Quos cupiditate ut fugiat veritatis a excepturi natus natus consectetur dolor.', 0, NULL, 's3fpsPtIic', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(16, 'Kaylah Langworth', 'carolanne61@example.org', '$2y$10$cvgkfokeUEMPAW78mm3jFOYFag9z4CJMITPqcL6ffQuRkfPbcrQ2y', 'Student', '+1 (382) 728-0238', 'Tenetur itaque quod esse odio unde incidunt iure pariatur eveniet fugiat earum facilis.', 0, NULL, 'WynpJoPS8b', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(17, 'Ethyl Hilpert', 'srath@example.org', '$2y$10$spYceT4S2xEy6MQLlRgZs.ei22AcTLhmbSSdmq6WuFBWKp3HLzona', 'Student', '1-459-844-0695', 'Et culpa voluptates qui voluptas quia quis similique excepturi.', 0, NULL, '7141I1Ou2d', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(18, 'Rogers Torp', 'nader.izabella@example.net', '$2y$10$.XgdaGSSwNsopL6CGVJdbuQda7Md87TY.SYfTSudeDqHR.IZJNapm', 'Student', '+1-309-717-0078', 'Quos consequatur eveniet maiores consequuntur dolor ea iusto molestiae delectus culpa rerum.', 0, NULL, 'kaxd5XBP0b', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(19, 'Prof. Emanuel Ziemann', 'zboncak.golda@example.org', '$2y$10$Ov2FzyOg/yYQF4.IyRLnR.2AcA9nDAtxg9UEDeIJwB0smUQzJhLpG', 'Student', '520-932-9942', 'Quo sed at cumque laboriosam alias porro et voluptatem aut aliquam odit est.', 0, NULL, 'jite2MAboi', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(20, 'Prof. Kobe Spencer PhD', 'casimir70@example.com', '$2y$10$Ap6IDBQBe1bknZuN5CAJMew.5V7pEtrLVYYFwk7aKnGawrzs1YDfK', 'Student', '+1-926-440-2573', 'Tempora tenetur sint amet quaerat iusto dolor et.', 0, NULL, 'slv17lXv75', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(21, 'Danny Muller', 'qmarquardt@example.com', '$2y$10$Yl8WBdy5Rtdf2yK01zfQ9uxuR9kiAsBj4BM9UsukQmfBtMwGF79Xi', 'Student', '1-949-754-3262', 'Ut voluptatem earum quia vitae vitae eveniet aut ad ex.', 0, NULL, '0wIrAfi8ML', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(22, 'Rosie Hagenes', 'schiller.jodie@example.org', '$2y$10$jaPAA1KW6SRetIZPW6JviuPFIRbVdL5kO4xoCneHxdNPUA29vkrBu', 'Student', '1-937-701-7341', 'Magni ea qui eveniet eveniet laboriosam unde.', 0, NULL, 'jZH1GztHfr', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(23, 'Selina Wyman', 'davonte64@example.org', '$2y$10$ztjD66uvJIvAqGxovjdFYOMvv.CGMwI/rm4qk3CoFGvQbWQJlKygK', 'Student', '+1-535-362-1831', 'Et est earum eius tenetur repellat libero odio ab reprehenderit pariatur reprehenderit harum.', 0, NULL, 'ruxw79x9ep', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(24, 'Sarina Paucek', 'dyost@example.org', '$2y$10$PsKrczpj0DiTy28lhkwkxO0wsyNs1be4kpe7tgAG2pKvQ5JYng8b6', 'Student', '+1-215-516-6848', 'Pariatur voluptate sapiente adipisci ducimus dolores sed accusantium similique voluptatum.', 0, NULL, '8nMkUSw7cj', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(25, 'Eloy McClure', 'hkulas@example.com', '$2y$10$/zYI/3MNPaVvTXtUIGmOLOaGGw/.wuwdP8CoW8da8/iZ4vGQKD6ii', 'Student', '+1 (373) 517-6370', 'Id impedit ut repellat debitis a architecto soluta laboriosam rerum.', 0, NULL, 'CVxkKDkPWW', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(26, 'Dr. Bobby Hayes Sr.', 'keyon69@example.net', '$2y$10$Z2ov0LmtX1CGCy0Y0LFgteiLRynJ3E.0XtHNWWcUp5Ktt5xVUodmK', 'Student', '205-645-1060', 'Ad rerum esse vero reprehenderit dignissimos et earum eveniet.', 0, NULL, '7J1QFLiGJi', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(27, 'Margot Kertzmann Jr.', 'sipes.casimer@example.net', '$2y$10$ybi.0zvKb1.c1CwjmVmvsuATCJVinPpAYk.TBm9GUiEd48is4pa8W', 'Student', '+1-927-497-7712', 'Nisi culpa asperiores accusantium rem ipsam qui sapiente incidunt maiores explicabo.', 0, NULL, 'cF1wBM9O8U', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(28, 'Zena Murray', 'predovic.reece@example.org', '$2y$10$EcXczz.mGwRq/qRwQjR4ROc2FqArlu8uBS5SW9gNkDOaYpUwxxvwG', 'Student', '+1-802-644-5582', 'Vitae omnis eos rem enim dolorum laudantium nesciunt quia suscipit quasi et laudantium.', 0, NULL, 'F8Xykbqvfb', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(29, 'Elliott Lesch', 'herman.davin@example.org', '$2y$10$iqmzE7tupNUDSybxjXoRY./1ManMOAve74RLlrWeQbwgwzsbO/48e', 'Student', '+12182681505', 'Molestiae dolores in eum repellendus ad molestiae laborum dolor est possimus repudiandae.', 0, NULL, 'OFhUOfiNcg', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(30, 'Haven Stamm', 'yvonne.nitzsche@example.net', '$2y$10$OunWpMr7yyzJfttptbEoju5g5mmHKjC3j7X9k20xYUgiD1dQDqTFG', 'Student', '+1-359-236-9864', 'Labore molestiae officiis est aliquam suscipit deserunt.', 0, NULL, 'iiYDCMtsQG', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(31, 'Miss Marisol Mante Sr.', 'aheidenreich@example.org', '$2y$10$FNkXtdgMXb23nV0L3lL4bufWbcqMCquob1TKh39tm4LnPb7AgjFBe', 'Student', '+1-956-569-9806', 'Inventore sed aut error facilis et non.', 0, NULL, 'K0AcVy6vsj', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(32, 'Carmella Osinski III', 'joyce80@example.net', '$2y$10$JLcCmVpEGvFpESHY5ZCaHO1PM8tAgyMf0QjwosLUHvKzwE49kajRW', 'Student', '+1.615.369.4203', 'Ut aut voluptate et id expedita quis at vero officiis ullam qui aut rem.', 0, NULL, 'ZqWejVKTeB', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(33, 'Otho Bode', 'lela92@example.com', '$2y$10$Kz1LQWzmWY0LmlFZXvAn2ueRnnVus9gQXzI6EHk0OliycIzrNJDD2', 'Student', '268-920-0418', 'Accusamus sint asperiores doloremque fugiat aperiam ut consequatur esse soluta officiis.', 0, NULL, 'gaXqnvvya1', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(34, 'Dr. Ona Strosin Sr.', 'isidro.mclaughlin@example.net', '$2y$10$FLR1GcaNc51ZLd3WBLUUG.Bmi8..uajqHBy2IHxLZn6ac8VkUadEa', 'Student', '(995) 796-0351', 'Est sit consequuntur ut deleniti tenetur aut quam in aliquam quia aliquid aspernatur.', 0, NULL, 'TDKD47IulW', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(35, 'Ms. Electa Kub', 'barrett46@example.org', '$2y$10$Y3uT237nq3ygXhPEh0e2.uAiIHAdjJAKadw3qujSXrbDu101gB5zi', 'Student', '(664) 415-0803', 'Sit officiis debitis ut voluptas quia voluptatum atque qui qui rerum quis nemo.', 0, NULL, 'cVjI7RUnJ6', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(36, 'Prof. Gracie Jones Jr.', 'lessie.rice@example.org', '$2y$10$RfB1wGdwHKaHuqJACpaW/.DfMDtC6QTy1WX4UubgRszotEI0wFpDS', 'Student', '+18943014931', 'Vel deserunt accusamus ut dicta sed ullam perspiciatis vitae.', 0, NULL, 'frJbAxJX7i', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(37, 'Rory Dibbert', 'mcdermott.kaylin@example.org', '$2y$10$o1Z0m7fNtAF2wSB5drwonewJamWyVk6jdh4cSQt4slfbzDh3wzaua', 'Student', '+1-891-902-7298', 'Magni impedit molestiae velit quibusdam aut corporis non dolorem delectus vitae.', 0, NULL, 'sx5YObOq57', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(38, 'Vivienne Metz', 'jhaley@example.com', '$2y$10$GSe6kXIKXsPEiwL8vM4UF.rS7Ji6Tf1ikbDH4ypSnKXMonr3gnYfy', 'Student', '+14679810477', 'Quod adipisci eligendi et fuga illo architecto explicabo harum ut quod et dolore.', 0, NULL, 'FH7p1dVLK6', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(39, 'Lamar Schaden', 'flavio46@example.org', '$2y$10$NH559bYEcIXCyH/v7Nq3F.LyciOKPPUMQShJRxo.Dksb5xnOlg7Y2', 'Student', '639.301.2914', 'Nesciunt consectetur dolor consectetur nulla magnam numquam et.', 0, NULL, 'FjQbJCHCMq', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(40, 'Maryse O\'Reilly Sr.', 'cali.bartoletti@example.org', '$2y$10$FiVSyuN0pONGr3z9O7L/S.feyGZGuP7KqFXXhJpeBOo8blOsr8uRK', 'Student', '+1-849-940-1152', 'Beatae aperiam provident quaerat in assumenda omnis et cupiditate alias modi occaecati fugit.', 0, NULL, 'rAXLihSffO', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(41, 'Americo Smith', 'myrtle73@example.com', '$2y$10$Aw7cYHJZUm/Y58ZMAmurKuplypY1.V6/NNznvUsFfqT1budcetR4O', 'Student', '1-754-407-4041', 'Reprehenderit reiciendis deserunt sunt ea voluptatem quasi.', 0, NULL, 'g6YZNxOcom', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(42, 'Yazmin Erdman', 'delaney61@example.org', '$2y$10$SJpO/XsORoKVxPSv6PQD6OzENeEyKNg1agY9GXGM1feOLNt4paoX.', 'Student', '953.610.1423', 'Velit voluptas cupiditate ex cumque ut nihil nemo aperiam voluptatibus esse nobis.', 0, NULL, 'ebkhku1oaH', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(43, 'Telly Kihn', 'rath.earline@example.com', '$2y$10$4QNonavHIMAk9hDe4DBV9u2LgQTWfYV9fxfkpOP2Cb6wxc3bZATxK', 'Student', '+1-247-795-4824', 'Et quod molestiae laborum excepturi ea ut id eius.', 0, NULL, '1hwxHDPlee', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(44, 'Vada Langosh', 'ynienow@example.com', '$2y$10$KMybYE1b1C2/VfYD0DADEOZkC9bGgr80P/pLiRZKhjkmp6cWWl9qS', 'Student', '+1 (791) 697-6652', 'Est culpa est quod quis labore inventore rerum.', 0, NULL, '7tXspVfrSd', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(45, 'Prof. Hilda Baumbach', 'mboehm@example.org', '$2y$10$C4YGrkBNGLcduX7KhpbjtOwgvlRSLiJa61o7Pf8pXohPcdFR8rs9q', 'Student', '(803) 843-1369', 'Quas iste enim ducimus nisi asperiores quo exercitationem quaerat sequi nam eos quibusdam.', 0, NULL, 'v9KCBlXyuv', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(46, 'Kyra Kutch', 'bins.coralie@example.net', '$2y$10$h.2M0YRzxgP6RE6fjAsIm.pVWdwycBVgjsX/zugoi7LFZ74rjqzXu', 'Student', '(505) 205-9921', 'Voluptatem similique non voluptas ea molestiae laborum facilis neque voluptate.', 0, NULL, 'RPQSDSYw9Y', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(47, 'Louie Kunze', 'chuel@example.com', '$2y$10$ZcA.mBgRc.nEa3YULddtH.JPX.LBZ.EpD73/TSaseMouMafLScijG', 'Student', '+16026611518', 'Corrupti aperiam commodi dolor aut odio eum vel ab odio deleniti aliquam.', 0, NULL, '7zseZIyTWq', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(48, 'Kamille Kilback', 'duncan73@example.org', '$2y$10$vRHhH2S/WpVrC6PtiqpPwu3JtqrJKvDOr6yRV8XjMV3dsh67kca1S', 'Student', '+1-331-802-8106', 'Quia doloremque dolores sint exercitationem aut sit et.', 0, NULL, 'KzaKhZJ9vC', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(49, 'Mr. Emile Emard', 'jrunolfsson@example.net', '$2y$10$2uQy977l742j2Fz6nw3A4uqa0wQR67d/J0orl4bj5HBjNVvB7Cso2', 'Student', '+16494976137', 'Vel repellendus voluptas eum architecto vel facilis vero laudantium et totam quo et.', 0, NULL, 'vUXSgXlQLY', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(50, 'Mercedes Durgan', 'schuster.carmelo@example.net', '$2y$10$zyz3qDY7aZMKzQBoKdbEV.oXn.rzI1F7a08iSbplanjXPTEoMGQwy', 'Student', '+12895188166', 'Inventore vel asperiores dolorem vel soluta hic consequatur adipisci corrupti voluptas.', 0, NULL, 'il8cxsIqZj', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL),
	(51, 'Lurline Graham', 'hardy.johns@example.org', '$2y$10$u6gInEtSrv6xjoyS8QbzsublU/.uWu9/yM43ccJz0NTyY9p2hOwTa', 'Student', '+1.428.656.9887', 'Nam et voluptate autem hic excepturi illum in nesciunt quis incidunt mollitia.', 0, NULL, 'gH6nWRmvZk', '2021-07-25 19:08:55', '2021-07-25 19:08:55', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
