

-- --------------------------------------------------------

--
-- Table structure for table `#__assets`
--

DROP TABLE IF EXISTS `#__assets`;
CREATE TABLE IF NOT EXISTS `#__assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=60 ;

--
-- Dumping data for table `#__assets`
--

INSERT INTO `#__assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 1, 115, 0, 'root.1', 'Root Asset', '{"core.login.site":{"6":1,"2":1},"core.login.admin":{"6":1},"core.login.offline":{"6":1},"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
(7, 1, 13, 16, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(8, 1, 17, 68, 1, 'com_content', 'com_content', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(9, 1, 69, 70, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 71, 72, 1, 'com_installer', 'com_installer', '{"core.admin":[],"core.manage":{"7":0},"core.delete":{"7":0},"core.edit.state":{"7":0}}'),
(11, 1, 73, 74, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(12, 1, 75, 76, 1, 'com_login', 'com_login', '{}'),
(13, 1, 77, 78, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 79, 80, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 81, 82, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1}}'),
(16, 1, 83, 84, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(17, 1, 85, 86, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(18, 1, 87, 88, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(19, 1, 89, 92, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(20, 1, 93, 94, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1},"core.manage":[],"core.edit":[],"core.edit.state":[]}'),
(21, 1, 95, 96, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1},"core.manage":[]}'),
(22, 1, 97, 98, 1, 'com_search', 'com_search', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(23, 1, 99, 100, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(24, 1, 101, 104, 1, 'com_users', 'com_users', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(25, 1, 105, 108, 1, 'com_weblinks', 'com_weblinks', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(26, 1, 109, 110, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 18, 19, 2, 'com_content.category.2', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(30, 19, 90, 91, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(31, 25, 106, 107, 2, 'com_weblinks.category.6', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(32, 24, 102, 103, 1, 'com_users.category.7', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(33, 1, 111, 112, 1, 'com_finder', 'com_finder', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(34, 1, 113, 114, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{"core.admin":[],"core.manage":[],"core.delete":[],"core.edit.state":[]}'),
(35, 37, 57, 66, 3, 'com_content.category.8', 'Joomla', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(36, 35, 58, 59, 4, 'com_content.article.1', 'The Joomla! Community', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(37, 8, 20, 67, 2, 'com_content.category.9', 'Sample Data Article', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(38, 37, 21, 56, 3, 'com_content.category.10', 'Demo', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(39, 38, 22, 23, 4, 'com_content.article.2', 'Module Variations', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(40, 38, 24, 45, 4, 'com_content.category.11', 'Shortcode', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(41, 40, 25, 26, 5, 'com_content.article.3', 'Accordion', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(42, 40, 27, 28, 5, 'com_content.article.4', 'Carousel', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(43, 40, 29, 30, 5, 'com_content.article.5', 'Tab', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(44, 40, 31, 32, 5, 'com_content.article.6', 'Map', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(45, 40, 33, 34, 5, 'com_content.article.7', 'Testimonial ', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(46, 40, 35, 36, 5, 'com_content.article.8', 'Alert', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(47, 40, 37, 38, 5, 'com_content.article.9', 'Button', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(48, 40, 39, 40, 5, 'com_content.article.10', 'Icon', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(49, 40, 41, 42, 5, 'com_content.article.11', 'Column', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(50, 38, 46, 47, 4, 'com_content.article.12', 'Powerfull Features', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(51, 38, 48, 49, 4, 'com_content.article.13', 'Article', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(52, 38, 50, 51, 4, 'com_content.article.14', 'Typography', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(54, 40, 43, 44, 5, 'com_content.article.16', 'Gallery', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(55, 38, 52, 53, 4, 'com_content.article.17', 'Video', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(56, 38, 54, 55, 4, 'com_content.article.18', 'Module Position', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(57, 35, 60, 61, 4, 'com_content.article.19', 'The Joomla Blog', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(58, 35, 62, 63, 4, 'com_content.article.20', 'The Joomla overview', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(59, 35, 64, 65, 4, 'com_content.article.21', 'The Joomla Help', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}');

-- --------------------------------------------------------

--
-- Table structure for table `#__associations`
--

DROP TABLE IF EXISTS `#__associations`;
CREATE TABLE IF NOT EXISTS `#__associations` (
  `id` varchar(50) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `#__banners`
--

DROP TABLE IF EXISTS `#__banners`;
CREATE TABLE IF NOT EXISTS `#__banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `custombannercode` varchar(2048) NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `params` text NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `#__banner_clients`
--

DROP TABLE IF EXISTS `#__banner_clients`;
CREATE TABLE IF NOT EXISTS `#__banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `#__banner_tracks`
--

DROP TABLE IF EXISTS `#__banner_tracks`;
CREATE TABLE IF NOT EXISTS `#__banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `#__categories`
--

DROP TABLE IF EXISTS `#__categories`;
CREATE TABLE IF NOT EXISTS `#__categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `#__categories`
--

INSERT INTO `#__categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`) VALUES
(1, 0, 0, 0, 21, 0, '', 'system', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '', 960, '2009-10-18 16:07:09', 0, '0000-00-00 00:00:00', 0, '*'),
(2, 27, 1, 1, 2, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 960, '2010-06-28 13:26:37', 0, '0000-00-00 00:00:00', 0, '*'),
(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":"","foobar":""}', '', '', '{"page_title":"","author":"","robots":""}', 960, '2010-06-28 13:27:35', 0, '0000-00-00 00:00:00', 0, '*'),
(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 960, '2010-06-28 13:27:57', 0, '0000-00-00 00:00:00', 0, '*'),
(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 960, '2010-06-28 13:28:15', 0, '0000-00-00 00:00:00', 0, '*'),
(6, 31, 1, 9, 10, 1, 'uncategorised', 'com_weblinks', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 960, '2010-06-28 13:28:33', 0, '0000-00-00 00:00:00', 0, '*'),
(7, 32, 1, 11, 12, 1, 'uncategorised', 'com_users', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 960, '2010-06-28 13:28:33', 0, '0000-00-00 00:00:00', 0, '*'),
(8, 35, 9, 18, 19, 2, 'sample-data-article/joomla', 'com_content', 'Joomla', 'joomla', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 960, '2013-01-31 07:26:07', 439, '2013-01-31 08:00:22', 0, '*'),
(9, 37, 1, 13, 20, 1, 'sample-data-article', 'com_content', 'Sample Data Article', 'sample-data-article', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 960, '2013-01-31 07:51:48', 0, '0000-00-00 00:00:00', 0, '*'),
(10, 38, 9, 14, 17, 2, 'sample-data-article/demo', 'com_content', 'Demo', 'demo', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 960, '2013-01-31 07:52:06', 0, '0000-00-00 00:00:00', 0, '*'),
(11, 40, 10, 15, 16, 3, 'sample-data-article/demo/short-code', 'com_content', 'Shortcode', 'short-code', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 960, '2013-01-31 08:00:08', 0, '0000-00-00 00:00:00', 0, '*');

-- --------------------------------------------------------

--
-- Table structure for table `#__contact_details`
--

DROP TABLE IF EXISTS `#__contact_details`;
CREATE TABLE IF NOT EXISTS `#__contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `imagepos` varchar(20) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `sortname1` varchar(255) NOT NULL,
  `sortname2` varchar(255) NOT NULL,
  `sortname3` varchar(255) NOT NULL,
  `language` char(7) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `#__contact_details`
--

INSERT INTO `#__contact_details` (`id`, `name`, `alias`, `con_position`, `address`, `suburb`, `state`, `country`, `postcode`, `telephone`, `fax`, `misc`, `image`, `imagepos`, `email_to`, `default_con`, `published`, `checked_out`, `checked_out_time`, `ordering`, `params`, `user_id`, `catid`, `access`, `mobile`, `webpage`, `sortname1`, `sortname2`, `sortname3`, `language`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `metakey`, `metadesc`, `metadata`, `featured`, `xreference`, `publish_up`, `publish_down`) VALUES
(1, 'Contact Name', 'name', 'Position', 'Street Address', 'Suburb', 'State', 'Country', 'Zip Code', 'Telephone', 'Fax', '<p>Information about or by the contact.</p>', '', NULL, 'email@email.com', 0, 1, 0, '0000-00-00 00:00:00', 1, '{"show_contact_category":"","show_contact_list":"","presentation_style":"","show_name":"","show_position":"","show_email":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","show_profile":"","show_links":"","linka_name":"Facebook","linka":"http:\\/\\/www.facebook.com\\/joomla","linkb_name":"Twitter","linkb":"http:\\/\\/twitter.com\\/joomla","linkc_name":"","linkc":null,"linkd_name":"","linkd":null,"linke_name":"","linke":"","contact_layout":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":""}', 0, 4, 1, '', '', 'last', 'first', 'middle', '*', '2013-01-31 07:52:56', 960, '', '0000-00-00 00:00:00', 0, '', '', '{"robots":"","rights":""}', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `#__content`
--

DROP TABLE IF EXISTS `#__content`;
CREATE TABLE IF NOT EXISTS `#__content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `title_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Deprecated in Joomla! 3.0',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `sectionid` int(10) unsigned NOT NULL DEFAULT '0',
  `mask` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` varchar(5120) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `#__content`
--

INSERT INTO `#__content` (`id`, `asset_id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(1, 36, 'The Joomla! Community', 'the-joomla-community', '', '<p>Joomla! means All Together, and it is a community of people all working and having fun together that makes Joomla! possible. Thousands of people each year participate in the Joomla! community, and we hope you will be one of them.</p>\r\n<p>People with all kinds of skills, of all skill levels and from around the world are welcome to join in. Participate in the <a href="http://joomla.org">Joomla.org</a> family of websites (the<a href="http://forum.joomla.org"> forum </a>is a great place to start). Come to a <a href="http://community.joomla.org/events.html">Joomla! event</a>. Join or start a <a href="http://community.joomla.org/user-groups.html">Joomla! Users Group</a>. Whether you are a developer, site administrator, designer, end user or fan, there are ways for you to participate and contribute.</p>', '', 1, 0, 0, 8, '2013-01-31 07:27:02', 960, '', '2013-01-31 09:03:15', 439, 0, '0000-00-00 00:00:00', '2013-01-31 07:27:02', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, 3, '', '', 1, 57, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(2, 39, 'Module Variations', 'module-variations', '', '<p>Welcome to Shaper <strong>Helix</strong> template. This is the blank template for joomla based on Helix Framewok. You are seeing main content area of this template.</p>', '', 1, 0, 0, 10, '2013-01-31 07:53:08', 960, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2013-01-31 07:53:08', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 5, '', '', 1, 167, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(3, 41, 'Accordion', 'sc-accordion', '', '<p>[accordion id="sc-accordion"] [accordion_item title=''Item 1'']Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ornare consectetur sodales. Nulla luctus cursus mauris at dapibus. Cras ac felis et neque consequat elementum a eget turpis. Aliquam erat volutpat. Integer feugiat sem eu ligula vulputate consequat. Nulla facilisi. Cras vel elit lectus, at fringilla lorem.[/accordion_item] [accordion_item title=''Item 2'']consectetur adipiscing elit. Proin ornare consectetur sodales. Nulla luctus cursus mauris at dapibus. Cras ac felis et neque consequat elementum a eget turpis. Aliquam erat volutpat. Integer feugiat sem eu ligula vulputate consequat. Nulla facilisi. Cras vel elit lectus, at fringilla lorem.[/accordion_item] [accordion_item title=''Item 3''] Proin ornare consectetur sodales. Nulla luctus cursus mauris at dapibus. Cras ac felis et neque consequat elementum a eget turpis. Aliquam erat volutpat. Integer feugiat sem eu ligula vulputate consequat. Nulla facilisi. Cras vel elit lectus, at fringilla lorem.[/accordion_item] [/accordion]</p>\r\n<h3>Get the code</h3>\r\n<pre>[[accordion] <br />    [accordion_item title=''ITEM_TITLE'']ADD_CONTENT_HERE[/accordion_item]<br />    [accordion_item title=''ITEM_TITLE'']ADD_CONTENT_HERE[/accordion_item] <br />    [accordion_item title=''ITEM_TITLE'']ADD_CONTENT_HERE[/accordion_item]<br />[/accordion]]</pre>', '', 1, 0, 0, 11, '2013-01-31 08:07:29', 960, '', '2013-02-04 09:56:46', 439, 0, '0000-00-00 00:00:00', '2013-01-31 08:07:29', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 11, 0, 9, '', '', 1, 48, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(4, 42, 'Carousel', 'sc-carousel', '', '<p>[carousel][carousel_item]<img src="images/helix/carousel1.png" border="0" alt="" width="1500" height="550" style="border: 0;" /> [caption] Powerful templates framework to develop Joomla base website faster! [/caption] [/carousel_item] [carousel_item] <img src="images/helix/carousel2.png" border="0" alt="" width="1500" height="550" style="border: 0;" /> [caption] Powerful templates framework to develop Joomla base website faster! [/caption] [/carousel_item] [carousel_item] <img src="images/helix/carousel3.png" border="0" alt="" width="1500" height="550" style="border: 0;" />[caption] Powerful templates framework to develop Joomla base website faster! [/caption] [/carousel_item] [/carousel]</p>\r\n<h3>Get the code</h3>\r\n<pre>[[carousel]\r\n[carousel_item]add image here [caption]Powerful templates framework to develop Joomla base website faster![/caption][/carousel_item]\r\n[/carousel]]</pre>', '', 1, 0, 0, 11, '2013-01-31 08:39:47', 960, '', '2013-08-20 07:01:15', 960, 0, '0000-00-00 00:00:00', '2013-01-31 08:39:47', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 23, 0, 8, '', '', 1, 80, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(5, 43, 'Tab', 'tab', '', '<p>[row]</p>\r\n<p>[col class="span6"]</p>\r\n<p>[tab id="tab1" class="tabbale" button="nav-tabs"] [tab_item title="Tab1"]Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ornare consectetur sodales. Nulla luctus cursus mauris at dapibus. Cras ac felis et neque consequat elementum a eget turpis. Aliquam erat volutpat. Integer feugiat sem eu ligula vulputate consequat. Nulla facilisi. Cras vel elit lectus, at fringilla lorem.[/tab_item] [tab_item title="Tab2"]consectetur adipiscing elit. Proin ornare consectetur sodales. Nulla luctus cursus mauris at dapibus. Cras ac felis et neque consequat elementum a eget turpis. Aliquam erat volutpat. Integer feugiat sem eu ligula vulputate consequat. Nulla facilisi. Cras vel elit lectus, at fringilla lorem.[/tab_item] [tab_item title="Tab3"]consectetur adipiscing elit. Proin ornare consectetur sodales. Nulla luctus cursus mauris at dapibus. Cras ac felis et neque consequat elementum a eget turpis. Aliquam erat volutpat. Integer feugiat sem eu ligula vulputate consequat. Nulla facilisi. Cras vel elit lectus, at fringilla lorem.[/tab_item][/tab]</p>\r\n<p>[/col]</p>\r\n<p>[col class="span6"]</p>\r\n<p>[tab id="tab2" class="tabbale" button="nav-pills"] [tab_item title="Tab1"]Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ornare consectetur sodales. Nulla luctus cursus mauris at dapibus. Cras ac felis et neque consequat elementum a eget turpis. Aliquam erat volutpat. Integer feugiat sem eu ligula vulputate consequat. Nulla facilisi. Cras vel elit lectus, at fringilla lorem.[/tab_item] [tab_item title="Tab2"]consectetur adipiscing elit. Proin ornare consectetur sodales. Nulla luctus cursus mauris at dapibus. Cras ac felis et neque consequat elementum a eget turpis. Aliquam erat volutpat. Integer feugiat sem eu ligula vulputate consequat. Nulla facilisi. Cras vel elit lectus, at fringilla lorem.[/tab_item] [tab_item title="Tab3"]consectetur adipiscing elit. Proin ornare consectetur sodales. Nulla luctus cursus mauris at dapibus. Cras ac felis et neque consequat elementum a eget turpis. Aliquam erat volutpat. Integer feugiat sem eu ligula vulputate consequat. Nulla facilisi. Cras vel elit lectus, at fringilla lorem.[/tab_item][/tab]</p>\r\n<p>[/col]</p>\r\n<p>[/row]</p>\r\n<h3>Get the code</h3>\r\n<pre>[[tab] \r\n[tab_item title="ITEM_TITLE"]ADD_CONTENT_HERE[/tab_item ]\r\n[tab_item title="ITEM_TITLE"]ADD_CONTENT_HERE[/tab_item ] \r\n[tab_item title="ITEM_TITLE"]ADD_CONTENT_HERE[/tab_item ]\r\n[/tab]]\r\n</pre>', '', 1, 0, 0, 11, '2013-01-31 08:51:31', 960, '', '2013-02-04 07:14:50', 439, 0, '0000-00-00 00:00:00', '2013-01-31 08:51:31', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 9, 0, 7, '', '', 1, 53, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(6, 44, 'Map', 'sc-map', '', '<p>[spmap lat="23.743193" lng="90.388281" zoom="8" maptype="ROADMAP"]</p>\r\n<h3>Get the code</h3>\r\n<pre>[[spmap lat="LATITUDE" lng="LONGITUDE" zoom="VALUE 1 to 10"]]</pre>', '', 1, 0, 0, 11, '2013-01-31 09:06:35', 960, '', '2013-06-19 09:19:42', 960, 0, '0000-00-00 00:00:00', '2013-01-31 09:06:35', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 9, 0, 6, '', '', 1, 34, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(7, 45, 'Testimonial ', 'testimonial', '', '<p>[testimonial name="John Doe" email="jakirhasaneng@gmail.com" company="joomshaper" designation="Developer"]Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum venenatis, felis a semper mollis, mauris mi suscipit dui, non laoreet diam enim et turpis. Sed imperdiet ultrices felis, at ultricies tellus consequat a. Proin condimentum porttitor eros, vitae facilisis sapien rhoncus vitae. Aliquam dapibus elit non metus posuere blandit. Phasellus a aliquam urna. Aliquam ac massa tellus, a semper odio. In hac habitasse platea dictumst. Integer tincidunt, nisi quis congue consectetur, lacus augue scelerisque enim, eu vehicula neque tortor ac risus. Nunc mollis interdum iaculis. [/testimonial]</p>\r\n<h3>Get the code</h3>\r\n<pre>[[testimonial name="AUTHOR_NAME" email="AUTHOR_EMAIL" company="AUTHOR_COMPANY" designation="AUTHOR_DESIGNATION"]ADD_CONTENT_HERE[/testimonial]]</pre>', '', 1, 0, 0, 11, '2013-01-31 09:09:00', 960, '', '2013-01-31 09:49:51', 439, 0, '0000-00-00 00:00:00', '2013-01-31 09:09:00', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 8, 0, 5, '', '', 1, 32, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(8, 46, 'Alert', 'sc-alert', '', '<p>[alert type="alert"]</p>\r\n<h4>Warning!</h4>\r\n<p>Best check yo self, you''re not looking too good. Nulla vitae elit libero, a pharetra augue. [/alert] [alert type="error" style="width:85%"]</p>\r\n<h4>Error or danger!</h4>\r\n<p>Oh snap! Change a few things up and try submitting again.[/alert] [alert type="success" style="width:75%"]</p>\r\n<h4>success!</h4>\r\n<p>Well done! You successfully read this important alert message. [/alert] [alert type="info" style="width:65%"]</p>\r\n<h4>Information!</h4>\r\n<p>Heads up! This alert needs your attention, but it''s not super important. [/alert]</p>', '', 1, 0, 0, 11, '2013-01-31 09:13:46', 960, '', '2013-06-19 09:22:20', 960, 0, '0000-00-00 00:00:00', '2013-01-31 09:13:46', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 6, 0, 4, '', '', 1, 48, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(9, 47, 'Button', 'sc-button', '', '<p>[row] [col class="span6"] [button type="default" size="" link="#"]Default[/button]</p>\r\n<p>[button type="primary" size="" link="#"]Primary[/button]</p>\r\n<p>[button type="info" size="" link="#"]Info[/button]</p>\r\n<p>[button type="success" size="" link="#"]Success[/button]</p>\r\n<p>[button type="warning" size="" link="#"]Warning[/button]</p>\r\n<p>[button type="danger" size="" link="#"]danger[/button]</p>\r\n<p>[button type="inverse" size="" link="#"]Inverse[/button]</p>\r\n<p>[button type="block btn-primary" size="large" link="#"]Block level button[/button] [/col] [col class="span6"] [button type="default" size="large" link="#"]Large button[/button]</p>\r\n<p>[button type="primary" size="large" link="#"]Large button[/button]</p>\r\n<p>[button type="default" size="" link="#"]Default button[/button]</p>\r\n<p>[button type="primary" size="" link="#"]Default button[/button]</p>\r\n<p>[button type="default" size="small" link="#"]Small button[/button]</p>\r\n<p>[button type="primary" size="small" link="#"]Small button[/button]</p>\r\n<p>[button type="default" size="mini" link="#"]Mini button[/button]</p>\r\n<p>[button type="primary" size="mini" link="#"]Mini button[/button] [/col] [/row]</p>\r\n<h3>Get the code</h3>\r\n<pre>[[button type="BUTTON_TYPE"]...[/button]]\r\n</pre>', '', 1, 0, 0, 11, '2013-01-31 09:16:06', 960, '', '2013-01-31 09:25:55', 439, 0, '0000-00-00 00:00:00', '2013-01-31 09:16:06', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 4, 0, 3, '', '', 1, 29, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(10, 48, 'Icon', 'sc-icon', '', '<p>[fontawesome_icons]</p>', '', 1, 0, 0, 11, '2013-01-31 09:26:14', 960, '', '2013-11-13 10:37:14', 960, 0, '0000-00-00 00:00:00', '2013-01-31 09:26:14', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 12, 0, 2, '', '', 1, 44, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(11, 49, 'Column', 'sc-column', '', '<p>[row class="show-grid"] [col class="span4"] Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id.[/col] [col class="span4"] Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id.[/col] [col class="span4"] Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id.[/col] [/row]</p>\r\n<h3>Get the code</h3>\r\n<pre>[[row id="ROW_ID" class="ROW_CLASS"]\r\n[col class="span4"]ADD_CONTENT_HERE[/col]\r\n[col class="span4"]ADD_CONTENT_HERE[/col]\r\n[col class="span4"]ADD_CONTENT_HERE[/col]\r\n[/row]]\r\n</pre>\r\n<p>[row class="show-grid"] [col class="span8"] Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id. Nullam id dolor id nibh ultricies vehicula ut id. Donec id elit non mi porta gravida at eget metus.[/col] [col class="span4"] Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id.[/col] [/row]</p>\r\n<h3>Get the code</h3>\r\n<pre>[[row id="ROW_ID" class="ROW_CLASS"]\r\n[col class="span8"]ADD_CONTENT_HERE[/col]\r\n[col class="span4"]ADD_CONTENT_HERE[/col]\r\n[/row]]\r\n</pre>', '', 1, 0, 0, 11, '2013-01-31 09:32:26', 960, '', '2013-02-04 07:14:32', 439, 0, '0000-00-00 00:00:00', '2013-01-31 09:32:26', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 10, 0, 1, '', '', 1, 35, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(12, 50, 'Powerfull Features', 'powerfull-features', '', '<p>[row]</p>\r\n<p>[col class="span6"]</p>\r\n<h4>Joomla 2.5 and 3.0</h4>\r\n<p>Helix - II is available for Joomla 2.5 as well as Joomla 3.0 that means no matter which version of you joomla you like to use for developing your next website.</p>\r\n<p> </p>\r\n<h4>HTML5</h4>\r\n<p>We brought HTML5 in Helix blank template to make elegant, modern and SEO friendly website that would be fully functional &amp; represents awesome typography.</p>\r\n<p> </p>\r\n<h4>Bootstrap</h4>\r\n<p><a href="http://getbootstrap.com" target="_blank">Bootstrap</a> is made upon responsive CSS Designs with less code which enhances the overall look and feel of your website.</p>\r\n<p>[/col]</p>\r\n<p>[col class="span6"]</p>\r\n<h4>Wordpress</h4>\r\n<p>This is really great thing that Helix Framework is available for most popular blogging platform Wordpress besides Joomla with tons of exciting features.  </p>\r\n<p> </p>\r\n<h4>CSS3</h4>\r\n<p>The latest CSS3 technology has been used in Helix Framework - II to make the whole web development process easier and faster with lot of scopes.  </p>\r\n<p> </p>\r\n<h4>Presets</h4>\r\n<p>Presets manager give the flexibilty to change the design of your website without coding by selecting the desire color of your website background, header and footer etc.</p>\r\n<p>[/col]</p>\r\n<p>[/row]</p>', '', 1, 0, 0, 10, '2013-01-31 09:34:38', 960, '', '2013-08-20 07:33:45', 960, 0, '0000-00-00 00:00:00', '2013-01-31 09:34:38', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 52, 0, 4, '', '', 1, 872, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', ''),
(13, 51, 'Article', 'article', '', '<ul>\r\n<li>This is a sample <strong>unordered list</strong></li>\r\n</ul>\r\n<ul class="arrow">\r\n<li>ul with class <strong>arrow</strong></li>\r\n</ul>\r\n<ul class="arrow-2">\r\n<li>ul with class <strong>arrow-2</strong></li>\r\n</ul>\r\n<ul class="star">\r\n<li>ul with class <strong>star</strong></li>\r\n</ul>\r\n<ul class="rss">\r\n<li>ul with class <strong>rss</strong></li>\r\n</ul>', '', 1, 0, 0, 10, '2013-01-31 11:56:10', 960, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2013-01-31 11:56:10', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 3, '', '', 1, 7, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(14, 52, 'Typography', 'typgraphy', '', '<p>[row]</p>\r\n<p>[col class="span6"]</p>\r\n<h1>h1. Heading 1</h1>\r\n<h2>h2. Heading 2</h2>\r\n<h3>h3. Heading 3</h3>\r\n<h4>h4. Heading 4</h4>\r\n<h5>h5. Heading 5</h5>\r\n<h6>h6. Heading 6</h6>\r\n<p>[/col]</p>\r\n<p>[col class="span6"]</p>\r\n<h3>Dropcap</h3>\r\n<p>[dropcap]This is a Magazine Style Drop Cap. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.[/dropcap]</p>\r\n<pre>[[dropcap]Dropcap Texts[/dropcap]]</pre>\r\n<p>[/col]</p>\r\n<p>[/row]</p>\r\n<p>[row]</p>\r\n<h3>Lists example</h3>\r\n<p>[col class="span6"]</p>\r\n<ul>\r\n<li>This is a sample <strong>unordered list</strong></li>\r\n</ul>\r\n<ul class="arrow">\r\n<li>ul with class <strong>arrow</strong></li>\r\n</ul>\r\n<ul class="arrow-double">\r\n<li>ul with class <strong>arrow-double</strong></li>\r\n</ul>\r\n<ul class="tick">\r\n<li>ul with class <strong>tick</strong></li>\r\n</ul>\r\n<ul class="cross">\r\n<li>ul with class <strong>cross</strong></li>\r\n</ul>\r\n<ul class="star">\r\n<li>ul with class <strong>star</strong></li>\r\n</ul>\r\n<ul class="rss">\r\n<li>ul with class <strong>rss</strong></li>\r\n</ul>\r\n<p>[/col]</p>\r\n<p>[col class="span6"]</p>\r\n<ol>\r\n<li>This is a sample <strong>ordered list</strong></li>\r\n</ol>\r\n<ul class="arrow">\r\n<li>ul with class <strong>arrow</strong></li>\r\n</ul>\r\n<ul class="arrow-double">\r\n<li>ul with class <strong>arrow-double</strong></li>\r\n</ul>\r\n<ul class="tick">\r\n<li>ul with class <strong>tick</strong></li>\r\n</ul>\r\n<ul class="cross">\r\n<li>ul with class <strong>cross</strong></li>\r\n</ul>\r\n<ul class="star">\r\n<li>ul with class <strong>star</strong></li>\r\n</ul>\r\n<ul class="rss">\r\n<li>ul with class <strong>rss</strong></li>\r\n</ul>\r\n<p>[/col]</p>\r\n<p>[/row]</p>\r\n<h3>Block Number</h3>\r\n<p>[row][col class="span4"] [blocknumber type="circle" text="01" color="#FFF" background="#34bcf5"]Lorem ipsum dolor sit amet consectetuer rutrum dignissim et neque id.[/blocknumber]</p>\r\n<p>[blocknumber type="circle" text="02" color="#FFF" background="#aacb24"]Lorem ipsum dolor sit amet consectetuer rutrum dignissim et neque id.[/blocknumber]</p>\r\n<p>[blocknumber type="circle" text="03" color="#FFF" background="#f16a10"]Lorem ipsum dolor sit amet consectetuer rutrum dignissim et neque id.[/blocknumber]</p>\r\n<pre>[[blocknumber type="circle" text="01" color="#FFF" background="#f16a10"]Circle Block Number[/blocknumber]]</pre>\r\n<p>[/col]</p>\r\n<p>[col class="span4"] [blocknumber type="rounded" text="01" color="#FFF" background="#7d2828"]Lorem ipsum dolor sit amet consectetuer rutrum dignissim et neque id.[/blocknumber]</p>\r\n<p>[blocknumber type="rounded" text="02" color="#FFF" background="#d80000"]Lorem ipsum dolor sit amet consectetuer rutrum dignissim et neque id.[/blocknumber]</p>\r\n<p>[blocknumber type="rounded" text="03" color="#FFF" background="#329491"]Lorem ipsum dolor sit amet consectetuer rutrum dignissim et neque id.[/blocknumber]</p>\r\n<pre>[[blocknumber type="rounded" text="01" color="#FFF" background="#329491"]Rounded Block Number[/blocknumber]]</pre>\r\n<p>[/col]</p>\r\n<p>[col class="span4"] [blocknumber text="01" color="#FFF" background="#999"]Lorem ipsum dolor sit amet consectetuer rutrum dignissim et neque id.[/blocknumber]</p>\r\n<p>[blocknumber text="02" color="#FFF" background="#666"]Lorem ipsum dolor sit amet consectetuer rutrum dignissim et neque id.[/blocknumber]</p>\r\n<p>[blocknumber text="03" color="#FFF" background="#000"]Lorem ipsum dolor sit amet consectetuer rutrum dignissim et neque id.[/blocknumber]</p>\r\n<pre>[[blocknumber text="01" color="#FFF" background="#999"]Normal Block Number[/blocknumber]]</pre>\r\n<p>[/col]<span style="line-height: 1.3em;">[/row]</span></p>\r\n<h3>Block Examples </h3>\r\n<p>[row][col class="span4"]</p>\r\n<p>[block color="#FFF" background="#34bcf5"]Lorem ipsum dolor sit amet, sic genero nomine Piscatore mihi. Dicis Deducitur potest flens praemio quod non dum veniens indica enim.[/block]</p>\r\n<p>[block color="#FFF" background="#aacb24"]Lorem ipsum dolor sit amet, sic genero nomine Piscatore mihi. Dicis Deducitur potest flens praemio quod non dum veniens indica enim.[/block]</p>\r\n<p>[block color="#FFF" background="#f16a10"]Lorem ipsum dolor sit amet, sic genero nomine Piscatore mihi. Dicis Deducitur potest flens praemio quod non dum veniens indica enim.[/block]</p>\r\n<pre>[[block color="#FFF" background="#f16a10"]Content[/block]]</pre>\r\n<p>[/col]</p>\r\n<p>[col class="span4"]</p>\r\n<p>[block type="rounded" color="#FFF" background="#7d2828"]Lorem ipsum dolor sit amet, sic genero nomine Piscatore mihi. Dicis Deducitur potest flens praemio quod non dum veniens indica enim.[/block]</p>\r\n<p>[block type="rounded" color="#FFF" background="#329491"]Lorem ipsum dolor sit amet, sic genero nomine Piscatore mihi. Dicis Deducitur potest flens praemio quod non dum veniens indica enim.[/block]</p>\r\n<p>[block type="rounded" color="#FFF" background="#000000"]Lorem ipsum dolor sit amet, sic genero nomine Piscatore mihi. Dicis Deducitur potest flens praemio quod non dum veniens indica enim.[/block]</p>\r\n<pre>[[block type="rounded" color="#FFF" background="#000000"]Lorem ipsum dolor[/block]]</pre>\r\n<p>[/col]</p>\r\n<p>[col class="span4"]</p>\r\n<p>[block border="1px dashed #CCC" padding="14px 15px"]Lorem ipsum dolor sit amet, sic genero nomine Piscatore mihi. Dicis Deducitur potest flens praemio quod non dum veniens indica enim.[/block]</p>\r\n<p>[block border="3px solid #34bcf5" padding="12px 15px"]Lorem ipsum dolor sit amet, sic genero nomine Piscatore mihi. Dicis Deducitur potest flens praemio quod non dum veniens indica enim.[/block]</p>\r\n<p>[block type="rounded" border="5px solid #aacb24" padding="10px 15px"]Lorem ipsum dolor sit amet, sic genero nomine Piscatore mihi. Dicis Deducitur potest flens praemio quod non dum veniens indica enim.[/block]</p>\r\n<pre>[[block border="5px solid #aacb24" padding="10px 15px"]Lorem ipsum dolor[/block]]</pre>\r\n<p>[/col]</p>\r\n<p>[/row]</p>\r\n<h3>Bubble Examples</h3>\r\n<p>[row][col class="span4"]</p>\r\n<p><span style="line-height: 1.3em;">[bubble author="Betty D. Steward"]Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ligula orci, ullamcorper vitae sodales venenatis, feugiat et felis. Donec non dui velit, a posuere dui.[/bubble]</span></p>\r\n<p><span style="line-height: 1.3em;">[/col][col class="span4"]</span></p>\r\n<p><span style="line-height: 1.3em;">[bubble color="#FFF" background="#736357" author="Barbara J. Pennebaker"]Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ligula orci, ullamcorper vitae sodales venenatis, feugiat et felis. Donec non dui velit, a posuere dui.[/bubble]</span></p>\r\n<p><span style="line-height: 1.3em;">[/col]</span><span style="line-height: 1.3em;">[col class="span4"]</span></p>\r\n<p><span style="line-height: 1.3em;">[bubble background="transparent" border="3px solid #ccc" author="Chad M. Simmons"]Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ligula orci, ullamcorper vitae sodales venenatis, feugiat et felis. Donec non dui.[/bubble]</span></p>\r\n<p><span>[/col]</span></p>\r\n<p><span style="line-height: 1.3em;">[/row]</span></p>\r\n<p><span style="line-height: 1.3em;">[row][col class="span12"]</span></p>\r\n<p> </p>\r\n<pre>[[bubble background="#FFF" color="#666" border="3px solid #ccc" author="Chad M. Simmons"]Lorem ipsum dolor sit amet.[/bubble]]</pre>\r\n<p><span style="line-height: 1.3em;">[/col]</span><span style="line-height: 1.3em;">[/row]</span></p>', '', 1, 0, 0, 10, '2013-01-31 11:57:09', 960, '', '2013-02-14 11:14:05', 439, 0, '0000-00-00 00:00:00', '2013-01-31 11:57:09', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 91, 0, 2, '', '', 1, 479, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(18, 56, 'Module Position', 'module-position', '', '<table class="table table-bordered table-striped center">\r\n<thead>\r\n<tr><th colspan="6">\r\n<h4>Header</h4>\r\n</th></tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td>logo</td>\r\n<td>menu</td>\r\n<td>search</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table class="table table-bordered table-striped center">\r\n<thead>\r\n<tr><th colspan="6">\r\n<h4>feature</h4>\r\n</th></tr>\r\n</thead>\r\n</table>\r\n<table class="table table-bordered table-striped center">\r\n<thead>\r\n<tr><th colspan="6">\r\n<h4>Users</h4>\r\n</th></tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td>user1</td>\r\n<td>user2</td>\r\n<td>user3</td>\r\n<td>user4</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table class="table table-bordered table-striped center">\r\n<thead>\r\n<tr><th colspan="6">\r\n<h4>Main Body</h4>\r\n</th></tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td>left</td>\r\n<td>component</td>\r\n<td>right</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table class="table table-bordered table-striped center">\r\n<thead>\r\n<tr><th colspan="6">\r\n<h4>breadcrumb</h4>\r\n</th></tr>\r\n</thead>\r\n</table>\r\n<table class="table table-bordered table-striped center">\r\n<thead>\r\n<tr><th colspan="6">\r\n<h4>Bottom</h4>\r\n</th></tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td>bottom1</td>\r\n<td>bottom2</td>\r\n<td>bottom3</td>\r\n<td>bottom4</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table class="table table-bordered table-striped center">\r\n<thead>\r\n<tr><th colspan="6">\r\n<h4>Footer</h4>\r\n</th></tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td>footer2</td>\r\n<td>footer1</td>\r\n</tr>\r\n</tbody>\r\n</table>', '', 1, 0, 0, 10, '2013-02-04 07:49:29', 960, '', '2013-02-04 08:52:15', 439, 0, '0000-00-00 00:00:00', '2013-02-04 07:49:29', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 22, 0, 0, '', '', 1, 66, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(16, 54, 'Gallery', 'gallery', '', '<p>[gallery columns="4" filter="yes"]</p>\r\n<p>[gallery_item tag="joomla" src="images/helix/gallery/300x200.png" /]</p>\r\n<p>[gallery_item tag="wordpress" src="images/helix/gallery/300x200.png" /]</p>\r\n<p>[gallery_item tag="joomla, wordpress" src="images/helix/gallery/300x200.png" /]</p>\r\n<p>[gallery_item tag="magento" src="images/helix/gallery/300x200.png" /]</p>\r\n<p>[gallery_item tag="opencart" src="images/helix/gallery/300x200.png" /]</p>\r\n<p>[gallery_item tag="magento, opencart" src="images/helix/gallery/300x200.png" /]</p>\r\n<p>[gallery_item tag="joomla, magento, wordpress, opencart" src="images/helix/gallery/300x200.png" /]</p>\r\n<p>[gallery_item tag="drupal" src="images/helix/gallery/300x200.png" /]</p>\r\n<p>[/gallery]</p>\r\n<h3>Get the code</h3>\r\n<pre>[[gallery columns="4" filter="yes"]\r\n[gallery_item tag="joomla" src="images/helix/gallery/300x200.png"/]\r\n[gallery_item tag="wordpress" src="images/helix/gallery/300x200.png"/]\r\n[gallery_item tag="joomla, wordpress" src="images/helix/gallery/300x200.png"/]\r\n[gallery_item tag="magento" src="images/helix/gallery/300x200.png"/]\r\n[gallery_item tag="opencart" src="images/helix/gallery/300x200.png"/]\r\n[gallery_item tag="magento, opencart" src="images/helix/gallery/300x200.png"/]\r\n[gallery_item tag="joomla, magento, wordpress, opencart" src="images/helix/gallery/300x200.png"/]\r\n[gallery_item tag="drupal" src="images/helix/gallery/300x200.png"/]\r\n[/gallery]]\r\n</pre>', '', 1, 0, 0, 11, '2013-02-04 06:47:55', 960, '', '2013-02-04 07:41:41', 439, 0, '0000-00-00 00:00:00', '2013-02-04 06:47:55', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 29, 0, 0, '', '', 1, 108, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(17, 55, 'Video', 'video', '', '<p>[row]</p>\r\n<p>[col class="span6"]</p>\r\n<p>[spvideo]https://www.youtube.com/watch?v=vb2eObvmvdI[/spvideo]</p>\r\n<h3>Get the code</h3>\r\n<pre>[[spvideo]http://www.youtube.com/watch?v=vb2eObvmvdI[/spvideo]]</pre>\r\n<p>[/col]</p>\r\n<p>[col class="span6"]</p>\r\n<p>[spvideo]http://vimeo.com/3701346[/spvideo]</p>\r\n<h3>Get the code</h3>\r\n<pre>[[spvideo]http://vimeo.com/3701346[/spvideo]]</pre>\r\n<p>[/col]</p>\r\n<p>[/row]</p>', '', 1, 0, 0, 10, '2013-02-04 06:56:51', 960, '', '2013-06-19 08:17:54', 960, 0, '0000-00-00 00:00:00', '2013-02-04 06:56:51', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 34, 0, 1, '', '', 1, 109, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(19, 57, 'The Joomla Blog', 'the-joomla-blog', '', '<p>Joomla! means All Together, and it is a community of people all working and having fun together that makes Joomla! possible. Thousands of people each year participate in the Joomla! community, and we hope you will be one of them.</p>\r\n<p>People with all kinds of skills, of all skill levels and from around the world are welcome to join in. Participate in the <a href="http://joomla.org">Joomla.org</a> family of websites (the<a href="http://forum.joomla.org"> forum </a>is a great place to start). Come to a <a href="http://community.joomla.org/events.html">Joomla! event</a>. Join or start a <a href="http://community.joomla.org/user-groups.html">Joomla! Users Group</a>. Whether you are a developer, site administrator, designer, end user or fan, there are ways for you to participate and contribute.</p>', '', 1, 0, 0, 8, '2013-01-31 07:27:02', 960, '', '2013-02-04 09:19:32', 439, 0, '0000-00-00 00:00:00', '2013-01-31 07:27:02', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, 2, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(20, 58, 'The Joomla overview', 'the-joomla-overview', '', '<p>Joomla! means All Together, and it is a community of people all working and having fun together that makes Joomla! possible. Thousands of people each year participate in the Joomla! community, and we hope you will be one of them.</p>\r\n<p>People with all kinds of skills, of all skill levels and from around the world are welcome to join in. Participate in the <a href="http://joomla.org">Joomla.org</a> family of websites (the<a href="http://forum.joomla.org"> forum </a>is a great place to start). Come to a <a href="http://community.joomla.org/events.html">Joomla! event</a>. Join or start a <a href="http://community.joomla.org/user-groups.html">Joomla! Users Group</a>. Whether you are a developer, site administrator, designer, end user or fan, there are ways for you to participate and contribute.</p>', '', 1, 0, 0, 8, '2013-01-31 07:27:02', 960, '', '2013-02-04 09:20:04', 439, 0, '0000-00-00 00:00:00', '2013-01-31 07:27:02', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, 1, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(21, 59, 'The Joomla Help', 'the-joomla-help', '', '<p>Joomla! means All Together, and it is a community of people all working and having fun together that makes Joomla! possible. Thousands of people each year participate in the Joomla! community, and we hope you will be one of them.</p>\r\n<p>People with all kinds of skills, of all skill levels and from around the world are welcome to join in. Participate in the <a href="http://joomla.org">Joomla.org</a> family of websites (the<a href="http://forum.joomla.org"> forum </a>is a great place to start). Come to a <a href="http://community.joomla.org/events.html">Joomla! event</a>. Join or start a <a href="http://community.joomla.org/user-groups.html">Joomla! Users Group</a>. Whether you are a developer, site administrator, designer, end user or fan, there are ways for you to participate and contribute.</p>', '', 1, 0, 0, 8, '2013-01-31 07:27:02', 960, '', '2013-02-04 09:20:24', 439, 0, '0000-00-00 00:00:00', '2013-01-31 07:27:02', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, 0, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');

-- --------------------------------------------------------

--
-- Table structure for table `#__content_frontpage`
--

DROP TABLE IF EXISTS `#__content_frontpage`;
CREATE TABLE IF NOT EXISTS `#__content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__content_frontpage`
--

INSERT INTO `#__content_frontpage` (`content_id`, `ordering`) VALUES
(12, 2),
(15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `#__content_rating`
--

DROP TABLE IF EXISTS `#__content_rating`;
CREATE TABLE IF NOT EXISTS `#__content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `#__core_log_searches`
--

DROP TABLE IF EXISTS `#__core_log_searches`;
CREATE TABLE IF NOT EXISTS `#__core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `#__extensions`
--

DROP TABLE IF EXISTS `#__extensions`;
CREATE TABLE IF NOT EXISTS `#__extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `system_data` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10002 ;

--
-- Dumping data for table `#__extensions`
--

INSERT INTO `#__extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(1, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '{"legacy":false,"name":"com_mailto","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MAILTO_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(2, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '{"legacy":false,"name":"com_wrapper","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_WRAPPER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(3, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_admin","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_ADMIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(4, 'com_banners', 'component', 'com_banners', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_banners","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_BANNERS_XML_DESCRIPTION","group":""}', '{"purchase_type":"3","track_impressions":"0","track_clicks":"0","metakey_prefix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(5, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_cache","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CACHE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(6, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_categories","type":"component","creationDate":"December 2007","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(7, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_checkin","type":"component","creationDate":"Unknown","author":"Joomla! Project","copyright":"(C) 2005 - 2008 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CHECKIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(8, 'com_contact', 'component', 'com_contact', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_contact","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CONTACT_XML_DESCRIPTION","group":""}', '{"show_contact_category":"hide","show_contact_list":"0","presentation_style":"sliders","show_name":"1","show_position":"1","show_email":"0","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"1","show_fax":"1","show_webpage":"1","show_misc":"1","show_image":"1","image":"","allow_vcard":"0","show_articles":"0","show_profile":"0","show_links":"0","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","contact_icons":"0","icon_address":"","icon_email":"","icon_telephone":"","icon_mobile":"","icon_fax":"","icon_misc":"","show_headings":"1","show_position_headings":"1","show_email_headings":"0","show_telephone_headings":"1","show_mobile_headings":"0","show_fax_headings":"0","allow_vcard_headings":"0","show_suburb_headings":"1","show_state_headings":"1","show_country_headings":"1","show_email_form":"1","show_email_copy":"1","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"0","redirect":"","show_category_crumb":"0","metakey":"","metadesc":"","robots":"","author":"","rights":"","xreference":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(9, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_cpanel","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CPANEL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_installer","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_INSTALLER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(11, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_languages","type":"component","creationDate":"2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_LANGUAGES_XML_DESCRIPTION","group":""}', '{"administrator":"en-GB","site":"en-GB"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(12, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_login","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(13, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_media","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MEDIA_XML_DESCRIPTION","group":""}', '{"upload_extensions":"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS","upload_maxsize":"10","file_path":"images","image_path":"images","restrict_uploads":"1","allowed_media_usergroup":"3","check_mime":"1","image_extensions":"bmp,gif,jpg,png","ignore_extensions":"","upload_mime":"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip","upload_mime_illegal":"text\\/html","enable_flash":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(14, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_menus","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MENUS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(15, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_messages","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MESSAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(16, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_modules","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MODULES_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(17, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_newsfeeds","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{"show_feed_image":"1","show_feed_description":"1","show_item_description":"1","feed_word_count":"0","show_headings":"1","show_name":"1","show_articles":"0","show_link":"1","show_description":"1","show_description_image":"1","display_num":"","show_pagination_limit":"1","show_pagination":"1","show_pagination_results":"1","show_cat_items":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(18, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_plugins","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_PLUGINS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(19, 'com_search', 'component', 'com_search', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_search","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_SEARCH_XML_DESCRIPTION","group":""}', '{"enabled":"0","show_date":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(20, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_templates","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_TEMPLATES_XML_DESCRIPTION","group":""}', '{"template_positions_display":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(21, 'com_weblinks', 'component', 'com_weblinks', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_weblinks","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_WEBLINKS_XML_DESCRIPTION","group":""}', '{"show_comp_description":"1","comp_description":"","show_link_hits":"1","show_link_description":"1","show_other_cats":"0","show_headings":"0","show_numbers":"0","show_report":"1","count_clicks":"1","target":"0","link_icons":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(22, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_content","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CONTENT_XML_DESCRIPTION","group":""}', '{"article_layout":"_:default","show_title":"1","link_titles":"1","show_intro":"1","show_category":"1","link_category":"1","show_parent_category":"0","link_parent_category":"0","show_author":"1","link_author":"0","show_create_date":"1","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_readmore":"1","show_readmore_title":"1","readmore_limit":"100","show_icons":"1","show_print_icon":"1","show_email_icon":"1","show_hits":"0","show_noauth":"0","urls_position":"0","show_publishing_options":"1","show_article_options":"1","show_urls_images_frontend":"1","show_urls_images_backend":"1","targeta":0,"targetb":0,"targetc":0,"float_intro":"left","float_fulltext":"left","category_layout":"_:blog","show_category_heading_title_text":"1","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"1","show_empty_categories":"0","show_no_articles":"1","show_subcat_desc":"1","show_cat_num_articles":"0","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_num_articles_cat":"1","num_leading_articles":"1","num_intro_articles":"4","num_columns":"2","num_links":"4","multi_column_order":"0","show_subcategory_content":"0","show_pagination_limit":"1","filter_field":"hide","show_headings":"1","list_show_date":"0","date_format":"","list_show_hits":"1","list_show_author":"1","orderby_pri":"order","orderby_sec":"rdate","order_date":"published","show_pagination":"2","show_pagination_results":"1","show_feed_link":"1","feed_summary":"0","feed_show_readmore":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(23, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_config","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CONFIG_XML_DESCRIPTION","group":""}', '{"filters":{"1":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"6":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"7":{"filter_type":"NONE","filter_tags":"","filter_attributes":""},"2":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"3":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"4":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"5":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"8":{"filter_type":"NONE","filter_tags":"","filter_attributes":""}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(24, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_redirect","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_REDIRECT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(25, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_users","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_USERS_XML_DESCRIPTION","group":""}', '{"allowUserRegistration":"1","new_usertype":"2","useractivation":"1","frontend_userparams":"1","mailSubjectPrefix":"","mailBodySuffix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(27, 'com_finder', 'component', 'com_finder', '', 1, 1, 0, 0, '{"legacy":false,"name":"com_finder","type":"component","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_FINDER_XML_DESCRIPTION","group":""}', '{"show_description":"1","description_length":255,"allow_empty_query":"0","show_url":"1","show_advanced":"1","expand_advanced":"0","show_date_filters":"0","highlight_terms":"1","opensearch_name":"","opensearch_description":"","batch_size":"50","memory_table_limit":30000,"title_multiplier":"1.7","text_multiplier":"0.7","meta_multiplier":"1.2","path_multiplier":"2.0","misc_multiplier":"0.3","stemmer":"snowball"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(28, 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_joomlaupdate","type":"component","creationDate":"February 2012","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(100, 'PHPMailer', 'library', 'phpmailer', '', 0, 1, 1, 1, '{"legacy":false,"name":"PHPMailer","type":"library","creationDate":"2001","author":"PHPMailer","copyright":"(c) 2001-2003, Brent R. Matzelle, (c) 2004-2009, Andy Prevost. All Rights Reserved., (c) 2010-2011, Jim Jagielski. All Rights Reserved.","authorEmail":"jimjag@gmail.com","authorUrl":"https:\\/\\/code.google.com\\/a\\/apache-extras.org\\/p\\/phpmailer\\/","version":"5.2","description":"LIB_PHPMAILER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(101, 'SimplePie', 'library', 'simplepie', '', 0, 1, 1, 1, '{"legacy":false,"name":"SimplePie","type":"library","creationDate":"2004","author":"SimplePie","copyright":"Copyright (c) 2004-2009, Ryan Parman and Geoffrey Sneddon","authorEmail":"","authorUrl":"http:\\/\\/simplepie.org\\/","version":"1.2","description":"LIB_SIMPLEPIE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(102, 'phputf8', 'library', 'phputf8', '', 0, 1, 1, 1, '{"legacy":false,"name":"phputf8","type":"library","creationDate":"2006","author":"Harry Fuecks","copyright":"Copyright various authors","authorEmail":"hfuecks@gmail.com","authorUrl":"http:\\/\\/sourceforge.net\\/projects\\/phputf8","version":"0.5","description":"LIB_PHPUTF8_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(103, 'Joomla! Platform', 'library', 'joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"Joomla! Platform","type":"library","creationDate":"2008","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http:\\/\\/www.joomla.org","version":"11.4","description":"LIB_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(200, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_archive","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters.\\n\\t\\tAll rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(201, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LATEST_NEWS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(202, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_articles_popular","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(203, 'mod_banners', 'module', 'mod_banners', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_banners","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_BANNERS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(204, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_breadcrumbs","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_BREADCRUMBS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(205, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(206, 'mod_feed', 'module', 'mod_feed', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_FEED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(207, 'mod_footer', 'module', 'mod_footer', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_footer","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_FOOTER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(208, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_login","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(209, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_menu","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_MENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(210, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_articles_news","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_NEWS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(211, 'mod_random_image', 'module', 'mod_random_image', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_random_image","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_RANDOM_IMAGE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(212, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_related_items","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_RELATED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(213, 'mod_search', 'module', 'mod_search', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_search","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_SEARCH_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(214, 'mod_stats', 'module', 'mod_stats', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_stats","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_STATS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(215, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_syndicate","type":"module","creationDate":"May 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_SYNDICATE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(216, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_users_latest","type":"module","creationDate":"December 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_USERS_LATEST_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(217, 'mod_weblinks', 'module', 'mod_weblinks', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_weblinks","type":"module","creationDate":"July 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_WEBLINKS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(218, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_whosonline","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_WHOSONLINE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(219, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_wrapper","type":"module","creationDate":"October 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_WRAPPER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(220, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_category","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(221, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_categories","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(222, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_languages","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LANGUAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(223, 'mod_finder', 'module', 'mod_finder', '', 0, 1, 0, 0, '{"legacy":false,"name":"mod_finder","type":"module","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_FINDER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(300, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(301, 'mod_feed', 'module', 'mod_feed', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_FEED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(302, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LATEST_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(303, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_logged","type":"module","creationDate":"January 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LOGGED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(304, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_login","type":"module","creationDate":"March 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(305, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_menu","type":"module","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_MENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(307, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_popular","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(308, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_quickicon","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_QUICKICON_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(309, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_status","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_STATUS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(310, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_submenu","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_SUBMENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(311, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_title","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_TITLE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(312, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_toolbar","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_TOOLBAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(313, 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_multilangstatus","type":"module","creationDate":"September 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_MULTILANGSTATUS_XML_DESCRIPTION","group":""}', '{"cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(314, 'mod_version', 'module', 'mod_version', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_version","type":"module","creationDate":"January 2012","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_VERSION_XML_DESCRIPTION","group":""}', '{"format":"short","product":"1","cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(400, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 0, 1, 0, '{"legacy":false,"name":"plg_authentication_gmail","type":"plugin","creationDate":"February 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_GMAIL_XML_DESCRIPTION","group":""}', '{"applysuffix":"0","suffix":"","verifypeer":"1","user_blacklist":""}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(401, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '{"legacy":false,"name":"plg_authentication_joomla","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_AUTH_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(402, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '{"legacy":false,"name":"plg_authentication_ldap","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_LDAP_XML_DESCRIPTION","group":""}', '{"host":"","port":"389","use_ldapV3":"0","negotiate_tls":"0","no_referrals":"0","auth_method":"bind","base_dn":"","search_string":"","users_dn":"","username":"admin","password":"bobby7","ldap_fullname":"fullName","ldap_email":"mail","ldap_uid":"uid"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(404, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"plg_content_emailcloak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION","group":""}', '{"mode":"1"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(405, 'plg_content_geshi', 'plugin', 'geshi', 'content', 0, 0, 1, 0, '{"legacy":false,"name":"plg_content_geshi","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"","authorUrl":"qbnz.com\\/highlighter","version":"2.5.0","description":"PLG_CONTENT_GESHI_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(406, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"plg_content_loadmodule","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_LOADMODULE_XML_DESCRIPTION","group":""}', '{"style":"xhtml"}', '', '', 0, '2011-09-18 15:22:50', 0, 0),
(407, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 1, '{"legacy":false,"name":"plg_content_pagebreak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION","group":""}', '{"title":"1","multipage_toc":"1","showall":"1"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(408, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 1, 1, 1, '{"legacy":false,"name":"plg_content_pagenavigation","type":"plugin","creationDate":"January 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_PAGENAVIGATION_XML_DESCRIPTION","group":""}', '{"position":"1"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(409, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 1, 1, 1, '{"legacy":false,"name":"plg_content_vote","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_VOTE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(410, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors_codemirror","type":"plugin","creationDate":"28 March 2011","author":"Marijn Haverbeke","copyright":"","authorEmail":"N\\/A","authorUrl":"","version":"1.0","description":"PLG_CODEMIRROR_XML_DESCRIPTION","group":""}', '{"linenumbers":"0","tabmode":"indent"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(411, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors_none","type":"plugin","creationDate":"August 2004","author":"Unknown","copyright":"","authorEmail":"N\\/A","authorUrl":"","version":"2.5.0","description":"PLG_NONE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(412, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors_tinymce","type":"plugin","creationDate":"2005-2013","author":"Moxiecode Systems AB","copyright":"Moxiecode Systems AB","authorEmail":"N\\/A","authorUrl":"tinymce.moxiecode.com\\/","version":"3.5.4.1","description":"PLG_TINY_XML_DESCRIPTION","group":""}', '{"mode":"2","skin":"0","entity_encoding":"raw","lang_mode":"0","lang_code":"en","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","invalid_elements":"script,applet,iframe","extended_elements":"","toolbar":"top","toolbar_align":"left","html_height":"550","html_width":"750","resizing":"true","resize_horizontal":"false","element_path":"1","fonts":"1","paste":"1","searchreplace":"1","insertdate":"1","format_date":"%Y-%m-%d","inserttime":"1","format_time":"%H:%M:%S","colors":"1","table":"1","smilies":"1","media":"1","hr":"1","directionality":"1","fullscreen":"1","style":"1","layer":"1","xhtmlxtras":"1","visualchars":"1","visualblocks":"1","nonbreaking":"1","template":"1","blockquote":"1","wordcount":"1","advimage":"1","advlink":"1","advlist":"1","autosave":"1","contextmenu":"1","inlinepopups":"1","custom_plugin":"","custom_button":""}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(413, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors-xtd_article","type":"plugin","creationDate":"October 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_ARTICLE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(414, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"plg_editors-xtd_image","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_IMAGE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(415, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"plg_editors-xtd_pagebreak","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(416, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"plg_editors-xtd_readmore","type":"plugin","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_READMORE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(417, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_categories","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(418, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_contacts","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_CONTACTS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(419, 'plg_search_content', 'plugin', 'content', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_content","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_CONTENT_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(420, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_newsfeeds","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(421, 'plg_search_weblinks', 'plugin', 'weblinks', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_weblinks","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_WEBLINKS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(422, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 0, 1, 1, '{"legacy":false,"name":"plg_system_languagefilter","type":"plugin","creationDate":"July 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(423, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_p3p","type":"plugin","creationDate":"September 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_P3P_XML_DESCRIPTION","group":""}', '{"headers":"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(424, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 0, 1, 1, '{"legacy":false,"name":"plg_system_cache","type":"plugin","creationDate":"February 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CACHE_XML_DESCRIPTION","group":""}', '{"browsercache":"0","cachetime":"15"}', '', '', 0, '0000-00-00 00:00:00', 9, 0),
(425, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"plg_system_debug","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_DEBUG_XML_DESCRIPTION","group":""}', '{"profile":"1","queries":"1","memory":"1","language_files":"1","language_strings":"1","strip-first":"1","strip-prefix":"","strip-suffix":""}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(426, 'plg_system_log', 'plugin', 'log', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_log","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_LOG_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(427, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_redirect","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_REDIRECT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0);
INSERT INTO `#__extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(428, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_remember","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_REMEMBER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(429, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"plg_system_sef","type":"plugin","creationDate":"December 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEF_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 8, 0),
(430, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_logout","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(431, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 1, '{"legacy":false,"name":"plg_user_contactcreator","type":"plugin","creationDate":"August 2009","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTACTCREATOR_XML_DESCRIPTION","group":""}', '{"autowebpage":"","category":"34","autopublish":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(432, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '{"legacy":false,"name":"plg_user_joomla","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2009 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_USER_JOOMLA_XML_DESCRIPTION","group":""}', '{"autoregister":"1"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(433, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 0, 1, 1, '{"legacy":false,"name":"plg_user_profile","type":"plugin","creationDate":"January 2008","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_USER_PROFILE_XML_DESCRIPTION","group":""}', '{"register-require_address1":"1","register-require_address2":"1","register-require_city":"1","register-require_region":"1","register-require_country":"1","register-require_postal_code":"1","register-require_phone":"1","register-require_website":"1","register-require_favoritebook":"1","register-require_aboutme":"1","register-require_tos":"1","register-require_dob":"1","profile-require_address1":"1","profile-require_address2":"1","profile-require_city":"1","profile-require_region":"1","profile-require_country":"1","profile-require_postal_code":"1","profile-require_phone":"1","profile-require_website":"1","profile-require_favoritebook":"1","profile-require_aboutme":"1","profile-require_tos":"1","profile-require_dob":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(434, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '{"legacy":false,"name":"plg_extension_joomla","type":"plugin","creationDate":"May 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(435, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"plg_content_joomla","type":"plugin","creationDate":"November 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTENT_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(436, 'plg_system_languagecode', 'plugin', 'languagecode', 'system', 0, 0, 1, 0, '{"legacy":false,"name":"plg_system_languagecode","type":"plugin","creationDate":"November 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(437, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', 0, 1, 1, 1, '{"legacy":false,"name":"plg_quickicon_joomlaupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(438, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', 0, 1, 1, 1, '{"legacy":false,"name":"plg_quickicon_extensionupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(439, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', 0, 1, 1, 0, '{"legacy":false,"name":"plg_captcha_recaptcha","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION","group":""}', '{"public_key":"","private_key":"","theme":"clean"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(440, 'plg_system_highlight', 'plugin', 'highlight', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"plg_system_highlight","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(441, 'plg_content_finder', 'plugin', 'finder', 'content', 0, 0, 1, 0, '{"legacy":false,"name":"plg_content_finder","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTENT_FINDER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(442, 'plg_finder_categories', 'plugin', 'categories', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_categories","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_CATEGORIES_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(443, 'plg_finder_contacts', 'plugin', 'contacts', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_contacts","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_CONTACTS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(444, 'plg_finder_content', 'plugin', 'content', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_content","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_CONTENT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(445, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_newsfeeds","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(446, 'plg_finder_weblinks', 'plugin', 'weblinks', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_weblinks","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_WEBLINKS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(500, 'atomic', 'template', 'atomic', '', 0, 1, 1, 0, '{"legacy":false,"name":"atomic","type":"template","creationDate":"10\\/10\\/09","author":"Ron Severdia","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"contact@kontentdesign.com","authorUrl":"http:\\/\\/www.kontentdesign.com","version":"2.5.0","description":"TPL_ATOMIC_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(502, 'bluestork', 'template', 'bluestork', '', 1, 1, 1, 0, '{"legacy":false,"name":"bluestork","type":"template","creationDate":"07\\/02\\/09","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"TPL_BLUESTORK_XML_DESCRIPTION","group":""}', '{"useRoundedCorners":"1","showSiteName":"0","textBig":"0","highContrast":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(503, 'beez_20', 'template', 'beez_20', '', 0, 1, 1, 0, '{"legacy":false,"name":"beez_20","type":"template","creationDate":"25 November 2009","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"2.5.0","description":"TPL_BEEZ2_XML_DESCRIPTION","group":""}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","templatecolor":"nature"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(504, 'hathor', 'template', 'hathor', '', 1, 1, 1, 0, '{"legacy":false,"name":"hathor","type":"template","creationDate":"May 2010","author":"Andrea Tarr","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"hathor@tarrconsulting.com","authorUrl":"http:\\/\\/www.tarrconsulting.com","version":"2.5.0","description":"TPL_HATHOR_XML_DESCRIPTION","group":""}', '{"showSiteName":"0","colourChoice":"0","boldText":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(505, 'beez5', 'template', 'beez5', '', 0, 1, 1, 0, '{"legacy":false,"name":"beez5","type":"template","creationDate":"21 May 2010","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"2.5.0","description":"TPL_BEEZ5_XML_DESCRIPTION","group":""}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","html5":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(600, 'English (United Kingdom)', 'language', 'en-GB', '', 0, 1, 1, 1, '{"legacy":false,"name":"English (United Kingdom)","type":"language","creationDate":"2008-03-15","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.10","description":"en-GB site language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(601, 'English (United Kingdom)', 'language', 'en-GB', '', 1, 1, 1, 1, '{"legacy":false,"name":"English (United Kingdom)","type":"language","creationDate":"2008-03-15","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.10","description":"en-GB administrator language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(700, 'files_joomla', 'file', 'joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"files_joomla","type":"file","creationDate":"November 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.16","description":"FILES_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(800, 'PKG_JOOMLA', 'package', 'pkg_joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"PKG_JOOMLA","type":"package","creationDate":"2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http:\\/\\/www.joomla.org","version":"2.5.0","description":"PKG_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10000, 'System - Helix Framework', 'plugin', 'helix', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"System - Helix Framework","type":"plugin","creationDate":"March 2011","author":"JoomShaper.com","copyright":"Copyright (C) 2010 - 2013 JoomShaper. All rights reserved.","authorEmail":"support@joomshaper.com","authorUrl":"www.joomshaper.com","version":"2.1.3","description":"Helix Framework - JoomShaper Template Framework for Joomla 2.5 and 3.X","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10001, 'shaper_helix_ii', 'template', 'shaper_helix_ii', '', 0, 1, 1, 0, '{"legacy":false,"name":"shaper_helix_ii","type":"template","creationDate":"Feb 2013","author":"JoomShaper.com","copyright":"Copyright (C) 2010 - 2013 JoomShaper.com. All rights reserved.","authorEmail":"support@joomshaper.com","authorUrl":"http:\\/\\/www.joomshaper.com","version":"1.0.3","description":"\\n\\t\\t\\n\\t\\t\\tShaper Helix \\u2013 II is the default\\/blank template of Helix Framework version 2.<br \\/>\\n\\t\\t\\tThis template has all the in built functionality of Helix 2.0. Helix - II comes with tons of shortcode such for video, gallery, slideshow, tabs, accordion etc. \\n\\t\\t\\tHelix 2.0 especially comes with rich administration features such as logo settings, masterpiece layout builder,\\n\\t\\t\\tmega menu, unlimited fonts control, Google analytics,\\n\\t\\t\\tLess complitation and all types of presets control like header color, link color, background color so on.\\n\\t\\t\\tNow you don\\u2019t need to worry about its speed. The built-in css and javascript compresses \\n\\t\\t\\tused by Helix to provide optimal performance.\\n\\t\\t\\t<h3>Key Features<\\/h3>\\n\\t\\t\\t<ul class=\\"arrow\\">\\n\\t\\t\\t\\t<li>Unlimited module positions with the power of unique layout builder<\\/li>\\n\\t\\t\\t\\t<li>Powered by Bootstrap and compatible with Joomla 2.5 and 3.0<\\/li>\\n\\t\\t\\t\\t<li>Three (3) presets with presets manager<\\/li>\\n\\t\\t\\t\\t<li>Uses latest web technologies like html5 and css3<\\/li>\\n\\t\\t\\t\\t<li>Tons of shortcodes in built<\\/li>\\n\\t\\t\\t\\t<li>Built with LESS CSS<\\/li>\\n\\t\\t\\t\\t<li>Megamenu, RTL Support, CSS and JS compression and many more...<\\/li>\\n\\t\\t\\t<\\/ul>\\n\\t\\t\\n\\t","group":""}', '{"logo_type":"image","logo_position":"","logo_type_text":"Helix","logo_type_slogan":"Joomla! Templates Framework","logo_width":"260","logo_height":"100","showcp":"1","copyright":"2012 Shaper Express Demo. All Rights Reserved.","show_helix_logo":"1","preset":"style1","style1_header":"#ccc","style1_background":"#ffccff","style1_text":"#eeeeee","style1_link":"#0B78A1","style1_footer":"#0B78A1","menutype":"mainmenu","spmenu":"mega","menu_col_width":"200","show_menu_image":"1","menu_image_position":"1","init_x":"0","init_y":"0","sub_x":"0","sub_y":"0","menu_animation":"slidefade","menu_duration":"300","menu_transition":"linear","body_font":"","header_font":"","header_selectors":"","other_font":"","cache_time":"60","compress_css":"0","compress_js":"0","enable_ga":"0","ga_code":"","direction":"ltr","showtop":"1","jcredit":"1","validator":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `#__languages`
--

DROP TABLE IF EXISTS `#__languages`;
CREATE TABLE IF NOT EXISTS `#__languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` char(7) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `sitename` varchar(1024) NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_image` (`image`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `#__languages`
--

INSERT INTO `#__languages` (`lang_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
(1, 'en-GB', 'English (UK)', 'English (UK)', 'en', 'en', '', '', '', '', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `#__menu`
--

DROP TABLE IF EXISTS `#__menu`;
CREATE TABLE IF NOT EXISTS `#__menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `ordering` int(11) NOT NULL DEFAULT '0' COMMENT 'The relative ordering of the menu item in the tree.',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`,`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_path` (`path`(333)),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=158 ;

--
-- Dumping data for table `#__menu`
--

INSERT INTO `#__menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `ordering`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 151, 0, '*', 0),
(2, 'menu', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 0, 1, 1, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 1, 10, 0, '*', 1),
(3, 'menu', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', 0, 2, 2, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 2, 3, 0, '*', 1),
(4, 'menu', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', 0, 2, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-cat', 0, '', 4, 5, 0, '*', 1),
(5, 'menu', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 0, 2, 2, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-clients', 0, '', 6, 7, 0, '*', 1),
(6, 'menu', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 0, 2, 2, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-tracks', 0, '', 8, 9, 0, '*', 1),
(7, 'menu', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 0, 1, 1, 8, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 113, 118, 0, '*', 1),
(8, 'menu', 'com_contact', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', 0, 7, 2, 8, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 114, 115, 0, '*', 1),
(9, 'menu', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', 0, 7, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact-cat', 0, '', 116, 117, 0, '*', 1),
(10, 'menu', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', 0, 1, 1, 15, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages', 0, '', 119, 124, 0, '*', 1),
(11, 'menu', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', 0, 10, 2, 15, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-add', 0, '', 120, 121, 0, '*', 1),
(12, 'menu', 'com_messages_read', 'Read Private Message', '', 'Messaging/Read Private Message', 'index.php?option=com_messages', 'component', 0, 10, 2, 15, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-read', 0, '', 122, 123, 0, '*', 1),
(13, 'menu', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 1, 1, 17, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 125, 130, 0, '*', 1),
(14, 'menu', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 13, 2, 17, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 126, 127, 0, '*', 1),
(15, 'menu', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', 0, 13, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds-cat', 0, '', 128, 129, 0, '*', 1),
(16, 'menu', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', 0, 1, 1, 24, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:redirect', 0, '', 143, 144, 0, '*', 1),
(17, 'menu', 'com_search', 'Basic Search', '', 'Basic Search', 'index.php?option=com_search', 'component', 0, 1, 1, 19, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:search', 0, '', 133, 134, 0, '*', 1),
(18, 'menu', 'com_weblinks', 'Weblinks', '', 'Weblinks', 'index.php?option=com_weblinks', 'component', 0, 1, 1, 21, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 135, 140, 0, '*', 1),
(19, 'menu', 'com_weblinks_links', 'Links', '', 'Weblinks/Links', 'index.php?option=com_weblinks', 'component', 0, 18, 2, 21, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 136, 137, 0, '*', 1),
(20, 'menu', 'com_weblinks_categories', 'Categories', '', 'Weblinks/Categories', 'index.php?option=com_categories&extension=com_weblinks', 'component', 0, 18, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks-cat', 0, '', 138, 139, 0, '*', 1),
(21, 'menu', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 0, 1, 1, 27, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:finder', 0, '', 131, 132, 0, '*', 1),
(22, 'menu', 'com_joomlaupdate', 'Joomla! Update', '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', 0, 1, 1, 28, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:joomlaupdate', 0, '', 141, 142, 0, '*', 1),
(101, 'mainmenu', 'Home', 'home', '', 'home', 'index.php?option=com_content&view=featured', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"featured_categories":[""],"layout_type":"blog","num_leading_articles":"","num_intro_articles":"","num_columns":"","num_links":"","multi_column_order":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_title":"","link_titles":"","show_intro":"","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_readmore":"","show_readmore_title":"","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 11, 12, 1, '*', 0),
(102, 'mainmenu', 'Features', '2013-01-31-06-37-23', '', '2013-01-31-06-37-23', '#', 'url', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"showmenutitle":"1","desc":"","cols":"3","group":"0","showgrouptitle":"1","cwidth":"500","colxw":"250\\r\\n250\\r\\n500","class":"","subcontent":"normal"}', 13, 66, 0, '*', 0),
(103, 'mainmenu', 'Typography', 'typgraphy', '', '2013-01-31-06-37-23/2013-01-31-06-54-32/typgraphy', 'index.php?option=com_content&view=article&id=14', 'component', 1, 106, 3, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 15, 16, 0, '*', 0),
(104, 'mainmenu', 'Module Position', 'module-position', '', '2013-01-31-06-37-23/2013-01-31-06-54-32/module-position', 'index.php?option=com_content&view=article&id=18', 'component', 1, 106, 3, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 17, 18, 0, '*', 0),
(105, 'mainmenu', 'Module Variations', '2013-01-31-06-39-54', '', '2013-01-31-06-37-23/2013-01-31-06-54-32/2013-01-31-06-39-54', 'index.php?option=com_content&view=article&id=2', 'component', 1, 106, 3, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 19, 20, 0, '*', 0),
(106, 'mainmenu', 'Key Features', '2013-01-31-06-54-32', '', '2013-01-31-06-37-23/2013-01-31-06-54-32', '#', 'url', 1, 102, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"showmenutitle":"1","desc":"","cols":"1","group":"1","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 14, 27, 0, '*', 0),
(107, 'mainmenu', 'Shortcode', '2013-01-31-07-00-31', '', '2013-01-31-07-00-31', '#', 'url', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 67, 90, 0, '*', 0),
(108, 'mainmenu', 'Menu', '2013-01-31-07-00-49', '', '2013-01-31-06-37-23/2013-01-31-07-00-49', '#', 'url', 1, 102, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"showmenutitle":"1","desc":"","cols":"1","group":"1","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 28, 63, 0, '*', 0),
(109, 'mainmenu', 'Mega Menu', '2013-01-31-07-04-54', '', '2013-01-31-06-37-23/2013-01-31-07-00-49/2013-01-31-07-04-54', '?menu=mega', 'url', 1, 108, 3, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 29, 30, 0, '*', 0),
(110, 'mainmenu', 'Dropline Menu', '2013-01-31-07-06-22', '', '2013-01-31-06-37-23/2013-01-31-07-00-49/2013-01-31-07-06-22', '?menu=drop', 'url', 1, 108, 3, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 31, 32, 0, '*', 0),
(112, 'mainmenu', 'Split Menu', '2013-01-31-07-08-55', '', '2013-01-31-06-37-23/2013-01-31-07-00-49/2013-01-31-07-08-55', '?menu=split', 'url', 1, 108, 3, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 33, 34, 0, '*', 0),
(113, 'mainmenu', 'RTL Demos', '2013-01-31-07-09-06', '', '2013-01-31-06-37-23/2013-01-31-06-54-32/2013-01-31-07-09-06', '#', 'url', 1, 106, 3, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 21, 26, 0, '*', 0),
(114, 'mainmenu', 'LTR Language', '2013-01-31-07-09-56', '', '2013-01-31-06-37-23/2013-01-31-06-54-32/2013-01-31-07-09-06/2013-01-31-07-09-56', '?direction=ltr', 'url', 1, 113, 4, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 22, 23, 0, '*', 0),
(115, 'mainmenu', 'RTL Language', '2013-01-31-07-10-29', '', '2013-01-31-06-37-23/2013-01-31-06-54-32/2013-01-31-07-09-06/2013-01-31-07-10-29', '?direction=rtl', 'url', 1, 113, 4, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 24, 25, 0, '*', 0),
(116, 'mainmenu', 'Custom Module', '2013-01-31-07-13-54', '', '2013-01-31-06-37-23/2013-01-31-07-13-54', '#', 'url', 1, 102, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"showmenutitle":"1","desc":"","cols":"1","group":"1","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"modules","mods":["87"]}', 64, 65, 0, '*', 0),
(117, 'mainmenu', 'Presets', '2013-01-31-07-20-51', '', '2013-01-31-07-20-51', '#', 'url', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 91, 98, 0, '*', 0),
(118, 'mainmenu', 'Preset1', '2013-01-31-07-21-59', '', '2013-01-31-07-20-51/2013-01-31-07-21-59', '?preset=preset1', 'url', 1, 117, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 92, 93, 0, '*', 0),
(119, 'mainmenu', 'Menu Example', '2013-01-31-07-23-52', '', '2013-01-31-06-37-23/2013-01-31-07-00-49/2013-01-31-07-23-52', '#', 'url', 1, 108, 3, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"showmenutitle":"1","desc":"","cols":"2","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 35, 62, 0, '*', 0),
(120, 'mainmenu', 'Preset2', '2013-01-31-07-24-34', '', '2013-01-31-07-20-51/2013-01-31-07-24-34', '?preset=preset2', 'url', 1, 117, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 94, 95, 0, '*', 0),
(121, 'mainmenu', 'Preset3', '2013-01-31-07-25-04', '', '2013-01-31-07-20-51/2013-01-31-07-25-04', '?preset=preset3', 'url', 1, 117, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 96, 97, 0, '*', 0),
(123, 'mainmenu', 'Joomla!', 'joomla', '', 'joomla', 'index.php?option=com_content&view=article&id=1', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 99, 112, 0, '*', 0),
(124, 'mainmenu', 'Group2', '2013-01-31-07-29-22', '', '2013-01-31-06-37-23/2013-01-31-07-00-49/2013-01-31-07-23-52/2013-01-31-07-29-22', '#', 'url', 1, 119, 4, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"showmenutitle":"1","desc":"","cols":"1","group":"1","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 44, 61, 0, '*', 0),
(125, 'mainmenu', 'Child Item', '2013-01-31-07-32-05', '', '2013-01-31-06-37-23/2013-01-31-07-00-49/2013-01-31-07-23-52/2013-01-31-07-29-22/2013-01-31-07-32-05', '#', 'url', 1, 124, 5, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 45, 46, 0, '*', 0),
(126, 'mainmenu', 'Child Item', '2013-01-31-07-32-48', '', '2013-01-31-06-37-23/2013-01-31-07-00-49/2013-01-31-07-23-52/2013-01-31-07-29-22/2013-01-31-07-32-48', '#', 'url', 1, 124, 5, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 47, 48, 0, '*', 0),
(127, 'mainmenu', 'Child Item', '2013-01-31-07-33-25', '', '2013-01-31-06-37-23/2013-01-31-07-00-49/2013-01-31-07-23-52/2013-01-31-07-29-22/2013-01-31-07-33-25', '#', 'url', 1, 124, 5, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 49, 60, 0, '*', 0),
(128, 'mainmenu', 'Group1', '2013-01-31-07-34-16', '', '2013-01-31-06-37-23/2013-01-31-07-00-49/2013-01-31-07-23-52/2013-01-31-07-34-16', '#', 'url', 1, 119, 4, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"showmenutitle":"1","desc":"","cols":"1","group":"1","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 36, 43, 0, '*', 0),
(129, 'mainmenu', 'Child Item', '2013-01-31-07-35-10', '', '2013-01-31-06-37-23/2013-01-31-07-00-49/2013-01-31-07-23-52/2013-01-31-07-34-16/2013-01-31-07-35-10', '#', 'url', 1, 128, 5, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"images\\/folder.png","menu_text":1,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 37, 38, 0, '*', 0),
(130, 'mainmenu', 'Child Item', '2013-01-31-07-38-19', '', '2013-01-31-06-37-23/2013-01-31-07-00-49/2013-01-31-07-23-52/2013-01-31-07-34-16/2013-01-31-07-38-19', '#', 'url', 1, 128, 5, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 39, 40, 0, '*', 0),
(131, 'mainmenu', 'Child Item', '2013-01-31-07-38-54', '', '2013-01-31-06-37-23/2013-01-31-07-00-49/2013-01-31-07-23-52/2013-01-31-07-34-16/2013-01-31-07-38-54', '#', 'url', 1, 128, 5, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 41, 42, 0, '*', 0),
(133, 'mainmenu', 'Single Article', 'single-article', '', 'joomla/single-article', 'index.php?option=com_content&view=article&id=1', 'component', 1, 123, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 102, 103, 0, '*', 0),
(132, 'mainmenu', 'Category Blog', 'category-blog', '', 'joomla/category-blog', 'index.php?option=com_content&view=category&layout=blog&id=8', 'component', 1, 123, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"layout_type":"blog","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","page_subheading":"","num_leading_articles":"","num_intro_articles":"","num_columns":"","num_links":"","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 100, 101, 0, '*', 0),
(139, 'mainmenu', 'Contact', 'contact', '', 'joomla/contact', 'index.php?option=com_contact&view=contact&id=1', 'component', 1, 123, 2, 8, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"presentation_style":"","show_contact_category":"","show_contact_list":"","show_name":"","show_position":"","show_email":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","show_links":"","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 104, 105, 0, '*', 0),
(134, 'mainmenu', 'Child Item', '2013-01-31-07-41-53', '', '2013-01-31-06-37-23/2013-01-31-07-00-49/2013-01-31-07-23-52/2013-01-31-07-29-22/2013-01-31-07-33-25/2013-01-31-07-41-53', '#', 'url', 1, 127, 6, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 50, 51, 0, '*', 0),
(135, 'mainmenu', 'Child Item', '2013-01-31-07-42-32', '', '2013-01-31-06-37-23/2013-01-31-07-00-49/2013-01-31-07-23-52/2013-01-31-07-29-22/2013-01-31-07-33-25/2013-01-31-07-42-32', '#', 'url', 1, 127, 6, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 52, 53, 0, '*', 0),
(136, 'mainmenu', 'Child Item', '2013-01-31-07-42-56', '', '2013-01-31-06-37-23/2013-01-31-07-00-49/2013-01-31-07-23-52/2013-01-31-07-29-22/2013-01-31-07-33-25/2013-01-31-07-42-56', '#', 'url', 1, 127, 6, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 54, 59, 0, '*', 0),
(138, 'mainmenu', 'Child Item', '2013-01-31-07-44-11', '', '2013-01-31-06-37-23/2013-01-31-07-00-49/2013-01-31-07-23-52/2013-01-31-07-29-22/2013-01-31-07-33-25/2013-01-31-07-42-56/2013-01-31-07-44-11', '#', 'url', 1, 136, 7, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 57, 58, 0, '*', 0),
(137, 'mainmenu', 'Child Item', '2013-01-31-07-43-43', '', '2013-01-31-06-37-23/2013-01-31-07-00-49/2013-01-31-07-23-52/2013-01-31-07-29-22/2013-01-31-07-33-25/2013-01-31-07-42-56/2013-01-31-07-43-43', '#', 'url', 1, 136, 7, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 55, 56, 0, '*', 0),
(140, 'mainmenu', 'Login', 'login', '', 'joomla/login', 'index.php?option=com_users&view=login', 'component', 1, 123, 2, 25, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"login_redirect_url":"","logindescription_show":"1","login_description":"","login_image":"","logout_redirect_url":"","logoutdescription_show":"1","logout_description":"","logout_image":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 106, 107, 0, '*', 0),
(141, 'mainmenu', 'Registration', 'registration', '', 'joomla/registration', 'index.php?option=com_users&view=registration', 'component', 1, 123, 2, 25, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 108, 109, 0, '*', 0),
(142, 'mainmenu', 'Accordion', 'accordion', '', '2013-01-31-07-00-31/accordion', 'index.php?option=com_content&view=article&id=3', 'component', 1, 107, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 68, 69, 0, '*', 0),
(143, 'mainmenu', 'Carousel', 'carousel', '', '2013-01-31-07-00-31/carousel', 'index.php?option=com_content&view=article&id=4', 'component', 1, 107, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 70, 71, 0, '*', 0),
(144, 'mainmenu', 'Tab', 'tab', '', '2013-01-31-07-00-31/tab', 'index.php?option=com_content&view=article&id=5', 'component', 1, 107, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 72, 73, 0, '*', 0),
(145, 'mainmenu', 'Map', 'map', '', '2013-01-31-07-00-31/map', 'index.php?option=com_content&view=article&id=6', 'component', 1, 107, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 88, 89, 0, '*', 0),
(146, 'mainmenu', 'Testimonial ', 'testimonial', '', '2013-01-31-07-00-31/testimonial', 'index.php?option=com_content&view=article&id=7', 'component', 1, 107, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 86, 87, 0, '*', 0),
(147, 'mainmenu', 'Alert', 'alert', '', '2013-01-31-07-00-31/alert', 'index.php?option=com_content&view=article&id=8', 'component', 1, 107, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 84, 85, 0, '*', 0),
(148, 'mainmenu', 'Button', 'button', '', '2013-01-31-07-00-31/button', 'index.php?option=com_content&view=article&id=9', 'component', 1, 107, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 82, 83, 0, '*', 0),
(149, 'mainmenu', 'Icon', 'icon', '', '2013-01-31-07-00-31/icon', 'index.php?option=com_content&view=article&id=10', 'component', 1, 107, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 74, 75, 0, '*', 0),
(150, 'mainmenu', 'Column', 'column', '', '2013-01-31-07-00-31/column', 'index.php?option=com_content&view=article&id=11', 'component', 1, 107, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 76, 77, 0, '*', 0),
(151, 'top-menu', 'About Us', 'about-us', '', 'about-us', 'index.php?option=com_content&view=article&id=12', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 145, 146, 0, '*', 0),
(152, 'top-menu', 'About Joomla', 'about-joomla', '', 'about-joomla', 'index.php?option=com_content&view=article&id=1', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 147, 148, 0, '*', 0),
(153, 'top-menu', 'Joomla Overview', 'joomla-overview', '', 'joomla-overview', 'index.php?option=com_content&view=article&id=1', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 149, 150, 0, '*', 0),
(154, 'mainmenu', 'Gallery', 'gallery', '', '2013-01-31-07-00-31/gallery', 'index.php?option=com_content&view=article&id=16', 'component', 1, 107, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 78, 79, 0, '*', 0),
(155, 'mainmenu', 'Video', 'video', '', '2013-01-31-07-00-31/video', 'index.php?option=com_content&view=article&id=17', 'component', 1, 107, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 80, 81, 0, '*', 0),
(156, 'mainmenu', '404', '2013-02-06-08-37-59', '', 'joomla/2013-02-06-08-37-59', 'index.php?option=404', 'url', 1, 123, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"showmenutitle":"1","desc":"","cols":"1","group":"0","showgrouptitle":"1","cwidth":"","colxw":"","class":"","subcontent":"normal"}', 110, 111, 0, '*', 0);

-- --------------------------------------------------------

--
-- Table structure for table `#__menu_types`
--

DROP TABLE IF EXISTS `#__menu_types`;
CREATE TABLE IF NOT EXISTS `#__menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `#__menu_types`
--

INSERT INTO `#__menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site'),
(2, 'top-menu', 'Top Menu', '');

-- --------------------------------------------------------

--
-- Table structure for table `#__messages`
--

DROP TABLE IF EXISTS `#__messages`;
CREATE TABLE IF NOT EXISTS `#__messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `#__messages_cfg`
--

DROP TABLE IF EXISTS `#__messages_cfg`;
CREATE TABLE IF NOT EXISTS `#__messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `#__modules`
--

DROP TABLE IF EXISTS `#__modules`;
CREATE TABLE IF NOT EXISTS `#__modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=116 ;

--
-- Dumping data for table `#__modules`
--

INSERT INTO `#__modules` (`id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(2, 'Login', '', '', 1, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '', 1, '*'),
(3, 'Popular Articles', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_popular', 3, 1, '{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(4, 'Recently Added Articles', '', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_latest', 3, 1, '{"count":"5","ordering":"c_dsc","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(8, 'Toolbar', '', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_toolbar', 3, 1, '', 1, '*'),
(9, 'Quick Icons', '', '', 1, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_quickicon', 3, 1, '', 1, '*'),
(10, 'Logged-in Users', '', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_logged', 3, 1, '{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(12, 'Admin Menu', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 3, 1, '{"layout":"","moduleclass_sfx":"","shownew":"1","showhelp":"1","cache":"0"}', 1, '*'),
(13, 'Admin Submenu', '', '', 1, 'submenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_submenu', 3, 1, '', 1, '*'),
(14, 'User Status', '', '', 2, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_status', 3, 1, '', 1, '*'),
(15, 'Title', '', '', 1, 'title', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_title', 3, 1, '', 1, '*'),
(79, 'Multilanguage status', '', '', 1, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_multilangstatus', 3, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(86, 'Joomla Version', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_version', 3, 1, '{"format":"short","product":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(87, 'Menu Module', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Far far away, behind the word mountains, far from the countries.<br />Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.</p>', 0, 'menumodule', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(88, 'Variation Highlighted', 'Module Variation', '<p>Use module class suffix "orange"</p>\r\n<p>Lorem Ipsum is simply dummy text of the printing and <a href="#">typesetting</a> industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley.</p>\r\n<ul>\r\n<li>List Item 1</li>\r\n<li><a href="#">List Item 2</a></li>\r\n<li>List Item 3</li>\r\n</ul>', 1, 'user1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":" highlighted","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(89, 'Variation Green', '', '<p>Lorem Ipsum is simply dummy text of the printing and <a href="#">typesetting</a> industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley.</p>\r\n<ul>\r\n<li>List Item 1</li>\r\n<li><a href="#">List Item 2</a></li>\r\n<li>List Item 3</li>\r\n</ul>', 1, 'user2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":" green","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(90, 'Variation Gray', '', '<p>Lorem Ipsum is simply dummy text of the printing and <a href="#">typesetting</a> industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley.</p>\r\n<ul>\r\n<li>List Item 1</li>\r\n<li><a href="#">List Item 2</a></li>\r\n<li>List Item 3</li>\r\n</ul>', 1, 'user3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":" gray","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(92, 'Variation Orange', '', '<p>Lorem Ipsum is simply dummy text of the printing and <a href="#">typesetting</a> industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley.</p>\r\n<ul>\r\n<li>List Item 1</li>\r\n<li><a href="#">List Item 2</a></li>\r\n<li>List Item 3</li>\r\n</ul>', 1, 'user1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":" orange","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(93, 'Variation Maroon', '', '<p>Lorem Ipsum is simply dummy text of the printing and <a href="#">typesetting</a> industry. Lorem Ipsum has been the industry''s standard printing simply.</p>\r\n<ul>\r\n<li><a href="#">List Item 1</a></li>\r\n<li><a href="#">List Item 2</a></li>\r\n<li><a href="#">List Item 3</a></li>\r\n</ul>', 1, 'user2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":" maroon","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(94, 'Variation Pink', '', '<p>Lorem Ipsum is simply dummy text of the printing and <a href="#">typesetting</a> industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley.</p>\r\n<ul>\r\n<li>List Item 1</li>\r\n<li><a href="#">List Item 2</a></li>\r\n<li>List Item 3</li>\r\n</ul>', 1, 'user3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":" pink","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(96, 'Variation Dark', '', '<p>Lorem Ipsum is simply dummy text of the printing and <a href="#">typesetting</a> industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley.</p>\r\n<ul>\r\n<li>List Item 1</li>\r\n<li><a href="#">List Item 2</a></li>\r\n<li>List Item 3</li>\r\n</ul>', 1, 'user1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":" dark","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(97, 'Variation Blue', '', '<p>Lorem Ipsum is simply dummy text of the printing and <a href="#">typesetting</a> industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley.</p>\r\n<ul>\r\n<li>List Item 1</li>\r\n<li><a href="#">List Item 2</a></li>\r\n<li>List Item 3</li>\r\n</ul>', 1, 'user2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":" blue","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(98, 'Variation Red', '', '<p>Lorem Ipsum is simply dummy text of the printing and <a href="#">typesetting</a> industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley.</p>\r\n<ul>\r\n<li>List Item 1</li>\r\n<li><a href="#">List Item 2</a></li>\r\n<li>List Item 3</li>\r\n</ul>', 1, 'user3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":" red","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(100, 'Front Page Feature', 'Frontpage Slideshow', '<p>[carousel]</p>\r\n<p>[carousel_item]</p>\r\n<h1>Helix Framework</h1>\r\n<p>Powerful templates framework to develop Joomla base website faster!</p>\r\n<p>[button type="primary" size="large" link="http://www.joomshaper.com/helix/"]Download Now[/button] <span style="line-height: 1.3em;">[button type="success" size="large" link="http://demo.joomshaper.com/?template=helix_ii"]Live Demo[/button]</span><span style="line-height: 1.3em;"> </span></p>\r\n<p>[/carousel_item]</p>\r\n<p>[carousel_item]</p>\r\n<h1>Layout Builder</h1>\r\n<p>JoomShaper brings Layout Builder first time in Joomla! It is one of the unique features introduced in Helix – II which allows anyone to customize the existing theme in any shape or dimensions without having any programming language!</p>\r\n<p>[/carousel_item]</p>\r\n<p>[carousel_item]</p>\r\n<h1>Useful Shortcodes</h1>\r\n<p>In Helix - II you can see many useful Shortcodes installed. Now you can add lots of extra features on your website, without having any coding knowledge.</p>\r\n<p>[/carousel_item]</p>\r\n<p><span style="line-height: 1.3em;">[/carousel]</span></p>', 1, 'feature', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(101, 'Search', '', '', 1, 'search', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_search', 1, 0, '{"label":"","width":"20","text":"","button":"1","button_pos":"right","imagebutton":"","button_text":"","opensearch":"1","opensearch_title":"","set_itemid":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(102, 'The Framework', '', '<p>[icon name="cog" size="64" color="#fff" class="pull-left" /]<span style="line-height: 1.3em;">The Helix Framework is one of the best light and feature rich responsive theme framework developed by JoomShaper, your trusted friend in this world, for an easy accessibility to the way of building Joomla and Wordpress based websites with hundreds of easy tasking features.</span></p>\r\n<p><span style="line-height: 1.3em;">It is so easy to develop and control of Joomla &amp; Wordpress templates for you and your clients. Helix framework will make your experience of creating website much smoother than ever before.</span></p>\r\n<p><span style="line-height: 1.3em;">[button type="primary" size="large" link="http://www.joomshaper.com/helix"][icon name="download-alt" /] Download Now[/button]</span></p>', 1, 'right', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":" highlighted","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(103, 'Important Links', '', '<p>[row][col class="span6"]</p>\r\n<ul class="arrow">\r\n<li><a href="#">Powerful Layout Builder</a></li>\r\n<li><a href="#">Useful shortcodes</a></li>\r\n<li><a href="#">Easy Admin</a></li>\r\n<li><a href="#">Awesome Mega Menu</a></li>\r\n<li><a href="#">Fully Responsive</a></li>\r\n<li><a href="#">Built with LESS</a></li>\r\n<li><a href="#">HTML5 base template</a></li>\r\n<li><a href="#">Unlimited Module positions</a></li>\r\n</ul>\r\n<p>[/col] [col class="span6"]</p>\r\n<ul class="arrow">\r\n<li><a href="#">Powerful Layout Builder</a></li>\r\n<li><a href="#">Useful shortcodes</a></li>\r\n<li><a href="#">Easy Admin</a></li>\r\n<li><a href="#">Awesome Mega Menu</a></li>\r\n<li><a href="#">Fully Responsive</a></li>\r\n<li><a href="#">Built with LESS</a></li>\r\n<li><a href="#">HTML5 base template</a></li>\r\n<li><a href="#">Unlimited Module positions</a></li>\r\n</ul>\r\n<p>[/col][/row]</p>', 1, 'bottom3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(104, 'Gallery', '', '<p>[gallery]</p>\r\n<p>[gallery_item src="images/helix/gallery/img01.png" /]</p>\r\n<p>[gallery_item src="images/helix/gallery/img02.png" /]</p>\r\n<p>[gallery_item src="images/helix/gallery/img03.png" /]</p>\r\n<p>[gallery_item src="images/helix/gallery/img04.png" /]</p>\r\n<p>[gallery_item src="images/helix/gallery/img05.png" /]</p>\r\n<p>[gallery_item src="images/helix/gallery/img06.png" /]</p>\r\n<p>[/gallery]</p>', 1, 'bottom1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(105, 'About Us', '', '<p>We are one of the leading Premium Joomla and WordPress template provider serving more than 40 thousands happy clients worldwide with having more 45 joomla templates.</p>\r\n<p><strong>Connet With Us</strong></p>\r\n<p><span style="line-height: 1.3em;">[button type="link social facebook" link="http://www.facebook.com/joomshaper"][icon name="facebook" /][/button] [button type="link social twitter" link="http://twitter.com/joomshaper"][icon name="twitter" /][/button] [button type="link social pinterest" link="http://pinterest.com/joomshaper"][icon name="pinterest" /][/button] [button type="link social gplus" link="https://plus.google.com/106333042920846200705?prsrc=2"][icon name="google-plus" /][/button]</span></p>', 1, 'bottom2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(107, 'Footer Menu', '', '', 1, 'footer2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 0, '{"menutype":"top-menu","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(111, 'User1', 'User 1 - Layout Builder', '<p>[icon name=''columns'' class="pull-left" size=''48'']</p>\r\n<h4>Layout Builder</h4>\r\n<p>Helix Framework comes with unique layout builder which ensures web development and easier and faster.</p>', 1, 'user1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(112, 'User4', '', '<p>[icon name=''coffee'' size=''48'' class=''pull-left'']</p>\r\n<h4>Built with Less</h4>\r\n<p>Reduce your development time by coding css using less that supported by latest Helix Framework.</p>', 1, 'user4', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(113, 'User3', '', '<p>[icon name=''book'' class=''pull-left'' size=''48'']</p>\r\n<h4>Shortcode</h4>\r\n<p>Anybody can add extra features by using builtin shortcode libraries without having the coding knowledge.</p>', 1, 'user3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(114, 'User2', 'Responsive Layout', '<p>[icon name=''desktop'' class="pull-left" size=''48'']</p>\r\n<h4>Responsive Layout</h4>\r\n<p>Bootstrap powered responsive layout ensures your website best visible in all devices<span style="line-height: 1.3em;">.</span></p>', 1, 'user2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*');

-- --------------------------------------------------------

--
-- Table structure for table `#__modules_menu`
--

DROP TABLE IF EXISTS `#__modules_menu`;
CREATE TABLE IF NOT EXISTS `#__modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__modules_menu`
--

INSERT INTO `#__modules_menu` (`moduleid`, `menuid`) VALUES
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(79, 0),
(86, 0),
(87, 0),
(88, 105),
(89, 105),
(90, 105),
(92, 105),
(93, 105),
(94, 105),
(96, 105),
(97, 105),
(98, 105),
(100, 101),
(101, 0),
(102, 101),
(102, 104),
(103, 0),
(104, 0),
(105, 0),
(107, 0),
(111, 101),
(112, 101),
(113, 101),
(114, 101);

-- --------------------------------------------------------

--
-- Table structure for table `#__newsfeeds`
--

DROP TABLE IF EXISTS `#__newsfeeds`;
CREATE TABLE IF NOT EXISTS `#__newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `filename` varchar(200) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `#__overrider`
--

DROP TABLE IF EXISTS `#__overrider`;
CREATE TABLE IF NOT EXISTS `#__overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) NOT NULL,
  `string` text NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `#__schemas`
--

DROP TABLE IF EXISTS `#__schemas`;
CREATE TABLE IF NOT EXISTS `#__schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__schemas`
--

INSERT INTO `#__schemas` (`extension_id`, `version_id`) VALUES
(700, '2.5.16');

-- --------------------------------------------------------

--
-- Table structure for table `#__template_styles`
--

DROP TABLE IF EXISTS `#__template_styles`;
CREATE TABLE IF NOT EXISTS `#__template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `#__template_styles`
--

INSERT INTO `#__template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES
(2, 'bluestork', 1, '1', 'Bluestork - Default', '{"useRoundedCorners":"1","showSiteName":"0"}'),
(3, 'atomic', 0, '0', 'Atomic - Default', '{}'),
(4, 'beez_20', 0, '0', 'Beez2 - Default', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/joomla_black.gif","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","templatecolor":"personal","html5":"0"}'),
(5, 'hathor', 1, '0', 'Hathor - Default', '{"showSiteName":"0","colourChoice":"","boldText":"0"}'),
(6, 'beez5', 0, '0', 'Beez5 - Default', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/sampledata\\/fruitshop\\/fruits.gif","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","html5":"0"}'),
(7, 'shaper_helix_ii', 0, '1', 'shaper_helix_ii - Default', '{"layout_width":"1170","layout_type":"responsive","logo_type":"image","logo_position":"logo","logo_type_image":"","logo_type_text":"Helix","logo_type_slogan":"Joomla! Templates Framework","logo_width":"130","logo_height":"50","footer_position":"footer1","showcp":"1","copyright":"Copyright \\u00a9  {year} Shaper Helix - II Demo. All Rights Reserved.","show_helix_logo":"1","jcredit":"1","credit_link":"1","credit_text":"Designed by {JoomShaper}","validator":"0","showtop":"1","totop_position":"footer2","preset":"preset1","preset1_header":"rgb(248, 248, 248)","preset1_bg":"#f2f2f2","preset1_text":"rgb(102, 102, 102)","preset1_link":"rgb(34, 184, 240)","preset2_header":"rgb(238, 238, 238)","preset2_bg":"rgb(245, 245, 245)","preset2_text":"#444","preset2_link":"rgb(109, 127, 27)","preset3_header":"#e5ddd5","preset3_bg":"#f2f2f2","preset3_text":"#333","preset3_link":"#aa824a","layout":[{"name":"Header","class":"container","responsive":"","backgroundcolor":"rgba(255, 255, 255, 0)","textcolor":"rgba(255, 255, 255, 0)","linkcolor":"rgba(255, 255, 255, 0)","linkhovercolor":"rgba(255, 255, 255, 0)","margin":"","padding":"20px 0","children":[{"span":"3","offset":"","type":"modules","position":"logo","style":"none","customclass":"","responsiveclass":""},{"span":"6","offset":"","type":"modules","position":"menu","style":"none","customclass":"","responsiveclass":""},{"span":"3","offset":"","type":"modules","position":"search","style":"sp_xhtml","customclass":"","responsiveclass":""}]},{"name":"Feature","class":"container","responsive":"hidden-phone hidden-tablet","backgroundcolor":"rgba(255, 255, 255, 0)","textcolor":"rgba(255, 255, 255, 0)","linkcolor":"rgba(255, 255, 255, 0)","linkhovercolor":"rgba(255, 255, 255, 0)","margin":"","padding":"80px 0","children":[{"span":"12","offset":"","type":"modules","position":"feature","style":"none","customclass":"","responsiveclass":""}]},{"name":"Users","class":"container","responsive":"","backgroundcolor":"rgba(255, 255, 255, 0)","textcolor":"rgba(255, 255, 255, 0)","linkcolor":"rgba(255, 255, 255, 0)","linkhovercolor":"rgba(255, 255, 255, 0)","margin":"","padding":"30px 0","children":[{"span":"3","offset":"","type":"modules","position":"user1","style":"sp_xhtml","customclass":"","responsiveclass":""},{"span":"3","offset":"","type":"modules","position":"user2","style":"sp_xhtml","customclass":"","responsiveclass":""},{"span":"3","offset":"","type":"modules","position":"user3","style":"sp_xhtml","customclass":"","responsiveclass":""},{"span":"3","offset":"","type":"modules","position":"user4","style":"sp_xhtml","customclass":"","responsiveclass":""}]},{"name":"Main Body","class":"container","responsive":"","backgroundcolor":"rgba(255, 255, 255, 0)","textcolor":"rgba(255, 255, 255, 0)","linkcolor":"rgba(255, 255, 255, 0)","linkhovercolor":"rgba(255, 255, 255, 0)","margin":"","padding":"30px 0","children":[{"span":"3","offset":"","type":"modules","position":"left","style":"sp_xhtml","customclass":"","responsiveclass":""},{"span":"6","offset":"","type":"message","position":"","style":"xhtml","customclass":"","responsiveclass":"","children":[{"name":"Content Area","class":"","responsive":"","backgroundcolor":"rgba(255, 255, 255, 0)","textcolor":"rgba(255, 255, 255, 0)","linkcolor":"rgba(255, 255, 255, 0)","linkhovercolor":"rgba(255, 255, 255, 0)","margin":"","padding":"","children":[{"span":"12","offset":"","type":"component","position":"","style":"xhtml","customclass":"","responsiveclass":""}]}]},{"span":"3","offset":"","type":"modules","position":"right","style":"sp_xhtml","customclass":"","responsiveclass":""}]},{"name":"Breadcrumb","class":"container","responsive":"","backgroundcolor":"rgba(255, 255, 255, 0)","textcolor":"rgba(255, 255, 255, 0)","linkcolor":"rgba(255, 255, 255, 0)","linkhovercolor":"rgba(255, 255, 255, 0)","margin":"","padding":"","children":[{"span":"12","offset":"","type":"modules","position":"breadcrumb","style":"none","customclass":"","responsiveclass":""}]},{"name":"Bottom","class":"container","responsive":"","backgroundcolor":"rgba(255, 255, 255, 0)","textcolor":"rgba(255, 255, 255, 0)","linkcolor":"rgba(255, 255, 255, 0)","linkhovercolor":"rgba(255, 255, 255, 0)","margin":"","padding":"40px 0","children":[{"span":"3","offset":"","type":"modules","position":"bottom1","style":"xhtml","customclass":"","responsiveclass":""},{"span":"3","offset":"","type":"modules","position":"bottom2","style":"xhtml","customclass":"","responsiveclass":""},{"span":"3","offset":"","type":"modules","position":"bottom3","style":"xhtml","customclass":"","responsiveclass":""},{"span":"3","offset":"","type":"modules","position":"bottom4","style":"sp_xhtml","customclass":"","responsiveclass":""}]},{"name":"Footer","class":"container","responsive":"","backgroundcolor":"rgba(255, 255, 255, 0)","textcolor":"rgba(255, 255, 255, 0)","linkcolor":"rgba(255, 255, 255, 0)","linkhovercolor":"rgba(255, 255, 255, 0)","margin":"","padding":"30px 0","children":[{"span":"7","offset":"","type":"modules","position":"footer1","style":"none","customclass":"","responsiveclass":""},{"span":"5","offset":"","type":"modules","position":"footer2","style":"none","customclass":"","responsiveclass":""}]}],"menu":"mainmenu","menutype":"mega","menu_col_width":"200","show_menu_image":"1","menu_image_position":"1","submenu_position":"0","init_x":"0","init_y":"0","sub_x":"0","sub_y":"0","body_font":"","body_selectors":"","header_font":"","header_selectors":"","other_font":"","other_selectors":"","cache_time":"60","compress_css":"0","compress_js":"0","enable_ga":"0","ga_code":"","loadjquery":"0","loadfromcdn":"0","lessoption":"1","hide_component_area":"0"}');

-- --------------------------------------------------------

--
-- Table structure for table `#__updates`
--

DROP TABLE IF EXISTS `#__updates`;
CREATE TABLE IF NOT EXISTS `#__updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `categoryid` int(11) DEFAULT '0',
  `name` varchar(100) DEFAULT '',
  `description` text NOT NULL,
  `element` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `folder` varchar(20) DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(10) DEFAULT '',
  `data` text NOT NULL,
  `detailsurl` text NOT NULL,
  `infourl` text NOT NULL,
  PRIMARY KEY (`update_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Available Updates' AUTO_INCREMENT=234 ;

--
-- Dumping data for table `#__updates`
--

INSERT INTO `#__updates` (`update_id`, `update_site_id`, `extension_id`, `categoryid`, `name`, `description`, `element`, `type`, `folder`, `client_id`, `version`, `data`, `detailsurl`, `infourl`) VALUES
(1, 3, 0, 0, 'Armenian', '', 'pkg_hy-AM', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/hy-AM_details.xml', ''),
(2, 3, 0, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/da-DK_details.xml', ''),
(3, 3, 0, 0, 'Khmer', '', 'pkg_km-KH', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/km-KH_details.xml', ''),
(4, 3, 0, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/sv-SE_details.xml', ''),
(5, 3, 0, 0, 'Hungarian', '', 'pkg_hu-HU', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/hu-HU_details.xml', ''),
(6, 3, 0, 0, 'Bulgarian', '', 'pkg_bg-BG', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/bg-BG_details.xml', ''),
(7, 3, 0, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', ''),
(8, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.8.2', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(9, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(10, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(11, 3, 0, 0, 'Turkish', '', 'pkg_tr-TR', 'package', '', 0, '2.5.7.2', '', 'http://update.joomla.org/language/details/tr-TR_details.xml', ''),
(12, 3, 0, 0, 'Ukrainian', '', 'pkg_uk-UA', 'package', '', 0, '2.5.7.2', '', 'http://update.joomla.org/language/details/uk-UA_details.xml', ''),
(13, 3, 0, 0, 'Indonesian', '', 'pkg_id-ID', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/id-ID_details.xml', ''),
(14, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(15, 3, 0, 0, 'Belarusian', '', 'pkg_be-BY', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/be-BY_details.xml', ''),
(16, 3, 0, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/lv-LV_details.xml', ''),
(17, 3, 0, 0, 'Estonian', '', 'pkg_et-EE', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/et-EE_details.xml', ''),
(18, 3, 0, 0, 'Romanian', '', 'pkg_ro-RO', 'package', '', 0, '2.5.5.3', '', 'http://update.joomla.org/language/details/ro-RO_details.xml', ''),
(19, 3, 0, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/nl-BE_details.xml', ''),
(20, 3, 0, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/mk-MK_details.xml', ''),
(21, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(22, 3, 0, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/sr-YU_details.xml', ''),
(23, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(24, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.8.2', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(25, 3, 0, 0, 'Norwegian Bokmal', '', 'pkg_nb-NO', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/nb-NO_details.xml', ''),
(26, 3, 0, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/en-AU_details.xml', ''),
(27, 3, 0, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/en-US_details.xml', ''),
(28, 3, 0, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/sr-RS_details.xml', ''),
(29, 3, 0, 0, 'Lithuanian', '', 'pkg_lt-LT', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/lt-LT_details.xml', ''),
(30, 3, 0, 0, 'Albanian', '', 'pkg_sq-AL', 'package', '', 0, '2.5.1.5', '', 'http://update.joomla.org/language/details/sq-AL_details.xml', ''),
(31, 3, 0, 0, 'Persian', '', 'pkg_fa-IR', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/fa-IR_details.xml', ''),
(32, 3, 0, 0, 'Galician', '', 'pkg_gl-ES', 'package', '', 0, '2.5.7.4', '', 'http://update.joomla.org/language/details/gl-ES_details.xml', ''),
(33, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(34, 3, 0, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/sy-IQ_details.xml', ''),
(35, 3, 0, 0, 'Portuguese', '', 'pkg_pt-PT', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/pt-PT_details.xml', ''),
(36, 3, 0, 0, 'Russian', '', 'pkg_ru-RU', 'package', '', 0, '2.5.8.4', '', 'http://update.joomla.org/language/details/ru-RU_details.xml', ''),
(37, 3, 0, 0, 'Hebrew', '', 'pkg_he-IL', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/he-IL_details.xml', ''),
(38, 3, 0, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/ca-ES_details.xml', ''),
(39, 3, 0, 0, 'Laotian', '', 'pkg_lo-LA', 'package', '', 0, '2.5.6.1', '', 'http://update.joomla.org/language/details/lo-LA_details.xml', ''),
(40, 3, 0, 0, 'Afrikaans', '', 'pkg_af-ZA', 'package', '', 0, '2.5.6.2', '', 'http://update.joomla.org/language/details/af-ZA_details.xml', ''),
(41, 3, 0, 0, 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/zh-CN_details.xml', ''),
(42, 3, 0, 0, 'Greek', '', 'pkg_el-GR', 'package', '', 0, '2.5.6.1', '', 'http://update.joomla.org/language/details/el-GR_details.xml', ''),
(43, 3, 0, 0, 'Esperanto', '', 'pkg_eo-XX', 'package', '', 0, '2.5.6.1', '', 'http://update.joomla.org/language/details/eo-XX_details.xml', ''),
(44, 3, 0, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '2.5.8.2', '', 'http://update.joomla.org/language/details/fi-FI_details.xml', ''),
(45, 3, 0, 0, 'Portuguese Brazil', '', 'pkg_pt-BR', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/pt-BR_details.xml', ''),
(46, 3, 0, 0, 'Chinese Traditional', '', 'pkg_zh-TW', 'package', '', 0, '2.5.7.2', '', 'http://update.joomla.org/language/details/zh-TW_details.xml', ''),
(47, 3, 0, 0, 'Vietnamese', '', 'pkg_vi-VN', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/vi-VN_details.xml', ''),
(48, 3, 0, 0, 'Kurdish Sorani', '', 'pkg_ckb-IQ', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/ckb-IQ_details.xml', ''),
(49, 3, 0, 0, 'Bosnian', '', 'pkg_bs-BA', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/bs-BA_details.xml', ''),
(50, 3, 0, 0, 'Croatian', '', 'pkg_hr-HR', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/hr-HR_details.xml', ''),
(51, 3, 0, 0, 'Azeri', '', 'pkg_az-AZ', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/az-AZ_details.xml', ''),
(52, 3, 0, 0, 'Norwegian Nynorsk', '', 'pkg_nn-NO', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/nn-NO_details.xml', ''),
(53, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(54, 3, 0, 0, 'Scottish Gaelic', '', 'pkg_gd-GB', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/gd-GB_details.xml', ''),
(55, 3, 0, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/th-TH_details.xml', ''),
(56, 3, 0, 0, 'Basque', '', 'pkg_eu-ES', 'package', '', 0, '1.7.0.1', '', 'http://update.joomla.org/language/details/eu-ES_details.xml', ''),
(57, 3, 0, 0, 'Uyghur', '', 'pkg_ug-CN', 'package', '', 0, '2.5.7.2', '', 'http://update.joomla.org/language/details/ug-CN_details.xml', ''),
(58, 3, 0, 0, 'Korean', '', 'pkg_ko-KR', 'package', '', 0, '2.5.7.2', '', 'http://update.joomla.org/language/details/ko-KR_details.xml', ''),
(59, 3, 0, 0, 'Hindi', '', 'pkg_hi-IN', 'package', '', 0, '2.5.6.1', '', 'http://update.joomla.org/language/details/hi-IN_details.xml', ''),
(60, 3, 0, 0, 'Welsh', '', 'pkg_cy-GB', 'package', '', 0, '2.5.6.1', '', 'http://update.joomla.org/language/details/cy-GB_details.xml', ''),
(61, 3, 0, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '2.5.8.3', '', 'http://update.joomla.org/language/details/sw-KE_details.xml', ''),
(108, 3, 0, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/sv-SE_details.xml', ''),
(63, 3, 0, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/sv-SE_details.xml', ''),
(64, 3, 0, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', ''),
(65, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(66, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(67, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(68, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(69, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(70, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(71, 3, 0, 0, 'Norwegian Bokmal', '', 'pkg_nb-NO', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/nb-NO_details.xml', ''),
(72, 3, 0, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/en-AU_details.xml', ''),
(73, 3, 0, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/en-US_details.xml', ''),
(74, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(75, 3, 0, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/fi-FI_details.xml', ''),
(76, 3, 0, 0, 'Portuguese Brazil', '', 'pkg_pt-BR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/pt-BR_details.xml', ''),
(77, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(78, 3, 0, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/sv-SE_details.xml', ''),
(79, 3, 0, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', ''),
(80, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(81, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(82, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(83, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(84, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(85, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(86, 3, 0, 0, 'Norwegian Bokmal', '', 'pkg_nb-NO', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/nb-NO_details.xml', ''),
(87, 3, 0, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/en-AU_details.xml', ''),
(88, 3, 0, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/en-US_details.xml', ''),
(89, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(90, 3, 0, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/fi-FI_details.xml', ''),
(91, 3, 0, 0, 'Portuguese Brazil', '', 'pkg_pt-BR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/pt-BR_details.xml', ''),
(92, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(93, 3, 0, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/sv-SE_details.xml', ''),
(94, 3, 0, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', ''),
(95, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(96, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(97, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(98, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(99, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(100, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(101, 3, 0, 0, 'Norwegian Bokmal', '', 'pkg_nb-NO', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/nb-NO_details.xml', ''),
(102, 3, 0, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/en-AU_details.xml', ''),
(103, 3, 0, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/en-US_details.xml', ''),
(104, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(105, 3, 0, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/fi-FI_details.xml', ''),
(106, 3, 0, 0, 'Portuguese Brazil', '', 'pkg_pt-BR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/pt-BR_details.xml', ''),
(107, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(109, 3, 0, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', ''),
(110, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(111, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(112, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(113, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(114, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(115, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(116, 3, 0, 0, 'Norwegian Bokmal', '', 'pkg_nb-NO', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/nb-NO_details.xml', ''),
(117, 3, 0, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/en-AU_details.xml', ''),
(118, 3, 0, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/en-US_details.xml', ''),
(119, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(120, 3, 0, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/fi-FI_details.xml', ''),
(121, 3, 0, 0, 'Portuguese Brazil', '', 'pkg_pt-BR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/pt-BR_details.xml', ''),
(122, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(123, 3, 0, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/sv-SE_details.xml', ''),
(124, 3, 0, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', ''),
(125, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(126, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(127, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(128, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(129, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(130, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(131, 3, 0, 0, 'Norwegian Bokmal', '', 'pkg_nb-NO', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/nb-NO_details.xml', ''),
(132, 3, 0, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/en-AU_details.xml', ''),
(133, 3, 0, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/en-US_details.xml', ''),
(134, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(135, 3, 0, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/fi-FI_details.xml', ''),
(136, 3, 0, 0, 'Portuguese Brazil', '', 'pkg_pt-BR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/pt-BR_details.xml', ''),
(137, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(138, 3, 0, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/sv-SE_details.xml', ''),
(139, 3, 0, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', ''),
(140, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(141, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(142, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(143, 3, 0, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/nl-BE_details.xml', ''),
(144, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(145, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(146, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(147, 3, 0, 0, 'Norwegian Bokmal', '', 'pkg_nb-NO', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/nb-NO_details.xml', ''),
(148, 3, 0, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/en-AU_details.xml', ''),
(149, 3, 0, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/en-US_details.xml', ''),
(150, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(151, 3, 0, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/fi-FI_details.xml', ''),
(152, 3, 0, 0, 'Portuguese Brazil', '', 'pkg_pt-BR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/pt-BR_details.xml', ''),
(153, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(154, 3, 0, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/sv-SE_details.xml', ''),
(155, 3, 0, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', ''),
(156, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(157, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(158, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(159, 3, 0, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/nl-BE_details.xml', ''),
(160, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(161, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(162, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(163, 3, 0, 0, 'Norwegian Bokmal', '', 'pkg_nb-NO', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/nb-NO_details.xml', ''),
(164, 3, 0, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/en-AU_details.xml', ''),
(165, 3, 0, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/en-US_details.xml', ''),
(166, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(167, 3, 0, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/fi-FI_details.xml', ''),
(168, 3, 0, 0, 'Portuguese Brazil', '', 'pkg_pt-BR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/pt-BR_details.xml', ''),
(169, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(170, 3, 0, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/sv-SE_details.xml', ''),
(171, 3, 0, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', ''),
(172, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(173, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(174, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(175, 3, 0, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/nl-BE_details.xml', ''),
(176, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(177, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(178, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(179, 3, 0, 0, 'Norwegian Bokmal', '', 'pkg_nb-NO', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/nb-NO_details.xml', ''),
(180, 3, 0, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/en-AU_details.xml', ''),
(181, 3, 0, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/en-US_details.xml', ''),
(182, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(183, 3, 0, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/fi-FI_details.xml', ''),
(184, 3, 0, 0, 'Portuguese Brazil', '', 'pkg_pt-BR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/pt-BR_details.xml', ''),
(185, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(186, 3, 0, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/sv-SE_details.xml', ''),
(187, 3, 0, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', ''),
(188, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(189, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(190, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(191, 3, 0, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/nl-BE_details.xml', ''),
(192, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(193, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(194, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(195, 3, 0, 0, 'Norwegian Bokmal', '', 'pkg_nb-NO', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/nb-NO_details.xml', ''),
(196, 3, 0, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/en-AU_details.xml', ''),
(197, 3, 0, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/en-US_details.xml', ''),
(198, 3, 0, 0, 'Persian', '', 'pkg_fa-IR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/fa-IR_details.xml', ''),
(199, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(200, 3, 0, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/sv-SE_details.xml', ''),
(201, 3, 0, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/fi-FI_details.xml', ''),
(202, 3, 0, 0, 'Portuguese Brazil', '', 'pkg_pt-BR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/pt-BR_details.xml', ''),
(203, 3, 0, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', ''),
(204, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(205, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(206, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(207, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(208, 3, 0, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/nl-BE_details.xml', ''),
(209, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(210, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(211, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(212, 3, 0, 0, 'Norwegian Bokmal', '', 'pkg_nb-NO', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/nb-NO_details.xml', ''),
(213, 3, 0, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/en-AU_details.xml', ''),
(214, 3, 0, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/en-US_details.xml', ''),
(215, 3, 0, 0, 'Persian', '', 'pkg_fa-IR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/fa-IR_details.xml', ''),
(216, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(217, 3, 0, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/fi-FI_details.xml', ''),
(218, 3, 0, 0, 'Portuguese Brazil', '', 'pkg_pt-BR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/pt-BR_details.xml', ''),
(219, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(221, 5, 0, 0, 'System - Helix Framework', '', 'helix', 'plugin', 'system', 0, '2.1.0', '', 'http://www.joomshaper.com/updates/plg_system_helix.xml', ''),
(222, 5, 0, 0, 'System - Helix Framework', '', 'helix', 'plugin', 'system', 0, '2.1.0', '', 'http://www.joomshaper.com/updates/plg_system_helix.xml', ''),
(223, 5, 0, 0, 'System - Helix Framework', '', 'helix', 'plugin', 'system', 0, '2.1.1', '', 'http://www.joomshaper.com/updates/plg_system_helix.xml', ''),
(224, 5, 0, 0, 'System - Helix Framework', '', 'helix', 'plugin', 'system', 0, '2.1.1', '', 'http://www.joomshaper.com/updates/plg_system_helix.xml', ''),
(225, 5, 0, 0, 'System - Helix Framework', '', 'helix', 'plugin', 'system', 0, '2.1.1', '', 'http://www.joomshaper.com/updates/plg_system_helix.xml', ''),
(226, 5, 0, 0, 'System - Helix Framework', '', 'helix', 'plugin', 'system', 0, '2.1.1', '', 'http://www.joomshaper.com/updates/plg_system_helix.xml', ''),
(227, 5, 0, 0, 'System - Helix Framework', '', 'helix', 'plugin', 'system', 0, '2.1.1', '', 'http://www.joomshaper.com/updates/plg_system_helix.xml', ''),
(228, 5, 0, 0, 'System - Helix Framework', '', 'helix', 'plugin', 'system', 0, '2.1.1', '', 'http://www.joomshaper.com/updates/plg_system_helix.xml', ''),
(229, 5, 0, 0, 'System - Helix Framework', '', 'helix', 'plugin', 'system', 0, '2.1.1', '', 'http://www.joomshaper.com/updates/plg_system_helix.xml', ''),
(230, 5, 0, 0, 'System - Helix Framework', '', 'helix', 'plugin', 'system', 0, '2.1.1', '', 'http://www.joomshaper.com/updates/plg_system_helix.xml', ''),
(231, 5, 0, 0, 'System - Helix Framework', '', 'helix', 'plugin', 'system', 0, '2.1.3', '', 'http://www.joomshaper.com/updates/plg_system_helix.xml', ''),
(232, 5, 0, 0, 'System - Helix Framework', '', 'helix', 'plugin', 'system', 0, '2.1.3', '', 'http://www.joomshaper.com/updates/plg_system_helix.xml', ''),
(233, 5, 0, 0, 'System - Helix Framework', '', 'helix', 'plugin', 'system', 0, '2.1.3', '', 'http://www.joomshaper.com/updates/plg_system_helix.xml', '');

-- --------------------------------------------------------

--
-- Table structure for table `#__update_categories`
--

DROP TABLE IF EXISTS `#__update_categories`;
CREATE TABLE IF NOT EXISTS `#__update_categories` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT '',
  `description` text NOT NULL,
  `parent` int(11) DEFAULT '0',
  `updatesite` int(11) DEFAULT '0',
  PRIMARY KEY (`categoryid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Update Categories' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `#__update_sites`
--

DROP TABLE IF EXISTS `#__update_sites`;
CREATE TABLE IF NOT EXISTS `#__update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` text NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  PRIMARY KEY (`update_site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Update Sites' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `#__update_sites`
--

INSERT INTO `#__update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`) VALUES
(1, 'Joomla Core', 'collection', 'http://update.joomla.org/core/list.xml', 0, 1360518000),
(2, 'Joomla Extension Directory', 'collection', 'http://update.joomla.org/jed/list.xml', 0, 1360517998),
(3, 'Accredited Joomla! Translations', 'collection', 'http://update.joomla.org/language/translationlist.xml', 0, 1360517998),
(4, 'System - Helix Framework', 'plugin', 'http://joomshaper.com/updates/plg_system_helix.xml', 1, 0),
(5, 'System - Helix Framework', 'extension', 'http://www.joomshaper.com/updates/plg_system_helix.xml', 1, 1384413481);

-- --------------------------------------------------------

--
-- Table structure for table `#__update_sites_extensions`
--

DROP TABLE IF EXISTS `#__update_sites_extensions`;
CREATE TABLE IF NOT EXISTS `#__update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links extensions to update sites';

--
-- Dumping data for table `#__update_sites_extensions`
--

INSERT INTO `#__update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1, 700),
(2, 700),
(3, 600),
(4, 10000),
(5, 10000);

-- --------------------------------------------------------

--
-- Table structure for table `#__usergroups`
--

DROP TABLE IF EXISTS `#__usergroups`;
CREATE TABLE IF NOT EXISTS `#__usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `#__usergroups`
--

INSERT INTO `#__usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 20, 'Public'),
(2, 1, 6, 17, 'Registered'),
(3, 2, 7, 14, 'Author'),
(4, 3, 8, 11, 'Editor'),
(5, 4, 9, 10, 'Publisher'),
(6, 1, 2, 5, 'Manager'),
(7, 6, 3, 4, 'Administrator'),
(8, 1, 18, 19, 'Super Users');

-- --------------------------------------------------------

--
-- Table structure for table `#__weblinks`
--

DROP TABLE IF EXISTS `#__weblinks`;
CREATE TABLE IF NOT EXISTS `#__weblinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `access` int(11) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `language` char(7) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if link is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


