-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: servidorlaravel
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `idLocal` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `latitude` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idLocal`),
  KEY `locations_user_id_foreign` (`user_id`),
  CONSTRAINT `locations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (54,1,'-22.90052','-43.2382435','2021-02-11 22:42:08','2021-02-11 23:50:44');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(6,'2016_06_01_000004_create_oauth_clients_table',1),(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(8,'2019_08_19_000000_create_failed_jobs_table',1),(9,'2021_02_10_030542_create_news_table',1),(10,'2021_02_10_031732_create_locations_table',1),(11,'2021_02_10_031744_create_photos_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `idNews` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `title` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `actived` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idNews`),
  KEY `news_user_id_foreign` (`user_id`),
  CONSTRAINT `news_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,2,'titulo 0','conteudo 0',1,'2021-02-10 07:54:54','2021-02-10 07:54:54'),(2,2,'titulo 1','conteudo 1',1,'2021-02-11 23:03:30','2021-02-11 23:03:30'),(3,2,'titulo 2','conteudo 2',1,'2021-02-11 23:03:45','2021-02-11 23:03:45'),(4,1,'titulo 3','conteudo 3',1,'2021-02-11 23:04:08','2021-02-11 23:04:08');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('22b95a85418cb824c8ac8a1155e53ff2ebd72167fb6e371cbeeaadff82aa7f4fb5bd90af3d2279f1',1,3,NULL,'[]',0,'2021-02-11 17:29:13','2021-02-11 17:29:13','2022-02-11 14:29:13'),('30b3f166fe0f7f0ec90d1e552e638e4e24db9f1fd79e5d7ec6539ea2dce81a4b5c91f532bac8f3f8',1,3,NULL,'[]',0,'2021-02-11 18:33:54','2021-02-11 18:33:54','2022-02-11 15:33:54'),('4e09bf77332805b77d14fa5e8d80212814ea8dff4a2162839b2ef13bff5484f5f7291c290c00ea95',1,3,NULL,'[]',0,'2021-02-11 18:38:11','2021-02-11 18:38:11','2022-02-11 15:38:11'),('618f8892927c8c87880a30b2fdafb9caa5c931ed13235dcd644de73a1544e358c619b84687cdac89',1,3,NULL,'[]',0,'2021-02-11 18:33:07','2021-02-11 18:33:07','2022-02-11 15:33:07'),('7be1306943e208b8dc2bde1a69dcfb7eea5cddb449d0c0c1a0d6695cc8320efdad9d1895ea853e07',1,3,NULL,'[]',0,'2021-02-11 18:51:06','2021-02-11 18:51:06','2022-02-11 15:51:06'),('7d51267bded9d94eb980a258a13233c497103a371f16040d92ac44edfe0ee99d9a44b168fb331fe7',1,3,NULL,'[]',0,'2021-02-11 18:53:03','2021-02-11 18:53:03','2022-02-11 15:53:03'),('99b54c9d01fc3d3897eef75c370dad224cbdbd9d8fc0e228e99020c085221f03967241c04ad74050',1,3,NULL,'[]',0,'2021-02-11 17:23:21','2021-02-11 17:23:21','2022-02-11 14:23:21'),('9a3185bf86e6e795dafc6c6696be60723749f626e5a567b1b7bf94cd02218d3e18279793a62b90f1',1,3,NULL,'[]',0,'2021-02-11 03:53:45','2021-02-11 03:53:45','2022-02-11 00:53:45'),('a4116beef0f35740791bd10c2f65d323e8ee6a9de528a70aac516b014597834284a149f1e939cd14',1,3,NULL,'[]',0,'2021-02-11 17:28:24','2021-02-11 17:28:24','2022-02-11 14:28:24'),('a9a9323de37a864088d4747a2cb83246c330a29d84b0fe41748e3db4019d085788eeeb4dc7bdf31f',1,3,NULL,'[]',0,'2021-02-11 17:29:27','2021-02-11 17:29:27','2022-02-11 14:29:27'),('abf5efb2c3a495a6808a5d593b198c41aa9297562187ed8a6caa94e5664f8642d9e3f566ad68d1d4',1,3,NULL,'[]',0,'2021-02-11 18:49:33','2021-02-11 18:49:33','2022-02-11 15:49:33'),('c057f0fb847c4cb147575cf1792d504b200433ef443cba05be25e5747d3de85367243c5c2b7fc74b',1,3,NULL,'[]',0,'2021-02-11 16:06:57','2021-02-11 16:06:57','2022-02-11 13:06:57'),('c9a4d4de2a3b80a84be3efbe50ea5ec78f579e46e5870fc344117b3def7337d6d89e972e80c09b1f',1,3,NULL,'[]',0,'2021-02-11 18:31:43','2021-02-11 18:31:43','2022-02-11 15:31:43'),('d50fd557bff4800d59c84f05af9b23d005684c8dbf3ae87850ec4f01e6e5dee48cd0a80611f663a9',1,3,NULL,'[]',0,'2021-02-11 17:25:35','2021-02-11 17:25:35','2022-02-11 14:25:35'),('d8a720d56da5e6458242b09e33670b12b04a0a25b6e9512e986c13b5564991535e2353665d60525d',1,3,NULL,'[]',0,'2021-02-11 18:36:18','2021-02-11 18:36:18','2022-02-11 15:36:18'),('fd94cef17d731009f6d35467f3556b93703aa8767a7452362acadfc3cf26acdef10cd1825555fd57',1,3,NULL,'[]',0,'2021-02-10 17:46:17','2021-02-10 17:46:17','2022-02-10 14:46:17');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
INSERT INTO `oauth_auth_codes` VALUES ('020d4170cb72371aa00bcee7d3c7c6835c8473f3cf92584201cabc2d9b4b53182977d24764306b08',1,3,'[]',1,'2021-02-11 01:03:43'),('045ed48a204af0f246706cf41f4562e950913e2ec5af93af6e794c41652b17eb7beba503fa25dbb1',1,3,'[]',1,'2021-02-11 15:43:06'),('0967a0cbfbeeacd1eefb264944abe1c330c1da3eed4ff3d77faed10b95423e27884d4f3f7da2bcef',1,3,'[]',1,'2021-02-11 15:48:10'),('0bc1feaae88a84c4ca881997fb3f8bc66032c221dd03a5a2950f43f1a8b9366e6170b09edaa5bda6',1,3,'[]',1,'2021-02-10 14:56:16'),('14f1fc1eca92b12fbdbb1e188651243b18df3123789eedba6fd94fab5bbfa9484027c4c62dd18d7b',1,3,'[]',0,'2021-02-11 01:03:14'),('1637f7ffdb83cca0eef43eed3f322e4daa8bd01338c8db7fcc8e11024d09981bec3ec939d1181b64',1,3,'[]',1,'2021-02-11 14:38:23'),('2e0c4a13094deb819e8e46c019949ecdb5359ba3e81bf294d7e0e46362b76f91dcc1a102c7d6b146',1,3,'[]',0,'2021-02-10 14:54:46'),('3cd3e41f7412aa6f862ffa544a6add7376ceb72a8889a2981ebbe04ea91733c5b24fb243d44ebdca',1,3,'[]',0,'2021-02-11 14:53:21'),('44481145d9c3b09ee482bb67008dfeb28c1035497ad3e39619b07ec8997d33a724771f513b984657',1,3,'[]',1,'2021-02-11 14:33:20'),('5a062545e01be02d6418eb586eaf0f4bafad1d90e860caddacfa0ac509c60fe64e58a1776ca1ce82',1,3,'[]',1,'2021-02-11 14:35:34'),('82dbca02e27a6fff80ecf26c633765a04676e168332849288e151966e6a9e03395717369c37d86c4',1,3,'[]',0,'2021-02-11 01:03:06'),('8cb4b0cd45427d85f49814dd9cf3643b524cb216c126da399ee5b848aa54e51986c5996a32f0dbe9',1,3,'[]',1,'2021-02-11 16:01:05'),('96695943cbb820238997d33e8f480f88842fe88641e36852a58680a50ba0d7129e7fd982cdb4dad2',1,3,'[]',0,'2021-02-10 14:55:20'),('9ba22db3026bfb37c28db7730e874c322232fe0f4d6c0a17d78063b2c8ca5adf453bb03e7460be2f',1,3,'[]',1,'2021-02-11 15:41:42'),('9e65c0b4ad256ea80f5ca962478429d1093946eec945ea086cd02d60da0a63046b5bc32d6627a8b3',1,3,'[]',1,'2021-02-11 15:43:53'),('a4298a67d30ced90832fb8cebd7ead747c4aa69f2dddc41bd90b1ce5ae0cddf47f79eae6cfcdf2e0',1,3,'[]',1,'2021-02-11 16:03:02'),('c74751f294d41e45cd5ee9bb65f08e3734200c3e1c37da6a426d248d2ea2c47cf0d3db5a00ae6bc2',1,3,'[]',1,'2021-02-11 13:16:56'),('cb275dbe5f59fe6994940b2b60f9dfa47eecebf374c7c19ce16cc52f9f7d3e858e42c5e1586fad0e',1,3,'[]',1,'2021-02-11 14:39:13'),('e13d8a4de13286f8db4640583ee0e428ac7f88c1e982872d9cea92f7ed696262d4cb77d438039dda',1,3,'[]',1,'2021-02-11 14:39:26'),('f3fd7241b3c079c3dcb17f84e07d0fe480d0424ae05ac861cbb19a5f367cbbf1402025bd1f888db7',1,3,'[]',1,'2021-02-11 15:59:32'),('f4cc0b73d1bfd22b35d1c25a936ff3f9ef80a6a264fbb55e550d96aaf46413df2388268bb99589e9',1,3,'[]',0,'2021-02-10 14:53:54'),('fd694f1c2789ad89ccb7a0a68ca9dab52a4c164b90c07f7418ab565b6800c2861b45a097378df408',1,3,'[]',1,'2021-02-11 15:46:17');
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'servidorLaravel Personal Access Client','MUOccZryMBdFMa7GtcQIhatCWZMYzwBfVG3mF8Hn',NULL,'http://localhost',1,0,0,'2021-02-10 08:26:32','2021-02-10 08:26:32'),(2,NULL,'servidorLaravel Password Grant Client','lzj6Q4A9kCjmG5UmBv42Q7jso2KLHUE8rLZmG841','users','http://localhost',0,1,0,'2021-02-10 08:26:33','2021-02-10 08:26:33'),(3,NULL,'appCliente','HrdgTrDfNLJ30SerNnMJPIrw70UFXIEJZYqoIDus',NULL,'http://192.168.1.40:8001/callback',0,0,0,'2021-02-10 08:28:08','2021-02-10 08:28:08');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2021-02-10 08:26:32','2021-02-10 08:26:32');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
INSERT INTO `oauth_refresh_tokens` VALUES ('2414c988b295abccd439036c55e20c9f4ec59ca58cea73e9fa1953d2b61cfbdc3644028cbcba1c7b','618f8892927c8c87880a30b2fdafb9caa5c931ed13235dcd644de73a1544e358c619b84687cdac89',0,'2022-02-11 15:33:08'),('4acc5e9162ab7a9bb6922a51146d38ad181a97c03fc5c839793f87a1ed2ad2a41d493a1da6cbfb32','22b95a85418cb824c8ac8a1155e53ff2ebd72167fb6e371cbeeaadff82aa7f4fb5bd90af3d2279f1',0,'2022-02-11 14:29:14'),('62c874edc3bf9ece4fbbbda0d50bc905f7913551ef13ac8ce0ff45d8e9c4478fe4eecfc010089d60','c057f0fb847c4cb147575cf1792d504b200433ef443cba05be25e5747d3de85367243c5c2b7fc74b',0,'2022-02-11 13:06:58'),('7ab14c369b8c17924499b463325f35e63241d2339176bb6629d6a90e8305ab5947090687943502e2','fd94cef17d731009f6d35467f3556b93703aa8767a7452362acadfc3cf26acdef10cd1825555fd57',0,'2022-02-10 14:46:17'),('8d7101674e4487fac7f57233557cb4127311e02fff940206383c162971b8770329c564a4586c7c69','a9a9323de37a864088d4747a2cb83246c330a29d84b0fe41748e3db4019d085788eeeb4dc7bdf31f',0,'2022-02-11 14:29:27'),('91356fc14430a4498786ad6df9fa133c84c6867a1e90760adb52862a48c08b5ddb4291072fd7e6f8','30b3f166fe0f7f0ec90d1e552e638e4e24db9f1fd79e5d7ec6539ea2dce81a4b5c91f532bac8f3f8',0,'2022-02-11 15:33:55'),('995dddfd4baa7a1820bc464337a7ba572e84011c4d5bd16bf0c779d37b73f776b81ffd0d7d010401','9a3185bf86e6e795dafc6c6696be60723749f626e5a567b1b7bf94cd02218d3e18279793a62b90f1',0,'2022-02-11 00:53:45'),('9a0c25ce7a5b1442be5212a303f447a427348cb20f642cfbb566ed16efd1ec7516b88c2769401753','99b54c9d01fc3d3897eef75c370dad224cbdbd9d8fc0e228e99020c085221f03967241c04ad74050',0,'2022-02-11 14:23:21'),('ac2385ed0b361f4a6ab6ce01777ed3a4f34658ccabaf67f5f6245965fe6dd47479ef7342468350a7','c9a4d4de2a3b80a84be3efbe50ea5ec78f579e46e5870fc344117b3def7337d6d89e972e80c09b1f',0,'2022-02-11 15:31:43'),('bdf3d7228d35b1cd93087c1e93ed596defac1b36e6814ce23533f855e887288960af9bbfe8fcdf7c','7be1306943e208b8dc2bde1a69dcfb7eea5cddb449d0c0c1a0d6695cc8320efdad9d1895ea853e07',0,'2022-02-11 15:51:06'),('bf7aa133640a99a1e2b3c7e470d379503539005ddde9db6f3498e5d0fb86365cb807de89d5499c38','7d51267bded9d94eb980a258a13233c497103a371f16040d92ac44edfe0ee99d9a44b168fb331fe7',0,'2022-02-11 15:53:04'),('c0c3dacedff756e02a0ab0d57f676b4370fb1265755e0ee505d1fe026b49e46b30ab40b605ca4273','d50fd557bff4800d59c84f05af9b23d005684c8dbf3ae87850ec4f01e6e5dee48cd0a80611f663a9',0,'2022-02-11 14:25:35'),('cf4ebbc6019d811eca7b5c0eff8f5c07d5506e3807c5aed90bfd9c83f4fbe64fc3abd51dd313ebc9','d8a720d56da5e6458242b09e33670b12b04a0a25b6e9512e986c13b5564991535e2353665d60525d',0,'2022-02-11 15:36:18'),('e061e987b82d4eaabc7a88cbb420e9be46dccbf9dab43b53c57466b028d4821f9af9ab3cd4b31446','4e09bf77332805b77d14fa5e8d80212814ea8dff4a2162839b2ef13bff5484f5f7291c290c00ea95',0,'2022-02-11 15:38:11'),('e8d55d5d6bd1a8b6d5bef1e644ab6f37685a88d29d176645527cf727a0cee5f1f5b7d20e3dc927f9','a4116beef0f35740791bd10c2f65d323e8ee6a9de528a70aac516b014597834284a149f1e939cd14',0,'2022-02-11 14:28:24'),('ecdb134ba1985bc877f5741bfbcc4472c4644b43bd2b18473d842dd233d9d05d9c1f0719f691126e','abf5efb2c3a495a6808a5d593b198c41aa9297562187ed8a6caa94e5664f8642d9e3f566ad68d1d4',0,'2022-02-11 15:49:33');
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photos` (
  `idPhoto` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `pathPhoto` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actived` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idPhoto`),
  KEY `photos_user_id_foreign` (`user_id`),
  CONSTRAINT `photos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (2,1,'503d848b-62c0-4104-ad15-2b6189c6d145.jpg28112c5190fc8b7e50919fc325395bc7.jpg','Foto tirada pelo celular - 1613065283',1,'2021-02-11 20:41:23','2021-02-11 20:41:23'),(3,1,'d9322a87-6b9a-4063-bd60-427925f543b4.jpgfa7d9f4bb7b649846c5b6f38066732eb.jpg','Foto tirada pelo celular - 1613065822',1,'2021-02-11 20:50:22','2021-02-11 20:50:22');
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actived` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@outlook.com',NULL,'$2y$10$9Ca01KRXaD4Gd.lN7SxJbuo1fFlUH2gDc.6qhr/JkPB/JiGtLmhze',1,NULL,'2021-02-10 07:27:20','2021-02-10 07:27:20'),(2,'Douglas A. Silva','Douglas_araujo018@outlook.com',NULL,'161ae56fdee2cc16161e14ce86b5ecc8',1,NULL,'2021-02-10 07:43:31','2021-02-10 08:06:38');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-11 19:57:58
