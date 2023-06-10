-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 08, 2023 lúc 08:44 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `laravel_bjyblog`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bjy_articles`
--

CREATE TABLE `bjy_articles` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '文章表主键',
  `category_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `slug` varchar(255) NOT NULL DEFAULT '' COMMENT 'slug',
  `author` varchar(255) NOT NULL DEFAULT '' COMMENT '作者',
  `markdown` mediumtext NOT NULL COMMENT 'markdown文章内容',
  `html` mediumtext NOT NULL COMMENT 'markdown转的html页面',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键词',
  `cover` varchar(255) NOT NULL DEFAULT '' COMMENT '封面图',
  `is_top` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否置顶 1是 0否',
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bjy_articles`
--

INSERT INTO `bjy_articles` (`id`, `category_id`, `title`, `slug`, `author`, `markdown`, `html`, `description`, `keywords`, `cover`, `is_top`, `views`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 1, 'Chào mừng đến với Laravel Blog Tánh', 'welcome-to-laravel-bjyblog', 'tánh', '1. [Tác giả Blog và cộng tác](https://shopttt.42web.io/tacgia.php)\n![](/images/default/article.png)\n2. [Xóa dữ liệu database](https://shopttt.42web.io/tacgia.php)\n3. [Upgrade version](https://shopttt.42web.io/tacgia.php)', '<ol>\n<li>\n<a href=\"https://shopttt.42web.io/tacgia.php\">Tác giả Blog và cộng tác</a>\n<img src=\"/images/default/article.png\" alt=\"\" />\n</li>\n<li>\n<a href=\"https://shopttt.42web.io/tacgia.php\">Xóa dữ liệu database</a>\n</li>\n<li>\n<a href=\"https://shopttt.42web.io/tacgia.php\">Upgrade version</a>\n</li>\n</ol>\n', 'welcome to laravel-blog', 'laravel-blog', '/images/default/article.png', 0, 337, '2023-05-05 07:35:12', '2023-06-08 19:21:23', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bjy_article_histories`
--

CREATE TABLE `bjy_article_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `article_id` int(11) NOT NULL,
  `markdown` mediumtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bjy_article_histories`
--

INSERT INTO `bjy_article_histories` (`id`, `article_id`, `markdown`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, '1. [Tác giả Blog và cộng tác](https://shopttt.42web.io/tacgia.php)\n![](/images/default/article.png)\n2. [Xóa dữ liệu database](https://shopttt.42web.io/tacgia.php)\n3. [Upgrade version](https://shopttt.42web.io/tacgia.php)', '2023-06-08 19:10:17', '2023-06-08 19:10:17', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bjy_article_tags`
--

CREATE TABLE `bjy_article_tags` (
  `article_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章id',
  `tag_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bjy_article_tags`
--

INSERT INTO `bjy_article_tags` (`article_id`, `tag_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '2017-07-18 00:35:12', '2016-07-18 00:35:12', NULL),
(2, 2, '2019-01-04 09:35:12', '2019-01-04 09:35:12', '2019-01-04 09:35:12'),
(3, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bjy_categories`
--

CREATE TABLE `bjy_categories` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '分类主键id',
  `name` varchar(15) NOT NULL DEFAULT '' COMMENT '分类名称',
  `slug` varchar(255) NOT NULL DEFAULT '' COMMENT 'slug',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键词',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `sort` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `pid` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父级栏目id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bjy_categories`
--

INSERT INTO `bjy_categories` (`id`, `name`, `slug`, `keywords`, `description`, `sort`, `pid`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'PHP', 'php', 'php', 'php_mô tả', 1, 0, '2023-06-02 00:35:12', '2023-06-08 19:29:25', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bjy_comments`
--

CREATE TABLE `bjy_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `socialite_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `article_id` int(10) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `is_audited` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `_lft` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `_rgt` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bjy_configs`
--

CREATE TABLE `bjy_configs` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '配置项键名',
  `value` text DEFAULT NULL COMMENT '配置项键值 1表示开启 0 关闭',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bjy_configs`
--

INSERT INTO `bjy_configs` (`id`, `name`, `value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(101, 'app.name', 'Phan Ngọc Tánh', '2018-08-22 14:03:01', '2023-06-08 18:15:37', NULL),
(102, 'bjyblog.head.keywords', '个人博客,博客模板,thinkphp,laravel博客,php博客,技术博客,白俊遥', '2018-08-22 14:03:01', '2018-08-22 14:03:01', NULL),
(103, 'bjyblog.head.description', 'xin chào', '2018-08-22 14:03:01', '2023-06-08 18:16:48', NULL),
(107, 'bjyblog.water.text', 'shopttt.42web.io', '2018-08-22 14:03:01', '2023-06-08 18:52:46', NULL),
(109, 'bjyblog.water.size', '15', '2018-08-22 14:03:01', '2018-08-22 14:03:01', NULL),
(110, 'bjyblog.water.color', '#008CBA', '2018-08-22 14:03:01', '2018-08-22 14:03:01', NULL),
(117, 'bjyblog.icp', 'Copyright @2022-2023 Tánh', '2018-08-22 14:03:01', '2023-06-08 18:52:30', NULL),
(118, 'bjyblog.admin_email', 'tanhngoc4@gmail.com', '2018-08-22 14:03:01', '2023-06-08 18:52:03', NULL),
(119, 'bjyblog.copyright_word', 'test<a href=\"https://shopttt.42web.io/tacgia.php\">test other setting</a>https://shopttt.42web.io/tacgia.php', '2018-08-22 14:03:01', '2023-06-08 19:12:39', NULL),
(123, 'bjyblog.statistics', '', '2018-08-25 10:04:02', '2018-08-25 10:04:02', NULL),
(125, 'bjyblog.author', 'tánh', '2018-08-22 14:03:01', '2023-06-08 18:52:10', NULL),
(128, 'bjyblog.baidu_site_url', '', '2018-08-22 14:03:01', '2018-08-22 14:03:01', NULL),
(141, 'bjyblog.alt_word', 'test img', '2018-08-22 14:03:01', '2023-06-08 19:12:15', NULL),
(142, 'mail.mailers.smtp.host', '', '2018-08-22 14:03:01', '2018-08-22 14:03:01', NULL),
(143, 'mail.mailers.smtp.username', '', '2018-08-22 14:03:01', '2018-08-22 14:03:01', NULL),
(144, 'mail.mailers.smtp.password', '', '2018-08-22 14:03:01', '2018-08-22 14:03:01', NULL),
(145, 'mail.from.name', '', '2018-08-22 14:03:01', '2018-08-22 14:03:01', NULL),
(148, 'bjyblog.notification_email', 'tanhngoc4@gmail.com', '2018-08-22 14:03:01', '2023-06-08 18:52:04', NULL),
(149, 'bjyblog.head.title', 'Blog của Tánh', '2018-08-22 14:03:01', '2023-06-08 18:16:33', NULL),
(150, 'bjyblog.qq_qun.article_id', '1', '2018-08-22 14:03:01', '2018-08-22 14:03:01', NULL),
(151, 'bjyblog.qq_qun.number', '88199093', '2018-08-22 14:03:01', '2018-08-22 14:03:01', NULL),
(152, 'bjyblog.qq_qun.code', '<a target=\"_blank\" href=\"//shang.qq.com/wpa/qunwpa?idkey=bba3fea90444ee6caf1fb1366027873fe14e86bada254d41ce67768fadd729ee\"><img border=\"0\" src=\"//pub.idqqimg.com/wpa/images/group.png\" alt=\"白俊遥博客群\" title=\"白俊遥博客群\"></a>', '2018-08-22 14:03:01', '2018-08-22 14:03:01', NULL),
(153, 'bjyblog.qq_qun.or_code', '/images/default/qr_code.png', '2018-08-22 14:03:01', '2018-08-22 14:03:01', NULL),
(154, 'mail.default', 'smtp', '2018-08-22 14:03:01', '2018-08-22 14:03:01', NULL),
(155, 'mail.mailers.smtp.port', '465', '2018-08-22 14:03:01', '2018-08-22 14:03:01', NULL),
(156, 'mail.mailers.smtp.encryption', 'ssl', '2018-08-22 14:03:01', '2018-08-22 14:03:01', NULL),
(157, 'mail.from.address', '', '2018-08-22 14:03:01', '2018-08-22 14:03:01', NULL),
(158, 'sentry.dsn', '', '2018-08-22 14:03:01', '2018-08-22 14:03:01', NULL),
(159, 'database.connections.mysql.dump.dump_binary_path', '/bin/', '2018-12-03 14:39:22', '2018-12-03 14:39:22', NULL),
(160, 'filesystems.disks.oss_backups.access_key', '', '2018-12-04 15:29:52', '2018-12-04 15:29:52', NULL),
(161, 'filesystems.disks.oss_backups.secret_key', '', '2018-12-04 15:29:52', '2018-12-04 15:29:52', NULL),
(162, 'filesystems.disks.oss_backups.bucket', '', '2018-12-04 15:29:52', '2018-12-04 15:29:52', NULL),
(163, 'filesystems.disks.oss_backups.endpoint', '', '2018-12-04 15:29:52', '2018-12-04 15:29:52', NULL),
(164, 'backup.backup.destination.disks', '[]', '2018-12-04 15:29:52', '2018-12-04 15:29:52', NULL),
(165, 'backup.notifications.mail.to', '', '2018-12-04 15:29:52', '2018-12-04 15:29:52', NULL),
(166, 'app.locale', 'en', '2019-02-26 14:10:52', '2019-02-26 14:10:52', NULL),
(167, 'bjyblog.seo.use_slug', 'false', '2019-05-19 12:43:00', '2019-05-19 12:43:00', NULL),
(168, 'bjyblog.social_share.select_plugin', 'sharejs', '2019-05-27 15:22:00', '2019-05-27 15:22:00', NULL),
(169, 'bjyblog.social_share.jssocials_config', '{\n    shares: [\"email\", \"twitter\", \"facebook\", \"googleplus\", \"linkedin\", \"pinterest\", \"stumbleupon\", \"pocket\", \"whatsapp\", \"messenger\", \"vkontakte\", \"telegram\", \"line\"],\n    showLabel: false,\n    showCount: false,\n    shareIn: \"popup\"\n}', '2019-05-27 15:22:00', '2019-05-27 15:22:00', NULL),
(170, 'bjyblog.social_share.sharejs_config', '{\n    sites: [\"weibo\", \"qq\", \"wechat\", \"douban\", \"qzone\", \"linkedin\", \"facebook\", \"twitter\", \"google\"]\n}', '2019-05-27 15:22:00', '2019-05-27 15:22:00', NULL),
(171, 'bjyblog.logo_with_php_tag', 'true', '2019-05-28 16:15:00', '2019-05-28 16:15:00', NULL),
(172, 'bjyblog.cdn_domain', '', '2019-08-05 15:15:00', '2019-08-05 15:15:00', NULL),
(173, 'bjyblog.comment_audit', 'false', '2019-10-21 15:45:00', '2019-10-21 15:45:00', NULL),
(174, 'services.baidu.appid', '', '2019-10-21 15:45:00', '2019-10-21 15:45:00', NULL),
(175, 'services.baidu.appkey', '', '2019-10-21 15:45:00', '2019-10-21 15:45:00', NULL),
(176, 'services.baidu.secret', '', '2019-10-21 15:45:00', '2019-10-21 15:45:00', NULL),
(177, 'scout.driver', 'null', '2019-11-19 15:45:00', '2019-11-19 15:45:00', NULL),
(178, 'scout.elasticsearch.prefix', 'laravel_', '2019-11-19 15:45:00', '2019-11-19 15:45:00', NULL),
(179, 'scout.elasticsearch.host', '127.0.0.1', '2019-11-19 15:45:00', '2019-11-19 15:45:00', NULL),
(180, 'scout.elasticsearch.port', '9200', '2019-11-19 15:45:00', '2019-11-19 15:45:00', NULL),
(181, 'scout.elasticsearch.scheme', 'http', '2019-11-19 15:45:00', '2019-11-19 15:45:00', NULL),
(182, 'scout.elasticsearch.user', 'null', '2019-11-19 15:45:00', '2019-11-19 15:45:00', NULL),
(183, 'scout.elasticsearch.pass', 'null', '2019-11-19 15:45:00', '2019-11-19 15:45:00', NULL),
(184, 'scout.elasticsearch.analyzer', 'ik_max_word', '2019-11-19 15:45:00', '2019-11-19 15:45:00', NULL),
(185, 'session.domain', '', '2019-12-14 03:49:00', '2019-12-14 03:49:00', NULL),
(186, 'scout.algolia.id', '', '2019-12-16 15:45:00', '2019-12-16 15:45:00', NULL),
(187, 'scout.algolia.secret', '', '2019-12-16 03:49:00', '2019-12-16 03:49:00', NULL),
(188, 'bjyblog.social_links.github', '', '2019-12-22 16:55:00', '2019-12-22 16:55:00', NULL),
(189, 'bjyblog.social_links.gitee', '', '2019-12-22 16:55:00', '2019-12-22 16:55:00', NULL),
(190, 'bjyblog.social_links.zhihu', '', '2019-12-22 16:55:00', '2019-12-22 16:55:00', NULL),
(191, 'bjyblog.social_links.weibo', '', '2019-12-22 16:55:00', '2019-12-22 16:55:00', NULL),
(192, 'bjyblog.social_links.upyun', '', '2019-12-22 16:55:00', '2019-12-22 16:55:00', NULL),
(193, 'bjyblog.link_target', '_blank', '2019-12-25 16:06:00', '2019-12-25 16:06:00', NULL),
(194, 'bjyblog.breadcrumb', 'true', '2019-12-31 18:01:01', '2019-12-31 18:01:01', NULL),
(195, 'app.timezone', 'PRC', '2020-01-26 18:01:01', '2020-01-26 18:01:01', NULL),
(196, 'bjyblog.licenses.allow_adaptation', '-nd', '2020-03-31 16:06:00', '2020-03-31 16:06:00', NULL),
(197, 'bjyblog.licenses.allow_commercial', '-nc', '2020-03-31 16:06:00', '2020-03-31 16:06:00', NULL),
(198, 'bjyblog.licenses.language', 'en', '2020-03-30 18:06:00', '2020-03-30 18:06:00', NULL),
(199, 'bjyblog.theme', 'blueberry', '2020-05-12 16:06:00', '2020-05-12 16:06:00', NULL),
(200, 'filesystems.disks.oss_uploads.access_key', '', '2020-06-26 16:29:52', '2020-06-26 16:29:52', NULL),
(201, 'filesystems.disks.oss_uploads.secret_key', '', '2020-06-26 16:29:52', '2020-06-26 16:29:52', NULL),
(202, 'filesystems.disks.oss_uploads.bucket', '', '2020-06-26 16:29:52', '2020-06-26 16:29:52', NULL),
(203, 'filesystems.disks.oss_uploads.endpoint', '', '2020-06-26 16:29:52', '2020-06-26 16:29:52', NULL),
(204, 'bjyblog.upload_disks', '[\"public\"]', '2018-12-04 15:29:52', '2018-12-04 15:29:52', NULL),
(205, 'services.tencent_cloud.secret_id', '', '2022-06-15 13:06:00', '2022-06-15 13:06:00', NULL),
(206, 'services.tencent_cloud.secret_key', '', '2022-06-15 13:06:00', '2022-06-15 13:06:00', NULL),
(207, 'services.tencent_cloud.region', '', '2022-06-15 13:06:00', '2022-06-15 13:06:00', NULL),
(208, 'services.tencent_cloud.project_id', '', '2022-06-15 13:06:00', '2022-06-15 13:06:00', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bjy_consoles`
--

CREATE TABLE `bjy_consoles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bjy_consoles`
--

INSERT INTO `bjy_consoles` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'App\\Console\\Commands\\Upgrade\\V5_5_5_0', '2018-09-27 15:26:00', '2018-09-27 15:26:00', NULL),
(3, 'App\\Console\\Commands\\Upgrade\\V5_5_6_0', '2018-09-28 03:26:00', '2018-09-28 03:26:00', NULL),
(4, 'App\\Console\\Commands\\Upgrade\\V5_5_7_0', '2018-11-06 15:26:00', '2018-11-06 15:26:00', NULL),
(5, 'App\\Console\\Commands\\Upgrade\\V5_5_8_0', '2018-12-31 14:03:00', '2018-12-31 14:03:00', NULL),
(6, 'App\\Console\\Commands\\Upgrade\\V5_5_9_0', '2018-12-31 14:03:00', '2018-12-31 14:03:00', NULL),
(7, 'App\\Console\\Commands\\Upgrade\\V5_5_10_0', '2018-12-31 14:03:00', '2018-12-31 14:03:00', NULL),
(8, 'App\\Console\\Commands\\Upgrade\\V5_5_11_0', '2019-02-26 14:10:00', '2019-02-26 14:10:00', NULL),
(9, 'App\\Console\\Commands\\Upgrade\\V5_8_1_0', '2019-02-26 14:10:00', '2019-02-26 14:10:00', NULL),
(10, 'App\\Console\\Commands\\Upgrade\\V5_8_2_0', '2019-02-26 14:10:00', '2019-02-26 14:10:00', NULL),
(11, 'App\\Console\\Commands\\Upgrade\\V5_8_3_0', '2019-05-17 14:10:00', '2019-05-17 14:10:00', NULL),
(12, 'App\\Console\\Commands\\Upgrade\\V5_8_4_0', '2019-05-19 11:28:00', '2019-05-19 11:28:00', NULL),
(13, 'App\\Console\\Commands\\Upgrade\\V5_8_5_0', '2019-06-01 11:28:00', '2019-06-01 11:28:00', NULL),
(14, 'App\\Console\\Commands\\Upgrade\\V5_8_6_0', '2019-06-22 11:28:00', '2019-06-22 11:28:00', NULL),
(15, 'App\\Console\\Commands\\Upgrade\\V5_8_7_0', '2019-06-28 11:28:00', '2019-06-28 11:28:00', NULL),
(16, 'App\\Console\\Commands\\Upgrade\\V5_8_8_0', '2019-07-01 15:28:00', '2019-07-01 15:28:00', NULL),
(18, 'App\\Console\\Commands\\Upgrade\\V5_8_9_0', '2019-07-27 07:28:00', '2019-07-27 07:28:00', NULL),
(19, 'App\\Console\\Commands\\Upgrade\\V5_8_10_0', '2019-08-02 15:01:00', '2019-08-02 15:01:00', NULL),
(20, 'App\\Console\\Commands\\Upgrade\\V5_8_11_0', '2019-08-05 15:11:00', '2019-08-05 15:11:00', NULL),
(21, 'App\\Console\\Commands\\Upgrade\\V6_0_0', '2019-09-18 15:30:00', '2019-09-18 15:30:00', NULL),
(22, 'App\\Console\\Commands\\Upgrade\\V6_1_0', '2019-09-28 15:30:00', '2019-09-28 15:30:00', NULL),
(23, 'App\\Console\\Commands\\Upgrade\\V6_2_0', '2019-10-20 03:30:00', '2019-10-20 03:30:00', NULL),
(24, 'App\\Console\\Commands\\Upgrade\\V6_3_0', '2019-10-26 06:35:00', '2019-10-26 06:35:00', NULL),
(25, 'App\\Console\\Commands\\Upgrade\\V6_4_0', '2019-11-09 03:35:00', '2019-11-09 03:35:00', NULL),
(26, 'App\\Console\\Commands\\Upgrade\\V6_5_0', '2019-11-09 03:35:00', '2019-11-09 03:35:00', NULL),
(27, 'App\\Console\\Commands\\Upgrade\\V6_6_0', '2019-12-14 06:03:00', '2019-12-14 06:03:00', NULL),
(28, 'App\\Console\\Commands\\Upgrade\\V6_7_0', '2019-12-21 04:03:00', '2019-12-21 04:03:00', NULL),
(29, 'App\\Console\\Commands\\Upgrade\\V6_8_0', '2019-12-27 15:13:00', '2019-12-27 15:13:00', NULL),
(30, 'App\\Console\\Commands\\Upgrade\\V6_9_0', '2020-01-03 15:13:00', '2020-01-03 15:13:00', NULL),
(31, 'App\\Console\\Commands\\Upgrade\\V6_10_0', '2020-01-17 15:13:00', '2020-01-17 15:13:00', NULL),
(32, 'App\\Console\\Commands\\Upgrade\\V6_11_0', '2020-01-20 15:13:00', '2020-01-20 15:13:00', NULL),
(33, 'App\\Console\\Commands\\Upgrade\\V6_12_0', '2020-01-27 15:13:00', '2020-01-27 15:13:00', NULL),
(34, 'App\\Console\\Commands\\Upgrade\\V6_13_0', '2020-01-28 08:13:00', '2020-01-28 08:13:00', NULL),
(35, 'App\\Console\\Commands\\Upgrade\\V6_14_0', '2020-02-10 14:13:00', '2020-02-10 14:13:00', NULL),
(36, 'App\\Console\\Commands\\Upgrade\\V7_0_0', '2020-03-13 13:13:00', '2020-03-13 13:13:00', NULL),
(37, 'App\\Console\\Commands\\Upgrade\\V8_0_0', '2020-03-31 16:35:00', '2020-03-31 16:35:00', NULL),
(38, 'App\\Console\\Commands\\Upgrade\\V9_0_0', '2020-04-20 16:35:00', '2020-04-20 16:35:00', NULL),
(39, 'App\\Console\\Commands\\Upgrade\\V10_0_0', '2020-05-12 16:35:00', '2020-05-12 16:35:00', NULL),
(40, 'App\\Console\\Commands\\Upgrade\\V11_0_0', '2020-06-19 16:35:00', '2020-06-19 16:35:00', NULL),
(41, 'App\\Console\\Commands\\Upgrade\\V12_0_0', '2020-09-13 16:00:00', '2020-09-13 16:00:00', NULL),
(42, 'App\\Console\\Commands\\Upgrade\\V13_0_0', '2020-09-21 16:21:00', '2020-09-21 16:21:00', NULL),
(43, 'App\\Console\\Commands\\Upgrade\\V14_0_0', '2020-10-04 16:21:00', '2020-10-04 16:21:00', NULL),
(44, 'App\\Console\\Commands\\Upgrade\\V15_0_0', '2021-02-18 16:16:00', '2021-02-18 16:16:00', NULL),
(45, 'App\\Console\\Commands\\Upgrade\\V16_0_0', '2021-05-29 16:16:00', '2021-05-29 16:16:00', NULL),
(46, 'App\\Console\\Commands\\Upgrade\\V17_0_0', '2022-06-15 13:16:00', '2022-06-15 13:16:00', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bjy_failed_jobs`
--

CREATE TABLE `bjy_failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bjy_followables`
--

CREATE TABLE `bjy_followables` (
  `socialite_user_id` bigint(20) UNSIGNED NOT NULL,
  `followable_id` int(10) UNSIGNED NOT NULL,
  `followable_type` varchar(255) NOT NULL,
  `relation` varchar(255) NOT NULL DEFAULT 'follow' COMMENT 'follow/like/subscribe/favorite/upvote/downvote',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bjy_friends`
--

CREATE TABLE `bjy_friends` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '链接名',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `sort` tinyint(3) UNSIGNED DEFAULT 1 COMMENT '排序',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bjy_friends`
--

INSERT INTO `bjy_friends` (`id`, `name`, `url`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'tánh', 'https://shopttt.42web.io/tacgia.php', 1, '2017-07-16 00:35:12', '2023-06-08 18:53:50', '2023-06-08 18:53:33'),
(2, 'xóa', 'https://deleted.com', 2, '2019-01-04 09:35:12', '2023-06-08 18:53:56', '2019-01-04 09:35:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bjy_friendship_links`
--

CREATE TABLE `bjy_friendship_links` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '链接名',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `sort` tinyint(3) UNSIGNED DEFAULT 1 COMMENT '排序',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bjy_jobs`
--

CREATE TABLE `bjy_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bjy_migrations`
--

CREATE TABLE `bjy_migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bjy_migrations`
--

INSERT INTO `bjy_migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2017_07_11_225347_create_article_tags_table', 1),
(9, '2017_07_11_225347_create_articles_table', 1),
(10, '2017_07_11_225347_create_categories_table', 1),
(11, '2017_07_11_225347_create_comments_table', 1),
(12, '2017_07_11_225347_create_configs_table', 1),
(13, '2017_07_11_225347_create_friends_table', 1),
(14, '2017_07_11_225347_create_friendship_links_table', 1),
(15, '2017_07_11_225347_create_notes_table', 1),
(16, '2017_07_11_225347_create_socialite_users_table', 1),
(17, '2017_07_11_225347_create_tags_table', 1),
(18, '2017_08_26_211441_create_jobs_table', 1),
(19, '2017_08_26_212556_create_failed_jobs_table', 1),
(20, '2017_10_18_203752_create_open_sources_table', 1),
(21, '2018_06_29_032244_create_laravel_follow_tables', 1),
(22, '2018_08_01_191920_create_navs_table', 1),
(23, '2018_09_04_204500_create_sites_table', 1),
(24, '2018_09_26_144126_create_consoles_table', 1),
(25, '2019_05_07_225949_create_socialite_clients_table', 1),
(26, '2020_01_19_215118_create_article_histories_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bjy_navs`
--

CREATE TABLE `bjy_navs` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '菜单主键',
  `sort` tinyint(4) NOT NULL DEFAULT 1 COMMENT '排序',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '菜单名',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bjy_navs`
--

INSERT INTO `bjy_navs` (`id`, `sort`, `name`, `url`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Ghi chú', 'notes', '2018-08-04 05:41:26', '2023-06-08 18:06:04', NULL),
(2, 1, 'Source code', 'openSources', '2018-08-04 05:41:26', '2023-06-08 18:06:39', NULL),
(3, 1, 'xóa', 'deleted', '2019-01-04 09:35:12', '2023-06-08 18:06:47', '2019-01-04 09:35:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bjy_notes`
--

CREATE TABLE `bjy_notes` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键id',
  `content` text NOT NULL COMMENT '内容',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bjy_oauth_access_tokens`
--

CREATE TABLE `bjy_oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bjy_oauth_access_tokens`
--

INSERT INTO `bjy_oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0aa029e6f57ec1a3c911df2e83b120a33321a6c785d347c7a9b609861f873dfd7990e3b6b1d16597', 1, 1, NULL, '[]', 0, '2023-06-08 17:54:57', '2023-06-08 17:54:57', '2024-06-09 00:54:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bjy_oauth_auth_codes`
--

CREATE TABLE `bjy_oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(3) UNSIGNED NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bjy_oauth_clients`
--

CREATE TABLE `bjy_oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(3) UNSIGNED NOT NULL,
  `password_client` tinyint(3) UNSIGNED NOT NULL,
  `revoked` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bjy_oauth_clients`
--

INSERT INTO `bjy_oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Password Grant Client', '', NULL, 'http://localhost', 0, 1, 0, '2019-06-29 13:35:12', '2019-06-29 13:35:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bjy_oauth_personal_access_clients`
--

CREATE TABLE `bjy_oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bjy_oauth_refresh_tokens`
--

CREATE TABLE `bjy_oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(3) UNSIGNED NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bjy_oauth_refresh_tokens`
--

INSERT INTO `bjy_oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('22719d5af1b01f8af9f388a6c362db21b5479e05eea40807d4dcd549eccd4cff1bd13d4774c46d5e', '0aa029e6f57ec1a3c911df2e83b120a33321a6c785d347c7a9b609861f873dfd7990e3b6b1d16597', 0, '2024-06-09 00:54:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bjy_open_sources`
--

CREATE TABLE `bjy_open_sources` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '项目主键',
  `sort` tinyint(4) NOT NULL DEFAULT 1 COMMENT '排序',
  `type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1:github 2:gitee',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '项目名',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bjy_password_resets`
--

CREATE TABLE `bjy_password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bjy_sites`
--

CREATE TABLE `bjy_sites` (
  `id` int(10) UNSIGNED NOT NULL,
  `socialite_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '第三方用户id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '网站名',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '网站链接',
  `audit` tinyint(4) NOT NULL DEFAULT 0 COMMENT '审核状态1为通过审核',
  `sort` tinyint(4) NOT NULL DEFAULT 0 COMMENT '排序',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bjy_socialite_clients`
--

CREATE TABLE `bjy_socialite_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `client_id` varchar(255) NOT NULL DEFAULT '',
  `client_secret` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bjy_socialite_clients`
--

INSERT INTO `bjy_socialite_clients` (`id`, `name`, `icon`, `client_id`, `client_secret`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'qq', 'qq', '', '', '2019-05-08 15:13:54', '2019-05-08 15:13:54', NULL),
(2, 'weibo', 'weibo', '', '', '2019-05-08 15:13:54', '2019-05-08 15:13:54', NULL),
(3, 'github', 'github', '', '', '2019-05-08 15:13:54', '2019-05-08 15:13:54', NULL),
(4, 'google', 'google', '', '', '2019-05-14 16:26:38', '2019-05-14 16:26:38', NULL),
(5, 'facebook', 'facebook', '', '', '2019-05-14 16:26:38', '2019-05-14 16:26:38', NULL),
(6, 'vkontakte', 'vk', '', '', '2019-07-01 16:26:38', '2019-07-01 16:26:38', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bjy_socialite_users`
--

CREATE TABLE `bjy_socialite_users` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键id',
  `socialite_client_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '类型 1：QQ  2：新浪微博 3：github',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '第三方昵称',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `openid` varchar(40) NOT NULL DEFAULT '' COMMENT '第三方用户id',
  `access_token` varchar(255) NOT NULL DEFAULT '' COMMENT 'access_token token',
  `last_login_ip` varchar(16) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `login_times` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录次数',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `is_admin` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否是admin',
  `is_blocked` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bjy_socialite_users`
--

INSERT INTO `bjy_socialite_users` (`id`, `socialite_client_id`, `name`, `avatar`, `openid`, `access_token`, `last_login_ip`, `login_times`, `email`, `is_admin`, `is_blocked`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '白俊遥', '/images/default/avatar.jpg', '1', '', '127.0.0.1', 1, 'baijunyao@baijunyao.com', 0, 0, NULL, '2017-07-24 00:35:12', '2017-07-24 00:35:12', NULL),
(2, 1, '已删除', '/images/default/avatar.jpg', '2', '', '127.0.0.1', 1, 'deleted@baijunyao.com', 0, 0, NULL, '2019-01-04 09:35:12', '2019-01-04 09:35:12', '2019-01-04 09:35:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bjy_tags`
--

CREATE TABLE `bjy_tags` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '标签主键',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '标签名',
  `slug` varchar(255) NOT NULL DEFAULT '' COMMENT 'slug',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '标签的关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '标签的描述',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bjy_tags`
--

INSERT INTO `bjy_tags` (`id`, `name`, `slug`, `keywords`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'laravel', 'laravel', 'laravel', 'Laravel', '2017-07-16 00:35:12', '2023-06-08 18:07:32', NULL),
(2, 'test', 'test', 'test', '测试描述', '2019-01-04 08:35:12', '2019-01-04 08:35:12', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bjy_users`
--

CREATE TABLE `bjy_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bjy_users`
--

INSERT INTO `bjy_users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'test', 'test@test.com', NULL, '$2y$10$tZG6FHmTEFOOdhqRRgYlve2gSVJyIamgYr3HbDuvsgVdzsuq5c0oG', NULL, '2016-10-22 00:35:12', '2016-10-22 00:35:12', NULL),
(2, '已删除', 'deleted@test.com', NULL, '$2y$10$z18tayxb9hAVdzMJNdN7HuoGJtFs.QGKc5xteVMqE/VgjUSWiifC6', NULL, '2019-01-04 08:35:12', '2016-01-04 08:35:12', '2016-01-04 08:35:12');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bjy_articles`
--
ALTER TABLE `bjy_articles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bjy_article_histories`
--
ALTER TABLE `bjy_article_histories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bjy_categories`
--
ALTER TABLE `bjy_categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bjy_comments`
--
ALTER TABLE `bjy_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bjy_comments__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`);

--
-- Chỉ mục cho bảng `bjy_configs`
--
ALTER TABLE `bjy_configs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bjy_consoles`
--
ALTER TABLE `bjy_consoles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bjy_failed_jobs`
--
ALTER TABLE `bjy_failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bjy_failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `bjy_followables`
--
ALTER TABLE `bjy_followables`
  ADD KEY `bjy_followables_followable_type_index` (`followable_type`);

--
-- Chỉ mục cho bảng `bjy_friends`
--
ALTER TABLE `bjy_friends`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bjy_friendship_links`
--
ALTER TABLE `bjy_friendship_links`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bjy_jobs`
--
ALTER TABLE `bjy_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bjy_jobs_uuid_unique` (`uuid`),
  ADD KEY `bjy_jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- Chỉ mục cho bảng `bjy_migrations`
--
ALTER TABLE `bjy_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bjy_navs`
--
ALTER TABLE `bjy_navs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bjy_notes`
--
ALTER TABLE `bjy_notes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bjy_oauth_access_tokens`
--
ALTER TABLE `bjy_oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bjy_oauth_access_tokens_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `bjy_oauth_auth_codes`
--
ALTER TABLE `bjy_oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bjy_oauth_clients`
--
ALTER TABLE `bjy_oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bjy_oauth_clients_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `bjy_oauth_personal_access_clients`
--
ALTER TABLE `bjy_oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bjy_oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Chỉ mục cho bảng `bjy_oauth_refresh_tokens`
--
ALTER TABLE `bjy_oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bjy_oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Chỉ mục cho bảng `bjy_open_sources`
--
ALTER TABLE `bjy_open_sources`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bjy_password_resets`
--
ALTER TABLE `bjy_password_resets`
  ADD KEY `bjy_password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `bjy_sites`
--
ALTER TABLE `bjy_sites`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bjy_socialite_clients`
--
ALTER TABLE `bjy_socialite_clients`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bjy_socialite_users`
--
ALTER TABLE `bjy_socialite_users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bjy_tags`
--
ALTER TABLE `bjy_tags`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bjy_users`
--
ALTER TABLE `bjy_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bjy_users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bjy_articles`
--
ALTER TABLE `bjy_articles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章表主键', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `bjy_article_histories`
--
ALTER TABLE `bjy_article_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `bjy_categories`
--
ALTER TABLE `bjy_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类主键id', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `bjy_comments`
--
ALTER TABLE `bjy_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `bjy_configs`
--
ALTER TABLE `bjy_configs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT cho bảng `bjy_consoles`
--
ALTER TABLE `bjy_consoles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT cho bảng `bjy_failed_jobs`
--
ALTER TABLE `bjy_failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `bjy_friends`
--
ALTER TABLE `bjy_friends`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `bjy_friendship_links`
--
ALTER TABLE `bjy_friendship_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id';

--
-- AUTO_INCREMENT cho bảng `bjy_jobs`
--
ALTER TABLE `bjy_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `bjy_migrations`
--
ALTER TABLE `bjy_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `bjy_navs`
--
ALTER TABLE `bjy_navs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '菜单主键', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `bjy_notes`
--
ALTER TABLE `bjy_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `bjy_oauth_clients`
--
ALTER TABLE `bjy_oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `bjy_oauth_personal_access_clients`
--
ALTER TABLE `bjy_oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `bjy_open_sources`
--
ALTER TABLE `bjy_open_sources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '项目主键', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `bjy_sites`
--
ALTER TABLE `bjy_sites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `bjy_socialite_clients`
--
ALTER TABLE `bjy_socialite_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `bjy_socialite_users`
--
ALTER TABLE `bjy_socialite_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `bjy_tags`
--
ALTER TABLE `bjy_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '标签主键', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `bjy_users`
--
ALTER TABLE `bjy_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
