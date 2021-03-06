-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.1.41-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- zlzone 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `zlzone` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `zlzone`;

-- 테이블 zlzone.bet 구조 내보내기
CREATE TABLE IF NOT EXISTS `bet` (
  `id` varchar(30) NOT NULL,
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `bet` varchar(11) NOT NULL,
  `time` varchar(30) NOT NULL,
  `home` varchar(20) NOT NULL,
  `homeb` varchar(11) NOT NULL,
  `darw` varchar(20) NOT NULL,
  `hup` varchar(10) DEFAULT NULL,
  `aup` varchar(10) DEFAULT NULL,
  `away` varchar(20) NOT NULL,
  `awayb` varchar(11) NOT NULL,
  `result` varchar(20) NOT NULL,
  `point` int(11) NOT NULL,
  `pointresult` varchar(50) NOT NULL DEFAULT '0',
  `doing` varchar(10) NOT NULL,
  `bettime` varchar(30) NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=MyISAM AUTO_INCREMENT=316 DEFAULT CHARSET=euckr;

-- 테이블 데이터 zlzone.bet:152 rows 내보내기
/*!40000 ALTER TABLE `bet` DISABLE KEYS */;
INSERT INTO `bet` (`id`, `num`, `bet`, `time`, `home`, `homeb`, `darw`, `hup`, `aup`, `away`, `awayb`, `result`, `point`, `pointresult`, `doing`, `bettime`) VALUES
	('test', 104, '3', '05.01 04:00', '토트넘', '2.36', '3.20', NULL, NULL, '아약스', '1.85', '진행중', 50000, '92500', '진행중', '05/18 22:56'),
	('555', 129, '1', '06.19	09:30', '브라질', '1.87', '(2.50)', '▼ ', '▲', '베네수엘라', '1.90', '진행중', 15, '28', '진행중', '06/11 20:20'),
	('555', 127, '3', '06.19	04:00', '자메이카', '2.08', '2.84', '', '', '호주', '1.83', '진행중', 400000, '732000', '진행중', '06/08 17:19'),
	('555', 128, '1', '06.19	06:30', '볼리비아', '2.36', '3.20', '', '', '페루', '1.85', '진행중', 123, '290', '진행중', '06/11 20:20'),
	('test', 125, '1', '06.19	04:00', '자메이카', '1.45', '+1.50', '', '', '호주', '2.26', '진행중', 50000, '72500', '진행중', '05/29 10:11'),
	('test', 124, '3', '06.19	04:00', '이탈리아', '2.00', '(2.50)', '▼ ', '▲', '브라질', '1.87 ', '진행중', 20000, '37400', '진행중', '05/28 23:36'),
	('test', 105, '2', '05.01 04:00', '토트넘', '2.36', '3.20', NULL, NULL, '아약스', '1.85', '진행중', 50000, '160000', '진행중', '05/18 22:56'),
	('555', 123, '2', '06.19	06:30', '볼리비아', '2.36', '3.20', '', '', '페루', '1.85', '진행중', 33333, '106666', '진행중', '05/28 22:31'),
	('test', 122, '1', '06.19	06:30', '볼리비아', '2.36', '3.20', '', '', '페루', '1.85', '진행중', 1000, '2360', '진행중', '05/28 20:14'),
	('555', 121, '1', '06.19	06:30', '볼리비아', '2.36', '3.20', '', '', '페루', '1.85', '진행중', 2000, '4720', '진행중', '05/23 10:46'),
	('test', 120, '1', '06.20	04:00', '스코틀랜드', '2.54', '3.21', '', '', '아르헨티나', '1.98', '진행중', 4000, '10160', '진행중', '05/21 17:12'),
	('test', 119, '2', '06.20	04:00', '일본', '3.25', '2.92', '', '', '잉글랜드', '1.48', '진행중', 200, '584', '진행중', '05/21 17:11'),
	('test', 115, '1', '06.19	06:30', '볼리비아', '1.86', '(2.50)', '▼ ', '▲', '페루', '1.94', '진행중', 100, '186', '진행중', '05/21 17:06'),
	('test', 117, '3', '06.19	04:00', '이탈리아', '2.12', '2.65', '', '', '브라질', '1.98', '진행중', 2000, '3960', '진행중', '05/21 17:11'),
	('555', 130, '1', '06.19	04:00', '이탈리아', '2.12', '2.65', '', '', '브라질', '1.98', '진행중', 200, '424', '진행중', '06/11 20:22'),
	('555', 131, '3', '06.19	06:30', '볼리비아', '2.36', '3.20', '', '', '페루', '1.85', '진행중', 200, '370', '진행중', '06/11 20:23'),
	('555', 132, '2', '06.19	06:30', '볼리비아', '2.36', '3.20', '', '', '페루', '1.85', '진행중', 500, '1600', '진행중', '06/11 20:23'),
	('555', 133, '3', '06.19	06:30', '볼리비아', '2.36', '3.20', '', '', '페루', '1.85', '진행중', 3000, '5550', '진행중', '06/11 21:02'),
	('555', 136, '1', '06.19	06:30', '볼리비아', '2.36', '3.20', '', '', '페루', '1.85', '진행중', 5000, '11800', '진행중', '06/12 15:01'),
	('test', 137, '1', '06.19	06:30', '볼리비아', '2.36', '3.20', '', '', '페루', '1.85', '진행중', 100, '236', '진행중', '12/03 23:40'),
	('test', 138, '2', '06.19	09:30', '브라질', '1.32', '3.20', '', '', '베네수엘라', '1.85', '진행중', 10000, '32000', '진행중', '12/03 23:50'),
	('test', 139, '1', '06.19	06:30', '볼리비아', '2.36', '3.20', '', '', '페루', '1.85', '진행중', 5000, '11800', '진행중', '01/03 17:35'),
	('aaa', 202, '1', '02.02 00:00', '왓포드 FC', '1.57', '-0.50', '', '', '에버턴 FC', '1.43', '진행중', 10, '14', '진행중', '01/21 15:01'),
	('aaa', 201, '1', '02.02	00:00', '왓포드 FC', '2.94', '3.35', '', '', '에버턴 FC', '2.49', '진행중', 10, '25', '진행중', '01/21 15:00'),
	('aaa', 200, '3', '02.02	00:00', '왓포드 FC', '2.94', '3.35', '', '', '에버턴 FC', '2.49', '진행중', 10, '25', '진행중', '01/21 15:00'),
	('aaa', 199, '2', '02.02	00:00', '왓포드 FC', '2.94', '3.35', '', '', '에버턴 FC', '2.49', '진행중', 10, '34', '진행중', '01/21 15:00'),
	('aaa', 198, '2', '02.02	00:00', '왓포드 FC', '2.94', '3.35', '', '', '에버턴 FC', '2.49', '진행중', 10, '34', '진행중', '01/21 15:00'),
	('aaa', 197, '2', '02.02	00:00', '왓포드 FC', '2.94', '3.35', '', '', '에버턴 FC', '2.49', '진행중', 10, '34', '진행중', '01/21 14:59'),
	('aaa', 196, '3', '02.02	00:00', '왓포드 FC', '2.94', '3.35', '', '', '에버턴 FC', '2.49', '진행중', 100, '249', '진행중', '01/21 14:59'),
	('aaa', 195, '3', '02.02	00:00', '왓포드 FC', '2.94', '3.35', '', '', '에버턴 FC', '2.49', '진행중', 10, '25', '진행중', '01/21 14:59'),
	('aaa', 194, '1', '02.02	00:00', '왓포드 FC', '2.94', '3.35', '', '', '에버턴 FC', '2.49', '진행중', 10, '25', '진행중', '01/21 14:59'),
	('aaa', 193, '1', '02.02	00:00', '왓포드 FC', '2.94', '3.35', '', '', '에버턴 FC', '2.49', '진행중', 100, '249', '진행중', '01/21 14:59'),
	('aaa', 192, '1', '02.02	00:00', '왓포드 FC', '2.94', '3.35', '', '', '에버턴 FC', '2.49', '진행중', 10, '25', '진행중', '01/21 14:58'),
	('aaa', 191, '1', '02.02	00:00', '왓포드 FC', '2.94', '3.35', '', '', '에버턴 FC', '2.49', '진행중', 10, '25', '진행중', '01/21 14:58'),
	('aaa', 190, '1', '02.02 00:00', '왓포드 FC', '1.57', '-0.50', '', '', '에버턴 FC', '1.43', '진행중', 10, '14', '진행중', '01/21 14:58'),
	('aaa', 189, '2', '02.02	00:00', '왓포드 FC', '2.94', '3.35', '', '', '에버턴 FC', '2.49', '진행중', 10, '34', '진행중', '01/21 14:57'),
	('aaa', 188, '3', '02.02	00:00', '왓포드 FC', '2.94', '3.35', '', '', '에버턴 FC', '2.49', '진행중', 10, '25', '진행중', '01/21 14:57'),
	('aaa', 187, '3', '02.02 00:00', '왓포드 FC', '1.83', '(2.50)', '▼ ', '▲', '페루', '1.98', '진행중', 10, '20', '진행중', '01/21 14:57'),
	('aaa', 186, '3', '02.02	00:00', '왓포드 FC', '2.94', '3.35', '', '', '에버턴 FC', '2.49', '진행중', 10, '25', '진행중', '01/21 14:54'),
	('aaa', 185, '2', '06.19	09:30', '브라질', '1.32', '3.20', '', '', '베네수엘라', '1.85', '진행중', 100000, '320000', '진행중', '01/21 13:28'),
	('aaa', 184, '2', '06.19	09:30', '브라질', '1.32', '3.20', '', '', '베네수엘라', '1.85', '진행중', 10, '32', '진행중', '01/21 13:28'),
	('aaa', 183, '3', '06.19	09:30', '브라질', '1.32', '3.20', '', '', '베네수엘라', '1.85', '진행중', 10, '19', '진행중', '01/21 13:28'),
	('aaa', 182, '3', '02.02 00:00', '왓포드 FC', '1.57', '-0.50', '', '', '에버턴 FC', '1.43', '진행중', 10, '14', '진행중', '01/21 13:28'),
	('aaa', 181, '3', '02.02	00:00', '왓포드 FC', '2.94', '3.35', '', '', '에버턴 FC', '2.49', '진행중', 10, '25', '진행중', '01/21 13:28'),
	('aaa', 180, '2', '02.02	00:00', '왓포드 FC', '2.94', '3.35', '', '', '에버턴 FC', '2.49', '진행중', 10, '34', '진행중', '01/21 13:27'),
	('aaa', 179, '1', '02.02	00:00', '왓포드 FC', '2.94', '3.35', '', '', '에버턴 FC', '2.49', '진행중', 10, '25', '진행중', '01/21 13:27'),
	('aaa', 178, '1', '02.02	00:00', '왓포드 FC', '2.94', '3.35', '', '', '에버턴 FC', '2.49', '진행중', 15000, '37350', '진행중', '01/21 13:01'),
	('aaa', 203, '1', '02.02 00:00', '왓포드 FC', '1.57', '-0.50', '', '', '에버턴 FC', '1.43', '진행중', 100, '143', '진행중', '01/21 15:01'),
	('aaa', 204, '1', '02.02 00:00', '왓포드 FC', '1.57', '-0.50', '', '', '에버턴 FC', '1.43', '진행중', 10, '16', '진행중', '01/21 15:02'),
	('aaa', 205, '1', '02.02	00:00', '왓포드 FC', '2.94', '3.35', '', '', '에버턴 FC', '2.49', '진행중', 10, '29', '진행중', '01/21 15:02'),
	('aaa', 206, '2', '02.02	00:00', '왓포드 FC', '2.94', '3.35', '', '', '에버턴 FC', '2.49', '진행중', 10, '34', '진행중', '01/21 15:02'),
	('aaa', 207, '3', '02.02 00:00', '왓포드 FC', '1.83', '(2.50)', '▼ ', '▲', '페루', '1.98', '진행중', 10, '20', '진행중', '01/21 15:02'),
	('aaa', 208, '1', '02.02 00:00', '왓포드 FC', '1.83', '(2.50)', '▼ ', '▲', '페루', '1.98', '진행중', 10, '18', '진행중', '01/21 15:02'),
	('aaa', 209, '3', '02.02 00:00', '왓포드 FC', '1.83', '(2.50)', '▼ ', '▲', '페루', '1.98', '진행중', 100, '198', '진행중', '01/21 15:02'),
	('aaa', 210, '3', '02.02 00:00', '왓포드 FC', '1.83', '(2.50)', '▼ ', '▲', '페루', '1.98', '진행중', 10000, '19800', '진행중', '01/21 15:02'),
	('aaa', 211, '1', '02.02 00:00', '왓포드 FC', '1.83', '(2.50)', '▼ ', '▲', '페루', '1.98', '진행중', 1000, '1830', '진행중', '01/21 15:02'),
	('aaa', 212, '1', '06.19	09:30', '브라질', '1.32', '3.20', '', '', '베네수엘라', '1.85', '진행중', 1000, '1320', '진행중', '01/21 15:02'),
	('aaa', 213, '3', '06.19	04:00', '이탈리아', '2.00', '(2.50)', '▼ ', '▲', '브라질', '1.87 ', '진행중', 1000, '1870', '진행중', '01/21 15:03'),
	('aaa', 214, '3', '06.19	04:00', '이탈리아', '2.00', '(2.50)', '▼ ', '▲', '브라질', '1.87 ', '진행중', 1000, '1870', '진행중', '01/21 15:03'),
	('aaa', 215, '3', '06.19	04:00', '이탈리아', '2.00', '(2.50)', '▼ ', '▲', '브라질', '1.87 ', '진행중', 10, '19', '진행중', '01/21 15:04'),
	('aaa', 216, '3', '06.19	04:00', '이탈리아', '2.00', '(2.50)', '▼ ', '▲', '브라질', '1.87 ', '진행중', 100, '187', '진행중', '01/21 15:04'),
	('aaa', 217, '3', '06.19	04:00', '이탈리아', '2.00', '(2.50)', '▼ ', '▲', '브라질', '1.87 ', '진행중', 1000, '1870', '진행중', '01/21 15:04'),
	('aaa', 218, '3', '06.19	04:00', '이탈리아', '2.00', '(2.50)', '▼ ', '▲', '브라질', '1.87 ', '진행중', 100, '187', '진행중', '01/21 15:04'),
	('aaa', 219, '3', '06.19	04:00', '이탈리아', '2.00', '(2.50)', '▼ ', '▲', '브라질', '1.87 ', '진행중', 100, '187', '진행중', '01/21 15:05'),
	('aaa', 220, '3', '06.19	04:00', '이탈리아', '2.00', '(2.50)', '▼ ', '▲', '브라질', '1.87 ', '진행중', 10, '19', '진행중', '01/21 15:05'),
	('aaa', 221, '3', '06.19	04:00', '자메이카', '1.95', '(2.50)', '▼ ', '▲', '호주', '2.00', '진행중', 10, '20', '진행중', '01/21 15:06'),
	('aaa', 222, '3', '06.20	04:00', '스코틀랜드', '2.10', '(2.50)', '▼ ', '▲', '아르헨티나', '1.98', '진행중', 10, '20', '진행중', '01/21 15:06'),
	('aaa', 223, '3', '06.20	04:00', '일본', '1.97', '(3.50)', '▼ ', '▲', '잉글랜드', '2.24', '진행중', 10, '22', '진행중', '01/21 15:08'),
	('aaa', 224, '3', '06.19	04:00', '이탈리아', '2.00', '(3.50)', '▼ ', '▲', '브라질', '1.87 ', '진행중', 10, '19', '진행중', '01/21 15:08'),
	('aaa', 225, '3', '06.19	04:00', '자메이카', '1.95', '(2.50)', '▼ ', '▲', '호주', '2.00', '진행중', 10, '20', '진행중', '01/21 15:08'),
	('aaa', 226, '3', '06.20	04:00', '스코틀랜드', '2.10', '(2.50)', '▼ ', '▲', '아르헨티나', '1.98', '진행중', 10, '20', '진행중', '01/21 15:08'),
	('aaa', 227, '3', '06.20	04:00', '스코틀랜드', '2.10', '(2.50)', '▼ ', '▲', '아르헨티나', '1.98', '진행중', 10, '20', '진행중', '01/21 15:08'),
	('aaa', 228, '3', '06.19	04:00', '자메이카', '1.95', '(2.50)', '▼ ', '▲', '호주', '2.00', '진행중', 10, '20', '진행중', '01/21 15:09'),
	('aaa', 229, '3', '06.19	04:00', '이탈리아', '2.00', '(3.50)', '▼ ', '▲', '브라질', '1.87 ', '진행중', 10, '19', '진행중', '01/21 15:09'),
	('aaa', 230, '3', '06.19	09:30', '브라질', '1.87', '(3.50)', '▼ ', '▲', '베네수엘라', '1.90', '진행중', 10, '19', '진행중', '01/21 15:09'),
	('aaa', 231, '3', '02.02 00:00', '왓포드 FC', '1.83', '(2.50)', '▼ ', '▲', '페루', '1.98', '진행중', 10, '20', '진행중', '01/21 15:09'),
	('aaa', 232, '3', '06.20	04:00', '스코틀랜드', '2.10', '(3.00)', '▼ ', '▲', '아르헨티나', '1.98', '진행중', 10, '20', '진행중', '01/21 15:09'),
	('aaa', 233, '2', '06.19	04:00', '자메이카', '2.08', '2.84', '', '', '호주', '1.83', '진행중', 10, '28', '진행중', '01/21 15:09'),
	('aaa', 234, '3', '02.02 00:00', '왓포드 FC', '1.57', '-0.50', '', '', '에버턴 FC', '1.43', '진행중', 10, '14', '진행중', '01/21 15:10'),
	('aaa', 235, '3', '06.20	04:00', '일본', '1.54', '+1.50', '', '', '잉글랜드', '3.38', '진행중', 10, '34', '진행중', '01/21 15:10'),
	('ccc', 236, '1', '10.11', '한국', '1.23', '(3.50)', '▼', '▲', '일본', '2.5', '진행중', 66, '81', '진행중', '01/28 09:22'),
	('ccc', 237, '1', '10.11', '한국', '1.23', '2.54', '', '', '일본', '2.5', '진행중', 1, '1', '진행중', '01/28 09:25'),
	('ccc', 238, '1', '10.11', '일본', '1.23', '(3.50)', '▼', '▲', '일본', '2.5', '진행중', 10, '12', '진행중', '01/28 10:02'),
	('ccc', 239, '1', '10.11', '일본', '1.23', '(3.50)', '▼', '▲', '일본', '2.5', '진행중', 100, '123', '진행중', '01/28 10:06'),
	('ccc', 240, '3', '10.11', '일본', '1.23', '(3.50)', '▼', '▲', '일본', '2.5', '진행중', 10, '25', '진행중', '01/28 10:10'),
	('ccc', 241, '3', '10.11', '일본', '1.23', '(3.50)', '▼', '▲', '일본', '2.5', '진행중', 10, '25', '진행중', '01/28 10:30'),
	('ccc', 242, '1', '10.11', '일본', '1.23', '(3.50)', '▼', '▲', '일본', '2.5', '진행중', 10, '12', '진행중', '01/28 12:48'),
	('ccc', 243, '1', '10.11', '한국', '1.23', '2.54', '', '', '일본', '2.5', '진행중', 10, '12', '진행중', '01/28 12:48'),
	('ccc', 244, '1', '10.11', '한국', '1.23', '(3.50)', '▼', '▲', '일본', '2.5', '진행중', 1000, '1230', '진행중', '01/28 12:48'),
	('ccc', 245, '1', '10.11', '일본', '1.23', '(3.50)', '▼', '▲', '일본', '2.5', '진행중', 1000, '1230', '진행중', '01/28 12:48'),
	('ccc', 246, '2', '10.11', '한국', '1.23', '2.54', '', '', '일본', '2.5', '진행중', 100, '254', '진행중', '01/28 12:48'),
	('ccc', 247, '3', '10.11', '일본', '1.23', '(3.50)', '▼', '▲', '일본', '2.5', '진행중', 1000, '2500', '진행중', '01/28 12:49'),
	('ccc', 248, '1', '02.02 00:00', '왓포드', '1.97', '(2.50)', '▼', '▲', '에버턴', '1.75', '진행중', 1000, '1970', '진행중', '01/28 13:01'),
	('ccc', 249, '3', '02.01 21:30', '레스터 시티', '1.89', '(3.50)', '▼', '▲', '첼시', '1.92', '진행중', 1000, '1920', '진행중', '01/28 13:01'),
	('ccc', 250, '2', '02.02 00:00', '왓포드', '1.76', '2.54', '', '', '에버턴', '2.12', '진행중', 1000, '2540', '진행중', '01/28 13:01'),
	('ccc', 251, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 1000, '2600', '진행중', '01/28 14:09'),
	('ccc', 252, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 1683, '4376', '진행중', '01/28 14:10'),
	('ccc', 253, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 1000, '2600', '진행중', '01/28 14:12'),
	('ccc', 254, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 15:01'),
	('ccc', 255, '2', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '230', '진행중', '01/28 15:01'),
	('ccc', 256, '3', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '150', '진행중', '01/28 15:01'),
	('ccc', 257, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 1000, '2600', '진행중', '01/28 15:47'),
	('ccc', 258, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 15:48'),
	('ccc', 259, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 1000, '2600', '진행중', '01/28 15:49'),
	('ccc', 260, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 500, '1300', '진행중', '01/28 15:49'),
	('ccc', 261, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 15:53'),
	('ccc', 262, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 15:54'),
	('ccc', 263, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 15:55'),
	('ccc', 264, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 15:56'),
	('ccc', 265, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 16:01'),
	('ccc', 266, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 16:12'),
	('ccc', 267, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 40, '104', '진행중', '01/28 16:13'),
	('ccc', 268, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 16:15'),
	('ccc', 269, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 16:15'),
	('ccc', 270, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 16:16'),
	('ccc', 271, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 16:17'),
	('ccc', 272, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 16:18'),
	('ccc', 273, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 1000, '2600', '진행중', '01/28 16:18'),
	('ccc', 274, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 16:18'),
	('ccc', 275, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 16:19'),
	('ccc', 276, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 16:19'),
	('ccc', 277, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 16:20'),
	('ccc', 278, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 16:20'),
	('ccc', 279, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 16:24'),
	('ccc', 280, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 16:26'),
	('ccc', 281, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 16:26'),
	('ccc', 282, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 16:27'),
	('ccc', 283, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 144, '374', '진행중', '01/28 16:27'),
	('ccc', 284, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 16:28'),
	('ccc', 285, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 16:28'),
	('ccc', 286, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 16:28'),
	('ccc', 287, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 16:29'),
	('ccc', 288, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 16:41'),
	('ccc', 289, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 16:41'),
	('ccc', 290, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 16:42'),
	('ccc', 291, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 16:55'),
	('ccc', 292, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 16:56'),
	('ccc', 293, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 140, '364', '진행중', '01/28 16:57'),
	('ccc', 294, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 16:58'),
	('ccc', 295, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 16:59'),
	('ccc', 296, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 17:01'),
	('ccc', 297, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 410, '1066', '진행중', '01/28 17:05'),
	('ccc', 298, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 10, '26', '진행중', '01/28 17:07'),
	('ccc', 299, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 17:07'),
	('ccc', 300, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 100, '260', '진행중', '01/28 17:08'),
	('ccc', 301, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 10000000, '26000000', '진행중', '01/28 17:08'),
	('ccc', 302, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 10, '26', '진행중', '01/28 17:09'),
	('ccc', 303, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 10, '26', '진행중', '01/28 17:09'),
	('ccc', 304, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 1000, '2600', '진행중', '01/28 17:09'),
	('ccc', 305, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 1, '3', '진행중', '01/28 17:10'),
	('ccc', 306, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 5000, '13000', '진행중', '01/28 17:31'),
	('ccc', 307, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 300, '780', '진행중', '01/28 17:33'),
	('ccc', 308, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 1000, '2600', '진행중', '02/05 08:49'),
	('ccc', 311, '3', '4', '5', '6', '7', '', '', '9', '0', '4:5', 1000, '0', '적중', '02/05 09:21'),
	('ccc', 312, '1', '02.01 21:30', '레스터 시티', '1.89', '(3.50)', '▼', '▲', '첼시', '1.92', '진행중', 100, '189', '진행중', '02/05 09:26'),
	('ccc', 313, '1', '02.02 00:00', '왓포드', '1.97', '(2.50)', '▼', '▲', '에버턴', '1.75', '진행중', 1000, '1970', '진행중', '02/05 09:26'),
	('ccc', 314, '1', '02.01 21:30', '레스터 시티', '2.6', '2.3', '', '', '첼시', '1.5', '진행중', 10, '26', '진행중', '02/05 09:26'),
	('ccc', 315, '3', '88', '8', '8', '8', '', '', '8', '8', '진행중', 10, '80', '진행중', '02/05 09:27');
/*!40000 ALTER TABLE `bet` ENABLE KEYS */;

-- 테이블 zlzone.board 구조 내보내기
CREATE TABLE IF NOT EXISTS `board` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `title` varchar(1000) DEFAULT NULL,
  `board` varchar(20000) DEFAULT NULL,
  `time` varchar(100) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=euckr;

-- 테이블 데이터 zlzone.board:20 rows 내보내기
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` (`num`, `name`, `title`, `board`, `time`, `level`) VALUES
	(1, '토쟁이', '이벤트', '이벤트', '05/29 00:13', 4),
	(2, '토쟁이', '테스트요', '테스트요', '05/29 00:12', 4),
	(3, '123', '???', 'ddd', '05/29 00:13', 1),
	(4, '555', '한강물온도 몇인가요?', '개말리네', '05/29 00:12', 3),
	(5, '555', '구제좀요.', 'ㄷㄷ', '05/29 00:12', 3),
	(6, '토쟁이', '가즈아', 'ㅇㅇ', '05/29 00:16', 4),
	(7, '123', '한강 가실분구함; (1/5)', '다꼴음;l', '05/29 10:11', 1),
	(8, '인생은한방', '비트코인으로 갈아타자', '빡치네', '05/29 10:14', 2),
	(9, '대학생', '대학등록금 다 잃었습니다.', ';;', '05/29 10:15', 3),
	(10, '토쟁이', '44', '44', '06/04 11:10', 4),
	(11, '555', '창의적종합설계 재밌22', '55555555555', '06/11 21:06', 3),
	(14, '토쟁이', '666', '66', '12/03 23:50', 4),
	(16, '아아앙', 'aaa', '12312312', '1232', 1),
	(17, '아아앙', '안녕', 'aaa', '하심미까', 1),
	(18, '아아앙', '123ㅇㅁㅇㄴㅇㅁㄴㅇㅁㄴ', '123ㅁㄴㅇㅁㄴㅇ', '120-1-21 13:6:25', 1),
	(19, '아아앙', 'ㅇㅋㅇㅋ', 'ㄴㅇ', '1/21 13:7:20', 1),
	(20, '아아앙', 'aaa', 'aaa', '1/21 14:9:17', 1),
	(21, '아아앙', '444', '444', '01/21 14:11', 1),
	(22, '아아앙', '666', '66', '01/22 09:23', 1),
	(23, '우린', 'ddd', 'ddd', '01/22 11:21', 1);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;

-- 테이블 zlzone.comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `comment` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `indate` varchar(50) DEFAULT NULL,
  `id` varchar(50) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `parent_num` int(11) NOT NULL,
  PRIMARY KEY (`num`),
  KEY `parent_num` (`parent_num`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=euckr;

-- 테이블 데이터 zlzone.comment:14 rows 내보내기
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` (`num`, `content`, `indate`, `id`, `level`, `parent_num`) VALUES
	(107, '4', '12/03 23:51', '555', 3, 14),
	(106, '33', '12/03 23:43', 'test', 4, 9),
	(105, 'gg', '12/03 23:40', 'test', 4, 12),
	(104, 'aa', '12/03 23:40', 'test', 4, 11),
	(100, 'aa', '06/04 16:01', '토쟁이', 4, 8),
	(99, 'dd', '06/04 16:00', '토쟁이', 4, 8),
	(98, 'ee', '06/04 16:00', '토쟁이', 4, 8),
	(97, '', '05/30 14:00', '토쟁이', 4, 5),
	(96, 'ee', '05/30 13:56', '토쟁이', 4, 9),
	(95, '', '05/29 10:08', '토쟁이', 4, 5),
	(94, '333', '05/29 10:08', '토쟁이', 4, 5),
	(93, '5555', '05/29 00:17', '555', 3, 6),
	(102, 'ㅠ', '06/11 21:05', '555', 3, 9),
	(91, '23', '05/29 00:13', '123', 1, 50);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

-- 테이블 zlzone.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `id` varchar(15) CHARACTER SET utf8mb4 NOT NULL,
  `pw` varchar(200) NOT NULL,
  `name` varchar(4000) NOT NULL,
  `email` varchar(4000) NOT NULL,
  `phone` char(19) NOT NULL,
  `point` int(11) NOT NULL,
  `level` int(10) NOT NULL DEFAULT '1',
  `last` int(20) NOT NULL,
  `charge` int(30) NOT NULL COMMENT '일일충전한도',
  `pointlimit` int(11) NOT NULL COMMENT '남은한도 표시',
  `admin` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr;

-- 테이블 데이터 zlzone.member:13 rows 내보내기
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`id`, `pw`, `name`, `email`, `phone`, `point`, `level`, `last`, `charge`, `pointlimit`, `admin`) VALUES
	('555', '15de21c670ae7c3f6f3f1f37029303c9', '555', '', '555', 89974, 4, 3, 0, 1000000, 0),
	('abc', '202cb962ac59075b964b07152d234b70', '123', '', '123', 3500, 3, 6, 0, 500000, 0),
	('abcd1234', 'bfa090db05f34c93ed3513fb9cfa1074', '장뚜띠', '', '01045039647', 2000, 1, 18, 0, 10000, 0),
	('6666', 'e9510081ac30ffa83f10b68cde1cac07', '인생은한방', '', '3333333', 2500, 2, 29, 0, 100000, 0),
	('653', '15de21c670ae7c3f6f3f1f37029303c9', '123', '', '444', 1500, 1, 0, 0, 10000, 0),
	('4242', 'fe7ecc4de28b2c83c016b5c6c2acd826', '대학생', '', '333', 3000, 3, 29, 0, 500000, 0),
	('asdf', '81dc9bdb52d04dc20036dbd8313ed055', 'asd', '', '1111', 1500, 1, 0, 0, 10000, 0),
	('a', 'c4ca4238a0b923820dcc509a6f75849b', 'a', '', '123123', 1500, 1, 0, 0, 10000, 0),
	('aaa', '123', '아아앙', '123@naver.com', '01030000000', 84342, 1, 22, 0, 10000, 0),
	('bbb', '123', '아아앙', '1234@naver.com', '01030000000', 19999, 2, 20, 0, 100000, 0),
	('dddd', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '아아앙', '14423@naver.com', '01030000000', 1445000, 3, 5, 0, 500000, 0),
	('ccc', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '홍삼동', '1243@naver.com', '01030100000', 480, 1, 5, 0, 10000, 1),
	('hhh', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '사시', 'aa@aa.com', '00000000000', 10000, 1, 5, 0, 10000, 0);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;

-- 테이블 zlzone.sports 구조 내보내기
CREATE TABLE IF NOT EXISTS `sports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` varchar(30) NOT NULL,
  `home` varchar(20) NOT NULL,
  `homeb` varchar(11) NOT NULL,
  `draw` varchar(20) NOT NULL,
  `hup` varchar(10) DEFAULT NULL,
  `aup` varchar(10) DEFAULT NULL,
  `away` varchar(20) NOT NULL,
  `awayb` varchar(11) NOT NULL,
  `doing` varchar(50) NOT NULL,
  `doing2` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=159 DEFAULT CHARSET=euckr;

-- 테이블 데이터 zlzone.sports:4 rows 내보내기
/*!40000 ALTER TABLE `sports` DISABLE KEYS */;
INSERT INTO `sports` (`id`, `time`, `home`, `homeb`, `draw`, `hup`, `aup`, `away`, `awayb`, `doing`, `doing2`) VALUES
	(155, '02.02 00:00', '왓포드', '1.76', '2.54', NULL, NULL, '에버턴', '2.12', '배팅 가능', '진행중'),
	(154, '02.01 21:30', '레스터 시티', '1.89', '(3.50)', '▼', '▲', '첼시', '1.92', '배팅 가능', '진행중'),
	(153, '02.01 21:30', '레스터 시티', '2.6', '2.3', NULL, NULL, '첼시', '1.5', '배팅 가능', '진행중'),
	(156, '02.02 00:00', '왓포드', '1.97', '(2.50)', '▼', '▲', '에버턴', '1.75', '배팅 가능', '진행중');
/*!40000 ALTER TABLE `sports` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
