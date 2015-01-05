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
-- @CAversion		Id:uninstall.architectcomp_mysql.utf8.sql 19 2012-01-12 16:33:49Z BrianWade $
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
-- Uninstall of `#__geocars` tables
--
DROP TABLE IF EXISTS `#__geocars_cars`;

DROP TABLE IF EXISTS `#__geocars_rating`;

DELETE FROM `#__assets` WHERE `name` LIKE '%com_geocars%';

DELETE FROM `#__extensions` WHERE `name`='com_geocars' AND `type`='component';

DELETE FROM `#__categories` WHERE `extension`='com_geocars';
