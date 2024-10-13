-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 13, 2024 at 07:51 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taskmanager_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2024_10_13_090817_create_tasks_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'api-token', '1e9af7cabf35248c871c497f61e32afcad5124fc719f77149291426d175c378b', '[\"*\"]', NULL, NULL, '2024-10-12 01:57:42', '2024-10-12 01:57:42'),
(2, 'App\\Models\\User', 1, 'api-token', '849865ccbbd67589b78e06a0b22ddfab212e6eb7a769de50a2e15558731be3c9', '[\"*\"]', NULL, NULL, '2024-10-12 02:54:57', '2024-10-12 02:54:57'),
(3, 'App\\Models\\User', 1, 'api-token', 'a0540a8f0421ba16722b04dca04ed80ac7b4b1955e2b5b29f0c831b378377efe', '[\"*\"]', NULL, NULL, '2024-10-12 02:58:54', '2024-10-12 02:58:54'),
(4, 'App\\Models\\User', 1, 'api-token', '23cf4b3f0c42fc76e4fc55d804892ceb4e36409225693316d8c0e992ba53778b', '[\"*\"]', NULL, NULL, '2024-10-12 03:07:25', '2024-10-12 03:07:25'),
(5, 'App\\Models\\User', 1, 'api-token', '0fb66d4c49a8e80513720c0caac34716602502d42faaf0a7340af30adf0c33e6', '[\"*\"]', '2024-10-12 03:32:16', NULL, '2024-10-12 03:08:29', '2024-10-12 03:32:16'),
(6, 'App\\Models\\User', 2, 'api-token', 'f580589d90ac0cdfbc59ba06294c3521caba89a5f014db15f62c4448bf190182', '[\"*\"]', NULL, NULL, '2024-10-12 21:17:59', '2024-10-12 21:17:59'),
(7, 'App\\Models\\User', 2, 'api-token', 'bc43d5d33dbd6c0b24445018de5570081860cef5159851afbd3fc09044db08aa', '[\"*\"]', NULL, NULL, '2024-10-12 21:18:22', '2024-10-12 21:18:22'),
(8, 'App\\Models\\User', 2, 'api-token', '2c9496df2651f78651a4024fcf42daeb9ddb03fd22d1b4b902ff8b07188ae2a7', '[\"*\"]', NULL, NULL, '2024-10-12 23:49:39', '2024-10-12 23:49:39'),
(9, 'App\\Models\\User', 3, 'api-token', '07470d39ca70a7a860ad79f21ccbad008bb5eabe5c3c2456fc9b1d0210a09fcb', '[\"*\"]', NULL, NULL, '2024-10-12 23:50:53', '2024-10-12 23:50:53'),
(10, 'App\\Models\\User', 3, 'api-token', '932a0e5f10fa18ac1ce2b5355a9226b0b48a8815f34bd7f3ef4277ce83273c7e', '[\"*\"]', NULL, NULL, '2024-10-12 23:58:06', '2024-10-12 23:58:06'),
(11, 'App\\Models\\User', 3, 'api-token', 'aa7faa2d46fe6ccb743dce885a6613435cf4f172ac449e2fc3e7c1a57eba56be', '[\"*\"]', NULL, NULL, '2024-10-13 00:02:10', '2024-10-13 00:02:10'),
(12, 'App\\Models\\User', 3, 'api-token', '03eea3f7726841c4e582c496821f7a5efb3026f7da3232ecf1188622127e84bf', '[\"*\"]', NULL, NULL, '2024-10-13 00:06:50', '2024-10-13 00:06:50'),
(13, 'App\\Models\\User', 2, 'api-token', 'f153074e7c8c5135e93b3f761263478aa528f897561f7cc03b2b538f0491f97f', '[\"*\"]', NULL, NULL, '2024-10-13 00:14:26', '2024-10-13 00:14:26'),
(14, 'App\\Models\\User', 3, 'api-token', '666d3eb8f639618aef07caa374ac62b2401c5b9000dc75ad7cc9feb08cb44658', '[\"*\"]', NULL, NULL, '2024-10-13 00:15:15', '2024-10-13 00:15:15'),
(15, 'App\\Models\\User', 3, 'api-token', '1600299dc5b083c61f9be89bcaf9dae05b6b52cb70357b6ee98637aaa5252bb0', '[\"*\"]', NULL, NULL, '2024-10-13 00:15:49', '2024-10-13 00:15:49'),
(16, 'App\\Models\\User', 3, 'api-token', '7a6800da860e7432b58f65b91256752141fc457a9a4e9ac3c28fef825f113f2e', '[\"*\"]', NULL, NULL, '2024-10-13 00:16:23', '2024-10-13 00:16:23'),
(17, 'App\\Models\\User', 3, 'api-token', '591a01448d41a5a6e9df600fb4d3baa4cd156739e0f4a2e67d131da1ccf3ef07', '[\"*\"]', NULL, NULL, '2024-10-13 00:16:54', '2024-10-13 00:16:54'),
(18, 'App\\Models\\User', 3, 'api-token', 'ec17a896be1ac544e4b0d6af8f15406bbbfb5f03c0ac4ceba9e69ead433d91ba', '[\"*\"]', NULL, NULL, '2024-10-13 00:24:15', '2024-10-13 00:24:15'),
(19, 'App\\Models\\User', 2, 'api-token', 'a1f8f6d3a7d7df83244d2664645d9bd917d0b4116ca1c59a320005f3987ef1f7', '[\"*\"]', '2024-10-13 08:04:11', NULL, '2024-10-13 00:24:33', '2024-10-13 08:04:11'),
(20, 'App\\Models\\User', 3, 'api-token', 'fa6884155a3fcce076ec1a8cec4620361faee370a0c934fe5a03efdb069faaf6', '[\"*\"]', NULL, NULL, '2024-10-13 00:35:54', '2024-10-13 00:35:54'),
(21, 'App\\Models\\User', 3, 'api-token', '726cc6ddf93ff2bfb8dac9b110b190d0a909d0f974806de29391a9c7dd9939f4', '[\"*\"]', NULL, NULL, '2024-10-13 00:37:19', '2024-10-13 00:37:19'),
(22, 'App\\Models\\User', 3, 'api-token', '1aefc938c6e4e594894d0b2b11815c953665b9b38d4a5da9aa64081198ebf7d0', '[\"*\"]', NULL, NULL, '2024-10-13 00:38:48', '2024-10-13 00:38:48'),
(23, 'App\\Models\\User', 2, 'api-token', '83a0589dd8fbf72f1668552072adee648566a774ec6508f31735807ed5bff280', '[\"*\"]', NULL, NULL, '2024-10-13 00:41:30', '2024-10-13 00:41:30'),
(24, 'App\\Models\\User', 3, 'api-token', 'f7042e6fe3a5c1a048888cf72b2edce648c75de59fdb1c26d4b7cba279062077', '[\"*\"]', NULL, NULL, '2024-10-13 00:44:43', '2024-10-13 00:44:43'),
(25, 'App\\Models\\User', 3, 'api-token', '87f48b25c22dad71da08dda730a17587b7b1d7b8e0268ff71880b1ba42c21918', '[\"*\"]', NULL, NULL, '2024-10-13 00:47:48', '2024-10-13 00:47:48'),
(26, 'App\\Models\\User', 3, 'api-token', '7a984d9916a5f08493b65d6d864ccb3ceaadb9b927b625aa3733911f10ee5d85', '[\"*\"]', NULL, NULL, '2024-10-13 00:52:08', '2024-10-13 00:52:08'),
(27, 'App\\Models\\User', 3, 'api-token', 'f4800f52a2eb7a8f717c826864a4ed25ae99c222cbb52b9ce66725ad33884981', '[\"*\"]', NULL, NULL, '2024-10-13 00:57:17', '2024-10-13 00:57:17'),
(28, 'App\\Models\\User', 2, 'api-token', '96f6e4f69920022fcb2b6f200a1ae127c51a836edfb9e63648f1ebb46d18b74c', '[\"*\"]', NULL, NULL, '2024-10-13 00:58:07', '2024-10-13 00:58:07'),
(29, 'App\\Models\\User', 2, 'api-token', '2c431e25cf9c02de2e679dfb28612e9e34ec468b8db0b8583e0d66ef827f3170', '[\"*\"]', NULL, NULL, '2024-10-13 00:58:47', '2024-10-13 00:58:47'),
(30, 'App\\Models\\User', 3, 'api-token', '11681ed478ecd3cc3f6611123fb6010dea9cf7e15aaa15f05bd06ed2d377de22', '[\"*\"]', NULL, NULL, '2024-10-13 01:03:23', '2024-10-13 01:03:23'),
(31, 'App\\Models\\User', 3, 'api-token', '8c5b69ad85a4fe5686cecb23ed93e6a987516c3e297440774aad03e0c244ecf3', '[\"*\"]', NULL, NULL, '2024-10-13 01:05:32', '2024-10-13 01:05:32'),
(32, 'App\\Models\\User', 3, 'api-token', 'bc5311089264daee8a1163826d2643b1c707269748d292f80a270e71c120b31d', '[\"*\"]', NULL, NULL, '2024-10-13 01:07:49', '2024-10-13 01:07:49'),
(33, 'App\\Models\\User', 3, 'api-token', '880604027b0d6f63a3df6ba257deb4b885d206136deddd368e779a6713f32342', '[\"*\"]', NULL, NULL, '2024-10-13 01:12:41', '2024-10-13 01:12:41'),
(34, 'App\\Models\\User', 3, 'api-token', 'b7bc5ee4fc6ad532cc9f8850c41694a95872dd28b34b4fdd25fd1fd774936d37', '[\"*\"]', NULL, NULL, '2024-10-13 01:13:50', '2024-10-13 01:13:50'),
(35, 'App\\Models\\User', 3, 'api-token', 'b469b3589fedc8bd90b6f2ef2183e2464876ff0f2de5b0e33a2fa66c11eebff2', '[\"*\"]', NULL, NULL, '2024-10-13 01:18:41', '2024-10-13 01:18:41'),
(36, 'App\\Models\\User', 3, 'api-token', '0dc23ee1af25994b712a19e470c0f1a70d47fcadb9f1eb2f1dc1efc00ffba851', '[\"*\"]', NULL, NULL, '2024-10-13 01:18:48', '2024-10-13 01:18:48'),
(37, 'App\\Models\\User', 2, 'api-token', 'f97c00cf6d2e183b2ef4016973bf764f59b727a4bea69b1c293cf1ed24b62f67', '[\"*\"]', NULL, NULL, '2024-10-13 01:21:30', '2024-10-13 01:21:30'),
(38, 'App\\Models\\User', 3, 'api-token', 'ae66e1d89278f0f3bb303b5ba2922b2826d384064dfb1c5c0e4713dda83af310', '[\"*\"]', NULL, NULL, '2024-10-13 01:26:22', '2024-10-13 01:26:22'),
(39, 'App\\Models\\User', 3, 'api-token', '9eef6fc170c6f17d9582eb04b0bc8dc372f205f37a1aeee3afca4ab33cd1c514', '[\"*\"]', NULL, NULL, '2024-10-13 01:27:34', '2024-10-13 01:27:34'),
(40, 'App\\Models\\User', 3, 'api-token', '5363e9ac79def7edb2454f904e4b0c8239197ae59c9a24641acdfc6aa1c6b732', '[\"*\"]', NULL, NULL, '2024-10-13 01:29:51', '2024-10-13 01:29:51'),
(41, 'App\\Models\\User', 3, 'api-token', '06b81596236d70c22780116a0220fd8c9f5655d46b617963e1b9b72a2aa18690', '[\"*\"]', NULL, NULL, '2024-10-13 01:37:19', '2024-10-13 01:37:19'),
(42, 'App\\Models\\User', 2, 'api-token', 'c12cda7ec51cdfa6d1db6c5305158fc0884c5ee4dc8350a1f075126e85903657', '[\"*\"]', NULL, NULL, '2024-10-13 01:38:28', '2024-10-13 01:38:28'),
(43, 'App\\Models\\User', 3, 'api-token', 'deecf6e009e610125b08a070c42f19741c0f6f9bd19f00ac0b224c1b47a5e07d', '[\"*\"]', NULL, NULL, '2024-10-13 01:44:48', '2024-10-13 01:44:48'),
(44, 'App\\Models\\User', 2, 'api-token', '6d37ca96140538ac896775129e4afa7a63fe637df03614cd6a66feff4b8ccc4d', '[\"*\"]', NULL, NULL, '2024-10-13 01:47:21', '2024-10-13 01:47:21'),
(45, 'App\\Models\\User', 3, 'api-token', 'b70aef57e5da4c1186c3b47d9b4a571d84a5ebbaff7252521ca0a4a313daf9de', '[\"*\"]', NULL, NULL, '2024-10-13 02:05:45', '2024-10-13 02:05:45'),
(46, 'App\\Models\\User', 3, 'api-token', '73c936481fd3e17f78d717f46a2c4710481d1ede30ba039afcda6f5f08846a02', '[\"*\"]', NULL, NULL, '2024-10-13 02:27:50', '2024-10-13 02:27:50'),
(47, 'App\\Models\\User', 3, 'api-token', '8dc9d94e7a948f7a93ac8a2c24b23be2f591ebf872f84df282cebc93eddae5d2', '[\"*\"]', NULL, NULL, '2024-10-13 02:28:31', '2024-10-13 02:28:31'),
(48, 'App\\Models\\User', 3, 'api-token', 'd1e4a435300a15d55676cf645a0aee5154e1527f15f1c6ca1ff6e39a735fb680', '[\"*\"]', NULL, NULL, '2024-10-13 05:52:58', '2024-10-13 05:52:58'),
(49, 'App\\Models\\User', 3, 'api-token', 'b48a54013785eba9ea3ceff8f8de6fef7670f8bc7df0250dc25fa0c30e14942e', '[\"*\"]', NULL, NULL, '2024-10-13 06:02:55', '2024-10-13 06:02:55'),
(50, 'App\\Models\\User', 2, 'api-token', 'e126d5c1b5183f0ab8b34b321480c7950bfe7fb98a3b4dad376905702fb78b17', '[\"*\"]', NULL, NULL, '2024-10-13 06:04:14', '2024-10-13 06:04:14'),
(51, 'App\\Models\\User', 2, 'api-token', '7adf3d54e580ab887d5c313139454a523dc2df98ec46708162c93ec3d1775465', '[\"*\"]', NULL, NULL, '2024-10-13 06:09:59', '2024-10-13 06:09:59'),
(52, 'App\\Models\\User', 2, 'api-token', '7637502e5ee7ee564c041672acffeb6e29c3382420fe164bbd206d6b4039491b', '[\"*\"]', NULL, NULL, '2024-10-13 06:10:58', '2024-10-13 06:10:58'),
(53, 'App\\Models\\User', 2, 'api-token', 'c1e47873c6b0ec87c11fb0b28060a39350a4f8ef060b9420519280df6b4917d5', '[\"*\"]', NULL, NULL, '2024-10-13 06:28:20', '2024-10-13 06:28:20'),
(54, 'App\\Models\\User', 3, 'api-token', 'cd8bf93426298b6092d60f06727090629195c0f92ed6306bd000efc6198a5932', '[\"*\"]', NULL, NULL, '2024-10-13 06:31:28', '2024-10-13 06:31:28'),
(55, 'App\\Models\\User', 3, 'api-token', '8da07f857bac2e194e54885baa82215c5a66eb7c7704fe9e109a63723e243cdf', '[\"*\"]', NULL, NULL, '2024-10-13 06:33:31', '2024-10-13 06:33:31'),
(56, 'App\\Models\\User', 3, 'api-token', '0d332db1eb504605a1b730784b283db4ce29e4b778577d9db54ff24c8844bb1b', '[\"*\"]', NULL, NULL, '2024-10-13 06:36:51', '2024-10-13 06:36:51'),
(57, 'App\\Models\\User', 3, 'api-token', '5d96ad9bce3d940cb70f2b988491514df84ade93650779e9ffb4b90355de6234', '[\"*\"]', NULL, NULL, '2024-10-13 06:36:55', '2024-10-13 06:36:55'),
(58, 'App\\Models\\User', 3, 'api-token', 'b63404927977df3ad17fdf08f668cb838f82126ed82c253e12f1956d2eb0aeaa', '[\"*\"]', NULL, NULL, '2024-10-13 06:38:16', '2024-10-13 06:38:16'),
(59, 'App\\Models\\User', 3, 'api-token', '37048c95abc481f06031cfb4f0db56de1c6d3eacbe85408079586a05af3b210e', '[\"*\"]', NULL, NULL, '2024-10-13 06:39:24', '2024-10-13 06:39:24'),
(60, 'App\\Models\\User', 3, 'api-token', '802ee128e10b23ce8f5b2e69cfb7588e45249e72b1cdf7e078882a258f53ba40', '[\"*\"]', NULL, NULL, '2024-10-13 07:14:01', '2024-10-13 07:14:01'),
(61, 'App\\Models\\User', 3, 'api-token', 'b899c64754cf5e2f7c55a70c872e0fc51b004a85ca5b21a6a6246183628dcb90', '[\"*\"]', '2024-10-13 07:22:57', NULL, '2024-10-13 07:17:42', '2024-10-13 07:22:57'),
(62, 'App\\Models\\User', 3, 'api-token', 'cdf6e9d9b64135b514d866808bf961a20de5b78031fbb4c40b1b36dbb1839f13', '[\"*\"]', '2024-10-13 09:27:01', NULL, '2024-10-13 07:26:44', '2024-10-13 09:27:01'),
(63, 'App\\Models\\User', 2, 'api-token', '92d16705e42f28aeab06dc955f39741e53d9409f28a15e4f335f6e2cfae09ac0', '[\"*\"]', '2024-10-13 08:16:33', NULL, '2024-10-13 08:05:32', '2024-10-13 08:16:33'),
(64, 'App\\Models\\User', 2, 'api-token', '068dc3fdbf9aef7060252f9b17e8d41f292524645b9cbd1fd9b0f7a727389794', '[\"*\"]', '2024-10-13 08:22:25', NULL, '2024-10-13 08:12:28', '2024-10-13 08:22:25'),
(65, 'App\\Models\\User', 3, 'api-token', '1343eab7bfb858921ccae10b19711e11fa4d206b47a6783f5086a337e96a4a72', '[\"*\"]', NULL, NULL, '2024-10-13 09:28:10', '2024-10-13 09:28:10'),
(66, 'App\\Models\\User', 2, 'api-token', 'bef904c546a1a8859a6304891056d9d2b651282e247b527f7186a1c07cc54e9b', '[\"*\"]', NULL, NULL, '2024-10-13 10:11:39', '2024-10-13 10:11:39'),
(67, 'App\\Models\\User', 3, 'api-token', '37154240809c2c01fe24529a3b5523eee6cfd9e5f2498a5278bb0590ca714014', '[\"*\"]', NULL, NULL, '2024-10-13 10:12:16', '2024-10-13 10:12:16'),
(68, 'App\\Models\\User', 3, 'api-token', 'cc3df39a2260bd8fbf9fcfcec1259fe801bcebe70c91206c661651d047c5affd', '[\"*\"]', '2024-10-13 10:15:06', NULL, '2024-10-13 10:15:06', '2024-10-13 10:15:06'),
(69, 'App\\Models\\User', 2, 'api-token', 'a266d7065cdfc5fb67e6827a17477aab6769e67a642cda4d276901ad8eed91bf', '[\"*\"]', '2024-10-13 10:15:22', NULL, '2024-10-13 10:15:21', '2024-10-13 10:15:22'),
(70, 'App\\Models\\User', 2, 'api-token', 'ea39b24f926fa903c9253fe9bc370fd115b552ef7a459dc1a52cd8dd0f1eb86e', '[\"*\"]', '2024-10-13 10:15:36', NULL, '2024-10-13 10:15:36', '2024-10-13 10:15:36'),
(71, 'App\\Models\\User', 3, 'api-token', '939ecb30996eb4d82bbac1bcdedad3185121724f81375ec92e95212390ff73bd', '[\"*\"]', '2024-10-13 10:52:03', NULL, '2024-10-13 10:16:32', '2024-10-13 10:52:03'),
(72, 'App\\Models\\User', 3, 'api-token', '0e60131aec70fa62993f2b52e5fac1875f08a2f4941ad8ce11a586cf982473bf', '[\"*\"]', '2024-10-13 10:27:32', NULL, '2024-10-13 10:17:10', '2024-10-13 10:27:32'),
(73, 'App\\Models\\User', 2, 'api-token', 'b0a2faad387dbc8ff898d34f8659f6f4e72ef6ed7a31ecc520df84cf724ce950', '[\"*\"]', '2024-10-13 10:39:43', NULL, '2024-10-13 10:27:54', '2024-10-13 10:39:43'),
(74, 'App\\Models\\User', 5, 'api-token', '29965c47900e2458d9e628cd14d01309d1b17e0b1b0c50aeb56efe9097649af7', '[\"*\"]', '2024-10-13 10:41:28', NULL, '2024-10-13 10:41:24', '2024-10-13 10:41:28'),
(75, 'App\\Models\\User', 3, 'api-token', 'e80bfe491f9cb274499c4cdae0873a45f84e970b7087938ec78d756e5d0c7587', '[\"*\"]', '2024-10-13 10:43:03', NULL, '2024-10-13 10:42:15', '2024-10-13 10:43:03'),
(76, 'App\\Models\\User', 3, 'api-token', '3e87e9a5eb5be6d611ac58fbadcac00bf7ed818f2cfe53be141a5657d5508ec4', '[\"*\"]', '2024-10-13 11:18:55', NULL, '2024-10-13 11:18:55', '2024-10-13 11:18:55'),
(77, 'App\\Models\\User', 3, 'api-token', '5806c3016c832fbfe6ad2eacfb517e59838ff002ba40c3dabab8a5a5eb8d6384', '[\"*\"]', '2024-10-13 11:34:38', NULL, '2024-10-13 11:28:05', '2024-10-13 11:34:38'),
(78, 'App\\Models\\User', 2, 'api-token', '0999989d56a730441779f15858b13ed5536e8ab4759828186f6b0dc852808735', '[\"*\"]', '2024-10-13 11:40:24', NULL, '2024-10-13 11:38:36', '2024-10-13 11:40:24'),
(79, 'App\\Models\\User', 3, 'api-token', '2cc7424598a01138d1a9bc3655c6d3684d48d0c3d72495909ae01be95a12a1b8', '[\"*\"]', '2024-10-13 11:40:53', NULL, '2024-10-13 11:40:42', '2024-10-13 11:40:53'),
(80, 'App\\Models\\User', 4, 'api-token', '34e181eac0da42757de62ea30b97e346b4eb4f031085b65fa8249b24124e7e62', '[\"*\"]', '2024-10-13 11:42:56', NULL, '2024-10-13 11:41:17', '2024-10-13 11:42:56'),
(81, 'App\\Models\\User', 5, 'api-token', '96a79d56870f0eeee2e6fdfadf06fd3990d181956b6ca1d3bf94e6f5dd9d5baa', '[\"*\"]', '2024-10-13 11:45:09', NULL, '2024-10-13 11:43:09', '2024-10-13 11:45:09'),
(82, 'App\\Models\\User', 5, 'api-token', 'dcf6388368ec9a1c7ac71ef3fd77e733e2fad085c98a7b5d43c784a084296849', '[\"*\"]', '2024-10-13 11:53:50', NULL, '2024-10-13 11:53:49', '2024-10-13 11:53:50');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('pending','completed') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `status`, `created_at`, `updated_at`) VALUES
(23238, 3, 'Design Homepage', 'Create the initial design for the new homepage layout', 'pending', '2024-10-13 11:33:48', '2024-10-13 11:33:48'),
(23239, 3, 'Fix Login Bug', 'Resolve the issue with users being unable to login', 'completed', '2024-10-13 11:34:14', '2024-10-13 11:34:36'),
(23240, 3, 'Update User Documentation', 'Review and update the user documentation for version 2.1', 'pending', '2024-10-13 11:34:32', '2024-10-13 11:34:32'),
(23241, 2, 'Test New API Endpoints', 'Conduct testing on the new API endpoints', 'pending', '2024-10-13 11:39:33', '2024-10-13 11:40:20'),
(23242, 2, 'Optimize Database Queries', 'Review and optimize slow database queries to improve performance', 'pending', '2024-10-13 11:39:56', '2024-10-13 11:39:56'),
(23243, 4, 'Implement User Authentication', 'Implement JWT-based user authentication for the application', 'pending', '2024-10-13 11:42:21', '2024-10-13 11:42:21'),
(23244, 4, 'Refactor CSS Styles', 'Refactor and clean up the CSS styles for better performance', 'pending', '2024-10-13 11:42:46', '2024-10-13 11:42:46'),
(23245, 5, 'Create Marketing Campaign', 'Work with the marketing team to create a new campaign', 'pending', '2024-10-13 11:43:31', '2024-10-13 11:45:05'),
(23246, 5, 'Set Up CI/CD Pipeline', 'Set up a continuous integration and delivery pipeline for the project', 'pending', '2024-10-13 11:43:55', '2024-10-13 11:43:55'),
(23247, 5, 'Design Database Schema', 'Design a scalable database schema for the new application module', 'pending', '2024-10-13 11:44:13', '2024-10-13 11:44:13'),
(23248, 5, 'Prepare Product Demo', 'Prepare a demo for the upcoming client presentation', 'pending', '2024-10-13 11:44:45', '2024-10-13 11:44:45');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Dinesh', 'dinesh@gmail.com', '$2y$10$xRiUx9WivpcWmtXrs6bVFuqB5FmbIfr8GvRX4vCTG0gPQ3a1KyfLu', '2024-10-12 01:53:38', '2024-10-12 01:53:38'),
(2, 'Nalindika', 'nalindika@gmail.com', '$2y$10$FVMvPuk6PIzOV5rgdiQpz.d5Rfvu03DJ/13.indg4qsKhQEeW51Ci', '2024-10-12 21:17:47', '2024-10-12 21:17:47'),
(3, 'Chathushan', 'chathu@gmail.com', '$2y$10$W4JbpG9G/BB/l5rulwEGquG4fB/I5MoVmuxYr5AFdfuT.wxDWIclC', '2024-10-12 23:33:19', '2024-10-12 23:33:19'),
(4, 'Sadeep ', 'sadee@gmail.com', '$2y$10$9Z6fMS4uuqBm8g7Fzp8uHOVUhCYYwyLSfTZQqGec.zMhhMv9dJqvi', '2024-10-12 23:58:45', '2024-10-12 23:58:45'),
(5, 'Shanthi Liyanage', 'shanthi@gmail.com', '$2y$10$g0X3QVyCFM9pZLSy2pNYgucwT7kEfIMk82wP/GFruoLOzw4UrZ3YS', '2024-10-13 10:40:38', '2024-10-13 10:40:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23249;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
