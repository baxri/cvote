-- @version 		$Id:$
-- @name			Cars In Georgia (Release 1.0.0)
-- @author			Giorgi Bibilashvili ()
-- @package			com_geocars
-- @subpackage		com_geocars.admin
-- @copyright		
-- @license			GNU General Public License version 3 or later - See http://www.gnu.org/copyleft/gpl.html 
--
-- The following Component Architect header section must remain in any distribution of this file
--
-- @CAversion		Id:install.architectcomp_mysql.utf8.sql 19 2012-01-12 16:33:49Z BrianWade $
-- @CAauthor		Component Architect (www.componentarchitect.com)
-- @CApackage		architectcomp
-- @CAsubpackage	architectcomp.admin
-- @CAtemplate		joomla_2_5_standard (Release 1.0.4)
-- @CAcopyright		Copyright (c)2013 - 2014 Simply Open Source Ltd. (trading as Component Architect). All Rights Reserved
-- @CAlicense		GNU General Public License version 3 or later - See http://www.gnu.org/copyleft/gpl.html
--
-- This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY, without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
-- --------------------------------------------------------
--
-- Table structure for table `#__geocars_cars`
--

DROP TABLE IF EXISTS `#__geocars_cars`;
CREATE TABLE IF NOT EXISTS `#__geocars_cars` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL DEFAULT '',
  `alias` VARCHAR(255) NOT NULL DEFAULT '',
  `description` MEDIUMTEXT NOT NULL,
  `image_5` VARCHAR(255) NOT NULL DEFAULT '',
  `image_4` VARCHAR(255) NOT NULL DEFAULT '',
  `image_3` VARCHAR(255) NOT NULL DEFAULT '',
  `image_2` VARCHAR(255) NOT NULL DEFAULT '',
  `image_1` VARCHAR(255) NOT NULL DEFAULT '',
  `catid` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `state` TINYINT(1) NOT NULL DEFAULT '0',
  `ordering` INT(11) NOT NULL DEFAULT '0',
  `hits` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `language` CHAR(7) NOT NULL DEFAULT '*',
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_ordering` (`ordering`),
  PRIMARY KEY (`id`)
  
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Table structure for table `#__geocars_rating`
--
DROP TABLE IF EXISTS `#__geocars_rating`;
CREATE TABLE IF NOT EXISTS `#__geocars_rating` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `content_type` VARCHAR(50) NOT NULL DEFAULT '',
  `content_id` INT(11) NOT NULL DEFAULT '0',
  `rating_sum` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `rating_count` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `lastip` VARCHAR(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `content_type_id` (`content_type`,`content_id`)
  
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
