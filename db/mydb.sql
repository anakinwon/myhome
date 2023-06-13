-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.6.5-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
--     수정 버전 :                  2023-06-13 (Audition 설정에 맞는 Table 로 변경)
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- mydb 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `mydb`;


DROP TABLE `user_role`;
DROP TABLE `user`;
DROP TABLE `role`;
DROP TABLE `board`;



-- 테이블 mydb.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `created_date` DATETIME ,
  `created_by` varchar(100) NULL DEFAULT 'ADMIN',
  `last_modified_date` DATETIME ,
  `last_modified_by` varchar(100) NULL DEFAULT 'ADMIN',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 mydb.user:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `created_date`, `created_by`, `last_modified_date`, `last_modified_by`) VALUES
	(1, 'admin' , '$2a$10$1tsuphF/pUbVfC0d98Lz8.uXL.Idx84unQLmwRQd4t3B4FwGtzK4y', b'1', NOW(), 'ADMIN', NOW(), 'UP'),
	(2, 'anakin', '$2a$10$1tsuphF/pUbVfC0d98Lz8.uXL.Idx84unQLmwRQd4t3B4FwGtzK4y', b'1', NOW(), 'ADMIN', NOW(), 'UP'),
	(3, 'padme' , '$2a$10$1tsuphF/pUbVfC0d98Lz8.uXL.Idx84unQLmwRQd4t3B4FwGtzK4y', b'1', NOW(), 'ADMIN', NOW(), 'UP'),
	(4, 'yoda'  , '$2a$10$1tsuphF/pUbVfC0d98Lz8.uXL.Idx84unQLmwRQd4t3B4FwGtzK4y', b'1', NOW(), 'ADMIN', NOW(), 'UP')
;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;



-- 테이블 mydb.role 구조 내보내기
CREATE TABLE IF NOT EXISTS `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `created_date` DATETIME ,
  `created_by` varchar(100) NULL DEFAULT 'ADMIN',
  `last_modified_date` DATETIME ,
  `last_modified_by` varchar(100) NULL DEFAULT 'ADMIN',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 mydb.role:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`, `name`, `created_date`, `created_by`, `last_modified_date`, `last_modified_by`) VALUES
	(5, 'ROLE_USER', NOW(), 'ADMIN', NOW(), 'UP'),
	(6, 'ROLE_ADMIN', NOW(), 'ADMIN', NOW(), 'UP');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;



-- 테이블 mydb.board 구조 내보내기
CREATE TABLE IF NOT EXISTS `board` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `content` text NOT NULL DEFAULT '',
  `created_date` DATETIME ,
  `created_by` varchar(100) NULL DEFAULT 'ADMIN',
  `last_modified_date` DATETIME ,
  `last_modified_by` varchar(100) NULL DEFAULT 'ADMIN',
  PRIMARY KEY (`id`),
  KEY `FK_board_user` (`user_id`)
  , CONSTRAINT `FK_board_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb3 COMMENT='게시판';

-- 테이블 데이터 mydb.board:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` (`id`, `user_id`, `title`, `content`, `created_date`, `created_by`, `last_modified_date`, `last_modified_by`) VALUES
	(7 , 1, '제목1', '내용!!! 테스트', NOW(), 'ADMIN', NOW(), 'UP'),
	(8 , 2, '안녕하세요', 'Spring Boot! 테스트', NOW(), 'ADMIN', NOW(), 'UP'),
	(9 , 3, '안녕안녕', 'Spring Boot 테스트', NOW(), 'ADMIN', NOW(), 'UP'),
	(10, 4, 'hi', 'hi', NOW(), 'ADMIN', NOW(), 'UP'),
	(11, 1, 'hi4', 'Content', NOW(), 'ADMIN', NOW(), 'UP'),
	(12, 2, 'TEST', 'TEST', NOW(), 'ADMIN', NOW(), 'UP'),
	(13, 1, '제목1', '내용!!! 테스트', NOW(), 'ADMIN', NOW(), 'UP'),
	(14, 2, '안녕하세요', 'Spring Boot! 테스트', NOW(), 'ADMIN', NOW(), 'UP'),
	(15, 3, '안녕안녕', 'Spring Boot 테스트', NOW(), 'ADMIN', NOW(), 'UP'),
	(16, 4, 'hi', 'hi', NOW(), 'ADMIN', NOW(), 'UP'),
	(17, 1, 'hi4', 'Content', NOW(), 'ADMIN', NOW(), 'UP'),
	(18, 2, 'TEST', 'TEST', NOW(), 'ADMIN', NOW(), 'UP'),
	(19, 1, '제목1', '내용!!! 테스트', NOW(), 'ADMIN', NOW(), 'UP'),
	(20, 2, '안녕하세요', 'Spring Boot! 테스트', NOW(), 'ADMIN', NOW(), 'UP'),
	(21, 3, '안녕안녕', 'Spring Boot 테스트', NOW(), 'ADMIN', NOW(), 'UP'),
	(22, 4, 'hi', 'hi', NOW(), 'ADMIN', NOW(), 'UP'),
	(23, 1, 'hi4', 'Content', NOW(), 'ADMIN', NOW(), 'UP'),
	(24, 2, 'TEST', 'TEST', NOW(), 'ADMIN', NOW(), 'UP'),
	(25, 3, '안녕안녕', 'Spring Boot 테스트', NOW(), 'ADMIN', NOW(), 'UP'),
	(26, 4, 'hi', 'hi', NOW(), 'ADMIN', NOW(), 'UP'),
	(27, 1, 'hi4', 'Content', NOW(), 'ADMIN', NOW(), 'UP'),
	(28, 2, 'TEST', 'TEST', NOW(), 'ADMIN', NOW(), 'UP'),
	(29, 1, '제목1', '내용!!! 테스트', NOW(), 'ADMIN', NOW(), 'UP'),
	(30, 2, '안녕하세요', 'Spring Boot! 테스트', NOW(), 'ADMIN', NOW(), 'UP'),
	(31, 3, '안녕안녕', 'Spring Boot 테스트', NOW(), 'ADMIN', NOW(), 'UP'),
	(32, 4, 'hi', 'hi', NOW(), 'ADMIN', NOW(), 'UP'),
	(33, 1, 'hi4', 'Content', NOW(), 'ADMIN', NOW(), 'UP'),
	(34, 2, 'TEST', 'TEST', NOW(), 'ADMIN', NOW(), 'UP'),
	(35, 3, '안녕안녕', 'Spring Boot 테스트', NOW(), 'ADMIN', NOW(), 'UP'),
	(36, 4, 'hi', 'hi', NOW(), 'ADMIN', NOW(), 'UP'),
	(37, 1, 'hi4', 'Content', NOW(), 'ADMIN', NOW(), 'UP'),
	(38, 2, 'TEST', 'TEST', NOW(), 'ADMIN', NOW(), 'UP'),
	(39, 1, '제목1', '내용!!! 테스트', NOW(), 'ADMIN', NOW(), 'UP'),
	(40, 2, '안녕하세요', 'Spring Boot! 테스트', NOW(), 'ADMIN', NOW(), 'UP'),
    (41, 3, '안녕안녕', 'Spring Boot 테스트', NOW(), 'ADMIN', NOW(), 'UP'),
	(42, 4, 'hi', 'hi', NOW(), 'ADMIN', NOW(), 'UP'),
	(43, 1, 'hi4', 'Content', NOW(), 'ADMIN', NOW(), 'UP'),
	(44, 2, 'TEST', 'TEST', NOW(), 'ADMIN', NOW(), 'UP'),
	(45, 3, '안녕안녕', 'Spring Boot 테스트', NOW(), 'ADMIN', NOW(), 'UP'),
	(46, 4, 'hi', 'hi', NOW(), 'ADMIN', NOW(), 'UP'),
	(47, 1, 'hi4', 'Content', NOW(), 'ADMIN', NOW(), 'UP'),
	(48, 2, 'TEST', 'TEST', NOW(), 'ADMIN', NOW(), 'UP'),
	(49, 1, '제목1', '내용!!! 테스트', NOW(), 'ADMIN', NOW(), 'UP'),
	(50, 2, '안녕하세요', 'Spring Boot! 테스트', NOW(), 'ADMIN', NOW(), 'UP')
;
/*!40000 ALTER TABLE `board` ENABLE KEYS */;



-- 테이블 mydb.user_role 구조 내보내기
CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK_user_role_role` (`role_id`)
   , CONSTRAINT `FK_user_role_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
     CONSTRAINT `FK_user_role_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 mydb.user_role:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
	(1, 5),
	(1, 6),
	(2, 5),
	(2, 6),
	(3, 5),
	(3, 6),
	(4, 5),
	(4, 6);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
