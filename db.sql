-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2019 at 09:31 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `phpcrud_ci`
--

-- --------------------------------------------------------

--
-- Table structure for table `am_admin_users`
--

CREATE TABLE IF NOT EXISTS `am_admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `user_type` int(1) NOT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1',
  `is_delete` enum('0','1') NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `am_admin_users_group`
--

CREATE TABLE IF NOT EXISTS `am_admin_users_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'user_type_id',
  `user_type_title` varchar(100) NOT NULL,
  `access_level` text NOT NULL,
  `access_limit` enum('0','1') NOT NULL DEFAULT '1',
  `crud_access` enum('0','1') NOT NULL DEFAULT '0',
  `is_active` enum('0','1') NOT NULL DEFAULT '1',
  `is_delete` enum('0','1') NOT NULL DEFAULT '0',
  `display_in_list` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `am_admin_users_group`
--

INSERT INTO `am_admin_users_group` (`id`, `user_type_title`, `access_level`, `access_limit`, `crud_access`, `is_active`, `is_delete`, `display_in_list`) VALUES
(1, 'Superadmin', '', '0', '1', '1', '0', '0'),
(2, 'Administrator', '', '0', '0', '1', '0', '0'),
(3, 'Admin User', '', '1', '0', '1', '0', '1');

-- --------------------------------------------------------

--
-- Table structure for table `am_elements`
--

CREATE TABLE IF NOT EXISTS `am_elements` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `am_id` int(11) NOT NULL,
  `am_table_name` varchar(100) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `field_label` varchar(100) DEFAULT NULL,
  `field_type` varchar(100) NOT NULL DEFAULT 'text',
  `data_type` varchar(50) DEFAULT NULL,
  `data_type_size` varchar(100) DEFAULT NULL,
  `field_type_attributes` varchar(100) DEFAULT NULL,
  `validation_rules` text COMMENT 'Ex. 1,2,3,4',
  `is_foreign_key` enum('0','1') NOT NULL DEFAULT '0',
  `foreign_table_name` varchar(100) DEFAULT NULL,
  `foreign_value_field` varchar(100) DEFAULT NULL COMMENT 'Combo Option Value Field',
  `foreign_label_field` varchar(100) DEFAULT NULL COMMENT 'Combo Option Label Field',
  `static_dropdown_options` text,
  `radio_options` text,
  `checkbox_options` text,
  `is_primary_key` enum('0','1') NOT NULL DEFAULT '0',
  `default_value` varchar(100) DEFAULT NULL,
  `include_in_insert` enum('0','1') NOT NULL DEFAULT '1',
  `include_in_update` enum('0','1') NOT NULL DEFAULT '1',
  `display_in_list` enum('0','1') NOT NULL DEFAULT '1',
  `can_update` enum('0','1') NOT NULL DEFAULT '1',
  `status_in_insert` varchar(20) NOT NULL DEFAULT 'active',
  `status_in_update` varchar(20) NOT NULL DEFAULT 'active',
  `am_extra` varchar(30) DEFAULT 'general',
  `is_search_option` enum('0','1') NOT NULL DEFAULT '1',
  `is_filters_option` enum('0','1') NOT NULL DEFAULT '0',
  `is_sorting_option` enum('0','1') NOT NULL DEFAULT '0',
  `form_field_order` int(1) NOT NULL,
  `is_required` enum('0','1') NOT NULL DEFAULT '1',
  `maxlength` char(3) DEFAULT NULL,
  `minlength` char(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `am_elements`
--

INSERT INTO `am_elements` (`id`, `am_id`, `am_table_name`, `field_name`, `field_label`, `field_type`, `data_type`, `data_type_size`, `field_type_attributes`, `validation_rules`, `is_foreign_key`, `foreign_table_name`, `foreign_value_field`, `foreign_label_field`, `static_dropdown_options`, `radio_options`, `checkbox_options`, `is_primary_key`, `default_value`, `include_in_insert`, `include_in_update`, `display_in_list`, `can_update`, `status_in_insert`, `status_in_update`, `am_extra`, `is_search_option`, `is_filters_option`, `is_sorting_option`, `form_field_order`, `is_required`, `maxlength`, `minlength`) VALUES
(1, 1, 'sma_brands', 'id', 'Id', 'hidden', 'int', '11', NULL, '', '0', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '0', '1', '1', '0', 'none', 'hidden', 'id', '0', '0', '0', 1, '1', '', NULL),
(2, 1, 'sma_brands', 'code', 'Code', 'text', 'varchar', '20', NULL, '', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, '1', '1', '1', '1', 'default', 'default', 'general', '1', '0', '0', 2, '1', '20', NULL),
(3, 1, 'sma_brands', 'name', 'Name', 'text', 'varchar', '50', NULL, '', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, '1', '1', '1', '1', 'default', 'default', 'general', '1', '0', '0', 3, '1', '50', NULL),
(4, 1, 'sma_brands', 'image', 'Image', 'file', 'varchar', '50', NULL, '[]', '0', '', '', '', NULL, NULL, NULL, '0', '', '1', '1', '1', '1', 'active', 'active', 'general', '0', '0', '0', 4, '0', '255', ''),
(5, 1, 'sma_brands', 'is_active', 'Is Active', 'radio', 'tinyint', '1', NULL, '[]', '0', '', '', '', '{"Yes":"1","No":"0"}', NULL, NULL, '0', '1', '1', '1', '1', '1', 'active', 'active', 'is_active', '0', '1', '0', 5, '0', '1', '1'),
(6, 1, 'sma_brands', 'is_delete', 'Is Delete', 'radio', 'tinyint', '1', NULL, '[]', '0', '', '', '', '{"Yes":"1","No":"0"}', NULL, NULL, '0', '0', '1', '1', '1', '1', 'none', 'active', 'is_delete', '0', '1', '0', 6, '0', '1', '1'),
(7, 2, 'crud_groups', 'id', 'Id', 'hidden', 'mediumint', '8', NULL, '', '0', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '0', '1', '1', '0', 'none', 'hidden', 'id', '0', '0', '0', 1, '1', '', NULL),
(8, 2, 'crud_groups', 'name', 'Name', 'text', 'varchar', '20', NULL, '', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, '1', '1', '1', '1', 'default', 'default', 'general', '1', '0', '0', 2, '1', '20', NULL),
(9, 2, 'crud_groups', 'description', 'Description', 'text', 'varchar', '100', NULL, '', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, '1', '1', '1', '1', 'default', 'default', 'general', '1', '0', '0', 3, '1', '100', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `am_elements_type`
--

CREATE TABLE IF NOT EXISTS `am_elements_type` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `element_type` varchar(30) DEFAULT NULL,
  `attributes` text,
  `is_active` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `element_type` (`element_type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `am_elements_validation_rules`
--

CREATE TABLE IF NOT EXISTS `am_elements_validation_rules` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `rules` varchar(50) NOT NULL,
  `need_inpute` enum('0','1') NOT NULL DEFAULT '0',
  `is_active` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `am_forms`
--

CREATE TABLE IF NOT EXISTS `am_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'am_id',
  `table_name` varchar(100) DEFAULT NULL,
  `form_title` varchar(255) DEFAULT NULL COMMENT 'form Link Heading',
  `id_field` varchar(100) NOT NULL DEFAULT 'id',
  `is_active_field` varchar(100) NOT NULL DEFAULT 'is_active',
  `is_delete_field` varchar(100) NOT NULL DEFAULT 'is_delete',
  `created_at_field` varchar(100) NOT NULL DEFAULT 'created_at',
  `updated_at_field` varchar(100) NOT NULL DEFAULT 'updated_at',
  `deleted_at_field` varchar(100) NOT NULL DEFAULT 'deleted_at',
  `trash_on_delete` enum('0','1') NOT NULL DEFAULT '0',
  `can_empty_trash` enum('0','1') NOT NULL DEFAULT '1',
  `can_undo_trash` enum('0','1') NOT NULL DEFAULT '1',
  `search_fields` text,
  `filters_fields` text,
  `sorting_fields` text,
  `form_column_layout` enum('1','2','3') NOT NULL DEFAULT '1',
  `is_active` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `am_forms`
--

INSERT INTO `am_forms` (`id`, `table_name`, `form_title`, `id_field`, `is_active_field`, `is_delete_field`, `created_at_field`, `updated_at_field`, `deleted_at_field`, `trash_on_delete`, `can_empty_trash`, `can_undo_trash`, `search_fields`, `filters_fields`, `sorting_fields`, `form_column_layout`, `is_active`) VALUES
(1, 'sma_brands', 'Sma Brands', 'id', 'is_active', 'is_delete', 'created_at', 'updated_at', 'deleted_at', '0', '1', '1', 'code,name,image', NULL, NULL, '1', '1'),
(2, 'crud_groups', 'Crud Groups', 'id', 'is_active', 'is_delete', 'created_at', 'updated_at', 'deleted_at', '0', '1', '1', 'name,description', NULL, NULL, '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `crud_date_format`
--

CREATE TABLE IF NOT EXISTS `crud_date_format` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `js` varchar(20) NOT NULL,
  `php` varchar(20) NOT NULL,
  `sql` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `crud_date_format`
--

INSERT INTO `crud_date_format` (`id`, `js`, `php`, `sql`) VALUES
(1, 'mm-dd-yyyy', 'm-d-Y', '%m-%d-%Y'),
(2, 'mm/dd/yyyy', 'm/d/Y', '%m/%d/%Y'),
(3, 'mm.dd.yyyy', 'm.d.Y', '%m.%d.%Y'),
(4, 'dd-mm-yyyy', 'd-m-Y', '%d-%m-%Y'),
(5, 'dd/mm/yyyy', 'd/m/Y', '%d/%m/%Y'),
(6, 'dd.mm.yyyy', 'd.m.Y', '%d.%m.%Y');

-- --------------------------------------------------------

--
-- Table structure for table `crud_elements`
--

CREATE TABLE IF NOT EXISTS `crud_elements` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `am_id` int(11) NOT NULL COMMENT 'crud_master_id',
  `am_table_name` varchar(100) DEFAULT NULL COMMENT 'crud master table name',
  `short_code` varchar(60) NOT NULL,
  `is_custom_field` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is Custom Fields',
  `field_name` varchar(100) DEFAULT NULL,
  `field_label` varchar(100) DEFAULT NULL,
  `field_type` varchar(100) NOT NULL DEFAULT 'text',
  `data_type` varchar(50) DEFAULT NULL,
  `data_type_size` varchar(100) DEFAULT NULL,
  `field_type_attributes` varchar(100) DEFAULT NULL,
  `is_foreign_key` tinyint(1) NOT NULL DEFAULT '0',
  `foreign_table_name` varchar(100) DEFAULT NULL,
  `foreign_value_field` varchar(100) DEFAULT NULL COMMENT 'Combo Option Value Field',
  `foreign_label_field` varchar(100) DEFAULT NULL COMMENT 'Combo Option Label Field',
  `static_dropdown_options` text,
  `radio_options` text,
  `checkbox_options` text,
  `is_primary_key` tinyint(1) NOT NULL DEFAULT '0',
  `default_value` varchar(100) DEFAULT NULL,
  `include_in_insert` tinyint(1) NOT NULL DEFAULT '1',
  `include_in_update` tinyint(1) NOT NULL DEFAULT '1',
  `display_in_list` tinyint(1) NOT NULL DEFAULT '1',
  `can_update` tinyint(1) NOT NULL DEFAULT '1',
  `status_in_insert` varchar(20) NOT NULL DEFAULT 'active',
  `status_in_update` varchar(20) NOT NULL DEFAULT 'active',
  `am_extra` varchar(30) DEFAULT 'general',
  `is_search_option` tinyint(1) NOT NULL DEFAULT '1',
  `is_filters_option` tinyint(1) NOT NULL DEFAULT '0',
  `is_sorting_option` tinyint(1) NOT NULL DEFAULT '0',
  `form_field_order` int(1) NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `maxlength` char(3) DEFAULT NULL,
  `minlength` char(3) DEFAULT NULL,
  `placeholder` varchar(255) DEFAULT NULL,
  `other_attributes` varchar(255) DEFAULT NULL,
  `validation_rules` tinyint(1) DEFAULT '0' COMMENT '1:TRUE, 0:FALSE',
  `validation_rules_details` text COMMENT 'JSON DATA',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=171 ;

--
-- Dumping data for table `crud_elements`
--

INSERT INTO `crud_elements` (`id`, `am_id`, `am_table_name`, `short_code`, `is_custom_field`, `field_name`, `field_label`, `field_type`, `data_type`, `data_type_size`, `field_type_attributes`, `is_foreign_key`, `foreign_table_name`, `foreign_value_field`, `foreign_label_field`, `static_dropdown_options`, `radio_options`, `checkbox_options`, `is_primary_key`, `default_value`, `include_in_insert`, `include_in_update`, `display_in_list`, `can_update`, `status_in_insert`, `status_in_update`, `am_extra`, `is_search_option`, `is_filters_option`, `is_sorting_option`, `form_field_order`, `is_required`, `maxlength`, `minlength`, `placeholder`, `other_attributes`, `validation_rules`, `validation_rules_details`) VALUES
(44, 3, 'sma_categories', 'sma_categories', 0, 'is_delete', 'Is Delete', 'radio', 'tinyint', '1', NULL, 0, '', '', '', '{"1":"Yes","0":"No"}', NULL, NULL, 0, '0', 0, 1, 1, 1, 'none', 'active', 'is_delete', 0, 0, 0, 7, 0, '', '', '', '', 0, NULL),
(42, 3, 'sma_categories', 'sma_categories', 0, 'parent_id', 'Parent Id', 'select', 'int', '11', NULL, 1, 'sma_categories', 'id', 'name', NULL, NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 0, 0, 0, 5, 0, '', '', '', '', 0, NULL),
(43, 3, 'sma_categories', 'sma_categories', 0, 'is_active', 'Is Active', 'radio', 'tinyint', '1', NULL, 0, '', '', '', '{"1":"Yes","0":"No"}', NULL, NULL, 0, '1', 1, 1, 1, 1, 'active', 'active', 'is_active', 0, 0, 0, 6, 0, '', '', '', '', 0, NULL),
(41, 3, 'sma_categories', 'sma_categories', 0, 'image', 'Image', 'file', 'varchar', '55', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 4, 0, '55', '', '', '', 0, NULL),
(40, 3, 'sma_categories', 'sma_categories', 0, 'name', 'Name', 'text', 'varchar', '55', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 3, 1, '55', '', '', '', 0, NULL),
(39, 3, 'sma_categories', 'sma_categories', 0, 'code', 'Code', 'text', 'varchar', '55', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 2, 1, '55', '', '', '', 0, NULL),
(38, 3, 'sma_categories', 'sma_categories', 0, 'id', 'Id', 'hidden', 'int', '11', NULL, 0, '', '', '', NULL, NULL, NULL, 1, '', 0, 0, 1, 0, 'none', 'none', 'id', 0, 0, 0, 1, 0, '0', '0', '', '', 0, NULL),
(45, 4, 'sma_companies', 'sma_companies', 0, 'id', 'Id', 'hidden', 'int', '11', NULL, 0, '', '', '', NULL, NULL, NULL, 1, '', 0, 1, 1, 0, 'none', 'hidden', 'id', 0, 0, 0, 1, 0, '', '', '', '', 0, NULL),
(46, 4, 'sma_companies', 'sma_companies', 0, 'group_id', 'Group Id', 'select', 'int', '10', NULL, 1, 'sma_groups', 'id', 'name', NULL, NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'disabled', 'general', 0, 0, 0, 2, 1, '', '', '', '', 0, NULL),
(47, 4, 'sma_companies', 'sma_companies', 0, 'group_name', 'Group Name', 'text', 'varchar', '20', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 1, 1, 1, 3, 1, '55', '', 'Enter Group Name', '', 0, NULL),
(48, 4, 'sma_companies', 'sma_companies', 0, 'customer_group_id', 'Customer Group Id', 'select', 'int', '11', NULL, 0, '', '', '', '{"1":"General","2":"Retailer"}', NULL, NULL, 0, '', 1, 1, 0, 1, 'active', 'active', 'general', 0, 0, 0, 4, 0, '', '', 'Group Name', '', 0, NULL),
(49, 4, 'sma_companies', 'sma_companies', 0, 'customer_group_name', 'Customer Group Name', 'text', 'varchar', '100', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 5, 0, '100', NULL, 'Customer Group Name', NULL, 0, NULL),
(50, 4, 'sma_companies', 'sma_companies', 0, 'name', 'Name', 'text', 'varchar', '55', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 6, 1, '55', '', 'Name', '', 0, NULL),
(51, 4, 'sma_companies', 'sma_companies', 0, 'company', 'Company', 'text', 'varchar', '255', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '-', 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 7, 0, '255', '', 'Company', '', 0, NULL),
(52, 4, 'sma_companies', 'sma_companies', 0, 'vat_no', 'Vat No', 'text', 'varchar', '100', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 0, 0, 0, 8, 0, '6', '2', 'Vat No', 'min=', 0, NULL),
(53, 4, 'sma_companies', 'sma_companies', 0, 'address', 'Address', 'textarea', 'varchar', '255', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 9, 0, '255', '', 'Address', '', 0, NULL),
(54, 4, 'sma_companies', 'sma_companies', 0, 'city', 'City', 'text', 'varchar', '55', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 10, 0, '55', NULL, 'City', NULL, 0, NULL),
(55, 4, 'sma_companies', 'sma_companies', 0, 'state', 'State', 'select', 'varchar', '55', NULL, 1, 'sma_state_master', 'id', 'name', NULL, NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 11, 1, '55', '', 'State', '', 0, NULL),
(56, 4, 'sma_companies', 'sma_companies', 0, 'state_code', 'State Code', 'text', 'varchar', '10', NULL, 1, 'sma_state_master', 'code', 'name', NULL, NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 12, 0, '1', '', 'State Code', '', 0, NULL),
(57, 4, 'sma_companies', 'sma_companies', 0, 'postal_code', 'Postal Code', 'text', 'varchar', '8', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 13, 1, '8', '', 'Postal Code', '', 0, NULL),
(58, 4, 'sma_companies', 'sma_companies', 0, 'country', 'Country', 'select', 'varchar', '100', NULL, 0, '', '', '', '{"India":"India","Amerika":"Amerika"}', NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 14, 1, '100', '', 'Country', '', 0, NULL),
(59, 4, 'sma_companies', 'sma_companies', 0, 'phone', 'Phone', 'text', 'varchar', '20', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 15, 1, '10', '10', 'Phone', '', 0, NULL),
(60, 4, 'sma_companies', 'sma_companies', 0, 'email', 'Email', 'email', 'varchar', '100', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 16, 1, '100', '', 'Email', '', 0, NULL),
(61, 4, 'sma_companies', 'sma_companies', 0, 'cf1', 'Cf1', 'text', 'varchar', '100', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 0, 0, 0, 1, 'none', 'none', 'general', 0, 0, 0, 17, 0, '0', '0', 'Cf1', '', 0, NULL),
(62, 4, 'sma_companies', 'sma_companies', 0, 'cf2', 'Cf2', 'text', 'varchar', '100', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 0, 0, 0, 1, 'none', 'none', 'general', 0, 0, 0, 18, 0, '0', '0', 'Cf2', '', 0, NULL),
(63, 4, 'sma_companies', 'sma_companies', 0, 'cf3', 'Cf3', 'text', 'varchar', '100', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 0, 0, 0, 1, 'none', 'none', 'general', 0, 0, 0, 19, 0, '0', '0', 'Cf3', '', 0, NULL),
(64, 4, 'sma_companies', 'sma_companies', 0, 'cf4', 'Cf4', 'text', 'varchar', '100', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 0, 0, 0, 1, 'none', 'none', 'general', 0, 0, 0, 20, 0, '0', '0', 'Cf4', '', 0, NULL),
(65, 4, 'sma_companies', 'sma_companies', 0, 'cf5', 'Cf5', 'text', 'varchar', '100', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 0, 0, 0, 1, 'none', 'none', 'general', 0, 0, 0, 21, 0, '0', '0', 'Cf5', '', 0, NULL),
(66, 4, 'sma_companies', 'sma_companies', 0, 'pass_key', 'Pass Key', 'text', 'varchar', '50', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 0, 0, 0, 1, 'none', 'none', 'general', 0, 0, 0, 22, 0, '0', '0', 'Pass Key', '', 0, NULL),
(67, 4, 'sma_companies', 'sma_companies', 0, 'cf6', 'Cf6', 'text', 'varchar', '100', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 0, 0, 0, 1, 'none', 'none', 'general', 0, 0, 0, 23, 0, '0', '0', 'Cf6', '', 0, NULL),
(68, 4, 'sma_companies', 'sma_companies', 0, 'invoice_footer', 'Invoice Footer', 'text', 'text', '', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 24, 0, '', '', 'Cf6', '', 0, NULL),
(69, 4, 'sma_companies', 'sma_companies', 0, 'payment_term', 'Payment Term', 'text', 'int', '11', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', 1, 1, 1, 1, 'active', 'active', 'general', 0, 0, 0, 25, 0, '', NULL, 'Cf6', NULL, 0, NULL),
(70, 4, 'sma_companies', 'sma_companies', 0, 'logo', 'Logo', 'file', 'varchar', '255', NULL, 0, '', '', '', NULL, NULL, NULL, 0, 'logo.png', 1, 1, 0, 1, 'active', 'active', 'general', 0, 0, 0, 26, 0, '255', '', 'Logo', '', 0, NULL),
(71, 4, 'sma_companies', 'sma_companies', 0, 'award_points', 'Award Points', 'text', 'int', '11', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', 1, 1, 1, 1, 'active', 'active', 'general', 0, 0, 0, 27, 0, '', NULL, 'Logo', NULL, 0, NULL),
(72, 4, 'sma_companies', 'sma_companies', 0, 'deposit_amount', 'Deposit Amount', 'text', 'decimal', '25,4', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 0, 0, 0, 28, 0, '', NULL, 'Logo', NULL, 0, NULL),
(73, 4, 'sma_companies', 'sma_companies', 0, 'price_group_id', 'Price Group Id', 'number', 'int', '11', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 0, 0, 0, 29, 0, '20', '1', 'undefined', '', 0, NULL),
(74, 4, 'sma_companies', 'sma_companies', 0, 'price_group_name', 'Price Group Name', 'text', 'varchar', '50', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 30, 0, '50', NULL, 'Price Group Name', NULL, 0, NULL),
(75, 4, 'sma_companies', 'sma_companies', 0, 'password', 'Password', 'text', 'varchar', '50', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 31, 0, '50', NULL, 'Password', NULL, 0, NULL),
(76, 4, 'sma_companies', 'sma_companies', 0, 'dob', 'Dob', 'date', 'date', '', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 0, 0, 0, 32, 0, '', '', 'Password', '', 0, NULL),
(77, 4, 'sma_companies', 'sma_companies', 0, 'anniversary', 'Anniversary', 'timepicker', 'date', '', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 0, 0, 0, 33, 0, '', '', '', '', 0, NULL),
(78, 4, 'sma_companies', 'sma_companies', 0, 'dob_father', 'Dob Father', 'timepicker', 'date', '', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 0, 0, 0, 34, 0, '', '', 'Password', '', 0, NULL),
(79, 4, 'sma_companies', 'sma_companies', 0, 'dob_mother', 'Dob Mother', 'date', 'date', '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 0, 0, 0, 35, 0, '', NULL, 'Password', NULL, 0, NULL),
(80, 4, 'sma_companies', 'sma_companies', 0, 'dob_child1', 'Dob Child1', 'timepicker', 'date', '', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 0, 0, 0, 36, 0, '', '', 'Password', '', 0, NULL),
(81, 4, 'sma_companies', 'sma_companies', 0, 'dob_child2', 'Dob Child2', 'timepicker', 'date', '', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 0, 0, 0, 37, 0, '', '', 'Password', '', 0, NULL),
(82, 4, 'sma_companies', 'sma_companies', 0, 'is_synced', 'Is Synced', 'radio', 'tinyint', '1', NULL, 0, '', '', '', '{"1":"Yes","0":"No"}', NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 0, 0, 0, 38, 0, '', '', 'Password', '', 0, NULL),
(83, 4, 'sma_companies', 'sma_companies', 0, 'lat', 'Lat', 'text', 'float', '10,6', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 0, 0, 0, 39, 0, '', NULL, 'Password', NULL, 0, NULL),
(84, 4, 'sma_companies', 'sma_companies', 0, 'lng', 'Lng', 'text', 'float', '10,6', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 0, 0, 0, 40, 0, '', NULL, 'Password', NULL, 0, NULL),
(85, 4, 'sma_companies', 'sma_companies', 0, 'gstn_no', 'Gstn No', 'text', 'varchar', '50', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 0, 0, 0, 1, 'none', 'none', 'general', 0, 0, 0, 41, 0, '0', '0', 'Gstn No', '', 0, NULL),
(86, 5, 'sma_products', 'sma_products', 0, 'id', 'Id', 'hidden', 'int', '11', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 1, 0, 'none', 'hidden', 'id', 0, 0, 0, 1, 0, '11', NULL, 'Id', NULL, 0, NULL),
(87, 5, 'sma_products', 'sma_products', 0, 'code', 'Code', 'text', 'varchar', '50', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 2, 0, '50', NULL, 'Code', NULL, 0, NULL),
(88, 5, 'sma_products', 'sma_products', 0, 'name', 'Name', 'text', 'char', '255', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 3, 0, '255', NULL, 'Name', NULL, 0, NULL),
(89, 5, 'sma_products', 'sma_products', 0, 'unit', 'Unit', 'select', 'int', '11', NULL, 0, '', '', '', '{"nos":"Nos","kg":"Kilogram","lit":"Liter"}', NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 0, 0, 0, 4, 0, '11', '', 'Units', '', 0, NULL),
(90, 5, 'sma_products', 'sma_products', 0, 'cost', 'Cost', 'text', 'decimal', '25,4', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 0, 0, 0, 5, 0, '', NULL, 'Cost', NULL, 0, NULL),
(91, 5, 'sma_products', 'sma_products', 0, 'price', 'Price', 'text', 'decimal', '25,4', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 0, 0, 0, 6, 0, '', NULL, 'Price', NULL, 0, NULL),
(92, 5, 'sma_products', 'sma_products', 0, 'alert_quantity', 'Alert Quantity', 'text', 'decimal', '15,4', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '20.0000', 1, 1, 1, 1, 'active', 'active', 'general', 0, 0, 0, 7, 0, '', NULL, 'Alert Quantity', NULL, 0, NULL),
(93, 5, 'sma_products', 'sma_products', 0, 'image', 'Image', 'file', 'varchar', '255', NULL, 0, '', '', '', NULL, NULL, NULL, 0, 'no_image.png', 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 8, 0, '255', '', 'Image', '', 0, NULL),
(94, 5, 'sma_products', 'sma_products', 0, 'category_id', 'Category Id', 'select', 'int', '11', NULL, 1, 'sma_categories', 'id', 'name', NULL, NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 0, 0, 0, 9, 1, '11', '', 'undefined', '', 0, NULL),
(95, 5, 'sma_products', 'sma_products', 0, 'subcategory_id', 'Subcategory Id', 'select', 'int', '11', NULL, 1, 'sma_categories', 'id', 'name', NULL, NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 0, 0, 0, 10, 0, '11', '', 'undefined', '', 0, NULL),
(96, 5, 'sma_products', 'sma_products', 0, 'cf1', 'Cf1', 'text', 'varchar', '255', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 11, 0, '255', '', 'Cf1', '', 0, NULL),
(97, 5, 'sma_products', 'sma_products', 0, 'cf2', 'Cf2', 'text', 'varchar', '255', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 12, 0, '255', NULL, 'Cf2', NULL, 0, NULL),
(98, 5, 'sma_products', 'sma_products', 0, 'cf3', 'Cf3', 'text', 'varchar', '255', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 13, 0, '255', NULL, 'Cf3', NULL, 0, NULL),
(99, 5, 'sma_products', 'sma_products', 0, 'cf4', 'Cf4', 'text', 'varchar', '255', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 14, 0, '255', NULL, 'Cf4', NULL, 0, NULL),
(100, 5, 'sma_products', 'sma_products', 0, 'cf5', 'Cf5', 'text', 'varchar', '255', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 15, 0, '255', NULL, 'Cf5', NULL, 0, NULL),
(101, 5, 'sma_products', 'sma_products', 0, 'cf6', 'Cf6', 'text', 'varchar', '255', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 16, 0, '255', NULL, 'Cf6', NULL, 0, NULL),
(102, 5, 'sma_products', 'sma_products', 0, 'quantity', 'Quantity', 'text', 'decimal', '15,4', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0.0000', 1, 1, 1, 1, 'active', 'active', 'general', 0, 0, 0, 17, 0, '', NULL, 'Quantity', NULL, 0, NULL),
(103, 5, 'sma_products', 'sma_products', 0, 'tax_rate', 'Tax Rate', 'select', 'int', '11', NULL, 1, 'sma_tax_rates', 'id', 'name', NULL, NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 0, 0, 0, 18, 0, '11', '', 'Tax Rate', '', 0, NULL),
(104, 5, 'sma_products', 'sma_products', 0, 'track_quantity', 'Track Quantity', 'text', 'tinyint', '1', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1', 1, 1, 1, 1, 'active', 'active', 'general', 0, 0, 0, 19, 0, '', NULL, 'Track Quantity', NULL, 0, NULL),
(105, 5, 'sma_products', 'sma_products', 0, 'details', 'Details', 'text', 'varchar', '1000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 20, 0, '100', NULL, 'Details', NULL, 0, NULL),
(106, 5, 'sma_products', 'sma_products', 0, 'warehouse', 'Warehouse', 'select', 'int', '11', NULL, 1, 'sma_warehouses', 'id', 'name', NULL, NULL, NULL, 0, '', 1, 1, 0, 1, 'active', 'active', 'general', 0, 0, 0, 21, 0, '11', '', 'Warehouse', '', 0, NULL),
(107, 5, 'sma_products', 'sma_products', 0, 'barcode_symbology', 'Barcode Symbology', 'text', 'varchar', '55', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'code128', 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 22, 0, '55', NULL, 'Barcode Symbology', NULL, 0, NULL),
(108, 5, 'sma_products', 'sma_products', 0, 'file', 'File', 'file', 'varchar', '100', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 0, 0, 0, 23, 0, '100', '', 'File', '', 0, NULL),
(109, 5, 'sma_products', 'sma_products', 0, 'product_details', 'Product Details', 'textarea', 'text', '', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 24, 0, '', '', 'Product Details', '', 0, NULL),
(110, 5, 'sma_products', 'sma_products', 0, 'tax_method', 'Tax Method', 'select', 'tinyint', '1', NULL, 1, 'sma_tax_rates', 'id', 'name', NULL, NULL, NULL, 0, '0', 1, 1, 0, 1, 'active', 'active', 'general', 0, 0, 0, 25, 1, '', '', 'Tax Method', '', 0, NULL),
(111, 5, 'sma_products', 'sma_products', 0, 'type', 'Type', 'select', 'varchar', '55', NULL, 0, '', '', '', '{"standert":"Standert","combo":"Combo"}', NULL, NULL, 0, 'standard', 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 26, 0, '55', '', 'Type', '', 0, NULL),
(112, 5, 'sma_products', 'sma_products', 0, 'supplier1', 'Supplier1', 'text', 'int', '11', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 0, 1, 0, 1, 'none', 'active', 'general', 0, 0, 0, 27, 0, '11', '', 'Supplier1', '', 0, NULL),
(113, 5, 'sma_products', 'sma_products', 0, 'supplier1price', 'Supplier1price', 'text', 'decimal', '25,4', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 0, 1, 0, 1, 'none', 'active', 'general', 0, 0, 0, 28, 0, '', '', 'Supplier1price', '', 0, NULL),
(114, 5, 'sma_products', 'sma_products', 0, 'supplier2', 'Supplier2', 'text', 'int', '11', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 0, 1, 0, 1, 'none', 'active', 'general', 0, 0, 0, 29, 0, '11', '', 'Supplier2', '', 0, NULL),
(115, 5, 'sma_products', 'sma_products', 0, 'supplier2price', 'Supplier2price', 'text', 'decimal', '25,4', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 0, 1, 0, 1, 'none', 'active', 'general', 0, 0, 0, 30, 0, '', '', 'Supplier2price', '', 0, NULL),
(116, 5, 'sma_products', 'sma_products', 0, 'supplier3', 'Supplier3', 'text', 'int', '11', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 0, 1, 0, 1, 'none', 'active', 'general', 0, 0, 0, 31, 0, '11', '', 'Supplier3', '', 0, NULL),
(117, 5, 'sma_products', 'sma_products', 0, 'supplier3price', 'Supplier3price', 'text', 'decimal', '25,4', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 0, 1, 0, 1, 'none', 'active', 'general', 0, 0, 0, 32, 0, '', '', 'Supplier3price', '', 0, NULL),
(118, 5, 'sma_products', 'sma_products', 0, 'supplier4', 'Supplier4', 'text', 'int', '11', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 0, 1, 0, 1, 'none', 'active', 'general', 0, 0, 0, 33, 0, '11', '', 'Supplier4', '', 0, NULL),
(119, 5, 'sma_products', 'sma_products', 0, 'supplier4price', 'Supplier4price', 'text', 'decimal', '25,4', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 0, 1, 0, 1, 'none', 'active', 'general', 0, 0, 0, 34, 0, '', '', 'Supplier4price', '', 0, NULL),
(120, 5, 'sma_products', 'sma_products', 0, 'supplier5', 'Supplier5', 'text', 'int', '11', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 0, 1, 0, 1, 'none', 'active', 'general', 0, 0, 0, 35, 0, '11', '', 'Supplier5', '', 0, NULL),
(121, 5, 'sma_products', 'sma_products', 0, 'supplier5price', 'Supplier5price', 'text', 'decimal', '25,4', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 0, 1, 0, 1, 'none', 'active', 'general', 0, 0, 0, 36, 0, '', '', 'Supplier5price', '', 0, NULL),
(122, 5, 'sma_products', 'sma_products', 0, 'promotion', 'Promotion', 'text', 'tinyint', '1', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '0', 0, 1, 0, 1, 'none', 'active', 'general', 0, 0, 0, 37, 0, '', '', 'Promotion', '', 0, NULL),
(123, 5, 'sma_products', 'sma_products', 0, 'promo_price', 'Promo Price', 'text', 'decimal', '25,4', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 0, 1, 0, 1, 'none', 'active', 'general', 0, 0, 0, 38, 0, '', '', 'Promo Price', '', 0, NULL),
(124, 5, 'sma_products', 'sma_products', 0, 'start_date', 'Start Date', 'datetime', 'datetime', '', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 0, 1, 0, 1, 'none', 'active', 'general', 0, 0, 0, 39, 0, '', '', 'Start Date', '', 0, NULL),
(125, 5, 'sma_products', 'sma_products', 0, 'end_date', 'End Date', 'datetime', 'datetime', '', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 0, 1, 0, 1, 'none', 'active', 'general', 0, 0, 0, 40, 0, '', '', 'End Date', '', 0, NULL),
(126, 5, 'sma_products', 'sma_products', 0, 'supplier1_part_no', 'Supplier1 Part No', 'text', 'varchar', '50', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 0, 1, 0, 1, 'none', 'active', 'general', 1, 0, 0, 41, 0, '50', '', 'Supplier1 Part No', '', 0, NULL),
(127, 5, 'sma_products', 'sma_products', 0, 'supplier2_part_no', 'Supplier2 Part No', 'text', 'varchar', '50', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 0, 1, 0, 1, 'none', 'active', 'general', 1, 0, 0, 42, 0, '50', '', 'Supplier2 Part No', '', 0, NULL),
(128, 5, 'sma_products', 'sma_products', 0, 'supplier3_part_no', 'Supplier3 Part No', 'text', 'varchar', '50', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 0, 1, 0, 1, 'none', 'active', 'general', 1, 0, 0, 43, 0, '50', '', 'Supplier3 Part No', '', 0, NULL),
(129, 5, 'sma_products', 'sma_products', 0, 'supplier4_part_no', 'Supplier4 Part No', 'text', 'varchar', '50', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 0, 1, 0, 1, 'none', 'active', 'general', 1, 0, 0, 44, 0, '50', '', 'Supplier4 Part No', '', 0, NULL),
(130, 5, 'sma_products', 'sma_products', 0, 'supplier5_part_no', 'Supplier5 Part No', 'text', 'varchar', '50', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 0, 1, 0, 1, 'none', 'active', 'general', 1, 0, 0, 45, 0, '50', '', 'Supplier5 Part No', '', 0, NULL),
(131, 5, 'sma_products', 'sma_products', 0, 'sale_unit', 'Sale Unit', 'text', 'int', '11', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 0, 0, 0, 46, 0, '11', NULL, 'Sale Unit', NULL, 0, NULL),
(132, 5, 'sma_products', 'sma_products', 0, 'purchase_unit', 'Purchase Unit', 'text', 'int', '11', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 0, 0, 0, 47, 0, '11', NULL, 'Purchase Unit', NULL, 0, NULL),
(133, 5, 'sma_products', 'sma_products', 0, 'brand', 'Brand', 'text', 'int', '11', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 0, 0, 0, 48, 0, '11', NULL, 'Brand', NULL, 0, NULL),
(134, 5, 'sma_products', 'sma_products', 0, 'mrp', 'Mrp', 'text', 'decimal', '25,4', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 0, 0, 0, 49, 0, '', NULL, 'Mrp', NULL, 0, NULL),
(135, 5, 'sma_products', 'sma_products', 0, 'hsn_code', 'Hsn Code', 'text', 'varchar', '100', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 50, 0, '100', NULL, 'Hsn Code', NULL, 0, NULL),
(136, 5, 'sma_products', 'sma_products', 0, 'is_featured', 'Is Featured', 'text', 'tinyint', '1', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '0', 1, 1, 1, 1, 'active', 'active', 'general', 0, 0, 0, 51, 0, '', NULL, 'Is Featured', NULL, 0, NULL),
(137, 6, 'sma_brands', 'sma_brands', 0, 'id', 'Id', 'hidden', 'int', '11', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 1, 0, 'none', 'hidden', 'id', 0, 0, 0, 1, 0, '11', NULL, 'Id', NULL, 0, NULL),
(138, 6, 'sma_brands', 'sma_brands', 0, 'code', 'Code', 'text', 'varchar', '20', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 2, 0, '20', NULL, 'Code', NULL, 0, NULL),
(139, 6, 'sma_brands', 'sma_brands', 0, 'name', 'Name', 'text', 'varchar', '50', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 3, 0, '50', NULL, 'Name', NULL, 0, NULL),
(140, 6, 'sma_brands', 'sma_brands', 0, 'image', 'Image', 'file', 'varchar', '50', NULL, 0, '', '', '', NULL, NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 4, 0, '50', '', 'Image', '', 0, NULL),
(141, 6, 'sma_brands', 'sma_brands', 0, 'is_active', 'Is Active', 'radio', 'tinyint', '1', NULL, 0, '', '', '', '{"1":"Yes","0":"No"}', NULL, NULL, 0, '1', 1, 1, 1, 1, 'active', 'active', 'is_active', 0, 0, 0, 5, 0, '', '', 'Is Active', '', 0, NULL),
(142, 6, 'sma_brands', 'sma_brands', 0, 'is_delete', 'Is Delete', 'radio', 'tinyint', '1', NULL, 0, '', '', '', '{"1":"Yes","0":"No"}', NULL, NULL, 0, '0', 1, 1, 1, 1, 'active', 'active', 'is_delete', 0, 0, 0, 6, 0, '', '', 'Is Delete', '', 0, NULL),
(143, 7, 'sma_date_format', 'sma_date_format', 0, 'id', 'Id', 'hidden', 'int', '11', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 1, 0, 'none', 'hidden', 'id', 0, 0, 0, 1, 0, '11', NULL, 'Id', NULL, 0, NULL),
(144, 7, 'sma_date_format', 'sma_date_format', 0, 'js', 'Js', 'text', 'varchar', '20', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 2, 0, '20', NULL, 'Js', NULL, 0, NULL),
(145, 7, 'sma_date_format', 'sma_date_format', 0, 'php', 'Php', 'text', 'varchar', '20', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 3, 0, '20', NULL, 'Php', NULL, 0, NULL),
(146, 7, 'sma_date_format', 'sma_date_format', 0, 'sql', 'Sql', 'text', 'varchar', '20', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 4, 0, '20', NULL, 'Sql', NULL, 0, NULL),
(147, 8, 'sma_warehouses', 'sma_warehouses', 0, 'id', 'Id', 'hidden', 'int', '11', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 1, 0, 'none', 'hidden', 'id', 0, 0, 0, 1, 0, '11', NULL, 'Id', NULL, 0, NULL),
(148, 8, 'sma_warehouses', 'sma_warehouses', 0, 'code', 'Code', 'text', 'varchar', '50', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 2, 0, '50', NULL, 'Code', NULL, 0, NULL),
(149, 8, 'sma_warehouses', 'sma_warehouses', 0, 'name', 'Name', 'text', 'varchar', '255', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 3, 0, '255', NULL, 'Name', NULL, 0, NULL),
(150, 8, 'sma_warehouses', 'sma_warehouses', 0, 'address', 'Address', 'text', 'varchar', '255', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 4, 0, '255', NULL, 'Address', NULL, 0, NULL),
(151, 8, 'sma_warehouses', 'sma_warehouses', 0, 'map', 'Map', 'text', 'varchar', '255', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 5, 0, '255', NULL, 'Map', NULL, 0, NULL),
(152, 8, 'sma_warehouses', 'sma_warehouses', 0, 'phone', 'Phone', 'text', 'varchar', '55', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 6, 0, '55', NULL, 'Phone', NULL, 0, NULL),
(153, 8, 'sma_warehouses', 'sma_warehouses', 0, 'email', 'Email', 'text', 'varchar', '55', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 7, 0, '55', NULL, 'Email', NULL, 0, NULL),
(154, 8, 'sma_warehouses', 'sma_warehouses', 0, 'price_group_id', 'Price Group Id', 'text', 'int', '11', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 0, 0, 0, 8, 0, '11', NULL, 'Price Group Id', NULL, 0, NULL),
(155, 9, 'sma_warehouses', 'custom_warehouses', 1, 'id', 'Id', 'hidden', 'int', '11', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 1, 0, 'none', 'hidden', 'id', 0, 0, 0, 1, 0, '11', NULL, 'Id', NULL, 0, NULL),
(156, 9, 'sma_warehouses', 'custom_warehouses', 1, 'code', 'Code', 'select', 'varchar', '50', NULL, 1, 'sma_categories', 'id', 'name', NULL, NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 2, 0, '50', '', 'Code', '', 0, NULL),
(157, 9, 'sma_warehouses', 'custom_warehouses', 1, 'name', 'Name', 'text', 'varchar', '255', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 3, 0, '255', NULL, 'Name', NULL, 0, NULL),
(158, 9, 'sma_warehouses', 'custom_warehouses', 1, 'location', 'location', 'select', NULL, NULL, NULL, 1, 'sma_state_master', 'id', 'name', NULL, NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 0, 0, '', '', '', '', 0, NULL),
(159, 9, 'sma_warehouses', 'custom_warehouses', 1, 'address', 'address', 'textarea', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL),
(160, 9, 'sma_warehouses', 'custom_warehouses', 1, 'status', 'status', 'radio', NULL, NULL, NULL, 0, '', '', '', '{"1":"onw","2":"Two","3":"Three","4":"Four","5":"Five","6":"Six","7":"Sevens","9":"Nine","10":"Ten"}', NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 0, 0, '', '', '', '', 0, NULL),
(161, 10, 'students', 'student_masters', 1, 'Student name', 'Student name', 'text', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL),
(162, 10, 'students', 'student_masters', 1, 'DOB', 'DOB', 'date', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL),
(163, 10, 'students', 'student_masters', 1, 'Category', 'Category', 'radio', NULL, NULL, NULL, 0, '', '', '', '{"obc":"OBC","sc":"SC","st":"ST","open":"Open","sbc":"SBC","nt":"NT"}', NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 0, 0, '', '', '', '', 0, NULL),
(164, 10, 'students', 'student_masters', 1, 'State', 'State', 'select', NULL, NULL, NULL, 1, 'sma_state_master', 'id', 'name', NULL, NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 0, 0, '', '', '', '', 0, NULL),
(165, 10, 'students', 'student_masters', 1, 'address', 'address', 'textarea', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL),
(166, 10, 'students', 'student_masters', 1, 'mobile', 'mobile', 'text', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL),
(167, 10, 'students', 'student_masters', 1, 'Email', 'Email', 'email', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL),
(168, 10, 'students', 'student_masters', 1, 'Gender', 'Gender', 'radio', NULL, NULL, NULL, 0, '', '', '', '{"M":"Male","F":"Female"}', NULL, NULL, 0, '', 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 0, 1, '', '', '', '', 0, NULL),
(169, 10, 'students', 'student_masters', 1, 'photo', 'photo', 'file', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL),
(170, 10, 'students', 'student_masters', 1, 'city', 'city', 'text', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 1, 1, 'active', 'active', 'general', 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `crud_groups`
--

CREATE TABLE IF NOT EXISTS `crud_groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `crud_groups`
--

INSERT INTO `crud_groups` (`id`, `name`, `description`) VALUES
(1, 'god', 'Superuser'),
(2, 'admin', 'Administrator'),
(3, 'user', 'Admin User');

-- --------------------------------------------------------

--
-- Table structure for table `crud_login_attempts`
--

CREATE TABLE IF NOT EXISTS `crud_login_attempts` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crud_masters`
--

CREATE TABLE IF NOT EXISTS `crud_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'am_id',
  `table_name` varchar(100) NOT NULL COMMENT 'DB Table Name',
  `short_code` varchar(100) NOT NULL COMMENT 'Form Unique Code',
  `action_controller` varchar(150) DEFAULT NULL COMMENT 'Form Submit Custom Controller',
  `action_method` varchar(150) DEFAULT NULL COMMENT 'Form Submit Custom Method',
  `is_custom_form` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is Custom Form',
  `form_title` varchar(255) DEFAULT NULL COMMENT 'form Link Heading',
  `id_field` varchar(100) NOT NULL DEFAULT 'id',
  `is_active_field` varchar(100) DEFAULT NULL,
  `is_delete_field` varchar(100) DEFAULT NULL,
  `created_at_field` varchar(100) DEFAULT NULL,
  `updated_at_field` varchar(100) DEFAULT NULL,
  `deleted_at_field` varchar(100) DEFAULT NULL,
  `trash_on_delete` enum('0','1') NOT NULL DEFAULT '0',
  `can_empty_trash` enum('0','1') NOT NULL DEFAULT '1',
  `can_undo_trash` enum('0','1') NOT NULL DEFAULT '1',
  `search_fields` text,
  `filters_fields` text,
  `sorting_fields` text,
  `form_column_layout` enum('1','2','3') NOT NULL DEFAULT '1',
  `is_active` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `short_code` (`short_code`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `crud_masters`
--

INSERT INTO `crud_masters` (`id`, `table_name`, `short_code`, `action_controller`, `action_method`, `is_custom_form`, `form_title`, `id_field`, `is_active_field`, `is_delete_field`, `created_at_field`, `updated_at_field`, `deleted_at_field`, `trash_on_delete`, `can_empty_trash`, `can_undo_trash`, `search_fields`, `filters_fields`, `sorting_fields`, `form_column_layout`, `is_active`) VALUES
(4, 'sma_companies', 'sma_companies', NULL, NULL, 0, 'Sma Companies', 'id', NULL, NULL, NULL, NULL, NULL, '0', '1', '1', 'group_name,customer_group_name,name,company,vat_no,address,city,state,state_code,postal_code,country,phone,email,cf1,cf2,cf3,cf4,cf5,pass_key,cf6,invoice_footer,logo,price_group_name,password,gstn_no', NULL, NULL, '1', '1'),
(3, 'sma_categories', 'sma_categories', NULL, NULL, 0, 'Sma Categories', 'id', 'is_active', 'is_delete', NULL, NULL, NULL, '0', '1', '1', 'code,name,image', NULL, NULL, '1', '1'),
(5, 'sma_products', 'sma_products', NULL, NULL, 0, 'Sma Products', 'id', NULL, NULL, NULL, NULL, NULL, '0', '1', '1', 'code,name,image,cf1,cf2,cf3,cf4,cf5,cf6,details,barcode_symbology,file,product_details,type,supplier1_part_no,supplier2_part_no,supplier3_part_no,supplier4_part_no,supplier5_part_no,hsn_code', NULL, NULL, '1', '1'),
(6, 'sma_brands', 'sma_brands', NULL, NULL, 0, 'Sma Brands', 'id', 'is_active', 'is_delete', NULL, NULL, NULL, '0', '1', '1', 'code,name,image', NULL, NULL, '1', '1'),
(7, 'sma_date_format', 'sma_date_format', NULL, NULL, 0, 'Sma Date Format', 'id', NULL, NULL, NULL, NULL, NULL, '0', '1', '1', 'js,php,sql', NULL, NULL, '1', '1'),
(8, 'sma_warehouses', 'sma_warehouses', NULL, NULL, 0, 'Sma Warehouses', 'id', NULL, NULL, NULL, NULL, NULL, '0', '1', '1', 'code,name,address,map,phone,email', NULL, NULL, '1', '1'),
(9, 'sma_warehouses', 'custom_warehouses', 'cruds_customs', 'warehouse', 1, 'Custom Warehouses', 'id', NULL, NULL, NULL, NULL, NULL, '0', '1', '1', 'code,name,address,map,phone,email', NULL, NULL, '1', '1'),
(10, 'students', 'student_masters', 'students', 'add', 1, 'Student Data', 'id', NULL, NULL, NULL, NULL, NULL, '0', '1', '1', NULL, NULL, NULL, '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `crud_settings`
--

CREATE TABLE IF NOT EXISTS `crud_settings` (
  `setting_id` int(1) NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `crud_version` varchar(250) NOT NULL,
  `language` varchar(20) NOT NULL,
  `dateformat` int(11) NOT NULL,
  `timezone` varchar(100) DEFAULT NULL,
  `mailpath` varchar(55) DEFAULT '/usr/sbin/sendmail',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(10) DEFAULT NULL,
  `default_email` varchar(100) NOT NULL,
  `captcha` varchar(100) DEFAULT NULL,
  `allow_reg` int(1) NOT NULL DEFAULT '0',
  `mmode` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `crud_settings`
--

INSERT INTO `crud_settings` (`setting_id`, `logo`, `site_name`, `crud_version`, `language`, `dateformat`, `timezone`, `mailpath`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `default_email`, `captcha`, `allow_reg`, `mmode`) VALUES
(1, 'logo.png', 'PHP CRUD ADMIN', '1.0.0', 'english', 5, 'Asia/Kolkata', '/usr/sbin/sendmail', 'pop.gmail.com', 'info@phpcrud.com', '', '25', NULL, 'info@phpcrud.com', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `crud_users`
--

CREATE TABLE IF NOT EXISTS `crud_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `crud_users`
--

INSERT INTO `crud_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `mobile`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`) VALUES
(1, '::1', '', 'sunilkmcharde', 'cab9d37310f5e8a0fbbf1c32e33b466d78710028', NULL, 'sunilkmcharde@gmail.com', '8149741557', NULL, NULL, NULL, NULL, 160907, 1511870234, 1, 'Sunil', 'Charde', NULL, NULL, NULL, 'M', 1),
(2, '::1', '', 'A2gNq4n7', '6c238b8e3ebe85ecbdf5ed2011f0456a9e835af8', NULL, 'sunilkmcharde@gmail.com', '8149741557', NULL, NULL, NULL, NULL, 160907, 1551074517, 1, 'Admin', 'User', NULL, NULL, NULL, 'M', 1);

-- --------------------------------------------------------

--
-- Table structure for table `crud_user_logins`
--

CREATE TABLE IF NOT EXISTS `crud_user_logins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `crud_user_logins`
--

INSERT INTO `crud_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(1, 1, NULL, '::1', 'sunilkmcharde', '2017-11-16 10:41:43'),
(2, 1, NULL, '::1', 'sunilkmcharde', '2017-11-16 10:57:29'),
(3, 1, NULL, '::1', 'sunilkmcharde', '2017-11-16 10:58:14'),
(4, 1, NULL, '::1', 'sunilkmcharde', '2017-11-18 07:05:38'),
(5, 1, NULL, '::1', 'sunilkmcharde', '2017-11-28 11:57:14'),
(6, 2, NULL, '::1', 'A2gNq4n7', '2018-01-17 14:58:21'),
(7, 2, NULL, '::1', 'A2gNq4n7', '2018-01-17 15:06:42'),
(8, 2, NULL, '121.46.94.55', 'A2gNq4n7', '2018-01-24 11:32:10'),
(9, 2, NULL, '127.0.0.1', 'A2gNq4n7', '2018-01-24 12:16:35'),
(10, 2, NULL, '::1', 'A2gNq4n7', '2018-01-25 09:03:19'),
(11, 2, NULL, '::1', 'A2gNq4n7', '2018-01-31 10:33:08'),
(12, 2, NULL, '::1', 'A2gNq4n7', '2018-02-01 09:17:55'),
(13, 2, NULL, '::1', 'A2gNq4n7', '2018-02-02 11:03:37'),
(14, 2, NULL, '::1', 'A2gNq4n7', '2018-02-03 07:43:10'),
(15, 2, NULL, '::1', 'A2gNq4n7', '2018-02-03 13:23:11'),
(16, 2, NULL, '::1', 'A2gNq4n7', '2018-02-10 07:06:51'),
(17, 2, NULL, '::1', 'A2gNq4n7', '2018-02-15 11:36:29'),
(18, 2, NULL, '::1', 'A2gNq4n7', '2018-02-16 11:22:16'),
(19, 2, NULL, '::1', 'A2gNq4n7', '2018-02-26 07:43:18'),
(20, 2, NULL, '::1', 'A2gNq4n7', '2018-03-05 11:49:11'),
(21, 2, NULL, '::1', 'A2gNq4n7', '2018-03-06 11:18:25'),
(22, 2, NULL, '::1', 'A2gNq4n7', '2018-03-09 12:42:45'),
(23, 2, NULL, '::1', 'A2gNq4n7', '2018-03-12 12:51:54'),
(24, 2, NULL, '::1', 'A2gNq4n7', '2018-03-16 12:29:20'),
(25, 2, NULL, '::1', 'A2gNq4n7', '2018-03-17 07:18:59'),
(26, 2, NULL, '::1', 'A2gNq4n7', '2018-04-14 06:32:27'),
(27, 2, NULL, '::1', 'A2gNq4n7', '2018-05-18 07:46:26'),
(28, 2, NULL, '::1', 'A2gNq4n7', '2018-06-30 09:20:48'),
(29, 2, NULL, '::1', 'A2gNq4n7', '2018-07-21 07:17:41'),
(30, 2, NULL, '::1', 'A2gNq4n7', '2018-07-23 12:10:53'),
(31, 2, NULL, '::1', 'A2gNq4n7', '2018-07-25 10:27:20'),
(32, 2, NULL, '::1', 'A2gNq4n7', '2018-07-25 12:46:09'),
(33, 2, NULL, '::1', 'A2gNq4n7', '2018-07-27 10:54:06'),
(34, 2, NULL, '::1', 'A2gNq4n7', '2018-08-13 08:55:10'),
(35, 2, NULL, '::1', 'A2gNq4n7', '2018-12-21 12:00:17'),
(36, 2, NULL, '::1', 'A2gNq4n7', '2019-01-29 09:54:31'),
(37, 2, NULL, '::1', 'A2gNq4n7', '2019-02-22 06:05:36'),
(38, 2, NULL, '::1', 'A2gNq4n7', '2019-02-22 09:19:36'),
(39, 2, NULL, '::1', 'A2gNq4n7', '2019-02-23 06:14:48'),
(40, 2, NULL, '::1', 'A2gNq4n7', '2019-02-23 06:14:49'),
(41, 2, NULL, '::1', 'A2gNq4n7', '2019-02-23 09:54:36'),
(42, 2, NULL, '::1', 'A2gNq4n7', '2019-02-25 06:01:57');

-- --------------------------------------------------------

--
-- Table structure for table `sma_brands`
--

CREATE TABLE IF NOT EXISTS `sma_brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=190 ;

--
-- Dumping data for table `sma_brands`
--

INSERT INTO `sma_brands` (`id`, `code`, `name`, `image`, `is_active`, `is_delete`) VALUES
(2, 'HR1', 'Godrej', '0c31c3152e4e7e069900bf5014df6533.JPG', 1, 0),
(3, 'HR2', 'Harrison', '5b93783c18d6b34353eea79127b2d08d.JPG', 1, 0),
(5, 'HR4', 'Kodia', 'e471e4fd5e67c1dfbee8502630ff4452.jpg', 1, 0),
(6, 'HR5', 'Tens', '', 1, 0),
(7, 'HR6', 'Tublar', '', 1, 0),
(8, 'HR7', 'Spider', 'cba73cd4d94b9083b0ca84108b5371a4.jpg', 1, 0),
(9, 'HR8', 'Brick Bullet', '5f093864599925d0eacceaccfbb85bea.jpg', 1, 0),
(10, 'HR9', 'Sewaup', '', 1, 0),
(11, 'HR10', 'Supreme Ivory', '', 1, 0),
(12, 'HR11', 'Zaha', 'e001963cea3463e5779cbe8854a597d7.png', 1, 0),
(13, 'HR12', 'Swet', '', 1, 0),
(14, 'HR13', 'Stealodeal', '', 1, 0),
(15, 'HR14', 'Plaza', '', 1, 0),
(16, 'HR15', 'Lalit', '', 1, 0),
(17, 'HR16', 'Shine Everest', 'd26172e44fb2d9c978be01985adf9492.JPG', 1, 0),
(18, 'HR17', 'ACE', '3c241bf1a72e9ffb47f8359ee527e3f2.JPG', 1, 0),
(19, 'HR18', 'Sunlight', '', 1, 0),
(20, 'HR19', 'JBS', '22f9d4678d0e7e0621b22cf3e40bd215.png', 1, 0),
(21, 'HR20', 'Alloytek', 'f7d20d9d1b6e75a477bfa059d353d217.jpg', 1, 0),
(22, 'HR21', 'Frontier', '3f341b09a3791f612d45bf9673a1158e.png', 1, 0),
(23, 'HR22', 'Ishna', '', 1, 0),
(24, 'HR23', 'PeepalComm', '', 1, 0),
(25, 'HR24', 'OSAKI', '', 1, 0),
(26, 'HR25', 'GREAVES', '4833861c3cde0bea751aa70a08996779.JPG', 1, 0),
(27, 'HR26', 'Labsol', '', 1, 0),
(28, 'HR27', 'Craftsman', '0c2d8a1a2ffef40c8950c3d2649f2d64.jpg', 1, 0),
(29, 'HR28', 'Dortel', 'f25227b46c04a91e9b864ee3c306919b.jpg', 1, 0),
(30, 'HR29', 'Design Elite', '', 1, 0),
(31, 'HR30', 'Ankeet', '22a006a170e8b1e8596a7c7528fa198b.jpg', 1, 0),
(32, 'HR31', 'KHS', '', 1, 0),
(33, 'HR32', 'Now & Ever', '', 1, 0),
(34, 'HR33', 'Black Bird', 'db775dad4d50ac2c040a10411d256760.jpg', 1, 0),
(35, 'HR34', 'Koin', '', 1, 0),
(36, 'HR35', 'Angel', '88b53110fc5143b123f6ae1adeffcc08.jpg', 1, 0),
(37, 'HR36', 'Visko', '7bb194ca231a95757181f5836395fa4f.jpg', 1, 0),
(38, 'HR37', 'Indian Shelf', '', 1, 0),
(39, 'HR38', 'V-Tech', '', 1, 0),
(40, 'HR39', 'CNR', '7c056603e8cd2348b7c2f5124471498c.jpg', 1, 0),
(41, 'HR40', 'Insta', '', 1, 0),
(42, 'HR41', 'Bharat', '6c9dfa4979456928cbbabbb580a5d771.jpg', 1, 0),
(43, 'HR42', 'Universal', '', 1, 0),
(44, 'HR43', 'Vetta', '', 1, 0),
(45, 'HR44', 'Dormaster', '', 1, 0),
(46, 'HR45', 'Dorset', '1a187e751a3e3bfc2dc6cdf2ed238a33.jpg', 1, 0),
(47, 'HR46', 'Hanfas', '', 1, 0),
(48, 'HR47', 'Klazvyn', '', 1, 0),
(49, 'HR48', 'Mexx', '', 1, 0),
(50, 'HR49', 'Hart Fin', '', 1, 0),
(51, 'HR50', 'YURI', 'c4ba47a28b4a9d0de4d5730f37e2694b.JPG', 1, 0),
(52, 'HR51', 'Bosch', 'c9b088725a4313d7df58b3e878e25346.png', 1, 0),
(53, 'HR52', 'Dewalt', '69f91931aaaabe63ef6eac08ebcb764e.JPG', 1, 0),
(54, 'HR53', 'Hitachi', '1d4b8ab2ba145dc3358f7e07633ccc18.JPG', 1, 0),
(55, 'HR54', 'Norton', '638dbbdd2adc3552a9d7e7ae1f856272.JPG', 1, 0),
(56, 'HR55', 'Topline', '471255e40e0f313a97ba90f588e515a6.jpg', 1, 0),
(57, 'HR56', 'Jet', '', 1, 0),
(58, 'HR57', 'SBC', '', 1, 0),
(59, 'HR58', 'Dell', '', 1, 0),
(60, 'HR59', 'Anant', 'ef0988929b5bea6c390b7771a49cc200.jpg', 1, 0),
(61, 'HR60', 'Yamoto', '', 1, 0),
(62, 'HR61', 'Stanley', '439f490baf626bffb98cb180cd569783.JPG', 1, 0),
(63, 'HR62', 'Kennedy', '', 1, 0),
(64, 'HR63', 'Usha', 'b58c73f8465db53ec8c587d10c5b2a7d.JPG', 1, 0),
(65, 'HR64', 'Miranda', '', 1, 0),
(66, 'HR65', 'Taparia', '31c2ab3af6139b4c01036dbb8219add6.JPG', 1, 0),
(67, 'HR66', 'Ketsy', '', 1, 0),
(68, 'HR67', 'Goodyear', '1d55fa808bb3a39cfbeb4a429952b6e7.png', 1, 0),
(69, 'HR68', 'Eastman', 'c3c3a63ca587f1071069a958cc03f6d6.png', 1, 0),
(70, 'HR69', 'Mac Master', '975cb375093381b740f749f0cf211740.gif', 1, 0),
(71, 'HR70', 'Norbar', '0e4b1ecb427587c183f8c2423032076b.jpg', 1, 0),
(72, 'HR71', 'Planet Power', '02a5278c4df8c31321f7e21a8ca1d42c.jpg', 1, 0),
(73, 'HR72', 'Buildskill', 'bf86cf3b8234d7e6ff0dafea90e2a448.JPG', 1, 0),
(74, 'HR73', 'Powermaxx', '08eef93479e72079b8d8b907444c4c5b.jpg', 1, 0),
(75, 'HR74', 'KPT', '3f59de719403c4be62dfbebd5965769f.JPG', 1, 0),
(76, 'HR75', 'Yking', '8be70de4ba9793ebad7050a002f1c57f.jpg', 1, 0),
(77, 'HR76', 'Black and Decker', 'a120904720702b98ecb31437359f30ce.JPG', 1, 0),
(78, 'HR77', 'Cheston', 'be7de4503996c6cac74f9e00d090c5d5.jpg', 1, 0),
(79, 'HR78', 'Jon Ciaz', '8a03074a0d746432f9e60a9fe3860d1f.png', 1, 0),
(80, 'HR79', 'Gravity', 'ac7071718d1768b48ee0e9cc3420baeb.gif', 1, 0),
(81, 'HR80', 'Venus', '67a40b1b77d1619026287a7ef58b6845.JPG', 1, 0),
(82, 'HR81', 'Pinaacle', '', 1, 0),
(83, 'HR82', 'TULA', '3fb434b6899bc605921c7481f604296b.jpg', 1, 0),
(84, 'HR83', 'Kerro', '', 1, 0),
(85, 'HR84', 'Aerospace', 'cd333401a344c740d2622a986d142414.jpg', 1, 0),
(86, 'HR85', 'MGW', '', 1, 0),
(87, 'HR86', 'LPS', '2413cbb425ad8f03c08b94f010726f08.JPG', 1, 0),
(88, 'HR87', 'Pooja', 'd4df882a64a7bcd4332b339ddfc0c1e7.JPG', 1, 0),
(89, 'HR88', 'Unbrako', '491f4f675b4af30698333d3bd8a6c57a.JPG', 1, 0),
(90, 'HR89', 'ICFS', '', 1, 0),
(91, 'HR90', 'ARB', '2f2a891a29c94d9ad10c22f20bf44ec5.jpg', 1, 0),
(92, 'HR91', 'NTN', '36736395307896c0e905b43ed36ae7fd.JPG', 1, 0),
(93, 'HR92', 'FAG', 'caa938e7d2c858aab248fd04d9fb2a37.JPG', 1, 0),
(94, 'HR93', 'Asian Paints', 'a9a66260812965bfe2eddfab55e4748e.jpg', 1, 0),
(95, 'HR94', 'British Paints', '1060f8f22453419c27e6cdf44bbf97df.jpg', 1, 0),
(96, 'HR95', 'Prime Aerosol', '', 1, 0),
(97, 'HR96', 'Abro', 'a5c31e4ba8deae4cac8490bb5f3b4647.JPG', 1, 0),
(98, 'HR97', 'Ashoka', '2bf672cdd22c06463b9d41518ff86fcc.jpg', 1, 0),
(99, 'HR98', 'Fevicol', '02d26f3a82bf64f32a7ee51dabe29ed6.JPG', 1, 0),
(100, 'HR99', 'McCoy Soudal', '9ab19ed703ed09ff22ca9f4775d34cdf.JPG', 1, 0),
(101, 'HR100', 'Champion', '', 1, 0),
(102, 'HR101', 'Bizol', '1b1aeccc6f7b48c74591067e2badc856.png', 1, 0),
(103, 'HR102', 'Xado', 'c8b0e9703cfb6e08bdfcdf61b505c5a2.jpg', 1, 0),
(104, 'HR103', 'MAK', '375c595a7426ee079918cdc034208d06.jpg', 1, 0),
(105, 'HR104', 'Castrol', '56784540547a0fdbc37f119b80cd856d.jpg', 1, 0),
(106, 'HR105', 'SKF', 'd4e6d4b4f5b9483d85f2f2338eb31867.JPG', 1, 0),
(107, 'HR106', 'Hindustan Petroleum', '6635ed37046f55052df1962e2f3aabc9.JPG', 1, 0),
(108, 'HR107', 'Valvoline', 'c12b2398035923d319bd7ea43fdbe402.jpg', 1, 0),
(109, 'HR108', 'Servo', 'b15cec79dbb7a80144dc393db9c7c8b8.jpg', 1, 0),
(110, 'HR109', 'Fenner', 'c924d9cf07d8ea6418bf293caebb6668.JPG', 1, 0),
(111, 'HR110', 'PBL', '0cc0a43d521c69a8d04021c037288b4c.jpg', 1, 0),
(112, 'HR111', 'KTR', '9a7db7b9327e3d0eecdb7eac28fcfae5.JPG', 1, 0),
(114, 'HR113', 'Link', 'b93d788fdc498f0b80a6f67e2f749bd6.JPG', 1, 0),
(116, 'HR115', 'JSKI', '', 1, 0),
(117, 'HR116', 'Shine Star', '', 1, 0),
(118, 'HR117', 'Mahashakti', '', 1, 0),
(120, 'HR119', 'Fine Art', '', 1, 0),
(121, 'HR120', 'Sleek-O-Matic', '', 1, 0),
(125, 'HR124', 'Modi', '', 1, 0),
(127, 'HR126', 'Mannat', '', 1, 0),
(128, 'HR127', 'SN', '', 1, 0),
(131, 'HR130', 'I-Ten', '', 1, 0),
(133, 'HR132', 'Rocket', 'c79bdd016b2a8e51f85bcc3ef333fbf0.jpg', 1, 0),
(134, 'HR133', 'Q Seven', 'f771e52b0413b7afc1de5d92e81eb820.png', 1, 0),
(135, 'HR134', 'Shubham', '', 1, 0),
(136, 'HR135', 'Yashika', '7278fd05a0bada356603ceb6e19f9bc3.jpg', 1, 0),
(137, 'HR136', 'Origins', '', 1, 0),
(138, 'HR137', 'Jarman', '', 1, 0),
(140, 'HR139', 'Shree', '', 1, 0),
(141, 'HR140', 'Golden', '', 1, 0),
(142, 'HR141', 'SS', '', 1, 0),
(143, 'HR142', 'Wudtul', '', 1, 0),
(144, 'HR143', 'Nord-Lock', '', 1, 0),
(145, 'HR144', 'APS', '5ebae7bb231b8c539a8e26341a22c2a2.jpg', 1, 0),
(147, 'HR146', 'Mansarovar', '', 1, 0),
(149, 'HR148', 'Ajay', 'e2aab82712e173ae3363fb3de63b7c2b.jpg', 1, 0),
(151, 'HR150', 'Jhalani', 'a1ed160c2ea1c950801bdac8354f4f2c.JPG', 1, 0),
(152, 'HR151', 'Proskit', '0696b7d2ebea26b7a022d66287ddd603.JPG', 1, 0),
(154, 'HR153', 'VTR', '', 1, 0),
(155, 'HR154', 'BAUM', '4be50ff9924a8efcefbf2976addba4b1.jpg', 1, 0),
(156, 'HR155', 'JCB', '23f9a45948d2bc26accf25b481a24e76.JPG', 1, 0),
(157, 'HR156', 'Gripp', '', 1, 0),
(160, 'HR159', 'Bizinto', '4eefa2dd185217b6158896bbd8cb6362.jpg', 1, 0),
(161, 'HR160', 'Freemans', 'c522fdf4e1f8dd307f5c5eceff49ae96.JPG', 1, 0),
(162, 'HR161', 'JK', 'bfdf7c4e5126a7752af33d9a94de055e.JPG', 1, 0),
(163, 'HR162', 'BLACK HORSE', 'cad567487f8e64f225af7240ffa7d574.jpg', 1, 0),
(164, 'HR163', 'Powergrip', '', 1, 0),
(165, 'HR164', 'Escon', '', 1, 0),
(166, 'HR165', 'Lovely', '', 1, 0),
(167, 'HR166', 'Groz', '8b26e0426c7f17fa7bbe6c8bac736eb0.JPG', 1, 0),
(168, 'HR167', 'WTC', '', 1, 0),
(169, 'HR168', 'Prince', '', 1, 0),
(170, 'HR169', 'Weal Care', '', 1, 0),
(171, 'HR170', 'R K', '', 1, 0),
(172, 'HR171', 'Harit', '', 1, 0),
(173, 'HR172', 'Rutland', '', 1, 0),
(175, 'HR174', 'Sharpex', '', 1, 0),
(176, 'HR175', 'Mehta', '', 1, 0),
(177, 'HR176', 'Kisankraft', '', 1, 0),
(178, 'HR177', 'Decora', '', 1, 0),
(179, 'HR178', 'Agrimate', '4d0a53c7a10415b373b2d482872ad51b.jpg', 1, 0),
(180, 'HR179', 'Define', '', 1, 0),
(181, 'HR180', 'TATA AGRICO', '94dd5b8b50f10709ca35dd4f87cb808c.png', 1, 0),
(182, 'HR181', 'CUMI', '67fa05b9ee952b84fc7ea0ed1e4829ca.JPG', 1, 0),
(183, 'HR182', 'Snap N Grip', '', 1, 0),
(184, 'HR183', 'Honda', '', 1, 0),
(185, 'HR184', 'SKIL', '09e693f7dd867f50c34c3766d508c305.JPG', 1, 0),
(186, 'HR185', 'Swisser', '', 1, 0),
(187, 'HR186', 'Insize', 'dd6342add5f6a08f17126671921cc202.JPG', 1, 0),
(188, '574275', 'brand xxx', 'ajax-loader-gears.gif', 1, 0),
(189, '4334', 'fdfsfd', NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_categories`
--

CREATE TABLE IF NOT EXISTS `sma_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=91 ;

--
-- Dumping data for table `sma_categories`
--

INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`, `parent_id`, `is_active`, `is_delete`) VALUES
(3, 'H1', 'Safes & Locks', '6d8fbeb66bbf5e3373dacc7b16bef873.png', 7, 1, 0),
(4, 'H2', 'Braces And Brackets', '49a8a25004ef2ab3838be51afc5d026a.pdf', 0, 1, 0),
(5, 'H3', 'Drawer And Cabinet Hardware', 'f4a444705a7690a6474299a075ded1ed.txt', 0, 1, 0),
(6, 'H4', 'Glass Hardware', 'c8cdbc6782b2354efb925716618d4a1b.docx', 0, 1, 0),
(7, 'H5', 'Abrasives', '79366ce5941f06b4fd5180bf0dc172c1.jpg', 0, 1, 0),
(8, 'H6', 'Hand Tools', 'd860355ea7115e0af465fc1508df2d06.jpg', 0, 1, 0),
(9, 'H7', 'Power Tools', '5f1dc510485a6d214b1fe9ee5c469142.jpg', 0, 1, 0),
(10, 'H8', 'Measuring And Layout Tools', 'b02c79e009e5a7fbeb9d16709515c843.jpg', 0, 1, 0),
(11, 'H9', 'Fastners', '323cd1713960dc39f0950b880d8c1a97.jpg', 0, 1, 0),
(12, 'H10', 'Bearings', '4fa3c2092c8af2d134541be2f41723da.jpg', 0, 1, 0),
(13, 'H11', 'Paints', '52460cd301507a9fdb3e83e071388628.jpg', 0, 1, 0),
(14, 'H12', 'Adhesives &amp; Sealants', '832ee231fdae0ed6fd4ce4eaff9a6b9a.jpg', 0, 1, 0),
(15, 'H13', 'Hardware Tools', 'e533b04a0fa4e35c5f10d48f03ce5f59.jpg', 0, 1, 0),
(16, 'H14', 'Oils &amp; Lubricants', '28d156617a1871dc61a5e96450b9da7f.jpg', 0, 1, 0),
(17, 'H15', 'Power Transmission', '4041bf2ec6ec7a8efed07d41383e0d87.jpg', 0, 1, 0),
(18, 'H16', 'Door Hardware', '797cb7c315b5f3b17ed49138be4190ab.jpg', 0, 1, 0),
(19, 'H17', 'Hardware Supplies', '27227d213afc08a7ae6fbedc2c287b48.jpg', 0, 1, 0),
(21, 'G1', 'Locks', 'e007fea76fed7e7728800c40c3416712.jpg', 3, 1, 0),
(22, 'G2', 'Brackets', 'd88b0f1110ca37fc32ca65a0739d1d81.jpg', 4, 1, 0),
(23, 'G3', 'Shelf Brackets And Supports', '0ce186d9216ca14d64135e268d0bd812.jpg', 4, 1, 0),
(24, 'G4', 'Telescopic Channel Slides', 'a44e4987fdd90f04ecaad15818970784.jpg', 5, 1, 0),
(25, 'G5', 'Handles And Pulls', 'd7086bef4b5a0c6e3623fd1de4d6200a.jpg', 5, 1, 0),
(26, 'G6', 'Cabinet Knobs', '83e9f4dc412c0cdd254e211a20f6f034.jpg', 5, 1, 0),
(27, 'G7', 'Sliding Door Fittings', '7d6a16d4088fa671d88a944d88ec0987.jpg', 6, 1, 0),
(28, 'G8', 'Floor Spring', '7774c62df3760bbd123ade7f48da77b7.jpg', 6, 1, 0),
(29, 'G9', 'Glass Connectors', 'a4c452ec4d293a9f530add8727449352.jpg', 6, 1, 0),
(30, 'G10', 'Glass Door Handle', '77bb099b7db562a7cb13ed36362fba1e.jpg', 6, 1, 0),
(31, 'G11', 'Patch Fitting', 'ba59a1ff6d9cefa2778924dbee20dbe5.jpg', 6, 1, 0),
(32, 'G12', 'Chop Saw Wheel', '498a5be66fb2b82507d0c9c8d29a376f.jpg', 7, 1, 0),
(33, 'G13', 'Grinding Wheels', 'f85bfbbcd0593ceee81de3ed78312762.jpg', 7, 1, 0),
(34, 'G14', 'Cutting Tools', '2d41d59c72cb8a50a2af190b16d760a7.jpg', 8, 1, 0),
(35, 'G15', 'Wrenches', 'd0d7bad175ac572159b5b6cc8aa9ea69.jpg', 8, 1, 0),
(36, 'G16', 'Drills', '4dbc7466e1bb9eca2da31ee545f2415f.jpg', 9, 1, 0),
(37, 'G17', 'Saws', 'bb22597454fe5601a74b378112a0afb8.jpg', 9, 1, 0),
(38, 'G18', 'Air Blowers', 'd5ab4bbadac577e74323d9df6fa17fa6.jpg', 9, 1, 0),
(39, 'G19', 'Weighing Scales', '63ac7edb037972cb0142e6959efaca87.jpg', 10, 1, 0),
(40, 'G20', 'Digital Calipers', '034e939067c59bf0950846ac0d7d2768.jpg', 10, 1, 0),
(41, 'G21', 'Bolts &amp; Studs', 'b9670a02960c473c87a39434caa770c9.jpg', 11, 1, 0),
(42, 'G22', 'Nuts', 'ba9ae2673d16d1cfa89cf8657f9e62c9.jpg', 11, 1, 0),
(43, 'G23', 'Screws', '32e1d7aebaff4465ebadb26cfbd24b28.jpg', 11, 1, 0),
(44, 'G24', 'Fasteners Pins', 'a1395d41206d21aba56014f4c29c3aff.jpg', 11, 1, 0),
(45, 'G25', 'Hexagon Wrenches', '876f6121325eb368b234007786cd77be.jpg', 11, 1, 0),
(46, 'G26', 'Anchor Fasteners', 'baa0ee26279ef5fbbc4e2688e327268e.jpg', 11, 1, 0),
(47, 'G27', 'Ball Bearings', '01f35b0306355b524acb2b0bb427f8e8.jpg', 12, 1, 0),
(48, 'G28', 'Roller Bearings', '9dc37980b838310bc843056a159f81ae.jpg', 12, 1, 0),
(49, 'G29', 'Thrust Bearings', 'e75c7339362d1f855fd0f5f8607939bd.jpg', 12, 1, 0),
(50, 'G30', 'Bearings Accessories', 'dfde1690c22eafa6ca15b7c032325373.jpg', 12, 1, 0),
(51, 'G31', 'Decorative Paints', 'a50179dbea948783af65bcf6e6f12464.jpg', 13, 1, 0),
(52, 'G32', 'Powder &amp; Coating', 'cd1f6da65be0272fc37a6ddf5ab17f00.jpg', 13, 1, 0),
(53, 'G33', 'Waterproofing', '5aee7606b56d9fdb3847c50472bfe3e4.jpg', 13, 1, 0),
(54, 'G34', 'Spray Paints', '4a6b46041b623f0f6ccf35e8eea6909a.jpg', 13, 1, 0),
(55, 'G35', 'Spray Guns', '6432fbe335c5d8c50d1c62550ab1627e.jpg', 13, 1, 0),
(56, 'G36', 'Paint Accessories', 'f023a21367cf932940cf7a9d09519ab1.jpg', 13, 1, 0),
(57, 'G37', 'Adhesives', '9f553b732a07814a95706983944ca7a2.jpg', 14, 1, 0),
(58, 'G38', 'Sealants', 'bd8e9895206753daff8aabccb1a74cfc.jpg', 14, 1, 0),
(59, 'G39', 'Tapes', '1335267083279b5f2f0fe882190bdc7d.jpg', 14, 1, 0),
(60, 'G40', 'Tool Kit', '61360035c00417772afab3bc673d77a0.jpg', 15, 1, 0),
(61, 'G41', 'Machine-Oils', '13bddd75666f6276435b0613b25b8e31.jpg', 16, 1, 0),
(62, 'G42', 'Greases', '9f672c2f953435fa738687cea399d663.jpg', 16, 1, 0),
(63, 'G43', 'Hydraulic Oils', 'd9b236ee93e56c1b930444d9144aa2c2.jpg', 16, 1, 0),
(64, 'G44', 'Belts', '3b4529cc752abeee046dbda583b13374.jpg', 17, 1, 0),
(65, 'G45', 'Gear Boxes', '2c4a3606d08a1f4455c79cd5d1cf0f83.jpg', 17, 1, 0),
(66, 'G46', 'Couplings', '', 17, 1, 0),
(67, 'G47', 'Safes', '84fd3af80a17966a7d3dc8b65e345585.jpg', 3, 1, 0),
(68, 'G48', 'Door Handles', '2814390cde592b73e7aec7d6dfe99b70.jpg', 18, 1, 0),
(69, 'G49', 'Door Closers', '7d2d087aa897e5e122e9d367ffd1a71f.jpg', 18, 1, 0),
(70, 'G50', 'Hinges', '8519adee08d09485ed12c617f9f8d9a1.jpg', 18, 1, 0),
(71, 'G51', 'Tower Bolts', '04d7f46cd56013731e8ae886ef51210e.jpg', 18, 1, 0),
(72, 'G52', 'Aldrops', '86e63efd36384d164b3847c77c0977ff.jpg', 18, 1, 0),
(73, 'G53', 'Door Holders', '1d53b847e90b330d3042efa3243614c3.jpg', 18, 1, 0),
(74, 'G54', 'Hooks', 'fef258b92872683cc5ebdd02833fed7d.jpg', 19, 1, 0),
(75, 'G55', 'Eye Pulleyes and Snaps', 'bce3d695bf20bc9512c819f7ca293773.jpg', 19, 1, 0),
(76, 'G56', 'Screws &amp; Nails', '39f9270bb1bc6e081fe3e148bf24da22.jpg', 11, 1, 0),
(77, 'G57', 'Nails', 'c975b26ef79f6a7196db57526dcffcc2.jpg', 11, 1, 0),
(78, 'G58', 'Washers', 'd623654cf0ec2261e29ee8702a94ddab.jpg', 11, 1, 0),
(79, 'G59', 'Spanners', 'c1896c614b40b89a9fbdeafce5b1224e.jpg', 8, 1, 0),
(80, 'G60', 'Screwdriver', 'f1c40fa0a6f706ea23826a4de9ef8bbd.jpg', 8, 1, 0),
(81, 'G61', 'Pliers', '30abd1d263d90c4d12c9038e0f314a25.jpg', 8, 1, 0),
(82, 'G62', 'Hammers', '668c8e2c6efa56fb82783ca13d0248d6.jpg', 8, 1, 0),
(83, 'G63', 'Measuring Tapes', '3f4e5ad5c584a2af890ba303e4158997.jpg', 8, 1, 0),
(84, 'G64', 'Files', '2e3fa968ce8d9d419c3be40e24283009.jpg', 8, 1, 0),
(85, 'G65', 'Hand Tool Accessories', '5dc6448aeb934177240c8b35eeaa927c.jpg', 8, 1, 0),
(86, 'G66', 'Lubrication Tools', 'a0baaaefc0195a5d12b5256218ac7c85.jpg', 8, 1, 0),
(87, 'G67', 'Gardening Tools', 'baecfe64d7ac10fbb9474a5a4436a517.jpg', 8, 1, 0),
(88, 'sssss', 'Sunil', '0bbefba22189076d41a66f22d6410fcc.pdf', 51, 1, 0),
(89, 'sdddasd', 'dssad', NULL, 51, 1, 0),
(90, 'aaa43', 'aaaaa42342', '25c82f9b2a118f0a1a70036f66e76205.jpg', 34, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_companies`
--

CREATE TABLE IF NOT EXISTS `sma_companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned DEFAULT NULL,
  `group_name` varchar(20) NOT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `customer_group_name` varchar(100) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `company` varchar(255) NOT NULL DEFAULT '-',
  `vat_no` varchar(100) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(55) NOT NULL,
  `state` varchar(55) DEFAULT NULL,
  `state_code` varchar(10) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cf1` varchar(100) DEFAULT NULL,
  `cf2` varchar(100) DEFAULT NULL,
  `cf3` varchar(100) DEFAULT NULL,
  `cf4` varchar(100) DEFAULT NULL,
  `cf5` varchar(100) DEFAULT NULL,
  `pass_key` varchar(50) NOT NULL,
  `cf6` varchar(100) DEFAULT NULL,
  `invoice_footer` text,
  `payment_term` int(11) DEFAULT '0',
  `logo` varchar(255) DEFAULT 'logo.png',
  `award_points` int(11) DEFAULT '0',
  `deposit_amount` decimal(25,4) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL,
  `price_group_name` varchar(50) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `anniversary` time NOT NULL,
  `dob_father` date NOT NULL,
  `dob_mother` date NOT NULL,
  `dob_child1` time NOT NULL,
  `dob_child2` time NOT NULL,
  `is_synced` tinyint(1) NOT NULL,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  `gstn_no` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `group_id_2` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `sma_companies`
--

INSERT INTO `sma_companies` (`id`, `group_id`, `group_name`, `customer_group_id`, `customer_group_name`, `name`, `company`, `vat_no`, `address`, `city`, `state`, `state_code`, `postal_code`, `country`, `phone`, `email`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `pass_key`, `cf6`, `invoice_footer`, `payment_term`, `logo`, `award_points`, `deposit_amount`, `price_group_id`, `price_group_name`, `password`, `dob`, `anniversary`, `dob_father`, `dob_mother`, `dob_child1`, `dob_child2`, `is_synced`, `lat`, `lng`, `gstn_no`) VALUES
(1, 3, 'customer', 1, 'General', 'Walk-in Customer', 'Walk-in Customer', '', 'H3B Nishat Enclave, 74 Bungalow', 'Bhopal', 'MP', NULL, '462003', 'India', '7552555950', 'info@simplypos.in', '', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, '', '0000-00-00', '00:00:00', '0000-00-00', '0000-00-00', '00:00:00', '00:00:00', 0, 0.000000, 0.000000, NULL),
(3, NULL, 'biller', NULL, NULL, 'Biller', 'Simplysafe Biller', '5555', 'H3B Nishat Enclave, 74 Bungalow', 'Bhopal', 'MP', NULL, '462003', 'India', '7552985733', 'possales@simplysafe.in', '', '', '', '', '', '', '', ' Thank you for shopping with us. Please come again', 0, 'logo1.png', 0, NULL, NULL, NULL, '', '0000-00-00', '00:00:00', '0000-00-00', '0000-00-00', '00:00:00', '00:00:00', 0, 0.000000, 0.000000, NULL),
(4, 5, 'sales', 1, 'cccccccc', 'Sunil', '-', '', 'Nagpur\r\ntertet', 'Nagpur', '12', 'Maharashtr', '654646', 'India', '8149742357', 'sunilcss@simplysafe.in', '', '', '', '', '', '', '', '', 0, 'logo.png', 0, '0.0000', 0, '', '', '2019-02-21', '12:15:00', '0000-00-00', '2019-02-18', '12:05:00', '12:05:00', 0, 0.000000, 0.000000, '');

-- --------------------------------------------------------

--
-- Table structure for table `sma_currencies`
--

CREATE TABLE IF NOT EXISTS `sma_currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(5) NOT NULL,
  `name` varchar(55) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `auto_update` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sma_currencies`
--

INSERT INTO `sma_currencies` (`id`, `code`, `name`, `rate`, `auto_update`) VALUES
(2, 'INR', 'Rupee', '1.0000', 0),
(3, 'USD', 'Dollar', '68.1200', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_date_format`
--

CREATE TABLE IF NOT EXISTS `sma_date_format` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `js` varchar(20) NOT NULL,
  `php` varchar(20) NOT NULL,
  `sql` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `sma_date_format`
--

INSERT INTO `sma_date_format` (`id`, `js`, `php`, `sql`) VALUES
(1, 'mm-dd-yyyy', 'm-d-Y', '%m-%d-%Y'),
(2, 'mm/dd/yyyy', 'm/d/Y', '%m/%d/%Y'),
(3, 'mm.dd.yyyy', 'm.d.Y', '%m.%d.%Y'),
(4, 'dd-mm-yyyy', 'd-m-Y', '%d-%m-%Y'),
(5, 'dd/mm/yyyy', 'd/m/Y', '%d/%m/%Y'),
(6, 'dd.mm.yyyy', 'd.m.Y', '%d.%m.%Y');

-- --------------------------------------------------------

--
-- Table structure for table `sma_groups`
--

CREATE TABLE IF NOT EXISTS `sma_groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `sma_groups`
--

INSERT INTO `sma_groups` (`id`, `name`, `description`) VALUES
(1, 'owner', 'Owner'),
(2, 'admin', 'Administrator'),
(3, 'customer', 'Customer'),
(4, 'supplier', 'Supplier'),
(5, 'sales', 'Sales Staff'),
(6, 'sweeper', 'saaf safai');

-- --------------------------------------------------------

--
-- Table structure for table `sma_instamojo`
--

CREATE TABLE IF NOT EXISTS `sma_instamojo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `request_id` varchar(50) NOT NULL,
  `payment_id` varchar(50) NOT NULL,
  `request_response` text NOT NULL,
  `success_response` text NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sma_order_ref`
--

CREATE TABLE IF NOT EXISTS `sma_order_ref` (
  `ref_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `so` int(11) NOT NULL DEFAULT '1',
  `qu` int(11) NOT NULL DEFAULT '1',
  `po` int(11) NOT NULL DEFAULT '1',
  `to` int(11) NOT NULL DEFAULT '1',
  `pos` int(11) NOT NULL DEFAULT '1',
  `do` int(11) NOT NULL DEFAULT '1',
  `pay` int(11) NOT NULL DEFAULT '1',
  `re` int(11) NOT NULL DEFAULT '1',
  `rep` int(11) NOT NULL DEFAULT '1',
  `ex` int(11) NOT NULL DEFAULT '1',
  `ppay` int(11) NOT NULL DEFAULT '1',
  `qa` int(11) DEFAULT '1',
  `offapp` int(11) NOT NULL DEFAULT '1' COMMENT 'Offline App',
  `eshop` int(11) NOT NULL DEFAULT '1' COMMENT 'Eshop',
  PRIMARY KEY (`ref_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sma_order_ref`
--

INSERT INTO `sma_order_ref` (`ref_id`, `date`, `so`, `qu`, `po`, `to`, `pos`, `do`, `pay`, `re`, `rep`, `ex`, `ppay`, `qa`, `offapp`, `eshop`) VALUES
(1, '2017-01-01', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_payments`
--

CREATE TABLE IF NOT EXISTS `sma_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT '0.0000',
  `pos_balance` decimal(25,4) DEFAULT '0.0000',
  `approval_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_settings`
--

CREATE TABLE IF NOT EXISTS `sma_pos_settings` (
  `pos_id` int(1) NOT NULL,
  `eshop_order_tax` int(11) NOT NULL,
  `cat_limit` int(11) NOT NULL,
  `pro_limit` int(11) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_biller` int(11) NOT NULL,
  `display_time` varchar(3) NOT NULL DEFAULT 'yes',
  `cf_title1` varchar(255) DEFAULT NULL,
  `cf_title2` varchar(255) DEFAULT NULL,
  `cf_value1` varchar(255) DEFAULT NULL,
  `cf_value2` varchar(255) DEFAULT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_manual_product` varchar(55) DEFAULT NULL,
  `customer_selection` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `toggle_subcategory_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_items_list` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `product_button_color` varchar(20) NOT NULL DEFAULT 'default',
  `tooltips` tinyint(1) DEFAULT '1',
  `paypal_pro` tinyint(1) DEFAULT '0',
  `stripe` tinyint(1) DEFAULT '0',
  `rounding` tinyint(1) DEFAULT '0',
  `char_per_line` tinyint(4) DEFAULT '42',
  `pin_code` varchar(20) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.0.2.22',
  `after_sale_page` tinyint(1) DEFAULT '0',
  `item_order` tinyint(1) DEFAULT '0',
  `authorize` tinyint(1) DEFAULT '0',
  `toggle_brands_slider` varchar(55) DEFAULT NULL,
  `instamojo` tinyint(1) NOT NULL DEFAULT '0',
  `ccavenue` tinyint(1) NOT NULL DEFAULT '0',
  `paytm` tinyint(1) NOT NULL DEFAULT '0',
  `paynear` tinyint(1) NOT NULL DEFAULT '0',
  `payumoney` tinyint(1) NOT NULL DEFAULT '0',
  `default_eshop_warehouse` int(11) NOT NULL,
  `default_eshop_pay` varchar(50) NOT NULL,
  `eshop_cod` tinyint(1) NOT NULL DEFAULT '0',
  `pos_screen_products` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=default category,1=favorite products',
  PRIMARY KEY (`pos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_pos_settings`
--

INSERT INTO `sma_pos_settings` (`pos_id`, `eshop_order_tax`, `cat_limit`, `pro_limit`, `default_category`, `default_customer`, `default_biller`, `display_time`, `cf_title1`, `cf_title2`, `cf_value1`, `cf_value2`, `receipt_printer`, `cash_drawer_codes`, `focus_add_item`, `add_manual_product`, `customer_selection`, `add_customer`, `toggle_category_slider`, `toggle_subcategory_slider`, `cancel_sale`, `suspend_sale`, `print_items_list`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `keyboard`, `pos_printers`, `java_applet`, `product_button_color`, `tooltips`, `paypal_pro`, `stripe`, `rounding`, `char_per_line`, `pin_code`, `purchase_code`, `envato_username`, `version`, `after_sale_page`, `item_order`, `authorize`, `toggle_brands_slider`, `instamojo`, `ccavenue`, `paytm`, `paynear`, `payumoney`, `default_eshop_warehouse`, `default_eshop_pay`, `eshop_cod`, `pos_screen_products`) VALUES
(1, 0, 22, 12, 2, 1, 3, '1', 'Simplysafe', 'VAT Reg', '123456789', '987654321', 'BIXOLON SRP-350II', 'x1C', 'Ctrl+F3', 'Ctrl+Shift+M', 'Ctrl+Shift+C', 'Ctrl+Shift+A', 'Ctrl+F11', 'Ctrl+F12', 'F4', 'F7', 'F9', 'F8', 'Ctrl+F1', 'Ctrl+F2', 'Ctrl+F10', 0, 'BIXOLON SRP-350II, BIXOLON SRP-350II', 0, 'info', 0, 1, 1, 0, 42, '462003', 'purchase_code', 'envato_username', '3.0.2.22', 0, 1, 1, '', 0, 0, 0, 0, 0, 0, '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_products`
--

CREATE TABLE IF NOT EXISTS `sma_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` char(255) NOT NULL,
  `unit` int(11) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) NOT NULL,
  `alert_quantity` decimal(15,4) DEFAULT '20.0000',
  `image` varchar(255) DEFAULT 'no_image.png',
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `cf1` varchar(255) DEFAULT NULL,
  `cf2` varchar(255) DEFAULT NULL,
  `cf3` varchar(255) DEFAULT NULL,
  `cf4` varchar(255) DEFAULT NULL,
  `cf5` varchar(255) DEFAULT NULL,
  `cf6` varchar(255) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `tax_rate` int(11) DEFAULT NULL,
  `track_quantity` tinyint(1) DEFAULT '1',
  `details` varchar(1000) DEFAULT NULL,
  `warehouse` int(11) DEFAULT NULL,
  `barcode_symbology` varchar(55) NOT NULL DEFAULT 'code128',
  `file` varchar(100) DEFAULT NULL,
  `product_details` text,
  `tax_method` tinyint(1) DEFAULT '0',
  `type` varchar(55) NOT NULL DEFAULT 'standard',
  `supplier1` int(11) DEFAULT NULL,
  `supplier1price` decimal(25,4) DEFAULT NULL,
  `supplier2` int(11) DEFAULT NULL,
  `supplier2price` decimal(25,4) DEFAULT NULL,
  `supplier3` int(11) DEFAULT NULL,
  `supplier3price` decimal(25,4) DEFAULT NULL,
  `supplier4` int(11) DEFAULT NULL,
  `supplier4price` decimal(25,4) DEFAULT NULL,
  `supplier5` int(11) DEFAULT NULL,
  `supplier5price` decimal(25,4) DEFAULT NULL,
  `promotion` tinyint(1) DEFAULT '0',
  `promo_price` decimal(25,4) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `supplier1_part_no` varchar(50) DEFAULT NULL,
  `supplier2_part_no` varchar(50) DEFAULT NULL,
  `supplier3_part_no` varchar(50) DEFAULT NULL,
  `supplier4_part_no` varchar(50) DEFAULT NULL,
  `supplier5_part_no` varchar(50) DEFAULT NULL,
  `sale_unit` int(11) DEFAULT NULL,
  `purchase_unit` int(11) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `mrp` decimal(25,4) NOT NULL,
  `hsn_code` varchar(100) DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `category_id` (`category_id`),
  KEY `id` (`id`),
  KEY `id_2` (`id`),
  KEY `category_id_2` (`category_id`),
  KEY `unit` (`unit`),
  KEY `brand` (`brand`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=822 ;

--
-- Dumping data for table `sma_products`
--

INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `mrp`, `hsn_code`, `is_featured`) VALUES
(4, 'HW1', 'Godrej, 6 Lever Mortise Lock Oliver', 4, '0.0000', '9000.0000', '5.0000', 'fd7cf095fad10d7bfc989e533ce1ac70.jpg', 3, 21, '', '', '', '', '', '', '-2.0000', 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(5, 'HW2', 'Harrison, Steel Eco. Round Padlocks, Enamled', 4, '0.0000', '330.0000', '5.0000', '836662ef2c37cb92bf62a5ca65dd00d8.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 3, '0.0000', NULL, 0),
(6, 'HW3', 'Shine Everest Mortise Door Lock, 1899', 4, '0.0000', '1899.0000', '5.0000', '4700d8789d89f1fe2c927823bccdd4f3.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 17, '0.0000', NULL, 0),
(7, 'HW4', 'Harrison Shutter Lock, Jama Security', 4, '0.0000', '600.0000', '5.0000', 'd50bfdfd3e6682484d44b2140f0b110c.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 3, '0.0000', NULL, 0),
(8, 'HW5', 'Kodia Mortice Lock Set, 4', 4, '0.0000', '1859.0000', '5.0000', '37cb72af6a10eb1a8c321bfc3cf1d6ef.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 5, '0.0000', NULL, 0),
(9, 'HW6', 'Kodia Engage Vacant Latch, 551', 4, '0.0000', '1021.0000', '5.0000', 'e5492de686b6e25d0d7b0b9bed0a647c.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 5, '0.0000', NULL, 0),
(10, 'HW7', 'Kodia Door Lock Double Turn 2 in 1', 4, '0.0000', '1826.0000', '5.0000', '7dcd6c5027adece9ec6f233f9dbc076d.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 5, '0.0000', NULL, 0),
(11, 'HW8', 'Harrison Shutter Lock, Jama Security', 4, '0.0000', '705.0000', '5.0000', 'ea5d33d33adb8d28e37251e61d9311a3.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 3, '0.0000', NULL, 0),
(12, 'HW9', 'Tens Cylinder Door Lock', 4, '0.0000', '458.0000', '5.0000', '38c66262cd66b02c872b577084a3f144.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 6, '0.0000', NULL, 0),
(13, 'HW10', 'Godrej, 65 mm, Cold Rolled Brass, Rekeyable Padlock, 3292', 4, '0.0000', '7369.0000', '5.0000', '7c27a4d8dbcc7c7fb8f1f7371278a9b2.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(14, 'HW11', 'Tublar Cylinder Lock With Ultra Brass Key', 4, '0.0000', '574.0000', '5.0000', '561541428e9a16599528e5b7e84f1052.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 7, '0.0000', NULL, 0),
(15, 'HW12', 'Harrison Premium Stainless Steel Computerized Key Padlock', 4, '0.0000', '720.0000', '5.0000', 'c3607c3c7a29bfc625f880fd1147540d.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 3, '0.0000', NULL, 0),
(16, 'HW13', 'Kodia Mortice Lock Double Turn, Bolt 2T', 4, '0.0000', '1404.0000', '5.0000', '3f1c16478ff19f6efe8e49eb630767c5.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 5, '0.0000', NULL, 0),
(17, 'HW14', 'Harrison Rolling Center Shutter Lock BT', 4, '0.0000', '890.0000', '5.0000', 'd1674fd5c4918bb8964486eb2a8366f4.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 3, '0.0000', NULL, 0),
(18, 'HW15', 'Bonus Multipurpose Lock, ML-100', 4, '0.0000', '164.0000', '5.0000', '4d6e1c7dac49e69aaab61293a895571e.jpg', 3, 21, '', '', '', '', '', '', '-3.0000', 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 0, '0.0000', NULL, 0),
(19, 'HW16', 'Harrison Cast Iron Pincylindrical Lock', 4, '0.0000', '371.0000', '5.0000', '3a5d5862cb969989bb2bca619ffbd2ba.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 3, '0.0000', NULL, 0),
(20, 'HW17', 'Godrej, Ultra Tribolt 1CK-Satin Nickel, Deadbolt Inside', 4, '0.0000', '6176.0000', '5.0000', 'f2b20c6da4dd8c613f5d5a1884ecc122.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(21, 'HW18', 'Godrej, 3KS Pentabolt 2C-Satin Nickel, Inside', 4, '0.0000', '8207.0000', '5.0000', '75221e0fa52ae4625829263af872636e.jpg', 3, 21, '', '', '', '', '', '', '-1.0000', 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(22, 'HW19', 'Harrison Shutter Lock, T-26 BCP', 4, '0.0000', '432.0000', '5.0000', '42f32221d7e5ee4c2667da6319474a1a.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 3, '0.0000', NULL, 0),
(23, 'HW20', 'Godrej, Pentabolt 2C-Antique Finish, Deadbolt', 4, '0.0000', '8499.0000', '5.0000', '83a107c8fcf5f507ab72ed9cd9ed835f.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(24, 'HW21', 'Harrison All Safe Iron Lock/Cupboard Lock With Computerised Key', 4, '0.0000', '437.0000', '5.0000', '102509f9922cf98fcbaaffc8093fdc15.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 3, '0.0000', NULL, 0),
(25, 'HW22', 'Godrej, Cylindrical Lock, Keyless', 4, '0.0000', '6000.0000', '5.0000', 'ad97f8e39699a45aa78996e99aa2e588.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(26, 'HW23', 'Harrison Godown Lock, 3T / UNO / Small', 4, '0.0000', '458.0000', '5.0000', '0de0f23e69b4e03840d135732423f248.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 3, '0.0000', NULL, 0),
(27, 'HW24', 'Harrison Premium Stainless Steel Computerized Key Padlock', 4, '0.0000', '999.0000', '5.0000', '814ebf93d33f6b24d60dde895d18e59f.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 3, '0.0000', NULL, 0),
(28, 'HW25', 'Godrej, 6 Lever Mortise Lock Matiz', 4, '0.0000', '9000.0000', '5.0000', '0eee8a423e12a8592f4f855a841762d1.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(29, 'HW26', 'Spider 40 mm Regular Pad Lock With 3 Key', 4, '0.0000', '78.0000', '5.0000', '0f0a96750773f683f77363630aa9b847.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 8, '0.0000', NULL, 0),
(30, 'HW27', 'Godrej, Ultra Tribolt 2C-Beige Brown, Inside', 4, '0.0000', '6582.0000', '5.0000', '6def682ba8a11cad6ddbc906aaff6d27.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(31, 'HW28', 'BRICK BULLET Pad Lock', 4, '0.0000', '241.0000', '5.0000', 'd3e7125060b314e006c0f4f42b52414b.jpg', 3, 21, '', '', '', '', '', '', '-2.0000', 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 9, '0.0000', NULL, 0),
(32, 'HW29', 'Godrej, Ultra Tribolt 2C-Satin Nickel, Deadbolt', 4, '0.0000', '7077.0000', '5.0000', '170eebf94a4973ed8daacbf03296ab9b.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(33, 'HW30', 'Harrison Brass Square Padlock', 4, '0.0000', '548.0000', '5.0000', '2a62b1ade7c91becdaba3637a07d99d1.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 3, '0.0000', NULL, 0),
(34, 'HW31', 'Shine Everest Mortise Door Lock', 4, '0.0000', '1799.0000', '5.0000', '027b83324efd730506ac3cd613b98b6f.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 17, '0.0000', NULL, 0),
(35, 'HW32', 'Harrison Premium Godown Latch Lock', 4, '0.0000', '768.0000', '5.0000', 'b6efcfb5f59f0b7e8187bdfa3da97c09.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 3, '0.0000', NULL, 0),
(36, 'HW33', 'Sewaup Cylindrical Mortice Lock Set', 4, '0.0000', '1670.0000', '5.0000', '1b75550c608ad2288049648ce0d7aadd.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 10, '0.0000', NULL, 0),
(37, 'HW34', 'Supreme Ivory C.P. Finish 4 key Computer Stroke Interlock', 4, '0.0000', '955.0000', '5.0000', 'b58bac2bc6c3a8f1502d9f0d91faca95.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 11, '0.0000', NULL, 0),
(38, 'HW35', 'Godrej, Ultra Tribolt 1CK-Satin Nickel', 4, '0.0000', '6200.0000', '5.0000', '6f1d664944ad2e370914f24c6953cae7.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(39, 'HW36', 'Godrej, 6 Lever Mortise Lock Victoria', 4, '0.0000', '8860.0000', '5.0000', '2005aafed6d204a316a7954f84b62e7f.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(40, 'HW37', 'Zaha Glass Door Lock', 4, '0.0000', '9730.0000', '5.0000', '8303de6d034bf884bcba4a2b8fbae98a.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 12, '0.0000', NULL, 0),
(41, 'HW38', 'Godrej, Ultra Veribolt 2C-Texture Brown', 4, '0.0000', '4939.0000', '5.0000', '93823fd3e73151d5f0676c8a5038c3e5.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(42, 'HW39', 'Godrej, 90mm, Stainless Steel, Disc Padlock', 4, '0.0000', '9000.0000', '5.0000', '9efe027615d47f664342285ea5e54ffb.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(43, 'HW40', 'Harrison Centre Shutter Lock', 4, '0.0000', '890.0000', '5.0000', '29690d9ca71651c5e66315587c4de35d.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 3, '0.0000', NULL, 0),
(44, 'HW41', 'Godrej, Pentabolt 1CK-Satin Nickel', 4, '0.0000', '7645.0000', '5.0000', 'ae9186174b45b86f0e57db9fab37ed92.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(45, 'HW42', 'Godrej, 65 mm, spl. Steel, Rekeyable Padlock', 4, '0.0000', '4800.0000', '5.0000', '842c83d6764d7a1a88679d8bef368c58.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(46, 'HW43', 'Godrej, Classic Lock Brass Keyed', 4, '0.0000', '9900.0000', '5.0000', '675cf229cbb2c810591eeb91d9833d81.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(47, 'HW44', 'Godrej, Legend Chrome 4 Lever Set', 4, '0.0000', '6722.0000', '5.0000', 'd5aed8adba6580ad1192a0f7a4d343e6.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(48, 'HW45', 'Spider 65 mm Cylindrical Pad Lock With 3 Brass Computer Keys', 4, '0.0000', '530.0000', '5.0000', 'e5dacab038bd0c0ddda17943eddf9cf3.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 8, '0.0000', NULL, 0),
(49, 'HW46', 'Spider Glass Door Lock Semi Circle With 3 Brass Wave Keys', 4, '0.0000', '1100.0000', '5.0000', '4af8d77dbec964e6021f551775f72a93.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 8, '0.0000', NULL, 0),
(50, 'HW47', 'Spider Ultra Multipurpose Locks', 4, '0.0000', '100.0000', '5.0000', '30a528a21b7a80cf8bae8c2bbb84125b.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 8, '0.0000', NULL, 0),
(51, 'HW48', 'Godrej, Ultra Veribolt 2C-Grey', 4, '0.0000', '4939.0000', '5.0000', '6cd566b8dbfce34b4d911537481025dd.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(52, 'HW49', 'Swet L- Knob', 4, '0.0000', '1306.0000', '5.0000', 'bb68bfdebf0e54fb771ecda546a01b2f.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 13, '0.0000', NULL, 0),
(53, 'HW50', 'Godrej, Altrix 2C - Royal Titanium', 4, '0.0000', '6199.0000', '5.0000', '8619007181035793f67b0a5d4c1a290e.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(54, 'HW51', 'Godrej, Ultra Twinbolt 2C-Satin Nickel Deadbolt', 4, '0.0000', '5450.0000', '5.0000', '7cd35c0626ca92debbb851b7d06feb39.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(55, 'HW52', 'Godrej, Pentabolt 2C-Antique Finish, Latchbolt', 4, '0.0000', '8499.0000', '5.0000', '022503820d494c5e8cf80757242b5fd1.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(56, 'HW53', 'Godrej, 70mm, Stainless Steel, Disc Padlock, Duralock', 4, '0.0000', '9000.0000', '5.0000', '8afee662483bc9cefe5e18e6972ba7c2.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(57, 'HW54', 'Godrej, Ultra Tribolt 2C-Satin Nickel', 4, '0.0000', '7077.0000', '5.0000', 'bd971f79067a9a0a4e8be23f1d2e002c.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(58, 'HW55', 'Godrej, 85 mm, Cold Rolled Brass, Rekeyable Padlock', 4, '0.0000', '6375.0000', '5.0000', 'eede1b599d355fc6fb711cacb567fcb3.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(59, 'HW56', 'Godrej, Cylindrical Lock, Keyed', 4, '0.0000', '6610.0000', '5.0000', 'deee9950f2c55dfb86a6f169c3cded9c.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(60, 'HW57', 'Harrison Shutter Lock, T-20', 4, '0.0000', '999.0000', '5.0000', '735ba3de13ed0eca0fe419d05965fc28.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 3, '0.0000', NULL, 0),
(61, 'HW58', 'Godrej, Antique Brass 2C-Deadbolt Carton', 4, '0.0000', '7189.0000', '5.0000', '85a1d522b3beb1eec9b6c2ebb430ddb2.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(62, 'HW59', 'Godrej, 3KS Pentabolt 2C-Satin Nickel, Deadbolt', 4, '0.0000', '8207.0000', '5.0000', '387474fedee94c120f78591c13e594c1.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(63, 'HW60', 'Stealodeal Alarm Padlock Safety Lock', 4, '0.0000', '599.0000', '5.0000', 'f3d1a88a70e7a0810405fc798bc955ba.jpeg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 14, '0.0000', NULL, 0),
(64, 'HW61', 'Kodia Cupboard Lock Long key with Solid Brass Locking Bolt', 4, '0.0000', '1000.0000', '5.0000', '549937a8ef97fe7f247ada96dfd72d83.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 5, '0.0000', NULL, 0),
(65, 'HW62', 'Harrison Shutter Lock, SC-2000', 4, '0.0000', '944.0000', '5.0000', '19849be0242417e195e3159fc6e1a931.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 3, '0.0000', NULL, 0),
(66, 'HW63', 'Godrej, Classic Lock Antique Brass, Keyless', 4, '0.0000', '9000.0000', '5.0000', '2084c7c3b3466b605204789648e0783b.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(67, 'HW64', 'Harrison Brass Square Padlock', 4, '0.0000', '485.0000', '5.0000', 'e5d608ac1b3ee857a2a426ea5e180075.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 3, '0.0000', NULL, 0),
(68, 'HW65', 'Sewaup Mortice Lock Set, Robo Vista with Super', 4, '0.0000', '1299.0000', '5.0000', '30273a891ea52f30118608e8d7994f97.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 10, '0.0000', NULL, 0),
(69, 'HW66', 'Godrej, Astro 1CK - Ruby Red', 4, '0.0000', '4399.0000', '5.0000', 'ac8d4fd2b8af8919d65435065093e4a4.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(70, 'HW67', 'Godrej, 50 mm, Cold Rolled Brass, Rekeyable Padlock', 4, '0.0000', '4332.0000', '5.0000', '216d50d4077881f1b95098656e0c3fb4.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(71, 'HW68', 'Godrej, Altrix 1CK - Royal Titanium', 4, '0.0000', '5512.0000', '5.0000', 'ae77c5bfd59f461d2e195fb92b033366.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(72, 'HW69', 'Kodia Pardar Dead Lock, Mild Steel', 4, '0.0000', '1804.0000', '5.0000', 'd29295cce63326b42573a4cc3fd5d7df.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 5, '0.0000', NULL, 0),
(73, 'HW70', 'Plaza Zinc Handle Mortise Lock 6 Lever 3 Keys With Micra', 4, '0.0000', '743.0000', '5.0000', 'd4b178dc6b30de846880a619e170b941.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 15, '0.0000', NULL, 0),
(74, 'HW71', 'Godrej, Ultra Tribolt 1CK-Satin Nickel', 4, '0.0000', '6200.0000', '5.0000', 'd7034a580a64141ee19ff380884e66a7.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(75, 'HW72', 'Godrej, Classic Lock - Wooden', 4, '0.0000', '9675.0000', '5.0000', '0f9d140a83aeea635617435ffb9051db.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(76, 'HW73', 'Godrej, Antique Brass1CK-Deadbolt Carton', 4, '0.0000', '6289.0000', '5.0000', '12c768d6313be0983a7ce1d0472f6038.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(77, 'HW74', 'Kodia Door Lock Bullet Double Turn 2 in 1', 4, '0.0000', '1716.0000', '5.0000', '47f8fab66857b747d8b4392f2fd1e89f.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 5, '0.0000', NULL, 0),
(78, 'HW75', 'Lalit Pad Door Lock', 4, '0.0000', '228.0000', '5.0000', '5269843f725f85341be4dd0a5b151cda.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 16, '0.0000', NULL, 0),
(79, 'HW76', 'Godrej, Ultra Latch Bolt 1CK-Beige Brown', 4, '0.0000', '8410.0000', '5.0000', '9cbc21271b319586d42e1f2634ad43c0.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(80, 'HW77', 'Godrej, Retrofit Adaptor Type B', 4, '0.0000', '4388.0000', '5.0000', 'e7e4f3d9506623f437fda5ffbdd26d8e.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(81, 'HW78', 'Godrej, 90mm, Stainless Steel, Disc Padlock', 4, '0.0000', '5288.0000', '5.0000', '3a6f64b96275509685cee54ae16530f1.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(82, 'HW79', 'Spider Cylindrical Cupboard Lock With 2 Brass Computer Keys', 4, '0.0000', '530.0000', '5.0000', '7aef7366e4197045270831095bd7fc1d.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 8, '0.0000', NULL, 0),
(83, 'HW80', 'Zaha Drawer Lock', 4, '0.0000', '259.0000', '5.0000', '654362ad47eb5804cc94efe00d5ef3ed.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 12, '0.0000', NULL, 0),
(84, 'HW81', 'Zaha S.S Door Magnet', 4, '0.0000', '235.0000', '5.0000', '333759c4b9ff7e11c586ebbb2a2040ac.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 12, '0.0000', NULL, 0),
(85, 'HW82', 'Spider Cylindrical Solid Brass Pad Lock 3Keys', 4, '0.0000', '700.0000', '5.0000', 'd5f7710287059ab063bd69b32abd8904.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 8, '0.0000', NULL, 0),
(86, 'HW83', 'Spider Steel Regular Pad Lock 3 Key', 4, '0.0000', '170.0000', '5.0000', '55ac9f50a36c874f52703c3710cb8368.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 8, '0.0000', NULL, 0),
(87, 'HW84', 'Godrej, Classic Lock Stainless Steel', 4, '0.0000', '9000.0000', '5.0000', '0f0116959407d1f505d60a1d1af77a8f.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(88, 'HW85', 'Godrej, Altrix 1CK - Royal Titanium, Deadbolt', 4, '0.0000', '5799.0000', '5.0000', '6e1bb58e247e89fb9c60316308ba2202.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(89, 'HW86', 'Kodia Inter Lock 3 Turn Pin Cylinder', 4, '0.0000', '1630.0000', '5.0000', 'abda492143e7e443dcac9f9438a5dd15.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 5, '0.0000', NULL, 0),
(90, 'HW87', 'Supreme Ivory C.P. Finish Jumbo Stroke Interlock', 4, '0.0000', '955.0000', '5.0000', '153b157ef18283a61aeceec46e19472b.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 11, '0.0000', NULL, 0),
(91, 'HW88', 'Spider Side Door Lock', 4, '0.0000', '380.0000', '5.0000', 'b4993f154185a66e63e46e71bcd22edc.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 8, '0.0000', NULL, 0),
(92, 'HW89', 'Harrison Brass Square Padlock', 4, '0.0000', '641.0000', '5.0000', '288a04aebb0f2c613d41254b421453e2.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 3, '0.0000', NULL, 0),
(93, 'HW90', 'Godrej, Ultra Sherlock', 4, '0.0000', '7313.0000', '5.0000', '3ab752c50df65919aad73b1ae48d04a4.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(94, 'HW91', 'Harrison Premium Round Padlock', 4, '0.0000', '834.0000', '5.0000', '42a28607f7b10ff19d97b63023b4e8b7.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 3, '0.0000', NULL, 0),
(95, 'HW92', 'Godrej, Astro 2C - Ruby Red', 4, '0.0000', '4699.0000', '5.0000', '5c2aa0a7a5021a6ebc1c9e624502846c.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(96, 'HW93', 'Shine Everest Mortise Door Lock', 4, '0.0000', '1849.0000', '5.0000', '9d99ba87ea2b6d18803a804e77783078.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 17, '0.0000', NULL, 0),
(97, 'HW94', 'Godrej, Ultra Latch Bolt 1CK - Beige Brown', 4, '0.0000', '10100.0000', '5.0000', '66b23965674ed89b58aaca3e1ed2e1c5.JPG', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(98, 'HW95', 'Godrej, Ultra Veribolt 1CK-Grey', 4, '0.0000', '4264.0000', '5.0000', 'e3bfbcff0e108a380f318ab6cd28aa6b.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(99, 'HW96', 'ACE Mortice Handle With Cyinder Lock', 4, '0.0000', '4673.0000', '5.0000', 'e4b849e04a3629c10d31bf7f58f5a103.jpg', 3, 21, '', '', '', '', '', '', '-4.0000', 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 18, '0.0000', NULL, 0),
(100, 'HW97', 'Godrej, Ultra Twinbolt 1CK-Satin Nickel', 4, '0.0000', '4850.0000', '5.0000', '55235b184aff687eb6b59ab8b38a718f.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(101, 'HW98', 'Godrej, 65 mm, Cold Rolled Brass, Rekeyable Padlock', 4, '0.0000', '6000.0000', '5.0000', 'fbd58d1e525ba9735d1d3772538bfcef.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(102, 'HW99', 'SUNLIGHT LOCKS Universal Lock', 4, '0.0000', '700.0000', '5.0000', 'ac684bbedeea990570dd83b1af14dff4.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 0, '0.0000', NULL, 0),
(103, 'HW100', 'JBS Mortise lock Handle', 4, '0.0000', '1053.0000', '5.0000', 'b3ecdc802ed6cace5f420d7171d96668.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 20, '0.0000', NULL, 0),
(104, 'HW101', 'Kodia Both Side Key Solid Brass Pin Cylinder Device', 4, '0.0000', '2248.0000', '5.0000', '8b6cdb2e51b0c350f3c53673c5a3c1d8.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 5, '0.0000', NULL, 0),
(105, 'HW102', 'Alloytek Milan', 4, '0.0000', '1465.0000', '5.0000', 'd8ad224809c1498c24638c6c1b0043b5.jpg', 3, 21, '', '', '', '', '', '', '-3.0000', 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 21, '0.0000', NULL, 0),
(106, 'HW103', 'SUNLIGHT LOCKS Xylo Bindas Lock', 4, '0.0000', '907.0000', '5.0000', '49290e0dc9cc0903eca4bbd87c10f936.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 0, '0.0000', NULL, 0),
(107, 'HW104', 'Godrej, 62 mm, Rekeyable Padlock', 4, '0.0000', '11245.0000', '5.0000', '9c4821522729efd24fea3a9b375db346.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(108, 'HW105', 'Harrison Furniture Lock 6L ALM Brass', 4, '0.0000', '315.0000', '5.0000', '0fca3f54499b9d31c631d06a843c4d1d.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 3, '0.0000', NULL, 0),
(109, 'HW106', 'Frontier Fence Barrier-20K', 4, '0.0000', '6400.0000', '5.0000', 'e9faf8985f890f67dd06ff6b77a02ef9.jpg', 4, 22, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 22, '0.0000', NULL, 0),
(110, 'HW107', 'Ishna Metal Mesh Hand Gloves', 4, '0.0000', '11846.0000', '5.0000', 'b5e94d03e38da984b7db56312c3161ae.jpg', 4, 22, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 23, '0.0000', NULL, 0),
(111, 'HW108', 'Frontier ECO Barrier', 4, '0.0000', '4400.0000', '5.0000', '24b9d4977fb2ebbfcdc68f8714384e6f.jpg', 4, 22, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 22, '0.0000', NULL, 0),
(112, 'HW109', 'PeepalComm Card Holder, E19S', 4, '0.0000', '499.0000', '5.0000', 'a90ffbf893f5ae0d43cb5da84ec1e65d.jpg', 4, 22, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 24, '0.0000', NULL, 0),
(113, 'HW110', 'Frontier Barricador - 1500', 4, '0.0000', '7100.0000', '5.0000', '884d92ebf2eeeb9f5d34cfa72afcefc7.jpg', 4, 22, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 22, '0.0000', NULL, 0),
(114, 'HW111', 'OSAKI Mini Metal Working Lathe', 4, '0.0000', '151467.0000', '5.0000', 'd5c1bc4c870face075d59ad55018bd64.jpg', 4, 22, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 25, '0.0000', NULL, 0),
(115, 'HW112', 'PeepalComm Card Holder, B46', 4, '0.0000', '599.0000', '5.0000', '42b00c80899da42a5015c0594939a1f1.jpg', 4, 22, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 24, '0.0000', NULL, 0),
(116, 'HW113', 'GREAVES Petrol Kerosene Engine', 4, '0.0000', '18354.0000', '5.0000', '9f83c2c97fe6bfb78fb408b41257c15a.jpg', 4, 22, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 26, '0.0000', NULL, 0),
(117, 'HW114', 'Labsol Concrete Test Hammer, WB 1035', 4, '0.0000', '10200.0000', '5.0000', 'f894152c68752b0adf4ed39266473bff.jpg', 4, 22, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 27, '0.0000', NULL, 0),
(118, 'HW115', 'Craftsman 6 Pieces Flat Wood Boring Drill Bit Set', 4, '0.0000', '326.0000', '5.0000', 'f2953a536b1c466cbcc0aa10c5f67939.jpg', 4, 22, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 28, '0.0000', NULL, 0),
(119, 'HW116', 'Dortel Folding Bracket, Brown', 4, '0.0000', '346.0000', '5.0000', '91d69f1aea5db1c4075e1f41dd06ef0a.jpg', 4, 23, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 29, '0.0000', NULL, 0),
(120, 'HW117', 'Dortel Adjustable Channel Bracket, Ivory', 4, '0.0000', '118.0000', '5.0000', '49708df213b468d1cb680ed63f5aa8ef.jpg', 4, 23, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 29, '0.0000', NULL, 0),
(121, 'HW118', 'Dortel S.S Adjustable Channel Bracket, S.S', 4, '0.0000', '160.0000', '5.0000', 'c03917659cbded95d939f7e3838d15ea.jpg', 4, 23, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 29, '0.0000', NULL, 0),
(122, 'HW119', 'Design Elite Steel Long Bracket', 4, '0.0000', '419.0000', '5.0000', 'cfb6897f1420715f6412c4ff7b946830.jpg', 4, 23, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 30, '0.0000', NULL, 0),
(123, 'HW120', 'ACE S Shaped Shelf Angle Bracket', 4, '0.0000', '329.0000', '5.0000', '5bf8a9135a87454e1e60566a9d69a56f.jpg', 4, 23, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 18, '0.0000', NULL, 0),
(124, 'HW121', 'Design Elite Steel F Bracket', 4, '0.0000', '192.0000', '5.0000', 'e0ce71448837c9fb048a75a217ad1e95.jpg', 4, 23, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 30, '0.0000', NULL, 0),
(125, 'HW122', 'Ankeet Mirror Cap', 4, '0.0000', '849.0000', '5.0000', 'd6f38ab8036c97f7b512ada9f21a292e.jpg', 4, 23, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 31, '0.0000', NULL, 0),
(126, 'HW123', 'KHS Stainless Steel Mirror Cap', 4, '0.0000', '1350.0000', '5.0000', 'd7f1dd8120e6dbe838b138c276420e92.jpg', 4, 23, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 32, '0.0000', NULL, 0),
(127, 'HW124', 'ACE S Shaped Shelf Angle Bracket', 4, '0.0000', '500.0000', '5.0000', '7138fd9d9e3ffd2159efc95153bb35a9.jpg', 4, 23, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 18, '0.0000', NULL, 0),
(128, 'HW125', 'KHS Chrome Mirror Cap', 4, '0.0000', '675.0000', '5.0000', '498fd376b1d1cb9153ce2f7a964022c2.jpg', 4, 23, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 32, '0.0000', NULL, 0),
(129, 'HW126', 'Shine Everest 350 mm Silver Drawer Channel, Pack of 30', 4, '0.0000', '6300.0000', '5.0000', '60d156f7e9e2d5d4f9f2f521340647e0.jpg', 5, 24, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 17, '0.0000', NULL, 0),
(130, 'HW127', 'Harrison Telescopic Ball Bearing Iron Slides, Zinc', 4, '0.0000', '432.0000', '5.0000', '275eb5e4b6ad77bfeac7e26a695b5f10.jpg', 5, 24, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 3, '0.0000', NULL, 0),
(131, 'HW128', 'Now & Ever Soft Close Channel Without Gallery', 4, '0.0000', '3000.0000', '5.0000', '92f9b2f1d7361e173ddffa367209e72b.jpg', 5, 24, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 33, '0.0000', NULL, 0),
(132, 'HW129', 'Shine Everest 750 mm Silver Drawer Channel, Pack of 30', 4, '0.0000', '13500.0000', '5.0000', '6d536481110bdf1229399097b490c81a.jpg', 5, 24, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 17, '0.0000', NULL, 0),
(133, 'HW130', 'Dortel Telescopic Ball Bearing Slide', 4, '0.0000', '170.0000', '5.0000', '1da8fce64e4d44d6b9fcf1ae8b5fb608.jpg', 5, 24, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 29, '0.0000', NULL, 0),
(134, 'HW131', 'Now & Ever Telescopic Channel', 4, '0.0000', '1000.0000', '5.0000', '5f5ddb41198a42f6598f706aac7c68e4.jpg', 5, 24, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 33, '0.0000', NULL, 0),
(135, 'HW132', 'Shine Everest 500 mm Silver Drawer Channel, Pack of 30', 4, '0.0000', '9000.0000', '5.0000', 'fce6b886c429fcae13a9fc02905cd563.jpg', 5, 24, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 17, '0.0000', NULL, 0),
(136, 'HW133', 'Shine Everest 300 mm Silver Drawer Channel, Pack of 30', 4, '0.0000', '5400.0000', '5.0000', '41ba6a54f1e4810ae5e2fce65fece898.jpg', 5, 24, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 17, '0.0000', NULL, 0),
(137, 'HW134', 'Dortel Telescopic Ball Bearing Slide, DTRS-001', 4, '0.0000', '238.0000', '5.0000', 'b3853bcc19bebcb3692b83cca47aeda0.jpg', 5, 24, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 29, '0.0000', NULL, 0),
(138, 'HW135', 'Shine Everest 600 mm Silver Drawer Channel, Pack of 30', 4, '0.0000', '10800.0000', '5.0000', 'c49bde1381e15b4bebade647eaeeabdf.jpg', 5, 24, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 17, '0.0000', NULL, 0),
(139, 'HW136', 'Black Bird MD 004 W/N Finish 8 Inch Main Door Handle', 4, '0.0000', '664.0000', '5.0000', '9d46c88677e4dcc6d6ff8bb668dd2073.jpg', 5, 25, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 34, '0.0000', NULL, 0),
(140, 'HW137', 'Koin Chrome Plated Cabinet Handles', 4, '0.0000', '176.0000', '5.0000', 'd7f6e091bbc7dda32fc5c90a81395985.jpg', 5, 25, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 35, '0.0000', NULL, 0),
(141, 'HW138', 'JBS 202 Grade H Type Pull Handle Finish', 4, '0.0000', '540.0000', '5.0000', '9b2bea43041ecd559d8a67f9d9b1e38c.jpg', 5, 25, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 20, '0.0000', NULL, 0);
INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `mrp`, `hsn_code`, `is_featured`) VALUES
(142, 'HW139', 'Harrison, Lotus Exclusive / Premium Cabinet Handles', 4, '0.0000', '1409.0000', '5.0000', '75861ce3beae20af24d1d23b614ab469.jpg', 5, 25, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 3, '0.0000', NULL, 0),
(143, 'HW140', 'Angel Smart Wardrobe Handle', 4, '0.0000', '749.0000', '5.0000', 'd88dcde12ce1cca916d3b0bedc6185d1.jpg', 5, 25, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 36, '0.0000', NULL, 0),
(144, 'HW141', 'Angel Champion Wardrobe Handle', 4, '0.0000', '623.0000', '5.0000', 'cc3a9dd9a4cd8b195e2f67b5ba580d84.jpg', 5, 25, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 36, '0.0000', NULL, 0),
(145, 'HW142', 'Angel Holesa tools', 4, '0.0000', '499.0000', '5.0000', 'b019aee8f9f37525d680d2a20b95aefb.jpg', 5, 25, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 36, '0.0000', NULL, 0),
(146, 'HW143', 'Koin Matt Type 5/8 New Hammer Cabinet Handle', 4, '0.0000', '128.0000', '5.0000', 'ff5f582c0a7710b0226c740b8ecce8f5.jpg', 5, 25, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 35, '0.0000', NULL, 0),
(147, 'HW144', 'Visko Handle', 4, '0.0000', '445.0000', '5.0000', '7dd0b0766df634a423739779eef3be2b.jpg', 5, 25, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 37, '0.0000', NULL, 0),
(148, 'HW145', 'Angel Wardrobe Handle', 4, '0.0000', '623.0000', '5.0000', '221a41982d4ea2a5e53cf3b1c1d6c226.jpg', 5, 25, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 36, '0.0000', NULL, 0),
(149, 'HW146', 'KOIN ANTIQUE TYPE HAMMER KNOB', 4, '0.0000', '520.0000', '5.0000', 'fcf7d3e511dd7b365dbba6122a47dec1.jpg', 5, 26, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 35, '0.0000', NULL, 0),
(150, 'HW147', 'Koin Chrome Plated L Knob Old Hammer', 4, '0.0000', '84.0000', '5.0000', 'e8bf263558963efb60df0ba9a37906ac.jpg', 5, 26, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 35, '0.0000', NULL, 0),
(151, 'HW148', 'Koin Chrome Plated L Knob', 4, '0.0000', '600.0000', '5.0000', '2948d0cf0a79103e876c4a7b1b942f95.jpg', 5, 26, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 35, '0.0000', NULL, 0),
(152, 'HW149', 'Koin Chrome Plated Hammer Knob', 4, '0.0000', '520.0000', '5.0000', '3d2fffb50355b266bf180acb4e156df4.jpg', 5, 26, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 35, '0.0000', NULL, 0),
(153, 'HW150', 'Koin Dual Type Watch Knob', 4, '0.0000', '250.0000', '5.0000', '7450ad9f0802770681fac437071a28ba.jpg', 5, 26, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 35, '0.0000', NULL, 0),
(154, 'HW151', 'Indian Shelf Multicolor Ceramic And Metal Knob', 4, '0.0000', '1134.0000', '5.0000', 'd932cb990842a1a1724d7111063cb68b.jpg', 5, 26, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 38, '0.0000', NULL, 0),
(155, 'HW152', 'Indian Shelf Black, White And Cream Ceramic And Metal Knob', 4, '0.0000', '1134.0000', '5.0000', 'b9b7f189fe752bd48b83a705230fb25a.jpg', 5, 26, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 38, '0.0000', NULL, 0),
(156, 'HW153', 'Koin Matt Type L Knob New Hammer', 4, '0.0000', '103.0000', '5.0000', 'fbf8a3287484822ce3627c8046439d44.jpg', 5, 26, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 35, '0.0000', NULL, 0),
(157, 'HW154', 'Indian Shelf Multicolor Ceramic And Metal Knob, KID-78-SL', 4, '0.0000', '1134.0000', '5.0000', '6331215d3f0d799e81e831861ac62dab.jpg', 5, 26, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 38, '0.0000', NULL, 0),
(158, 'HW155', 'Koin Clear Type Round Knob', 4, '0.0000', '82.0000', '5.0000', 'fa24ff23bc7f6fbf5702cab2e49cb331.jpg', 5, 26, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 35, '0.0000', NULL, 0),
(159, 'HW156', 'V-Tech Sliding Gate Opener', 4, '0.0000', '47196.0000', '5.0000', 'c505e5f1b97ec808723f5a9c04c6c71e.jpg', 6, 27, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 39, '0.0000', NULL, 0),
(160, 'HW157', 'Cnr Sliding Door Fitting', 4, '0.0000', '3622.0000', '5.0000', '69fceba769518d5c142478db96545350.jpg', 6, 27, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 40, '0.0000', NULL, 0),
(161, 'HW158', 'Define Matt Glass Sliding Fitting', 4, '0.0000', '2705.0000', '5.0000', '9d50b7be27adb4dc74b5d6a2f1331300.jpg', 6, 27, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 180, '0.0000', NULL, 0),
(162, 'HW159', 'INSTA Sliding System Wall Mounted', 4, '0.0000', '31350.0000', '5.0000', '1248be68bf78d057e2d4f2abc9bd7cab.jpg', 6, 27, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 41, '0.0000', NULL, 0),
(163, 'HW160', 'Define Matt Glass Sliding Door Roller', 4, '0.0000', '2636.0000', '5.0000', 'fc1d378399dc51cb51ca84eae651261e.jpg', 6, 27, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 180, '0.0000', NULL, 0),
(164, 'HW161', 'INSTA Point Fixed Glass Fittings', 4, '0.0000', '5130.0000', '5.0000', '62402c58ef06404c34ce9eb1565e196e.jpg', 6, 27, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 41, '0.0000', NULL, 0),
(165, 'HW162', 'Define Matt Glass Sliding Fitting, DF-GSF-011 A', 4, '0.0000', '4567.0000', '5.0000', '70161bcfe1178cde55cc8c2298129601.jpg', 6, 27, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 180, '0.0000', NULL, 0),
(166, 'HW163', 'INSTA Motion Gate Sliding System With Channel & Handle', 4, '0.0000', '15390.0000', '5.0000', '0cad4532219adb96481e2d7c9bae1ea5.jpg', 6, 27, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 41, '0.0000', NULL, 0),
(167, 'HW164', 'Bharat Stainless Steel Glass Fitting, 12 inch', 4, '0.0000', '5175.0000', '5.0000', '44d680189868e27da3383ba1d4de97b3.jpg', 6, 27, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 42, '0.0000', NULL, 0),
(168, 'HW165', 'Cnr Sliding Door Track', 4, '0.0000', '4347.0000', '5.0000', 'f00901f1fa4f8a573d96b510f3500224.jpg', 6, 27, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 40, '0.0000', NULL, 0),
(169, 'HW166', 'Universal Hydraulic Floor Spring', 4, '0.0000', '3658.0000', '5.0000', '86b169e403c4b8d812b375f879b47066.jpg', 6, 28, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 43, '0.0000', NULL, 0),
(170, 'HW167', 'Dortel Floor Spring (Double Spring), Silver', 4, '0.0000', '4810.0000', '5.0000', '43fafec4880316ec976ff77c7f7713e5.jpg', 6, 28, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 29, '0.0000', NULL, 0),
(171, 'HW168', 'Dortel Floor Spring (Single Spring), Silver', 4, '0.0000', '2646.0000', '5.0000', 'c8ce922ef0a0896e9ab4f5493d2c72dc.jpg', 6, 28, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 29, '0.0000', NULL, 0),
(172, 'HW169', 'Vetta Floor Spring with Double cylinder', 4, '0.0000', '5186.0000', '5.0000', 'a793fda741401b48b0332f8cde9de74f.jpg', 6, 28, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 44, '0.0000', NULL, 0),
(173, 'HW170', 'Vetta Floor Spring', 4, '0.0000', '4398.0000', '5.0000', 'ea28dd20548d9a7b29c8e966c365d90c.jpg', 6, 28, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 44, '0.0000', NULL, 0),
(174, 'HW171', 'Dormaster Floor Hinge', 4, '0.0000', '1968.0000', '5.0000', '001623fb3dc39385cc595cc213b2cb39.jpg', 6, 28, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 45, '0.0000', NULL, 0),
(175, 'HW172', 'Dorset Floor Spring', 4, '0.0000', '11340.0000', '5.0000', 'ce2f6ba8066e7846cb8f63eb52bd25ab.jpg', 6, 28, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 46, '0.0000', NULL, 0),
(176, 'HW173', 'Dorset Floor Spring, FS-6080', 4, '0.0000', '8180.0000', '5.0000', 'ae44630037d98b5b2e703d6b698edf72.jpg', 6, 28, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 46, '0.0000', NULL, 0),
(177, 'HW174', 'Dorset Floor Spring, FS-6120', 4, '0.0000', '9000.0000', '5.0000', '421380faeb54f45bc6dc806fe049f89a.jpg', 6, 28, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 46, '0.0000', NULL, 0),
(178, 'HW175', 'Define Floor Spring, DF-FS-904', 4, '0.0000', '6718.0000', '5.0000', '29b762d485e9ed5133785f970802d46b.jpg', 6, 28, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 180, '0.0000', NULL, 0),
(179, 'HW176', 'JBS 202 Grade L Type Wall to Glass Connector Shine Finish', 4, '0.0000', '135.0000', '5.0000', '587bf3f584e157033a4a8b75a7f4eaaf.jpg', 6, 29, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 20, '0.0000', NULL, 0),
(180, 'HW177', 'JBS 202 Grade U Type Glass Connector Matt Finish', 4, '0.0000', '121.0000', '5.0000', '97c5f7c66d00c4b174ed143527e25479.jpg', 6, 29, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 20, '0.0000', NULL, 0),
(181, 'HW178', 'JBS 202 Grade L Type Glass to Glass Connector Matt Finish', 4, '0.0000', '162.0000', '5.0000', 'e6c72eab22c4e3c4d5c73995f0583a21.jpg', 6, 29, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 20, '0.0000', NULL, 0),
(182, 'HW179', 'JBS 202 Grade Glass to Glass Connector Matt Finish', 4, '0.0000', '148.0000', '5.0000', '72970e33b108ce294d86dc68bfbbf295.jpg', 6, 29, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 20, '0.0000', NULL, 0),
(183, 'HW180', 'JBS 304 Grade Glass to Glass Connector Shine Finish', 4, '0.0000', '310.0000', '5.0000', '3cb0a5c74ae75fe89576b346d631e651.jpg', 6, 29, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 20, '0.0000', NULL, 0),
(184, 'HW181', 'JBS 304 Grade U Type Glass Connector Matt Finish', 4, '0.0000', '229.0000', '5.0000', 'f1476abca082528be4a4d626662052fa.jpg', 6, 29, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 20, '0.0000', NULL, 0),
(185, 'HW182', 'JBS 304 Grade L Type Wall to Glass Connector Shine Finish', 4, '0.0000', '243.0000', '5.0000', '9d231bf0da108c10bf6ee5a7c59c3ea2.jpg', 6, 29, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 20, '0.0000', NULL, 0),
(186, 'HW183', 'JBS 202 Plate Grade Pivot Glass Connector with SS Knob Shine Finish', 4, '0.0000', '121.0000', '5.0000', '001800ab5bceb9f67b8fa8374766a131.jpg', 6, 29, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 20, '0.0000', NULL, 0),
(187, 'HW184', 'JBS 202 Grade L Type Wall to Glass Connector Matt Finish', 4, '0.0000', '121.0000', '5.0000', '25146c055706699b1ba2566bdfbc3615.jpg', 6, 29, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 20, '0.0000', NULL, 0),
(188, 'HW185', 'JBS 304 Grade L Type Glass to Glass Connector Shine Finish', 4, '0.0000', '310.0000', '5.0000', 'ef754ffbf82fa8540724cbd8f50bcf6d.jpg', 6, 29, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 20, '0.0000', NULL, 0),
(189, 'HW186', 'Koin Matt Type Main Glass Door Handles', 4, '0.0000', '3360.0000', '5.0000', 'b240e582db2a6d7dee30ea86a8751e14.jpg', 6, 30, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 35, '0.0000', NULL, 0),
(190, 'HW187', 'Koin Chrome Plated Main Glass Door Handles', 4, '0.0000', '3120.0000', '5.0000', '5930b64a3816f9d59a790eea0ed49af4.jpg', 6, 30, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 35, '0.0000', NULL, 0),
(191, 'HW188', 'Koin Dual Type Main Glass Door Handles', 4, '0.0000', '2640.0000', '5.0000', 'ce66a6fb2ae0fb5b26594743a0860743.jpg', 6, 30, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 35, '0.0000', NULL, 0),
(192, 'HW189', 'Koin Antique Type Main Glass Door Handles', 4, '0.0000', '7900.0000', '5.0000', '59727ce910c22bf4cc3b201833a75dfe.jpg', 6, 30, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 35, '0.0000', NULL, 0),
(193, 'HW190', 'Koin Antique Type Main Glass Door Handles, KH 1042', 4, '0.0000', '3120.0000', '5.0000', '0b58b58a49038410186cd00c16c040e8.jpg', 6, 30, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 35, '0.0000', NULL, 0),
(194, 'HW191', 'Koin Matt Type Main Glass Door Handles', 4, '0.0000', '3360.0000', '5.0000', 'cade138ae212b01ee168c39fa61318f1.jpg', 6, 30, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 35, '0.0000', NULL, 0),
(195, 'HW192', 'Koin Matt Type Main Glass Door Handles, KH 1025', 4, '0.0000', '3360.0000', '5.0000', '6251684cc81aa95a253b827902042804.jpg', 6, 30, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 35, '0.0000', NULL, 0),
(196, 'HW193', 'Koin Antique Type Main Glass Door Handles, KH 1005', 4, '0.0000', '5900.0000', '5.0000', '2a2534f9961268a34bd025604d9807f5.jpg', 6, 30, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 35, '0.0000', NULL, 0),
(197, 'HW194', 'Koin Matt Type Main Glass Door Handles, KH 1064', 4, '0.0000', '2400.0000', '5.0000', '7720a6c42a56ef1c87e21f9eaa851cea.jpg', 6, 30, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 35, '0.0000', NULL, 0),
(198, 'HW195', 'Koin Chrome Plated Main Glass Door Handles, KH 1061', 4, '0.0000', '2640.0000', '5.0000', '289caef6003f4109cd592aee2cd5e4f8.jpg', 6, 30, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 35, '0.0000', NULL, 0),
(199, 'HW196', 'Koin Plain Patta 1.25 inch Chrome Plated Main Glass Door Handles', 4, '0.0000', '1920.0000', '5.0000', 'dcfbf0d570a33a8f8f59ddd7491d219c.jpg', 6, 30, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 35, '0.0000', NULL, 0),
(200, 'HW197', 'Dortel Over Panel Top Patch', 4, '0.0000', '866.0000', '5.0000', '31439dec2598099c69e1916ca7fa807b.jpg', 6, 31, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 29, '0.0000', NULL, 0),
(201, 'HW198', 'Godrej, Pivot Plate', 4, '0.0000', '5325.0000', '5.0000', '3640f557cde164264371863af03e8bce.jpg', 6, 31, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(202, 'HW199', 'Godrej, Top Patch', 4, '0.0000', '9500.0000', '5.0000', 'd1c9ec394eba0a6a8692e450c9db1d28.jpg', 6, 31, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(203, 'HW200', 'Godrej, Top Patch with Pivot', 4, '0.0000', '9500.0000', '5.0000', 'dd1eb7102df0bbbf1abf093e2ca64201.jpg', 6, 31, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(204, 'HW201', 'Godrej, Bottom Patch', 4, '0.0000', '9282.0000', '5.0000', 'f5e3dbba3c9f2adea159fcccca990837.jpg', 6, 31, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(205, 'HW202', 'Hanfas Perma-Fit', 4, '0.0000', '1227.0000', '5.0000', '1d37f6bb05780cd2410fca255667b726.jpg', 6, 31, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 47, '0.0000', NULL, 0),
(206, 'HW203', 'KLAZVYN Bottom Patch', 4, '0.0000', '1350.0000', '5.0000', '8bab066c665d86194ab043e3113f6e70.jpg', 6, 31, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 48, '0.0000', NULL, 0),
(207, 'HW204', 'Godrej, L Connect Patch', 4, '0.0000', '8719.0000', '5.0000', '6a8366dab4cf7a9a353a6ad1023f16a4.jpg', 6, 31, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(208, 'HW205', 'Mexx Anti Brass Fitting', 4, '0.0000', '8655.0000', '5.0000', '3bd548dcc5a29d347ddabd79323ceb33.jpg', 6, 31, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 49, '0.0000', NULL, 0),
(209, 'HW206', 'Hart Fin Type Four Way Spider without Routel With Glossy Finish', 4, '0.0000', '23310.0000', '5.0000', '322324e9d1459f027433384b7d3b2c0e.jpg', 6, 31, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 50, '0.0000', NULL, 0),
(210, 'HW207', 'YURI 14 Inch Green Cut Off Wheel 355 x 2.5 x 25.4 mm', 4, '0.0000', '3436.0000', '5.0000', '8fe5487ccbdac9ec8179b20e187c0890.jpg', 7, 32, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 51, '0.0000', NULL, 0),
(211, 'HW208', 'Bosch 14 Inch Chopsaw Wheel 355 x 3 x 25.4 mm', 4, '0.0000', '3520.0000', '5.0000', 'd4eb2a4e3cf9d44a01463beb42cd49e1.jpg', 7, 32, '', '', '', '', '', '', '-1.0000', 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 52, '0.0000', NULL, 0),
(212, 'HW209', 'Dewalt 14 Inch Chop Saw Wheel 355 x 2.8 x 25.4 mm', 4, '0.0000', '226.0000', '5.0000', '09c820addc492b7496fa984760d8b079.jpg', 7, 32, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 53, '0.0000', NULL, 0),
(213, 'HW210', 'Dewalt 14 Inch Chop Saw Wheel 355 x 2.8 x 25.4 mm', 4, '0.0000', '4500.0000', '5.0000', 'f3cb44c5e3a3362bfc2e6a5375212d98.jpg', 7, 32, '', '', '', '', '', '', '-1.0000', 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 53, '0.0000', NULL, 0),
(214, 'HW211', 'Hitachi 14 Inch Chop Saw Wheels 702114, 355 x 2 8 x 25 mm', 4, '0.0000', '7350.0000', '5.0000', '105aec81d7e6f508b35634885655c7b4.jpg', 7, 32, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 54, '0.0000', NULL, 0),
(215, 'HW212', 'Bosch 14" Chop Saw Wheels, 355 x 2 8 x 25 4 mm', 4, '0.0000', '3300.0000', '5.0000', 'b60a990138365aab462fe7c85f123f02.jpg', 7, 32, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 52, '0.0000', NULL, 0),
(216, 'HW213', 'Hitachi 14 Inch Chop Saw Wheels 702114, 355 x 2 8 x 25 mm', 4, '0.0000', '7350.0000', '5.0000', '5ad14020dd198728055aca86365d26e8.jpg', 7, 32, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 54, '0.0000', NULL, 0),
(217, 'HW214', 'Bosch 14" Chop Saw Wheels, 355 x 3 x 25 4 mm', 4, '0.0000', '3796.0000', '5.0000', 'faae610c12e511fb799602cbd68ce43e.jpg', 7, 32, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 52, '0.0000', NULL, 0),
(218, 'HW215', 'CUMI POWER 14 Inch Chopsaw Wheel 350 x 2.8 x 25.4 mm', 4, '0.0000', '1450.0000', '5.0000', '3bb4f36cf757466b1edb61e73110d098.jpg', 7, 32, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 182, '0.0000', NULL, 0),
(219, 'HW216', 'Norton 14 Inch Chopsaw Wheels 350 x 3 x 25.4 mm', 4, '0.0000', '1032.0000', '5.0000', '251b89c0ea849a8e0e1834eca609e9fe.jpg', 7, 32, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 55, '0.0000', NULL, 0),
(220, 'HW217', 'Norton Vitrified Toolroom Wheels, Size: 150 x 100 x 3175mm, V133', 4, '0.0000', '3765.0000', '5.0000', '791a7b3bfa81ea15d64146dcb2a66e6b.jpg', 7, 33, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 55, '0.0000', NULL, 0),
(221, 'HW218', 'Universal Resin Bond Diamond Grinding Flat Wheel', 4, '0.0000', '1477.0000', '5.0000', '7703987b3d349cbb7d9dbde2301da12b.jpg', 7, 33, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 43, '0.0000', NULL, 0),
(222, 'HW219', 'Universal Resin Bond Diamond Grinding Radius Wheel', 4, '0.0000', '1532.0000', '5.0000', 'f7572c65fca8ef232f166a47ff8f2d1e.jpg', 7, 33, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 43, '0.0000', NULL, 0),
(223, 'HW220', 'Norton Carbide Grinding Wheel, V538, Size: 250 x 25 x 31.75 mm', 4, '0.0000', '2073.0000', '5.0000', 'd4c4e27a4a29771295e9d560f888d2ba.jpg', 7, 33, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 55, '0.0000', NULL, 0),
(224, 'HW221', 'Topline 12 Inch Fine Thread And Gear Grinding Wheel 300 x 25 x 31.75 mm', 4, '0.0000', '5644.0000', '5.0000', 'bbeaedc948f298308f70b65817816210.jpg', 7, 33, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 56, '0.0000', NULL, 0),
(225, 'HW222', 'Topline 12 Inch Coarse Thread And Gear Grinding Wheel 300 x 25 x 50.8 mm', 4, '0.0000', '5644.0000', '5.0000', '7ec5b52dd9a2702093c121b6a7a75f51.jpg', 7, 33, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 56, '0.0000', NULL, 0),
(226, 'HW223', 'Topline 10 Inch Coarse Thread And Gear Grinding Wheel 250 x 25 x 31.75 mm', 4, '0.0000', '6530.0000', '5.0000', 'ef688665daf65dc3a43b6a3bf72cd7b8.jpg', 7, 33, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 56, '0.0000', NULL, 0),
(227, 'HW224', 'Topline 12 Inch Thread And Gear Grinding Wheel 300 x 50 x 76.2 mm', 4, '0.0000', '5663.0000', '5.0000', '332ca6345df55bc65c8b7609b2ec5db8.jpg', 7, 33, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 56, '0.0000', NULL, 0),
(228, 'HW225', 'Topline 12 Inch Thread And Gear Grinding Wheel 300 x 40 x 50.8 mm', 4, '0.0000', '5145.0000', '5.0000', '904ee636e2c158cc7f9ceb56b436b160.jpg', 7, 33, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 56, '0.0000', NULL, 0),
(229, 'HW226', 'Topline 10 Inch Fine Thread And Gear Grinding Wheel 250 x 25 x 31.75 mm', 4, '0.0000', '6530.0000', '5.0000', '44596b0517eb73dca7d0497af5c93450.jpg', 7, 33, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 56, '0.0000', NULL, 0),
(230, 'HW227', 'Jet Top Cutter With Sleeve', 4, '0.0000', '117.0000', '5.0000', '8eb1f4b8d1bcfc77c6b8a1bbb2171a71.jpg', 8, 34, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 57, '0.0000', NULL, 0),
(231, 'HW228', 'SBC Wire Stripper And Cutter, GY10434', 4, '0.0000', '9137.0000', '5.0000', 'cf4148b22f318b81ec2fc3e93a0dc1c7.jpg', 8, 34, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 58, '0.0000', NULL, 0),
(232, 'HW229', 'Dell Iron Jack Plane', 4, '0.0000', '475.0000', '5.0000', '287535394c79f1aeac4f1965e0d4974b.jpg', 8, 34, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 59, '0.0000', NULL, 0),
(233, 'HW230', 'Anant Tools A5 Adjustable Iron Plane', 4, '0.0000', '1200.0000', '5.0000', 'b050163191d87de9859723aa0f926939.jpg', 8, 34, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 60, '0.0000', NULL, 0),
(234, 'HW231', 'Yamoto Wheel Lock Retractable Blade Trimming Knife', 4, '0.0000', '959.0000', '5.0000', '8043d409fef6dd4820ebbb376924f729.jpg', 8, 34, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 61, '0.0000', NULL, 0),
(235, 'HW232', 'Stanley Snap-Off Knife With Dynagrip', 4, '0.0000', '2700.0000', '5.0000', '002e3abc7cbae50945e0b3e8aa753ea2.jpg', 8, 34, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 62, '0.0000', NULL, 0),
(236, 'HW233', 'Kennedy Bi-Material Grip Offset Scissors', 4, '0.0000', '285.0000', '5.0000', '6785ff0fac0939db10a0fd4f712b183c.jpg', 8, 34, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 63, '0.0000', NULL, 0),
(237, 'HW234', 'Usha Retail Garden Cutter tool', 4, '0.0000', '326.0000', '5.0000', '7212e9ba67c75334f37d9cf5ee58ebcb.jpg', 8, 34, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 64, '0.0000', NULL, 0),
(238, 'HW235', 'Miranda HSS-All Hard Power Hacksaw Blades', 4, '0.0000', '2700.0000', '5.0000', '815926e60ba6e4b52d192c25ec6a2ef1.jpg', 8, 34, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 65, '0.0000', NULL, 0),
(239, 'HW236', 'Stanley Mini Hacksaw, 20-807, Blade Size: 254 mm/10 inch', 4, '0.0000', '174.0000', '5.0000', '2b3836413d3a5a36a93229db177db216.jpg', 8, 34, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 62, '0.0000', NULL, 0),
(240, 'HW237', 'Taparia Adjustable Spanner Design 167097, Phosphate Finish', 4, '0.0000', '9380.0000', '5.0000', '40accdf18e9d50e98dfea0d649ff6bdf.jpg', 8, 35, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 66, '0.0000', NULL, 0),
(241, 'HW238', 'Snap N Grip Multipurpose Wrench', 4, '0.0000', '2100.0000', '5.0000', 'c6b7a75777d4ec3754bcc2282645fdce.jpg', 8, 35, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 183, '0.0000', NULL, 0),
(242, 'HW239', 'Stanley Adjustable Spanner', 4, '0.0000', '315.0000', '5.0000', 'c614771433ff558087ab810af1472752.jpg', 8, 35, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 62, '0.0000', NULL, 0),
(243, 'HW240', 'TATA AGRICO Stillson Type Pipe Wrench', 4, '0.0000', '266.0000', '5.0000', 'e2f1194b9d113ee5affaf75160f33359.jpg', 8, 35, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 181, '0.0000', NULL, 0),
(244, 'HW241', 'Ketsy 3 Pcs Pipe Wrench', 4, '0.0000', '1400.0000', '5.0000', '2835e84687a0378704177230a85c462e.jpg', 8, 35, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 67, '0.0000', NULL, 0),
(245, 'HW242', 'Goodyear Ratchet Pipe Threader Set', 4, '0.0000', '2600.0000', '5.0000', '4eba9ab2476b55dd9a6e9f6afb29004a.jpg', 8, 35, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 68, '0.0000', NULL, 0),
(246, 'HW243', 'Eastman Round Head Ratchet Handle with Quick Release - CRV, E-2204, Size: 1/2 Inch, Length: 250 mm', 4, '0.0000', '3775.0000', '5.0000', '39f363042f4820adef1b44e91a396657.jpg', 8, 35, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 69, '0.0000', NULL, 0),
(247, 'HW244', 'Mac Master Standard Type Click Torque Wrench', 4, '0.0000', '3800.0000', '5.0000', 'fe81407bf3a3c38309bf85ec6cd32a36.jpg', 8, 35, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 70, '0.0000', NULL, 0),
(248, 'HW245', 'Mac Master Ratchet Type Click Torque Wrench', 4, '0.0000', '3400.0000', '5.0000', 'bb25865a0cd84f60b7f3922485f815c0.jpg', 8, 35, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 70, '0.0000', NULL, 0),
(249, 'HW246', 'Norbar Hand Torque Multiplier', 4, '0.0000', '383449.0000', '5.0000', '730b10e0a5456571cc84523669fd66e6.jpg', 8, 35, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 71, '0.0000', NULL, 0),
(250, 'HW247', 'Imported(by Bizinto) Drill 10mm + 6HSS Bits + 1 Masonry Bit Combo', 4, '0.0000', '2499.0000', '5.0000', '9af3c3cc05c43738f0b4cd619b3f654a.jpg', 9, 36, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 160, '0.0000', NULL, 0),
(251, 'HW248', 'Planet Power Drill / Screw Driver with Reverse Forward Function, 350 W, 750 RPM', 4, '0.0000', '3350.0000', '5.0000', '7d77ed7c2c13d3263e93c7ee5b548f84.jpg', 9, 36, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 72, '0.0000', NULL, 0),
(252, 'HW249', 'Planet Power PD6VR Drill Machine with reverse Forward function', 4, '0.0000', '1850.0000', '5.0000', 'fcb7bb8ddd81a180dd4853d5f7db577f.jpg', 9, 36, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 72, '0.0000', NULL, 0),
(253, 'HW250', 'Buildskill BED1100 Electric Drill 10 mm, 300 W, 2600 RPM + 6 HSS + 1 Masonary Bit', 4, '0.0000', '1599.0000', '5.0000', 'f395d0453db0a83d00c66bc5a11b21b0.jpg', 9, 36, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 73, '0.0000', NULL, 0),
(254, 'HW251', 'Planet Power PH22 Rotary Hammer Drill 800W', 4, '0.0000', '9800.0000', '5.0000', '86bf8429e7ca803af1833ecd33b33097.jpg', 9, 36, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 72, '0.0000', NULL, 0),
(255, 'HW252', 'Powermaxx ID 600 E Hammer Dril, 600 W', 4, '0.0000', '1645.0000', '5.0000', '1bd6bf267eec9d25379f8dfab81fbaf9.jpg', 9, 36, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 74, '0.0000', NULL, 0),
(256, 'HW253', 'Planet Power PDH - 1000 Orange Hammer Drill 1000W', 4, '0.0000', '21900.0000', '5.0000', '0f0468c77987a17491fc39d59387a11a.jpg', 9, 36, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 72, '0.0000', NULL, 0),
(257, 'HW254', 'KPT KPT563 Hammer Drill 13mm, 550W, 1200 RPM', 4, '0.0000', '3935.0000', '5.0000', 'c3e818ec5fb3ce04933f9fd43ce4be31.jpg', 9, 36, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 75, '0.0000', NULL, 0),
(258, 'HW255', 'Hitachi DV16V Impact Drill 16mm, 590 W, 2900 RPM', 4, '0.0000', '4800.0000', '5.0000', 'd324d28fd04b72a7515aae884ea4803b.jpg', 9, 36, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 54, '0.0000', NULL, 0),
(259, 'HW256', 'Yking 2323B Impact Drill, 10 mm, 2800 RPM ,750 W', 4, '0.0000', '1950.0000', '5.0000', '750654564ec045d2e012fafbfa97ef02.jpg', 9, 36, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 76, '0.0000', NULL, 0),
(260, 'HW257', 'FERM TSM1033 Table Saw Machine 250mm', 4, '0.0000', '39750.0000', '5.0000', '1a1b12dd9b8eb540c69e705440705ced.jpg', 9, 37, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 0, '0.0000', NULL, 0),
(261, 'HW258', 'SKIL 4170 Jig Saw, 400 W, 3000 SPM', 4, '0.0000', '3350.0000', '5.0000', '0245a17c8e3b616d1c73cde28925a916.jpg', 9, 37, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 185, '0.0000', NULL, 0),
(262, 'HW259', 'Powermaxx JI600 Variable Spees Jigsaw, 3000 RPM, 600 W', 4, '0.0000', '1971.0000', '5.0000', '604ada5ea35e1dd4362ff226bc917532.jpg', 9, 37, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 74, '0.0000', NULL, 0),
(263, 'HW260', 'Black & Decker KS600E Jig Saw 450W, 0-3000 spm', 4, '0.0000', '3185.0000', '5.0000', 'a52046196f81fa7d5fb558a5faf223c9.jpg', 9, 37, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 77, '0.0000', NULL, 0),
(264, 'HW261', 'Bosch GKS 190 Circular Saw 184mm, 1400W, 5500 RPM', 4, '0.0000', '8768.0000', '5.0000', '7bc12ef23fcfc34ef07bc702517b3f22.jpg', 9, 37, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 52, '0.0000', NULL, 0),
(265, 'HW262', 'Planet Power PCS 7 Circular Saw 185mm, 1200W, 4900 rpm', 4, '0.0000', '5450.0000', '5.0000', 'a2aa52130e45b3fbc66c21ba1692ea30.jpg', 9, 37, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 72, '0.0000', NULL, 0),
(266, 'HW263', 'Bosch GKS 7000 Circular Saw 184 mm, 1100 W, 5200 RPM', 4, '0.0000', '6061.0000', '5.0000', 'cc1f49e965388c4af0188fff69017ceb.jpg', 9, 37, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 52, '0.0000', NULL, 0),
(267, 'HW264', 'Bosch GCO 200 Cut-Off Saw 355 mm, 2000 W, 3800 RPM', 4, '0.0000', '14200.0000', '5.0000', 'cd22781ba716d6603892924bd20fe471.jpg', 9, 37, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 52, '0.0000', NULL, 0),
(268, 'HW265', 'Dewalt D28720 Chop Saw , 2300 W, 3800 rpm, 355 mm', 4, '0.0000', '15240.0000', '5.0000', '245a180eb27d52ee789c97d986aaa56e.jpg', 9, 37, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 53, '0.0000', NULL, 0),
(269, 'HW266', 'Dawer Mitre Saw, DW913', 4, '0.0000', '8024.0000', '5.0000', '088da95197de8ea69e04bfcfdf6974af.jpg', 9, 37, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 0, '0.0000', NULL, 0),
(270, 'HW267', 'Cheston CHB-40 Air Blower 650 W', 4, '0.0000', '1919.0000', '5.0000', 'b8c49f2d8fed3a859b27e59cd31c719b.jpg', 9, 38, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 78, '0.0000', NULL, 0),
(271, 'HW268', 'Cheston Max Air Blower, 500W, 13000 RPM', 4, '0.0000', '1799.0000', '5.0000', '15b172496e0132fdc71646440ef566dc.jpg', 9, 38, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 78, '0.0000', NULL, 0),
(272, 'HW269', 'SKIL 8600 Air Blower, 600W', 4, '0.0000', '2450.0000', '5.0000', '98b3e47364e6418bae227a735c46d482.jpg', 9, 38, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 185, '0.0000', NULL, 0),
(273, 'HW270', 'Cheston Super Air Blower, 650 W', 4, '0.0000', '2099.0000', '5.0000', 'c8d0d745690cd672670cf2f177c5ff76.jpg', 9, 38, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 78, '0.0000', NULL, 0),
(274, 'HW271', 'Jon Ciaz JC-1399 Air Blower With Safety Glasses', 4, '0.0000', '2050.0000', '5.0000', '23552e8f8e7311091a1939cf61afdba6.jpg', 9, 38, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 79, '0.0000', NULL, 0),
(275, 'HW272', 'CUMI CB1 300 Air Blower 325 W', 4, '0.0000', '2350.0000', '5.0000', '8fa99894326245cbbfd3b36243d7e9e2.jpg', 9, 38, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 182, '0.0000', NULL, 0),
(276, 'HW273', 'Ralli Wolf NWB Portable Industrial Blower 350W', 4, '0.0000', '8935.0000', '5.0000', '6c65c513fdf38d0ade7b46c1572d4826.jpg', 9, 38, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 0, '0.0000', NULL, 0);
INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `mrp`, `hsn_code`, `is_featured`) VALUES
(277, 'HW274', 'Micro Set No. 14 Electric Blower', 4, '0.0000', '3800.0000', '5.0000', 'c4079090d9ada80f0b302f27556c4fb5.jpg', 9, 38, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 0, '0.0000', NULL, 0),
(278, 'HW275', 'STIHL Mist Blowers, SR 450', 4, '0.0000', '32654.0000', '5.0000', '74b2b73a271a61a9b71bb149abb1f03e.jpg', 9, 38, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 0, '0.0000', NULL, 0),
(279, 'HW276', 'SEM CM 200 S2 Air Blower, 60 W, 2750 RPM, 900 cmh', 4, '0.0000', '8404.0000', '5.0000', '94d751bd6bc48515f473f8c7ded9a2de.jpg', 9, 38, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 0, '0.0000', NULL, 0),
(280, 'HW277', 'GRAVITY 100 kg Platform Weighing Scales', 4, '0.0000', '7763.0000', '5.0000', '63983415b66054b5016d567500882851.jpg', 10, 39, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 80, '0.0000', NULL, 0),
(281, 'HW278', 'GRAVITY 20 kg Weighing Machine, Eco GT5 - 20', 4, '0.0000', '3500.0000', '5.0000', '6bd3b4f3ee85dd8f12c5dd56cc7eadfc.jpg', 10, 39, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 80, '0.0000', NULL, 0),
(282, 'HW279', 'Stealodeal Ts200 V Electronic Multipurpose 10kg Weighing Scale', 4, '0.0000', '999.0000', '5.0000', 'd51a9c60afb9da59fb8b81ad1416342c.jpeg', 10, 39, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 14, '0.0000', NULL, 0),
(283, 'HW280', 'Honda Table Top Weighing Scale, HTT-6K', 4, '0.0000', '2970.0000', '5.0000', '9dfe68406bf0a36e4946a501eb851185.jpg', 10, 39, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 184, '0.0000', NULL, 0),
(284, 'HW281', 'Venus Manual Body Weight Weighing Scale', 4, '0.0000', '1790.0000', '5.0000', 'c9ed80d3fdb795c2a3124cea8e7880a9.jpg', 10, 39, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 81, '0.0000', NULL, 0),
(285, 'HW282', 'Pinaacle Stainless Steel Platform Weighing Scale, 100 kg, 500 x 500 mm', 4, '0.0000', '7680.0000', '5.0000', 'ea3d6272cceaa2b8211b9deb959bb473.jpg', 10, 39, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 82, '0.0000', NULL, 0),
(286, 'HW283', 'Turbo Table Top Weighing Scale With Front & Back Display, 200 x 250 mm, 15 kg', 4, '0.0000', '3800.0000', '5.0000', '0a1c598d7a3e72a973d358e27e8e3bd8.jpg', 10, 39, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 0, '0.0000', NULL, 0),
(287, 'HW284', 'Swisser Table Top Weighing Scale', 4, '0.0000', '11902.0000', '5.0000', 'a51fb41c4ca0f4cf8a2546d12a0e613c.jpg', 10, 39, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 186, '0.0000', NULL, 0),
(288, 'HW285', 'TULA 5 g Table Top Weighing Scale', 4, '0.0000', '4213.0000', '5.0000', '7fbb87e413a007c0948987accffb0ad9.jpg', 10, 39, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 83, '0.0000', NULL, 0),
(289, 'HW286', 'Kerro Digital Precision Scale For Jewelry', 4, '0.0000', '6780.0000', '5.0000', '6412d20a446701547ac181342629ea09.jpg', 10, 39, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 84, '0.0000', NULL, 0),
(290, 'HW287', 'Imported 150 mm Digital Vernier Caliper', 4, '0.0000', '1199.0000', '5.0000', '319491e352ee92dc70cc17bced29867c.jpg', 10, 40, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 0, '0.0000', NULL, 0),
(291, 'HW288', 'Aerospace Digimatic Vernier Caliper, 0-150 mm', 4, '0.0000', '1974.0000', '5.0000', '9e3e483a8083dd39fc7d4764bd219e74.jpg', 10, 40, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 85, '0.0000', NULL, 0),
(292, 'HW289', 'Insize Digital Caliper 1108-150', 4, '0.0000', '2468.0000', '5.0000', '8fe10a8bac15fe99a928d77bf39bb205.jpg', 10, 40, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 187, '0.0000', NULL, 0),
(293, 'HW290', 'Aerospace Digimatic Vernier Caliper, 0-200 mm', 4, '0.0000', '2594.0000', '5.0000', 'd21c964be42a5f3edf75b9e980859ffb.jpg', 10, 40, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 85, '0.0000', NULL, 0),
(294, 'HW291', 'Aerospace Digimatic Vernier Caliper, 0-300 mm', 4, '0.0000', '4441.0000', '5.0000', '16a1529be993cc71447769c8d0adfb83.jpg', 10, 40, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 85, '0.0000', NULL, 0),
(295, 'HW292', 'Insize Digital Caliper 1112-200', 4, '0.0000', '2922.0000', '5.0000', '7033022bf660f02e2e692aaefac3212b.jpeg', 10, 40, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 187, '0.0000', NULL, 0),
(296, 'HW293', 'Imported Digital Vernier Caliper, 0-300 mm', 4, '0.0000', '3800.0000', '5.0000', 'f4b2ca66845dfc034d60de9bb714eead.jpg', 10, 40, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 0, '0.0000', NULL, 0),
(297, 'HW294', 'Insize Digital Caliper, 1112-150', 4, '0.0000', '2191.0000', '5.0000', '43b70b315b68678976e2f0ea85c6e431.jpeg', 10, 40, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 187, '0.0000', NULL, 0),
(298, 'HW295', 'MGW Precision Levels, Size: 200 x 200 mm, PLF 200', 4, '0.0000', '18000.0000', '5.0000', 'cb5fb4e5abbb2bb51f97b887d9e8e7b5.jpg', 10, 40, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 86, '0.0000', NULL, 0),
(299, 'HW296', 'MGW Outside Micrometers', 4, '0.0000', '6125.0000', '5.0000', '56ebc706df93729b5dd427980b19ea37.jpg', 10, 40, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 86, '0.0000', NULL, 0),
(300, 'HW297', 'LPS M4X16 Hex Head Bolt-Pack Of 200', 4, '0.0000', '876.0000', '5.0000', '7603e4a1b0485ba254f1ce057a73845c.jpg', 11, 41, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 87, '0.0000', NULL, 0),
(301, 'HW298', 'LPS M4X20 Hex Head Bolt-Pack Of 200', 4, '0.0000', '886.0000', '5.0000', 'f1f41e9ca2d0b0d00e1e57100ae6aeb0.jpg', 11, 41, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 87, '0.0000', NULL, 0),
(302, 'HW299', 'Pooja Forge M5X20 Hexagonal Head Bolt-Pack of 100', 4, '0.0000', '103.0000', '5.0000', 'cef79c1dd88879b4383c1fc924142201.jpg', 11, 41, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 88, '0.0000', NULL, 0),
(303, 'HW300', 'Pooja Forge M5X22 Hexagonal Head Bolt-Pack of 100', 4, '0.0000', '110.0000', '5.0000', '737894f86bdae0587ffa428da385fabe.jpg', 11, 41, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 88, '0.0000', NULL, 0),
(304, 'HW301', 'Pooja Forge M6X8 Flange Bolt-Pack of 100', 4, '0.0000', '121.0000', '5.0000', '2d010fd6ee5a8e76218ee9a1f0b60545.jpg', 11, 41, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 88, '0.0000', NULL, 0),
(305, 'HW302', 'Pooja Forge M6X10 Flange Bolt-Pack of 100', 4, '0.0000', '128.0000', '5.0000', '5d4d9ffa92b3c93bc26409cc5e46c3bf.jpg', 11, 41, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 88, '0.0000', NULL, 0),
(306, 'HW303', 'Unbrako M8X20 Durlok Bolt-Pack of 200', 4, '0.0000', '5276.0000', '5.0000', 'c5dd447f5d150c8c2234af7eca25e320.jpg', 11, 41, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 89, '0.0000', NULL, 0),
(307, 'HW304', 'Unbrako M8X25 Durlok Bolt-Pack of 200', 4, '0.0000', '5816.0000', '5.0000', 'ed8e7ca730e1e28b0e1db29453d779f0.jpg', 11, 41, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 89, '0.0000', NULL, 0),
(308, 'HW305', 'Unbrako M4X10 Hex Head Bolt-Pack of 500', 4, '0.0000', '1265.0000', '5.0000', '07145b30e1cc4ee2f9bcefdef67151d7.jpg', 11, 41, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 89, '0.0000', NULL, 0),
(309, 'HW306', 'Unbrako M4X12 Hex Head Bolt-Pack of 500', 4, '0.0000', '1310.0000', '5.0000', '4e2d0a7cb287231e7201d5b8e22240fb.jpg', 11, 41, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 89, '0.0000', NULL, 0),
(310, 'HW307', 'Unbrako M16X40 High Strength Structural Bolt-Pack of 25', 4, '0.0000', '1017.0000', '5.0000', 'fc10715c70f50905dfae43a9b523b254.jpg', 11, 41, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 89, '0.0000', NULL, 0),
(311, 'HW308', 'Unbrako M16X45 High Strength Structural Bolt-Pack of 25', 4, '0.0000', '1107.7500', '5.0000', '48d9aeb9f6c742fb47bff9d3e48c46ad.jpg', 11, 41, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 89, '0.0000', NULL, 0),
(312, 'HW309', 'LPS M3X10 Hex Head Bolt-Pack Of 200', 4, '0.0000', '728.0000', '5.0000', '52befe88d396c14aaad4563a02ae9e44.jpg', 11, 41, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 87, '0.0000', NULL, 0),
(313, 'HW310', 'LPS M3X20 Hex Head Bolt-Pack Of 200', 4, '0.0000', '772.0000', '5.0000', '9f936538737d9ed5b1f0aa3baf4a9521.jpg', 11, 41, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 87, '0.0000', NULL, 0),
(314, 'HW311', 'LPS M5X0.8 Hex Nut-Pack Of 1000', 4, '0.0000', '1050.0000', '5.0000', '1c17f7361926060ab10cdc80d1786f38.jpg', 11, 42, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 87, '0.0000', NULL, 0),
(315, 'HW312', 'Unbrako M6 Durlok Nut-Pack of 200', 4, '0.0000', '1530.0000', '5.0000', '51cb41e2b647cbe87980e39698d24163.jpg', 11, 42, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 89, '0.0000', NULL, 0),
(316, 'HW313', 'Unbrako M8 Durlok Nut-Pack of 200', 4, '0.0000', '2300.0000', '5.0000', '333e40f7f14995b1af777b451f14eb6e.jpg', 11, 42, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 89, '0.0000', NULL, 0),
(317, 'HW314', 'Unbrako M4X0.7 Hex Nut-Pack of 1000', 4, '0.0000', '800.0000', '5.0000', '485e4e136bc31ac6017dc87f3ccbf967.jpg', 11, 42, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 89, '0.0000', NULL, 0),
(318, 'HW315', 'Unbrako M5X0.8 Hex Nut-Pack of 700', 4, '0.0000', '700.0000', '5.0000', '9fb042d42a823e299c03482587fb042a.jpg', 11, 42, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 89, '0.0000', NULL, 0),
(319, 'HW316', 'Unbrako M6 Nylock Nut-Pack of 500', 4, '0.0000', '845.0000', '5.0000', '444898568eac7d5f0b34750f3b3660e2.jpg', 11, 42, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 89, '0.0000', NULL, 0),
(320, 'HW317', 'Unbrako M10 Nylock Nut-Pack of 200', 4, '0.0000', '1338.0000', '5.0000', 'a74228957efcfef04354c24015604f7e.jpg', 11, 42, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 89, '0.0000', NULL, 0),
(321, 'HW318', 'Unbrako M6 Hexagonal Weld Nut-Pack of 500', 4, '0.0000', '615.0000', '5.0000', '17d1a90271e1ba97f2984233f888f54f.jpg', 11, 42, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 89, '0.0000', NULL, 0),
(322, 'HW319', 'Unbrako M8 Hexagonal Weld Nut-Pack of 200', 4, '0.0000', '470.0000', '5.0000', 'db961044ce060621fd4948f794e9acd0.jpg', 11, 42, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 89, '0.0000', NULL, 0),
(323, 'HW320', 'Unbrako M18 Heavy Hex Nut-Pack of 100', 4, '0.0000', '2495.0000', '5.0000', 'e15d33e658dd65eebec6f24db8634d92.jpg', 11, 42, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 89, '0.0000', NULL, 0),
(324, 'HW321', 'Pooja Forge M5X8 Socket Head Screw-Pack of 100', 4, '0.0000', '80.0000', '5.0000', '9fd09725d483145e7f09074cdd2752e8.jpg', 11, 43, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 88, '0.0000', NULL, 0),
(325, 'HW322', 'Pooja Forge M5X10 Socket Head Screw-Pack of 100', 4, '0.0000', '90.0000', '5.0000', 'ed68858791492b17a22bc5926c41bec3.jpg', 11, 43, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 88, '0.0000', NULL, 0),
(326, 'HW323', 'Pooja Forge M5X12 Socket Head Screw-Pack of 100', 4, '0.0000', '98.0000', '5.0000', '1fa228718c400c450824ec649ac69fb8.jpg', 11, 43, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 88, '0.0000', NULL, 0),
(327, 'HW324', 'Pooja Forge M5X14 Socket Head Screw-Pack of 100', 4, '0.0000', '102.0000', '5.0000', '66b5e0880dbe8c84988db95c84b156f4.jpg', 11, 43, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 88, '0.0000', NULL, 0),
(328, 'HW325', 'Pooja Forge M5X15 Socket Head Screw-Pack of 100', 4, '0.0000', '108.0000', '5.0000', '5249ce3d1f6087103f6d5e1a2b22ab18.jpg', 11, 43, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 88, '0.0000', NULL, 0),
(329, 'HW326', 'Pooja Forge M5X16 Socket Head Screw-Pack of 100', 4, '0.0000', '115.0000', '5.0000', 'b000f8b1b06ba5ab317f831fcab6ff94.jpg', 11, 43, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 88, '0.0000', NULL, 0),
(330, 'HW327', 'Pooja Forge M5X18 Socket Head Screw-Pack of 100', 4, '0.0000', '125.0000', '5.0000', '98c6c2969dd2f5cdf3a4d2d198cd9c36.jpg', 11, 43, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 88, '0.0000', NULL, 0),
(331, 'HW328', 'Pooja Forge M5X20 Socket Head Screw-Pack of 100', 4, '0.0000', '134.0000', '5.0000', '96f2298b3cc56f65a32ec1d9acdfc2b1.jpg', 11, 43, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 88, '0.0000', NULL, 0),
(332, 'HW329', 'Pooja Forge M6X10 Socket Head Screw-Pack of 100', 4, '0.0000', '141.0000', '5.0000', '2d2924c0f91ac74de2d4a51a8c7b3dfb.jpg', 11, 43, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 88, '0.0000', NULL, 0),
(333, 'HW330', 'Pooja Forge M5X22 Socket Head Screw-Pack of 100', 4, '0.0000', '147.0000', '5.0000', '8cec7d638ffff0f1b3e81e9d32b72cff.jpg', 11, 43, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 88, '0.0000', NULL, 0),
(334, 'HW331', 'Unbrako M3X28 Dowel Pins-Pack Of 40', 4, '0.0000', '793.6000', '5.0000', 'f53bf768595d238c45066308aee2f05a.jpg', 11, 44, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 89, '0.0000', NULL, 0),
(335, 'HW332', 'Unbrako M2X18 Dowel Pins-Pack Of 40', 4, '0.0000', '793.6000', '5.0000', 'cbf528aea36dbe583d700b0a05cf785a.jpg', 11, 44, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 89, '0.0000', NULL, 0),
(336, 'HW333', 'Unbrako M3X18 Dowel Pins-Pack Of 40', 4, '0.0000', '793.6000', '5.0000', 'd1cba3744240a0b61b042a9a138c8f7f.jpg', 11, 44, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 89, '0.0000', NULL, 0),
(337, 'HW334', 'Unbrako M2X10 Dowel Pins-Pack Of 40', 4, '0.0000', '793.6000', '5.0000', '4eb6f8c64d632a8daf3e0d1646041cf8.jpg', 11, 44, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 89, '0.0000', NULL, 0),
(338, 'HW335', 'Unbrako M3X12 Dowel Pins-Pack Of 40', 4, '0.0000', '793.6000', '5.0000', 'c3152a37719bbd4f125f8b11831815fd.jpg', 11, 44, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 89, '0.0000', NULL, 0),
(339, 'HW336', 'Unbrako M2X20 Dowel Pins-Pack Of 40', 4, '0.0000', '793.6000', '5.0000', 'c7723966b4d4c61714fdf1b72fa8fba4.jpg', 11, 44, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 89, '0.0000', NULL, 0),
(340, 'HW337', 'Unbrako M3X20 Dowel Pins-Pack Of 40', 4, '0.0000', '793.6000', '5.0000', '1d358e0a3efa40cfd817a0877f41c312.jpg', 11, 44, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 89, '0.0000', NULL, 0),
(341, 'HW338', 'Unbrako M2X16 Dowel Pins-Pack Of 40', 4, '0.0000', '793.6000', '5.0000', '4daa4c8c44d12e0fe739ea878010e2e2.jpg', 11, 44, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 89, '0.0000', NULL, 0),
(342, 'HW339', 'Unbrako M2X12 Dowel Pins-Pack Of 40', 4, '0.0000', '793.6000', '5.0000', '6f55c4b20197e3472628955f10fe1ea1.jpg', 11, 44, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 89, '0.0000', NULL, 0),
(343, 'HW340', 'Unbrako M3X16 Dowel Pins-Pack Of 40', 4, '0.0000', '793.6000', '5.0000', 'a32ffdaa3d655071f3190fac90c198d3.jpg', 11, 44, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 89, '0.0000', NULL, 0),
(344, 'HW341', 'LPS Metrix Hexagon Wrench Set', 4, '0.0000', '338.0000', '5.0000', '36aa110b81aedb5eef6321b7ff8bf1da.jpg', 11, 45, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 87, '0.0000', NULL, 0),
(345, 'HW342', 'LPS Inch Hexagon Wrench Set', 4, '0.0000', '354.0000', '5.0000', '6d7ec5dde69a5791d36116bec03e48cc.jpg', 11, 45, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 87, '0.0000', NULL, 0),
(346, 'HW343', 'Unbrako 9 Pcs Metric Hex Wrench Set', 4, '0.0000', '330.0000', '5.0000', '86ce6928a899e4fba0f6614794a4ea62.jpg', 11, 45, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 89, '0.0000', NULL, 0),
(347, 'HW344', 'Unbrako 10 Pcs Inch Hex Wrench Set', 4, '0.0000', '347.0000', '5.0000', 'ede927d4a4dc5eca9c08459a52374f79.jpg', 11, 45, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 89, '0.0000', NULL, 0),
(348, 'HW345', 'Unbrako 1/16" Hexagon Wrench (Pack Of 100)', 4, '0.0000', '1065.0000', '5.0000', 'ece54a33b35c5390a04e55255de9a4d0.jpg', 11, 45, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 89, '0.0000', NULL, 0),
(349, 'HW346', 'Unbrako 2mm Hexagon Wrench (Pack Of 100)', 4, '0.0000', '1065.0000', '5.0000', '55fea5b7b465234af1eb09916a95f5f3.jpg', 11, 45, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 89, '0.0000', NULL, 0),
(350, 'HW347', 'Unbrako 2.5mm Hexagon Wrench (Pack Of 100)', 4, '0.0000', '1065.0000', '5.0000', 'ec340ba540b0c548102c93cc92111103.jpg', 11, 45, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 89, '0.0000', NULL, 0),
(351, 'HW348', 'Unbrako 1.5mm Hexagon Wrench (Pack Of 100)', 4, '0.0000', '1065.0000', '5.0000', '56ee6bb9a96bf7fe07a2ae33ad3e75fd.jpg', 11, 45, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 89, '0.0000', NULL, 0),
(352, 'HW349', 'LPS 2.5mm Hexagon Wrench', 4, '0.0000', '1067.0000', '5.0000', '84d532d14bc1a69705fe4bd80155b133.jpg', 11, 45, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 87, '0.0000', NULL, 0),
(353, 'HW350', 'LPS 1.5mm Hexagon Wrench', 4, '0.0000', '1067.0000', '5.0000', 'c6c055c9f127f92f55b6a82d4570fc0b.jpg', 11, 45, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 87, '0.0000', NULL, 0),
(354, 'HW351', 'ICFS FD 6x30 mm Only Plug without Screw-Pack of 100', 4, '0.0000', '126.0000', '5.0000', 'b58230668557c2c0e14990253ef2d0d4.jpg', 11, 46, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 90, '0.0000', NULL, 0),
(355, 'HW352', 'ICFS FD 5x25 mm Only Plug without Screw-Pack of 100', 4, '0.0000', '126.0000', '5.0000', 'abab48c62d88d3936329d63d15a85e79.jpg', 11, 46, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 90, '0.0000', NULL, 0),
(356, 'HW353', 'ICFS FD 8x40 mm Only Plug without Screw-Pack of 100', 4, '0.0000', '252.0000', '5.0000', '968978d1ab286d1c9a14e477706deb68.jpg', 11, 46, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 90, '0.0000', NULL, 0),
(357, 'HW354', 'ICFS Drop in Anchor M 10x40 mm-Pack of 50', 4, '0.0000', '500.0000', '5.0000', '69e97b1f03f50a5b093e95c55ad74c1f.jpg', 11, 46, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 90, '0.0000', NULL, 0),
(358, 'HW355', 'ICFS FD 4x20 mm Only Plug without Screw-Pack of 200', 4, '0.0000', '504.0000', '5.0000', 'b4857af4e5a6a6a801f239fab1937694.jpg', 11, 46, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 90, '0.0000', NULL, 0),
(359, 'HW356', 'ICFS NYLON HAMMER FIXING PLUG 6x60 mm-Pack of 100', 4, '0.0000', '600.0000', '5.0000', '5db38542ce01c6431f51f14523f15e38.jpg', 11, 46, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 90, '0.0000', NULL, 0),
(360, 'HW357', 'ICFS Drop in Anchor M 8x30 mm-Pack of 100', 4, '0.0000', '700.0000', '5.0000', 'fca0045c0ba0bb6a70005f02f053e88b.jpg', 11, 46, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 90, '0.0000', NULL, 0),
(361, 'HW358', 'ICFS 1k Assembly Foam 750 ml', 4, '0.0000', '754.0000', '5.0000', '7670eb21269ab6a2685948a40f428a64.jpg', 11, 46, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 90, '0.0000', NULL, 0),
(362, 'HW359', 'ICFS NYLON HAMMER FIXING PLUG 6x80 mm-Pack of 100', 4, '0.0000', '800.0000', '5.0000', '9d796add424de4a35a139252df0e5448.jpg', 11, 46, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 90, '0.0000', NULL, 0),
(363, 'HW360', 'ICFS NYLON HAMMER FIXING PLUG 8x60 mm-Pack of 100', 4, '0.0000', '800.0000', '5.0000', '4cec0c3fd3dee41f4297e8c2706d2f93.jpg', 11, 46, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 90, '0.0000', NULL, 0),
(364, 'HW361', 'ARB Deep Groove Ball Bearing-607-ZZ', 4, '0.0000', '30.0000', '5.0000', '556d165475ef7b119092ecc14c434d51.jpg', 12, 47, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 91, '0.0000', NULL, 0),
(365, 'HW362', 'ARB Deep Groove Ball Bearing-627-ZZ', 4, '0.0000', '30.0000', '5.0000', 'a8f927a4506af4b242ab0e85207ec317.jpg', 12, 47, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 91, '0.0000', NULL, 0),
(366, 'HW363', 'ARB Deep Groove Ball Bearing-608-ZZ', 4, '0.0000', '30.0000', '5.0000', '874882f401747cb845f07b3a2a0ea593.jpg', 12, 47, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 91, '0.0000', NULL, 0),
(367, 'HW364', 'ARB Deep Groove Ball Bearing-6000', 4, '0.0000', '33.0000', '5.0000', '2398e3f97b6ba3a668d1c81dde276921.jpg', 12, 47, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 91, '0.0000', NULL, 0),
(368, 'HW365', 'ARB Deep Groove Ball Bearing-628-ZZ', 4, '0.0000', '34.0000', '5.0000', '1873af689ca1d5624abb7aee7898b87c.jpg', 12, 47, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 91, '0.0000', NULL, 0),
(369, 'HW366', 'ARB Deep Groove Ball Bearing-609-ZZ', 4, '0.0000', '35.0000', '5.0000', '2017a918b42fbb16e6aab77e5551ea38.jpg', 12, 47, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 91, '0.0000', NULL, 0),
(370, 'HW367', 'ARB Deep Groove Ball Bearing-629-ZZ', 4, '0.0000', '36.0000', '5.0000', '2c11b96b4e8cf673cb12d615a54a7519.jpg', 12, 47, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 91, '0.0000', NULL, 0),
(371, 'HW368', 'ARB Deep Groove Ball Bearing-6000-ZZ', 4, '0.0000', '40.0000', '5.0000', '0aa82e841294df1ef81791e4bc28e961.jpg', 12, 47, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 91, '0.0000', NULL, 0),
(372, 'HW369', 'ARB Deep Groove Ball Bearing-6000-RS', 4, '0.0000', '40.0000', '5.0000', 'abbf38aa045b17c449cc4192c59e25bb.jpg', 12, 47, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 91, '0.0000', NULL, 0),
(373, 'HW370', 'ARB Deep Groove Ball Bearing-6001', 4, '0.0000', '45.0000', '5.0000', 'b13cc9c6c56e3642ace044441e165072.jpg', 12, 47, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 91, '0.0000', NULL, 0),
(374, 'HW371', 'ARB Taper Roller Bearing-30202', 4, '0.0000', '167.0000', '5.0000', 'e91c4619f9e10e9e9b9a820097cdca1f.jpg', 12, 48, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 91, '0.0000', NULL, 0),
(375, 'HW372', 'ARB Taper Roller Bearing-30203', 4, '0.0000', '178.0000', '5.0000', '64e862744370e925c1bcf37c7ea549de.jpg', 12, 48, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 91, '0.0000', NULL, 0),
(376, 'HW373', 'ARB Taper Roller Bearing-LM-11949/LM-11910', 4, '0.0000', '190.0000', '5.0000', '9180f9b203557ee7e7285523671d48c8.jpg', 12, 48, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 91, '0.0000', NULL, 0),
(377, 'HW374', 'ARB Taper Roller Bearing-30204', 4, '0.0000', '195.0000', '5.0000', 'e1b19e1e7668cd199e7605cabd4cb1f7.jpg', 12, 48, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 91, '0.0000', NULL, 0),
(378, 'HW375', 'ARB Taper Roller Bearing-LM-11749/LM-11710', 4, '0.0000', '195.0000', '5.0000', 'b3c521f0be4e96b965c752989e7a6ef1.jpg', 12, 48, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 91, '0.0000', NULL, 0),
(379, 'HW376', 'ARB Taper Roller Bearing-30302', 4, '0.0000', '195.0000', '5.0000', '18866f97b4901bcfbf17941101794f18.jpg', 12, 48, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 91, '0.0000', NULL, 0),
(380, 'HW377', 'ARB Taper Roller Bearing-32204', 4, '0.0000', '198.0000', '5.0000', '8815c6536213d74daf61927dd77d078d.jpg', 12, 48, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 91, '0.0000', NULL, 0),
(381, 'HW378', 'ARB Taper Roller Bearing-32004X', 4, '0.0000', '200.0000', '5.0000', '9acca8b80d0d13d17faafd034ce8a72c.jpg', 12, 48, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 91, '0.0000', NULL, 0),
(382, 'HW379', 'ARB Taper Roller Bearing-30205', 4, '0.0000', '200.0000', '5.0000', '824ff91743e49de45846aa29e35f387f.jpg', 12, 48, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 91, '0.0000', NULL, 0),
(383, 'HW380', 'ARB Taper Roller Bearing-L-44649/L-44610', 4, '0.0000', '205.0000', '5.0000', '31dc2b5625c49cb78b4c8c021ae6b397.jpg', 12, 48, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 91, '0.0000', NULL, 0),
(384, 'HW381', 'ARB Thrust Bearing-51105', 4, '0.0000', '64.0000', '5.0000', 'a069a457d45b09697440f843944863bb.jpg', 12, 49, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 91, '0.0000', NULL, 0),
(385, 'HW382', 'ARB Thrust Bearing-51107', 4, '0.0000', '117.0000', '5.0000', 'a271f21188ca22ffdb7904b81ddd19fe.jpg', 12, 49, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 91, '0.0000', NULL, 0),
(386, 'HW383', 'ARB Thrust Bearing-51108', 4, '0.0000', '158.0000', '5.0000', 'db2beff95f86fa22e6c08c0691e4fd10.jpg', 12, 49, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 91, '0.0000', NULL, 0),
(387, 'HW384', 'ARB Thrust Bearing-51208', 4, '0.0000', '170.0000', '5.0000', 'f9122b971180405709ed3d8ac670ffc9.jpg', 12, 49, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 91, '0.0000', NULL, 0),
(388, 'HW385', 'ARB Thrust Bearing-51109', 4, '0.0000', '173.0000', '5.0000', 'eeb58ba9eeedc4016dadaf3deaf7ebf0.jpg', 12, 49, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 91, '0.0000', NULL, 0),
(389, 'HW386', 'ARB Thrust Bearing-51207', 4, '0.0000', '185.0000', '5.0000', 'c871b9b916a213a1d702fe7db66bb597.jpg', 12, 49, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 91, '0.0000', NULL, 0),
(390, 'HW387', 'ARB Thrust Bearing-51210', 4, '0.0000', '204.0000', '5.0000', '9ad2561e9463be2620f1a9a4130bdd81.jpg', 12, 49, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 91, '0.0000', NULL, 0),
(391, 'HW388', 'NTN Single Direction Thrust Ball Bearing-51100', 4, '0.0000', '374.0000', '5.0000', '552f2feab9af73dd0d96f8d6734c2af7.jpg', 12, 49, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 92, '0.0000', NULL, 0),
(392, 'HW389', 'NTN Single Direction Thrust Ball Bearing-51102', 4, '0.0000', '398.0000', '5.0000', '55ab3b980f3348e25529398a7b7b0c7b.jpg', 12, 49, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 92, '0.0000', NULL, 0),
(393, 'HW390', 'NTN Single Direction Thrust Ball Bearing-51104', 4, '0.0000', '430.0000', '5.0000', '616f7548294010c7cbd5be750e333617.jpg', 12, 49, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 92, '0.0000', NULL, 0),
(394, 'HW391', 'FAG Two Bolt Flanged Housing Units-UCFL201-08', 4, '0.0000', '880.0000', '5.0000', '65b380cb94e1f95eef4eb2827b48d807.jpg', 12, 50, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 93, '0.0000', NULL, 0),
(395, 'HW392', 'FAG Housing Units-UCF201-08', 4, '0.0000', '880.0000', '5.0000', '2a79a6bb65bd763f8d09a4d504b2f47e.jpg', 12, 50, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 93, '0.0000', NULL, 0),
(396, 'HW393', 'FAG Plummer Block Housing Units-UCP201', 4, '0.0000', '880.0000', '5.0000', 'cc0adc378235a672171e297c59dc0a58.jpg', 12, 50, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 93, '0.0000', NULL, 0),
(397, 'HW394', 'FAG Two Bolt Flanged Housing Units-UCFL201', 4, '0.0000', '880.0000', '5.0000', '9958ecfd95a7fbad2dacb9d3b6e211ea.jpg', 12, 50, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 93, '0.0000', NULL, 0),
(398, 'HW395', 'FAG Housing Units-UCF201', 4, '0.0000', '880.0000', '5.0000', 'cd5461d934fde1ea8975e0f5cc292571.jpg', 12, 50, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 93, '0.0000', NULL, 0),
(399, 'HW396', 'FAG Plummer Block Housing Units-UCP201-08', 4, '0.0000', '880.0000', '5.0000', 'c07342d25e892322d25fab0726b42bf5.jpg', 12, 50, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 93, '0.0000', NULL, 0),
(400, 'HW397', 'FAG Two Bolt Flanged Housing Units-UCFL202-09', 4, '0.0000', '900.0000', '5.0000', 'ad22de8cff769a81ff06341589ba6eb7.jpg', 12, 50, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 93, '0.0000', NULL, 0),
(401, 'HW398', 'FAG Housing Units-UCF202-10', 4, '0.0000', '900.0000', '5.0000', '3f976815643f86196dea38b07d6994c4.jpg', 12, 50, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 93, '0.0000', NULL, 0),
(402, 'HW399', 'FAG Plummer Block Housing Units-UCP202-09', 4, '0.0000', '900.0000', '5.0000', 'bde552e61d137b8c238910b02dfa956a.jpg', 12, 50, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 93, '0.0000', NULL, 0),
(403, 'HW400', 'FAG Housing Units-UCF202', 4, '0.0000', '900.0000', '5.0000', '54021da358f680cc6ce45e1f83f26bb1.jpg', 12, 50, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 93, '0.0000', NULL, 0),
(404, 'HW401', 'FAG Two Bolt Flanged Housing Units-UCFL202-10', 4, '0.0000', '900.0000', '5.0000', '9a1435c5fd6236d360cf7997499da16f.jpg', 12, 50, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 93, '0.0000', NULL, 0),
(405, 'HW402', 'Asian Paints Apcolite Premium Gloss Enamel-Brilliant White-20 Ltr.', 6, '0.0000', '5130.0000', '5.0000', '8f6b002ff24b44f7e79b5478946fb10e.jpg', 13, 51, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 94, '0.0000', NULL, 0),
(406, 'HW403', 'Asian Paints Apcolite Premium Gloss Enamel-Brilliant White-10 Ltr.', 6, '0.0000', '2655.0000', '5.0000', '453651ca4daeef50fedf4d52c811472e.jpg', 13, 51, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 94, '0.0000', NULL, 0),
(407, 'HW404', 'Asian Paints Apcolite Premium Gloss Enamel-Brilliant White-4 Ltr.', 6, '0.0000', '1095.0000', '5.0000', '7e3895c107a4073230cba580134e5d6e.jpg', 13, 51, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 94, '0.0000', NULL, 0),
(408, 'HW405', 'Asian Paints Apcolite Premium Gloss Enamel-Brilliant White-1 Ltr.', 6, '0.0000', '290.0000', '5.0000', '889705229cb5f9330354b696d3e19db2.jpg', 13, 51, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 94, '0.0000', NULL, 0),
(409, 'HW406', 'Asian Paints Apcolite Premium Gloss Enamel-Brilliant White-0.5 Ltr.', 6, '0.0000', '153.0000', '5.0000', 'e833e01fbbd8247b252cb4aab1b6c705.jpg', 13, 51, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 94, '0.0000', NULL, 0),
(410, 'HW407', 'Asian Paints Apcolite Premium Gloss Enamel-Blazing White-20 Ltr.', 6, '0.0000', '5130.0000', '5.0000', 'a3bf941d93d27c683d08ab0f94b03f1c.jpg', 13, 51, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 94, '0.0000', NULL, 0),
(411, 'HW408', 'Asian Paints Apcolite Premium Gloss Enamel-Blazing White-10 Ltr.', 6, '0.0000', '2655.0000', '5.0000', 'd9f8574d355e436ef4599f6168ac6b92.jpg', 13, 51, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 94, '0.0000', NULL, 0),
(412, 'HW409', 'Asian Paints Apcolite Premium Gloss Enamel-Blazing White-4 Ltr.', 6, '0.0000', '1095.0000', '5.0000', '074d53e5b7f1046570fa7b6f104d6255.jpg', 13, 51, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 94, '0.0000', NULL, 0);
INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `mrp`, `hsn_code`, `is_featured`) VALUES
(413, 'HW410', 'Asian Paints Apcolite Premium Gloss Enamel-Blazing White-1 Ltr.', 6, '0.0000', '290.0000', '5.0000', '0820911d31cb211ce9c5df10acb7698f.jpg', 13, 51, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 94, '0.0000', NULL, 0),
(414, 'HW411', 'Asian Paints Apcolite Premium Gloss Enamel-Blazing White-0.5 Ltr.', 6, '0.0000', '153.0000', '5.0000', 'f899b4cb1708cd5fb42785ab677eee75.jpg', 13, 51, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 94, '0.0000', NULL, 0),
(415, 'HW412', 'Asian paints Acrylic Wall Putty- White-1 Kg.', 2, '0.0000', '71.0000', '5.0000', 'e7598b84b091b53fe40bff9c06c7d82f.jpg', 13, 52, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 94, '0.0000', NULL, 0),
(416, 'HW413', 'Asian Paints Utsav Metal Primer-Redoxide-0.5 Ltr.', 6, '0.0000', '76.0000', '5.0000', 'fcf4d3aaef0e6aabc6acfcb114b28edb.jpg', 13, 52, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 94, '0.0000', NULL, 0),
(417, 'HW414', 'British Paints Acrylic Wall Putty Cum Primer (Poly Bucket) (1 Kg.)', 2, '0.0000', '104.5000', '5.0000', '537ca504be1850444ad395661d454d10.jpg', 13, 52, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 95, '0.0000', NULL, 0),
(418, 'HW415', 'Asian Paints Utsav Primer-White(Solvent Based)-0.5 Ltr.', 6, '0.0000', '90.0000', '5.0000', '49017106c93bc1478bed6aa196ff128e.jpg', 13, 52, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 94, '0.0000', NULL, 0),
(419, 'HW416', 'Asian Paints AP Decoprime Metal Primer-Redoxide 0.5 Ltr.', 6, '0.0000', '95.0000', '5.0000', '449b3920fc2e17ec323a7cc7cedd4ed2.jpg', 13, 52, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 94, '0.0000', NULL, 0),
(420, 'HW417', 'Asian Paints wood Primer-Pink 0.5 Ltr.', 6, '0.0000', '96.0000', '5.0000', '1a9aef85b0b7b6b1dedebc5cf5c690ad.jpg', 13, 52, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 94, '0.0000', NULL, 0),
(421, 'HW418', 'Asian Paints Decoprime Wall Primer ST-White 0.5 Ltr.', 6, '0.0000', '98.0000', '5.0000', '337e87d140c89d7168c84a6ce5f269e6.jpg', 13, 52, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 94, '0.0000', NULL, 0),
(422, 'HW419', 'British Paints All Purpose White Primer (S.T.) (0.5 Ltr.)', 6, '0.0000', '133.8300', '5.0000', 'b56c689be5e363a10afdb686196eff9f.jpg', 13, 52, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 95, '0.0000', NULL, 0),
(423, 'HW420', 'Asian Paints wood Primer-White-0.5 Ltr.', 6, '0.0000', '102.0000', '5.0000', '7d6e75d67ad2c4debe261a99c801c797.jpg', 13, 52, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 94, '0.0000', NULL, 0),
(424, 'HW421', 'Asian Paints Utsav Primer-White(Water Based)-1 Ltr.', 6, '0.0000', '111.0000', '5.0000', 'b10e87793353761d6d655861f194fbf8.jpg', 13, 52, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 94, '0.0000', NULL, 0),
(425, 'HW422', 'British Paints Britproof LW (1 Ltr.)', 6, '0.0000', '157.6700', '5.0000', '9b5fd7f35af09337058ea6d5b4e41cc8.jpg', 13, 53, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 95, '0.0000', NULL, 0),
(426, 'HW423', 'British Paints Shieldcrete URP (1 Kg.)', 2, '0.0000', '337.3300', '5.0000', '276a60e241cfedfdd8388fddc1f795da.jpg', 13, 53, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 95, '0.0000', NULL, 0),
(427, 'HW424', 'British Paints Britcrete URP (1 Kg.)', 2, '0.0000', '436.3300', '5.0000', '1da94ef0754b48c1ad11c80a44fc42d1.jpg', 13, 53, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 95, '0.0000', NULL, 0),
(428, 'HW425', 'British Paints Britproof LW (5 Ltr.)', 6, '0.0000', '650.8300', '5.0000', '207b536ef7efb16da04090e30d012a9e.jpg', 13, 53, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 95, '0.0000', NULL, 0),
(429, 'HW426', 'British Paints Shieldcrete URP (5 Kg.)', 2, '0.0000', '1529.0000', '5.0000', 'b9c81f29a3f99187f76843de0525bd21.jpg', 13, 53, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 95, '0.0000', NULL, 0),
(430, 'HW427', 'British Paints Terrace Master (4 Ltr.)', 6, '0.0000', '1716.0000', '5.0000', 'e84b956464a25c4f9934f1bd240ddb59.jpg', 13, 53, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 95, '0.0000', NULL, 0),
(431, 'HW428', 'British Paints Britcrete URP (5 Kg.)', 2, '0.0000', '2062.0000', '5.0000', '945d52efd666b5adc309cba672ff42fb.jpg', 13, 53, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 95, '0.0000', NULL, 0),
(432, 'HW429', 'British Paints Britproof LW (20 Ltr.)', 6, '0.0000', '2192.6700', '5.0000', 'c8148cc3b8912b61863394bbe906c343.jpg', 13, 53, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 95, '0.0000', NULL, 0),
(433, 'HW430', 'British Paints Shieldcrete URP (20 Kg.)', 2, '0.0000', '4651.1700', '5.0000', '899344022811fe317d1795271b173492.jpg', 13, 53, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 95, '0.0000', NULL, 0),
(434, 'HW431', 'British Paints Britcrete URP (20 Kg.)', 2, '0.0000', '7034.5000', '5.0000', 'c609e46a31821966a8f201fc69f591d4.jpg', 13, 53, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 95, '0.0000', NULL, 0),
(435, 'HW432', 'Prime Aerosol White All Purpose Spray Paint-Pack Of 25', 4, '0.0000', '5625.0000', '5.0000', '7652e457f9845835848cdef8ded2a755.jpg', 13, 54, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 96, '0.0000', NULL, 0),
(436, 'HW433', 'Prime Aerosol Milky White All Purpose Spray Paint-Pack Of 25', 4, '0.0000', '5625.0000', '5.0000', '8bbbb23823cb8c92269eb5b1579540bf.jpg', 13, 54, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 96, '0.0000', NULL, 0),
(437, 'HW434', 'Prime Aerosol Super White All Purpose Spray Paint-Pack Of 25', 4, '0.0000', '5625.0000', '5.0000', 'bce3fa38ac90e422e7fcb5e9d40ddcce.jpg', 13, 54, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 96, '0.0000', NULL, 0),
(438, 'HW435', 'Prime Aerosol Matt. White All Purpose Spray Paint-Pack Of 25', 4, '0.0000', '5625.0000', '5.0000', '5d454271ca638e2d1f11bcd9c076030f.jpg', 13, 54, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 96, '0.0000', NULL, 0),
(439, 'HW436', 'Prime Aerosol HG Black All Purpose Spray Paint-Pack Of 25', 4, '0.0000', '5625.0000', '5.0000', '3df2fc1eb4a5b873aaa73dd55be3966e.jpg', 13, 54, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 96, '0.0000', NULL, 0),
(440, 'HW437', 'Prime Aerosol Black All Purpose Spray Paint-Pack Of 25', 4, '0.0000', '5625.0000', '5.0000', 'b2e4588132189e1215911a70bb06bd87.jpg', 13, 54, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 96, '0.0000', NULL, 0),
(441, 'HW438', 'Abro Grass Green Spray Paint-Pack Of 12', 4, '0.0000', '2316.0000', '5.0000', '8d64eac58c8f15a96141b602fb72d030.jpg', 13, 54, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 97, '0.0000', NULL, 0),
(442, 'HW439', 'Abro Fresh Green Spray Paint-Pack Of 12', 4, '0.0000', '2316.0000', '5.0000', '9b15e83b3333ea6c0a62013763e9d012.jpg', 13, 54, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 97, '0.0000', NULL, 0),
(443, 'HW440', 'Abro Haier Grey Spray Paint-Pack Of 12', 4, '0.0000', '2316.0000', '5.0000', '3da1ed7c1c16f3730959f20dd7b0e9cb.jpg', 13, 54, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 97, '0.0000', NULL, 0),
(444, 'HW441', 'Abro Matt Light Grey Spray Paint-Pack Of 12', 4, '0.0000', '2316.0000', '5.0000', '2f5e163a592b4dce5787e893815bd4a0.jpg', 13, 54, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 97, '0.0000', NULL, 0),
(445, 'HW442', 'Abro Ivory Spray Paint-Pack Of 12', 4, '0.0000', '2316.0000', '5.0000', '96b30a146f7e1a7b8269e656137bb3f0.jpg', 13, 54, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 97, '0.0000', NULL, 0),
(446, 'HW443', 'Abro Shifeng Blue Spray Paint-Pack Of 12', 4, '0.0000', '2316.0000', '5.0000', 'bb3c7b381fba1624bbb06328c72727c3.jpg', 13, 54, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 97, '0.0000', NULL, 0),
(447, 'HW444', 'Ashoka S-444 Paint Sprayer', 4, '0.0000', '720.0000', '5.0000', '0c49abea0f4651a006747dccd46914c6.jpg', 13, 55, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 98, '0.0000', NULL, 0),
(448, 'HW445', 'Ashoka Medium Paint Sprayer', 4, '0.0000', '870.0000', '5.0000', '2c7da4f327dad711099c909c5bc35d83.jpg', 13, 55, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 98, '0.0000', NULL, 0),
(449, 'HW446', 'Ashoka Sand Blasting Paint Sprayer', 4, '0.0000', '900.0000', '5.0000', 'b1ad11f9dce7090547046766b584661d.jpg', 13, 55, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 98, '0.0000', NULL, 0),
(450, 'HW447', 'Ashoka Super Paint Sprayer', 4, '0.0000', '1000.0000', '5.0000', '61e9e3bcc45cc08cb1db1a025e703c9b.jpg', 13, 55, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 98, '0.0000', NULL, 0),
(451, 'HW448', 'Ashoka Super Fine Paint Sprayer- Nylon Cup', 4, '0.0000', '1185.0000', '5.0000', '6776a0e671e6abb7300dda0a7d175fd7.jpg', 13, 55, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 98, '0.0000', NULL, 0),
(452, 'HW449', 'Ashoka Super Fine Paint Sprayer- SS Cup', 4, '0.0000', '1250.0000', '5.0000', 'bb09b454747d8f04b81971dd7322b873.jpg', 13, 55, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 98, '0.0000', NULL, 0),
(453, 'HW450', 'Texture Gun Paint Sprayer', 4, '0.0000', '1270.0000', '5.0000', '5d29ef333efae1832b10e3971df07d95.jpg', 13, 55, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 0, '0.0000', NULL, 0),
(454, 'HW451', 'Ashoka HVLP Power2 Paint Sprayer', 4, '0.0000', '1460.0000', '5.0000', '9d89f985c99a7c974f60d973e98878bd.jpg', 13, 55, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 98, '0.0000', NULL, 0),
(455, 'HW452', 'Ashoka AC-17 Paint Sprayer', 4, '0.0000', '1590.0000', '5.0000', '9d5e397b235724d19dd2dc5db41a681a.jpg', 13, 55, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 98, '0.0000', NULL, 0),
(456, 'HW453', 'Pilot High Performance Spray Gun-68S', 4, '0.0000', '1881.2500', '5.0000', 'f0f78603cea32f936bdf36cdf3cf5b8c.jpg', 13, 55, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 0, '0.0000', NULL, 0),
(457, 'HW454', 'Ashoka A-70 Paint Sprayer', 4, '0.0000', '1988.0000', '5.0000', '722061b776d2586cbec4b48290173ce6.jpg', 13, 55, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 98, '0.0000', NULL, 0),
(458, 'HW455', 'Asian Paints Apcolite Universal Stainer- Fast Violet-0.2 Ltr.', 6, '0.0000', '108.0000', '5.0000', 'ab11539fb65aadaf4f1a5bc5d4bac3a4.jpg', 13, 56, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 94, '0.0000', NULL, 0),
(459, 'HW456', 'Asian Paints Apcolite Universal Stainer- Fast Blue-0.2 Ltr.', 6, '0.0000', '108.0000', '5.0000', '754e97f28518261516553081f53dc1b1.jpg', 13, 56, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 94, '0.0000', NULL, 0),
(460, 'HW457', 'Asian Paints Apcolite Universal Stainer- Turkey Umber-0.2 Ltr.', 6, '0.0000', '108.0000', '5.0000', 'ea604198dd29b938f699242cd52f51dc.jpg', 13, 56, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 94, '0.0000', NULL, 0),
(461, 'HW458', 'Asian Paints Apcolite Universal Stainer- Fast yellow-0.2 Ltr.', 6, '0.0000', '108.0000', '5.0000', 'fa7d116bb2a8fecd2844afa2e41a21e7.jpg', 13, 56, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 94, '0.0000', NULL, 0),
(462, 'HW459', 'Asian Paints Apcolite Universal Stainer- Fast Green-0.2 Ltr.', 6, '0.0000', '108.0000', '5.0000', '2b00468ebfb9288b6d35a6dafffddbd2.jpg', 13, 56, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 94, '0.0000', NULL, 0),
(463, 'HW460', 'Asian Paints Apcolite Universal Stainer- Black-0.2 Ltr.', 6, '0.0000', '108.0000', '5.0000', '6c6799a4836be9525beeca4d2cf1e98d.jpg', 13, 56, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 94, '0.0000', NULL, 0),
(464, 'HW461', 'Asian Paints Apcolite Universal Stainer- Fast Yellow Green-0.2 Ltr.', 6, '0.0000', '108.0000', '5.0000', 'ae34a9b2b60fba0eb3abde5072996a21.jpg', 13, 56, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 94, '0.0000', NULL, 0),
(465, 'HW462', 'Asian Paints Apcolite Universal Stainer- Yellow oxide-0.2 Ltr.', 6, '0.0000', '148.0000', '5.0000', '19fa76787cd062dfd8de2197901d295a.jpg', 13, 56, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 94, '0.0000', NULL, 0),
(466, 'HW463', 'Asian Paints Apcolite Universal Stainer- Orange Burnt Sienna-0.2 Ltr.', 6, '0.0000', '148.0000', '5.0000', 'df8335e6fe5bc2f6cc9a69d0717999f3.jpg', 13, 56, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 94, '0.0000', NULL, 0),
(467, 'HW464', 'Asian Paints Apcolite Universal Stainer- Fast Red-0.2 Ltr.', 6, '0.0000', '148.0000', '5.0000', 'bb936a8532bb6dcccbeecfe39fa3c8ce.jpg', 13, 56, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 94, '0.0000', NULL, 0),
(468, 'HW465', 'Fevicol DDL Synthetic Adhesive Binder-0.125 Kg.', 2, '0.0000', '19.3800', '5.0000', 'fb5bc1fd71e9b268efcd07eb239bf36e.jpg', 14, 57, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 99, '0.0000', NULL, 0),
(469, 'HW466', 'Fevicol Master LOK Wood Lock Adhesive-0.125 Kg.', 2, '0.0000', '32.7400', '5.0000', '72f80a1e31de8e2f2de5074018233997.jpg', 14, 57, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 99, '0.0000', NULL, 0),
(470, 'HW467', 'Fevicol DDL Synthetic Adhesive Binder-0.25 Kg.', 2, '0.0000', '33.0300', '5.0000', '08fb2010f27649600e98814b61fcf8a1.jpg', 14, 57, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 99, '0.0000', NULL, 0),
(471, 'HW468', 'Fevicol SR 505 Synthetic Rubber Adhesive-0.1 Ltr.', 6, '0.0000', '50.0000', '5.0000', '6e624c16b4a58404b1ab5fb04e1030c7.jpg', 14, 57, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 99, '0.0000', NULL, 0),
(472, 'HW469', 'Fevicol SH Synthetic Resin Adhesive-0.125 Kg.', 2, '0.0000', '57.1400', '5.0000', 'fb42541ceb8bc2ab5cdb03ef934c9373.jpg', 14, 57, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 99, '0.0000', NULL, 0),
(473, 'HW470', 'Fevicol Master LOK Wood Lock Adhesive-0.25 Kg.', 2, '0.0000', '59.0400', '5.0000', '45b3091d2e0a8df06c99761b1c4385d3.jpg', 14, 57, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 99, '0.0000', NULL, 0),
(474, 'HW471', 'Fevicol Wudfin Wood stain-Tymberfil Rubber and Contact Adhesive-0.1 Ltr.', 6, '0.0000', '61.8800', '5.0000', '47f774da49588d9e7df6c3cd772de98c.jpg', 14, 57, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 99, '0.0000', NULL, 0),
(475, 'HW472', 'Fevicol DDL Synthetic Adhesive Binder-0.5 Kg.', 2, '0.0000', '62.8400', '5.0000', 'e305510c774264ce461b9ec1f91d3a5f.jpg', 14, 57, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 99, '0.0000', NULL, 0),
(476, 'HW473', 'Fevicol Wudfin Wood Polish (Clear & Yellow) Rubber and Contact Adhesive-0.2 Ltr.', 6, '0.0000', '65.4900', '5.0000', 'f505da80eef234ed954ce40e78a1da3e.jpg', 14, 57, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 99, '0.0000', NULL, 0),
(477, 'HW474', 'Fevicol Terminator Wood Preservative-0.1 Ltr.', 6, '0.0000', '66.3700', '5.0000', 'c79378d8b7dcda02cec86e5b1484ee9c.jpg', 14, 57, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 99, '0.0000', NULL, 0),
(478, 'HW475', 'McCoy Soudal 450g PRO+ Paintable Acrylic Sealant-White (Pack Of 24)', 4, '0.0000', '2640.0000', '5.0000', '746270d6009ba293d1773ce6d27dfc28.jpg', 14, 58, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 100, '0.0000', NULL, 0),
(479, 'HW476', 'McCoy Soudal 260ml GP Acetoxy Silicone Sealant-Transparent (Pack Of 24)', 4, '0.0000', '3120.0000', '5.0000', '5d1f63cc5b97f4516f3db64aa0f9720e.jpg', 14, 58, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 100, '0.0000', NULL, 0),
(480, 'HW477', 'McCoy Soudal 260ml GP Acetoxy Silicone Sealant-Black (Pack Of 24)', 4, '0.0000', '3120.0000', '5.0000', '911d102a8c5adbefd4036608c6da6d72.jpg', 14, 58, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 100, '0.0000', NULL, 0),
(481, 'HW478', 'McCoy Soudal 260ml GP Acetoxy Silicone Sealant-White (Pack Of 24)', 4, '0.0000', '3120.0000', '5.0000', 'db81ffa5a8766ff7a37c3d1cf9470226.jpg', 14, 58, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 100, '0.0000', NULL, 0),
(482, 'HW479', 'McCoy Soudal 280ml GP Acetoxy Silicone Sealant-Transparent (Pack Of 24)', 4, '0.0000', '3240.0000', '5.0000', '2368dfeea7236c04de1510a845c6bedf.jpg', 14, 58, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 100, '0.0000', NULL, 0),
(483, 'HW480', 'McCoy Soudal 280ml GP Acetoxy Silicone Sealant-Black (Pack Of 24)', 4, '0.0000', '3240.0000', '5.0000', 'e9dc9975255dfe9028a46d7cfbd8af3f.jpg', 14, 58, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 100, '0.0000', NULL, 0),
(484, 'HW481', 'McCoy Soudal 280ml GP Acetoxy Silicone Sealant-White (Pack Of 24)', 4, '0.0000', '3240.0000', '5.0000', 'c97f2b762b25212669a6661bf020fbd5.jpg', 14, 58, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 100, '0.0000', NULL, 0),
(485, 'HW482', 'McCoy Soudal 280ml GP Plus Acetoxy Silicone Sealant-White (Pack Of 24)', 4, '0.0000', '3360.0000', '5.0000', '9ff1108ed79339580aa3044bc0639511.jpg', 14, 58, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 100, '0.0000', NULL, 0),
(486, 'HW483', 'McCoy Soudal 280ml GP Plus Acetoxy Silicone Sealant-Transparent (Pack Of 24)', 4, '0.0000', '3360.0000', '5.0000', '0a1ce7c364a5b4740daca2990f1244b0.jpg', 14, 58, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 100, '0.0000', NULL, 0),
(487, 'HW484', 'Abro 260ml General Purpose Silicon Sealante (GP-1000, CLEAR)', 4, '0.0000', '3000.0000', '5.0000', 'f961ff4f77ecc4786fe97adcf8306b9c.jpg', 14, 58, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 97, '0.0000', NULL, 0),
(488, 'HW485', 'Abro 260ml General Purpose Silicon Sealante (GP-1000, BLACK)', 4, '0.0000', '3000.0000', '5.0000', '6f3b49fcb88ff7ae6030e5d1fdbcaa8d.jpg', 14, 58, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 97, '0.0000', NULL, 0),
(489, 'HW486', 'Champion 1/2" PTFE Teflon Tape', 4, '0.0000', '26.0000', '5.0000', '80554f76b9b6f4f16acb347b4f434577.jpg', 14, 59, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 101, '0.0000', NULL, 0),
(490, 'HW487', 'Champion 3/4" PTFE Teflon Tape', 4, '0.0000', '37.9000', '5.0000', '4eb085af8bb82eac4ff67753aa9e8669.jpg', 14, 59, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 101, '0.0000', NULL, 0),
(491, 'HW488', 'Champion 1" PTFE Teflon Tape', 4, '0.0000', '50.2000', '5.0000', '1b7c221615358648862d3404906be50a.jpg', 14, 59, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 101, '0.0000', NULL, 0),
(492, 'HW489', 'Abro 12mm x 30mtr Clear BOPP Adhesive Tape-Pack Of 12', 4, '0.0000', '81.0000', '5.0000', '9423ace01614d6e980fdb8fe7d8ba605.jpg', 14, 59, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 97, '0.0000', NULL, 0),
(493, 'HW490', 'Abro 12mm x 40 mtr Clear BOPP Adhesive Tape-Pack Of 12', 4, '0.0000', '102.0000', '5.0000', 'c74ce3a962a6e3648bc1a4664744ddfb.jpg', 14, 59, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 97, '0.0000', NULL, 0),
(494, 'HW491', 'Abro 12mm x 0.1mm x 5mtr PTFE Thread Seal Tape-Pack Of 10', 4, '0.0000', '120.0000', '5.0000', '3b51b2cf01757f927b7bba1bcca94e70.jpg', 14, 59, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 97, '0.0000', NULL, 0),
(495, 'HW492', 'Abro 18mm x 30mtr Brown BOPP Adhesive Tape-Pack Of 12', 4, '0.0000', '121.5000', '5.0000', 'bfaff3a170e2f3ae879e95024ca1a836.jpg', 14, 59, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 97, '0.0000', NULL, 0),
(496, 'HW493', 'Abro 18mm x 30 mtr Clear BOPP Adhesive Tape-Pack Of 12', 4, '0.0000', '121.5000', '5.0000', '4289e16566a763538131703d64e16244.jpg', 14, 59, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 97, '0.0000', NULL, 0),
(497, 'HW494', 'Abro 18mm x 40mtr Brown BOPP Adhesive Tape-Pack Of 12', 4, '0.0000', '153.0000', '5.0000', '97dc13c3ef9ebefa62ecc5fdf5855651.jpg', 14, 59, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 97, '0.0000', NULL, 0),
(498, 'HW495', 'Abro 18mm x 40 mtr Clear BOPP Adhesive Tape-Pack Of 12', 4, '0.0000', '153.0000', '5.0000', '5078b9473cd5def734776ec809a940de.jpg', 14, 59, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 97, '0.0000', NULL, 0),
(499, 'HW496', 'Bosch GSB 500 RE Tool Kit', 4, '0.0000', '3255.0000', '5.0000', '5d5a2109f9f95c84aa896489fd4adf84.JPG', 15, 60, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 52, '0.0000', NULL, 0),
(500, 'HW497', 'Bosch GSB 10 RE Home Tool Kit', 4, '0.0000', '3443.0000', '5.0000', '33f7fd50665de5068dac16ceb2fb0f02.JPG', 15, 60, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 52, '0.0000', NULL, 0),
(501, 'HW498', 'Bosch All in One Metal Hand Tool Kit (108 Piece)', 4, '0.0000', '1761.0000', '5.0000', '387c7125bdb8d248833e01b6b37154d5.JPG', 15, 60, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 52, '0.0000', NULL, 0),
(502, 'HW499', 'Black & Decker KR554RE Drill Machine', 4, '0.0000', '2099.0000', '5.0000', '757ed7f1d0758e3ebf4a1eac272ff413.JPG', 15, 60, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 77, '0.0000', NULL, 0),
(503, 'HW500', 'Black & Decker KC4815 Screwdriver Set (15 Pc)', 4, '0.0000', '1850.0000', '5.0000', 'bac27becb16ebe3cac772c73ab629ae8.jpg', 15, 60, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 77, '0.0000', NULL, 0),
(504, 'HW501', 'Bosch GSB 10RE Impact Driver', 4, '0.0000', '1999.0000', '5.0000', 'e7a7e243892e2a5e9021cfd566158e53.JPG', 15, 60, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 52, '0.0000', NULL, 0),
(505, 'HW502', 'Dewalt D25123K 800W 26mm 3 Mode SSD Combination Hammer', 4, '0.0000', '9000.0000', '5.0000', 'b9447af5c71979b5064c2df49d702a2c.JPG', 15, 60, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 53, '0.0000', NULL, 0),
(506, 'HW503', 'Buildskill BED1100 Powerful Electric Drill Machine (10mm)', 4, '0.0000', '924.0000', '5.0000', 'c6ce4bd85229dcfc2b118b844fd05998.JPG', 15, 60, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 73, '0.0000', NULL, 0),
(507, 'HW504', 'Black & Decker BDCD12 Cordless Drill Kit (3-Pieces)', 4, '0.0000', '3369.0000', '5.0000', '73912d8123f86ca1c5bb2f99c3fee940.JPG', 15, 60, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 77, '0.0000', NULL, 0),
(508, 'HW505', 'Bosch GDC 120 Marble Cutter', 4, '0.0000', '2899.0000', '5.0000', '8437f93c6056f73f4c94cb93d4193f06.JPG', 15, 60, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 52, '0.0000', NULL, 0),
(509, 'HW506', 'Cheston CHB-30VS Air Blower', 4, '0.0000', '799.0000', '5.0000', 'bdc979db9663f297b5b466dfe9522442.JPG', 15, 60, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 78, '0.0000', NULL, 0),
(510, 'HW507', 'Bizol Grenvo Allrounder ATF D-III Transmission Oil', 4, '0.0000', '150.0000', '5.0000', '0765dde8fdc4843cb34b66227488c995.jpg', 16, 61, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 102, '0.0000', NULL, 0),
(511, 'HW508', 'Bizol Grenvo Protect Gear Oil 90W', 4, '0.0000', '263.0000', '5.0000', 'c2e19b83d6527ef485cc44e11e85ca45.jpg', 16, 61, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 102, '0.0000', NULL, 0),
(512, 'HW509', 'Bizol Grenvo Protect Gear Oil 80W', 4, '0.0000', '265.0000', '5.0000', 'e9540d02dc35992ce90e14cf45b51c4d.jpg', 16, 61, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 102, '0.0000', NULL, 0),
(513, 'HW510', 'Bizol Grenvo Moto 20W', 4, '0.0000', '265.0000', '5.0000', 'eb71bfc149d2872fb1c8f50bf3f6f94c.jpg', 16, 61, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 102, '0.0000', NULL, 0),
(514, 'HW511', 'Bizol Grenvo Technology Gear Oil 85W', 4, '0.0000', '275.0000', '5.0000', '13f00be6363b0c23a67aea949edc9b99.jpg', 16, 61, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 102, '0.0000', NULL, 0),
(515, 'HW512', 'Bizol Grenvo Moto 20W', 4, '0.0000', '280.0000', '5.0000', '23127c35aa90f36adbc0c9f65109fee6.jpg', 16, 61, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 102, '0.0000', NULL, 0),
(516, 'HW513', 'Xado Fast Oil System Cleaner', 4, '0.0000', '399.0000', '5.0000', '72116357f6fe03170f7b9851b9bdcd27.jpg', 16, 61, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 103, '0.0000', NULL, 0),
(517, 'HW514', 'Bizol Grenvo Truck Essential 20W', 4, '0.0000', '290.0000', '5.0000', '73b08788b1f3c49f3f93d2af2b2062e0.jpg', 16, 61, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 102, '0.0000', NULL, 0),
(518, 'HW515', 'Bizol Grenvo Moto 20W', 4, '0.0000', '290.0000', '5.0000', 'fcf2faeaf4941ad9994e2151a8bd992d.jpg', 16, 61, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 102, '0.0000', NULL, 0),
(519, 'HW516', 'Bizol Grenvo Pro EP Li 03 Automotive Grease', 4, '0.0000', '160.0000', '5.0000', '9231048bc0890d0c65612e86d3735c60.jpg', 16, 62, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 102, '0.0000', NULL, 0),
(520, 'HW517', 'MAK WB Special Grease-1 Kg.', 2, '0.0000', '270.0000', '5.0000', 'fe0b95d9c8d2794acb94a7b133f7e192.jpg', 16, 62, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 104, '0.0000', NULL, 0),
(521, 'HW518', 'MAK MP 3 Grease-1 Kg.', 2, '0.0000', '286.0000', '5.0000', '1cb01c3dd62f02e4aba934074964f983.jpg', 16, 62, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 104, '0.0000', NULL, 0),
(522, 'HW519', 'Castrol AP3 Grease-1 Kg.', 2, '0.0000', '300.0000', '5.0000', 'a290c2306566026dbce07ba9cff33927.jpg', 16, 62, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 105, '0.0000', NULL, 0),
(523, 'HW520', 'SKF Premium Grease-VKG 9/1 IP-1 Kg.', 2, '0.0000', '301.0000', '5.0000', '8e834e0040af914e603a867d24e9a959.jpg', 16, 62, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 106, '0.0000', NULL, 0),
(524, 'HW521', 'Bizol Grenvo Pro EP Li 03 Automotive Grease-1 Kg.', 2, '0.0000', '305.0000', '5.0000', 'f3df1104a14600ec96b013d678853e60.jpg', 16, 62, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 102, '0.0000', NULL, 0),
(525, 'HW522', 'MAK L L Grease-1 Kg.', 2, '0.0000', '310.0000', '5.0000', '4c0d3435ddc6e417cbd034e0af322069.jpg', 16, 62, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 2, 2, 104, '0.0000', NULL, 0),
(526, 'HW523', 'Xado Protective Grease-125 ML', 6, '0.0000', '515.0000', '5.0000', '45be8280ece798aaaa5835c8618d6c96.jpg', 16, 62, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 103, '0.0000', NULL, 0),
(527, 'HW524', 'Xado Universal Penetrating Lubricant(Anti Rust Spray)-300 ML', 6, '0.0000', '550.0000', '5.0000', '9ccfb08d2e3faa812001b98d3afc8341.jpg', 16, 62, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 103, '0.0000', NULL, 0),
(528, 'HW525', 'Xado Grease For CV Joints-125ML', 6, '0.0000', '565.0000', '5.0000', '69b831f20f651917c71b43c5118c9245.jpg', 16, 62, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 103, '0.0000', NULL, 0),
(529, 'HW526', 'HP ENKLO-68 Hydraulic Oil-26 Ltr.', 6, '0.0000', '2500.0000', '5.0000', '62d63c45d318987ff4abc3c775d30bbd.jpg', 16, 63, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 107, '0.0000', NULL, 0),
(530, 'HW527', 'HP ENKLO-32 Hydraulic Oil-20 Ltr.', 6, '0.0000', '2550.0000', '5.0000', 'cb34a046fa8d063fb9dc09d716798bf6.jpg', 16, 63, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 107, '0.0000', NULL, 0),
(531, 'HW528', 'HP ENKLO-46 Hydraulic Oil-20 Ltr.', 6, '0.0000', '2550.0000', '5.0000', '7d0894670598032f7cc6480e223cf963.jpg', 16, 63, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 107, '0.0000', NULL, 0),
(532, 'HW529', 'Valvoline AWH-46 Hydraulic Oil-20 Ltr.', 6, '0.0000', '2600.0000', '5.0000', '859f87c62543531fd9ac8bac4c526550.jpg', 16, 63, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 108, '0.0000', NULL, 0),
(533, 'HW530', 'Indian Oil SERVO-46 Hydraulic Oil-20 Ltr.', 6, '0.0000', '2700.0000', '5.0000', '90585be42740785aefdd0e8814297b8e.jpg', 16, 63, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 109, '0.0000', NULL, 0),
(534, 'HW531', 'Indian Oil SERVO-68 Hydraulic Oil-20 Ltr.', 6, '0.0000', '2800.0000', '5.0000', 'f9f29872dd7cd4efa11c0342ca81b96f.jpg', 16, 63, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 109, '0.0000', NULL, 0),
(535, 'HW532', 'Castrol AWS-46 Hydraulic Oil-20 Ltr.', 6, '0.0000', '2900.0000', '5.0000', '29aea8bebab42199f3248fc83f2b7bc6.jpg', 16, 63, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 105, '0.0000', NULL, 0),
(536, 'HW533', 'Castrol AWS-68 Hydraulic Oil-20 Ltr.', 6, '0.0000', '2900.0000', '5.0000', '259acd8f798e9c63f57bb5d6b747a456.jpg', 16, 63, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 105, '0.0000', NULL, 0),
(537, 'HW534', 'Castrol AWS-32 Hydraulic Oil-20 Ltr.', 6, '0.0000', '3000.0000', '5.0000', '25fd8e754936bbd6c65724629dc056dd.jpg', 16, 63, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 105, '0.0000', NULL, 0),
(538, 'HW535', 'Xado Hydrolube68 Hydraulic Oil-20 Ltr.', 6, '0.0000', '3850.0000', '5.0000', '33dc982395af0c38bedbeaa22bee70bc.jpg', 16, 63, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 6, 6, 103, '0.0000', NULL, 0),
(539, 'HW536', 'Fenner A23 Wet Grinder Belt', 4, '0.0000', '68.0000', '5.0000', '95c9a28a9793d4d733ab10e49aab542d.jpg', 17, 64, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 110, '0.0000', NULL, 0),
(540, 'HW537', 'Fenner A24 Wet Grinder Belt', 4, '0.0000', '69.0000', '5.0000', 'dcb633878a77d3c3d2f2c612f74de29f.jpg', 17, 64, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 110, '0.0000', NULL, 0),
(541, 'HW538', 'Fenner A25 Wet Grinder Belt', 4, '0.0000', '69.0000', '5.0000', '55515904297f474c5929aca8643d0b75.jpg', 17, 64, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 110, '0.0000', NULL, 0),
(542, 'HW539', 'Fenner A26 Wet Grinder Belt', 4, '0.0000', '72.0000', '5.0000', 'b8e69cb1da90224ff5e998648399952e.jpg', 17, 64, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 110, '0.0000', NULL, 0),
(543, 'HW540', 'Fenner 2170 FHP V-Belt', 4, '0.0000', '72.0000', '5.0000', '737048ace97ae5eda4f08e1a76f37a08.jpg', 17, 64, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 110, '0.0000', NULL, 0),
(544, 'HW541', 'Fenner A27 Wet Grinder Belt', 4, '0.0000', '72.0000', '5.0000', '7c509027d3d5dfbabe4afbff5d49db5c.jpg', 17, 64, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 110, '0.0000', NULL, 0),
(545, 'HW542', 'Fenner A31 Wet Grinder Belt', 4, '0.0000', '75.0000', '5.0000', 'b9b64815025741296873cbdf30ef0377.jpg', 17, 64, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 110, '0.0000', NULL, 0),
(546, 'HW543', 'Fenner A29 Wet Grinder Belt', 4, '0.0000', '75.0000', '5.0000', 'e985a002804c2cf6aef2a4731ba8e496.jpg', 17, 64, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 110, '0.0000', NULL, 0);
INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `mrp`, `hsn_code`, `is_featured`) VALUES
(547, 'HW544', 'Fenner 2180 FHP V-Belt', 4, '0.0000', '75.0000', '5.0000', '8c24f3871d1c7d90246280fd285e471a.jpg', 17, 64, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 110, '0.0000', NULL, 0),
(548, 'HW545', 'Fenner A30 Wet Grinder Belt', 4, '0.0000', '75.0000', '5.0000', 'e32a00bf67fc0dc8948169c3913806a1.jpg', 17, 64, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 110, '0.0000', NULL, 0),
(549, 'HW546', 'PBL 0.5 HP Gear Box-AMB75L', 4, '0.0000', '6000.0000', '5.0000', '8a4342df44248c97e72b74cb74db7160.jpg', 17, 65, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 111, '0.0000', NULL, 0),
(550, 'HW547', 'PBL A Series 0.5 HP Foot Mounted Gear Box-A 015 L0.4', 4, '0.0000', '11540.0000', '5.0000', 'd81355d3649968ac3cde336ef4682ebd.jpg', 17, 65, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 111, '0.0000', NULL, 0),
(551, 'HW548', 'PBL A Series 0.5 HP Foot Mounted Gear Box-A 005 L0.4', 4, '0.0000', '11540.0000', '5.0000', 'cb42c993b15705e9b1930427f6115e0a.jpg', 17, 65, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 111, '0.0000', NULL, 0),
(552, 'HW549', 'PBL A Series 0.5 HP Gear Box-B030L0.4', 4, '0.0000', '11650.0000', '5.0000', '27939baee12edfb9ae628f97df3a4cf9.jpg', 17, 65, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 111, '0.0000', NULL, 0),
(553, 'HW550', 'PBL A Series 0.5 HP Gear Box-B025L0.4', 4, '0.0000', '11650.0000', '5.0000', '3c6dc3c9e0ef04ce3875d013bfa46935.jpg', 17, 65, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 111, '0.0000', NULL, 0),
(554, 'HW551', 'PBL A Series 1 HP Gear Box-B015L0.75', 4, '0.0000', '11650.0000', '5.0000', 'a283ee66d2e837998f4459e6f77f8599.jpg', 17, 65, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 111, '0.0000', NULL, 0),
(555, 'HW552', 'PBL A Series 0.5 HP Gear Box-B030L0.4', 4, '0.0000', '11650.0000', '5.0000', 'ca8e9c8868d2d90c53f3be0e8812d0e3.jpg', 17, 65, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 111, '0.0000', NULL, 0),
(556, 'HW553', 'PBL A Series 1 HP Gear Box-B020L0.75', 4, '0.0000', '11650.0000', '5.0000', '174b9477b0a0fc3155f4422273e17e49.jpg', 17, 65, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 111, '0.0000', NULL, 0),
(557, 'HW554', 'PBL A Series 1 HP Gear Box-B005L0.75', 4, '0.0000', '11650.0000', '5.0000', '8e045cbd134b9ad99932ed539e500fcd.jpg', 17, 65, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 111, '0.0000', NULL, 0),
(558, 'HW555', 'PBL A Series 1 HP Gear Box-B010L0.75', 4, '0.0000', '11650.0000', '5.0000', '341902f11e1880ae97bfb777ab94e612.jpg', 17, 65, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 111, '0.0000', NULL, 0),
(559, 'HW556', 'KTR Size 14 1a/1a Rotex Torsionally Flexible Coupling', 4, '0.0000', '1177.7800', '5.0000', 'af245423eb6f3002c3a1e0f1534fac6f.jpg', 17, 66, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 112, '0.0000', NULL, 0),
(560, 'HW557', 'KTR Size 14 Steel Rotex Spare Spider', 4, '0.0000', '300.0000', '5.0000', 'c8d9da8f1d4bc7af26c16f2b8c15bd55.jpg', 17, 66, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 112, '0.0000', NULL, 0),
(561, 'HW558', 'KTR Size 19 Steel Rotex Spare Spider', 4, '0.0000', '329.6300', '5.0000', '7a1ef49a0a0f4b90836f9df64b29fa12.jpg', 17, 66, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 112, '0.0000', NULL, 0),
(562, 'HW559', 'KTR Size 24 Steel Rotex Spare Spider', 4, '0.0000', '361.1100', '5.0000', 'cb2f70489ba362a03cac4e56abaaf4dc.jpg', 17, 66, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 112, '0.0000', NULL, 0),
(563, 'HW560', 'KTR Size 48 1/1 Rotex Torsionally Flexible Coupling', 4, '0.0000', '4925.9300', '5.0000', '861c8308067fc519c84e909c57a62d74.jpg', 17, 66, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 112, '0.0000', NULL, 0),
(564, 'HW561', 'KTR Size 42 1/1 Rotex Torsionally Flexible Coupling', 4, '0.0000', '3914.8100', '5.0000', 'd71c36d9d4a007629a526f946c51762b.jpg', 17, 66, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 112, '0.0000', NULL, 0),
(565, 'HW562', 'KTR Size 38 1/1 Rotex Torsionally Flexible Coupling', 4, '0.0000', '2737.0400', '5.0000', 'd429a42503f85be6a3f3f887369c790b.jpg', 17, 66, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 112, '0.0000', NULL, 0),
(566, 'HW563', 'KTR Size 19 1a/1a Rotex Torsionally Flexible Coupling', 4, '0.0000', '1329.6300', '5.0000', '1d4631f3561dc5b79a8d7952b9df3e03.jpg', 17, 66, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 112, '0.0000', NULL, 0),
(567, 'HW564', 'KTR Size 24 1a/1a Rotex Torsionally Flexible Coupling', 4, '0.0000', '1807.4100', '5.0000', '7fe71953b3a5eeabe7d2f7680ac940b7.jpg', 17, 66, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 112, '0.0000', NULL, 0),
(568, 'HW565', 'KTR Size 48 1a/1a Rotex Torsionally Flexible Coupling', 4, '0.0000', '6455.5600', '5.0000', 'a919cc78462c1c0f9ab05d273a52158b.jpg', 17, 66, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 112, '0.0000', NULL, 0),
(569, 'HW566', 'Godrej Esquire Electronic Safe-SEEC6000', 4, '0.0000', '6649.0000', '5.0000', 'a31fa83a03a402feaf695297d4ceee83.jpg', 3, 67, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(570, 'HW567', 'Godrej E-Laptop Pro Electronic Safe-SEEC3100', 4, '0.0000', '9199.0000', '5.0000', '2b3217738b113c22f07ddcddced35bf9.jpg', 3, 67, '', '', '', '', '', '', '-1.0000', 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(571, 'HW568', 'Godrej Secreto Electronic Safe-SEEC8900', 4, '0.0000', '10999.0000', '5.0000', '3bc6d1867d88c867990ef561c2bac077.jpg', 3, 67, '', '', '', '', '', '', '-2.0000', 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(572, 'HW569', 'Godrej Premium Coffer V1 Red Safe-SEMPC1011035', 4, '0.0000', '7999.0000', '5.0000', '3818a4765e03e14a760736dbe09e359b.jpg', 3, 21, '', '', '', '', '', '', '-1.0000', 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(573, 'HW570', 'Link Round 45 Brass Pad Lock', 4, '0.0000', '244.0000', '5.0000', '154d467d0e6bce14dae95c3c3b4b1388.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 114, '0.0000', NULL, 0),
(574, 'HW571', 'Link Atoot 40 Bright Chrome Plated Pad Lock', 4, '0.0000', '185.0000', '5.0000', '39b7ba36dd7cd1350969ef718c17dfaf.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 114, '0.0000', NULL, 0),
(575, 'HW572', 'Harrison Brass Square Padlock-Code: 0003', 4, '0.0000', '116.0000', '5.0000', 'f22430cb3d74dbd3cb08a8235ad4d9e9.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 3, '0.0000', NULL, 0),
(576, 'HW573', 'Harrison Brass Square Padlock-Code: 0003', 4, '0.0000', '63.0000', '5.0000', 'c388d90ac451768dcda18b88b91828e8.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 3, '0.0000', NULL, 0),
(577, 'HW574', 'Harrison Furniture Zinc Locks-6L', 4, '0.0000', '110.0000', '5.0000', '46f57c1b173f94efbe1d2ae6457700fd.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 3, '0.0000', NULL, 0),
(578, 'HW575', 'Harrison Furniture Zinc Locks-6L', 4, '0.0000', '30.0000', '5.0000', 'c82d039e787039fa39f0668dc78fffda.jpg', 3, 21, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 3, '0.0000', NULL, 0),
(579, 'HW576', 'JSKI Nickel Door Handle', 4, '0.0000', '75.0000', '5.0000', '703d5b38bab8787e7fb223805f532728.jpg', 18, 68, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 116, '0.0000', NULL, 0),
(580, 'HW577', 'Godrej, Gloria Door Handle Set, 8219', 4, '0.0000', '6244.0000', '5.0000', '1c1299568940333020c6b8edba30a5ab.jpg', 18, 68, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(581, 'HW578', 'Godrej, 6 Lever Diana Handle Set, Code: 8170', 4, '0.0000', '8250.0000', '5.0000', '2ad3a902f90a2ab014e7255074c578d4.jpg', 18, 68, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(582, 'HW579', 'Godrej, NEH-01 Door Handle Set, Code: 7514-1CK', 4, '0.0000', '4939.0000', '5.0000', '2baeae2cc5386ea2befc8744cc0c7aa0.jpg', 18, 68, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(583, 'HW580', 'Shine Star Italian Mirchi Door Handle With Lock, 8KYMIRCHI', 4, '0.0000', '1500.0000', '5.0000', '4f5b839b6dda9da4ac75508f19e110b2.jpg', 18, 68, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 117, '0.0000', NULL, 0),
(584, 'HW581', 'Shine Star Brass Door Handle, CY210GOLD', 4, '0.0000', '3399.0000', '5.0000', '05e74834c7f81532aaa379c29145f9c1.jpg', 18, 68, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 117, '0.0000', NULL, 0),
(585, 'HW582', 'Mahashakti Stainless Steel Door Kit', 4, '0.0000', '4582.0000', '5.0000', 'f2e9bcae9716421cf03e218cb303ad6a.jpg', 18, 68, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 118, '0.0000', NULL, 0),
(586, 'HW583', 'Dortel Pull Handle, S.S.matt, DTPHD 10', 4, '0.0000', '822.0000', '5.0000', '6e22ce49f7065f613967ef002beda8aa.jpg', 18, 68, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 29, '0.0000', NULL, 0),
(587, 'HW584', 'Godrej, SEH 02 - 280 mm Handle Set - Gold 2 Tone', 4, '0.0000', '12578.0000', '5.0000', '303d67f34e25e700425e5294d8a2ac05.jpg', 18, 68, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(588, 'HW585', 'Godrej, Baby Latch With Venus Handle Set, Code: 9102-Satin Finish', 4, '0.0000', '7397.0000', '5.0000', '34960a4d3b98e2993100e90990831224.jpg', 18, 68, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(589, 'HW586', 'Harrison, Lotus Exclusive / Premium Cabinet Handles, Code: 0711', 4, '0.0000', '582.0000', '5.0000', 'f243a7a30f7a45d3da15c0a8fbc02edc.jpg', 18, 68, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 3, '0.0000', NULL, 0),
(590, 'HW587', 'Godrej, Oliver Door Handle Set, Code: 8856-1CK', 4, '0.0000', '5457.0000', '5.0000', '8dff1da28771b0f9a5126bb658e491d3.jpg', 18, 68, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(591, 'HW588', 'Godrej, Mercury Door Handle Set, Code: 8419-2C', 4, '0.0000', '4416.0000', '5.0000', '3f8f44647a2c11c5300f16ee37ade3e7.jpg', 18, 68, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(592, 'HW589', 'Shine Star Russian Door Handle With Lock, RUSSIAN-TEAK', 4, '0.0000', '2299.0000', '5.0000', '59d85b7e1e9dfb9d35e6e5ea68e96760.jpg', 18, 68, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 117, '0.0000', NULL, 0),
(593, 'HW590', 'Fine Art Stainless Steel Rajvadi Main Door Handle', 4, '0.0000', '1800.0000', '5.0000', 'd6fd7a2008bd2438c1fa5cc3c5b4b8df.jpg', 18, 68, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 120, '0.0000', NULL, 0),
(594, 'HW591', 'Sleek-O-Matic Door Closer', 4, '0.0000', '1449.0000', '5.0000', '6ef3ed8898aad6d94b7f6543b5c9cbc8.jpg', 18, 69, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 121, '0.0000', NULL, 0),
(595, 'HW592', 'SHINE EVEREST Hydrolic Door Closer', 4, '0.0000', '557.0000', '5.0000', '8c0e5d7077a08a99bb3314efeb3643fe.jpg', 18, 69, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 17, '0.0000', NULL, 0),
(596, 'HW593', 'Design Elite Door Closer SS', 4, '0.0000', '1654.0000', '5.0000', '425478c37787bfd1e912d9a1e9128cc6.jpg', 18, 69, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 30, '0.0000', NULL, 0),
(597, 'HW594', 'Godrej Door Closer C071', 4, '0.0000', '6722.0000', '5.0000', '70093d4fdadcb28cc9b330da9e6e1cbc.jpg', 18, 69, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(598, 'HW595', 'Dortel Square Door Closer -Pelmet Arm, DTDC-007', 4, '0.0000', '2228.0000', '5.0000', '4dd027de17d74a6192c897d7ded924ef.jpg', 18, 69, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 29, '0.0000', NULL, 0),
(599, 'HW596', 'Universal Hydraulic Door Closer', 4, '0.0000', '1159.0000', '5.0000', '68356324a72f4273897de70d20ead891.jpg', 18, 69, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 43, '0.0000', NULL, 0),
(600, 'HW597', 'Godrej   Door Closer  C102', 4, '0.0000', '9310.0000', '5.0000', 'ffca45b3897154b4b64acd7b4b543476.jpg', 18, 69, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(601, 'HW598', 'Godrej, Door Closer Concealed C680', 4, '0.0000', '4489.0000', '5.0000', '5f1fb389eadf4b03e682e57769853b9e.jpg', 18, 69, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(602, 'HW599', 'Godrej Door Closer C680', 4, '0.0000', '6694.0000', '5.0000', '648dc4a799e057736e8ff411280787f3.jpg', 18, 69, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(603, 'HW600', 'Godrej   Door Closer   C752', 4, '0.0000', '7988.0000', '5.0000', 'ba4365204163c936a98090f8db8fcdf6.jpg', 18, 69, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(604, 'HW601', 'Godrej   Door Closer   D771', 4, '0.0000', '4191.0000', '5.0000', 'c482ad79edbb5705dbe24220cf7397db.jpg', 18, 69, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(605, 'HW602', 'Dortel Door Closer, Silver, DTDC-004', 4, '0.0000', '1336.0000', '5.0000', 'e87a49003d17112234cebc6c4dd4381b.jpg', 18, 69, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 29, '0.0000', NULL, 0),
(606, 'HW603', 'Dortel Doriant Door Closer, Silver, DTDC-006', 4, '0.0000', '1620.0000', '5.0000', '3c326977d92b06dfe3b921ab71fa9ed0.jpg', 18, 69, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 29, '0.0000', NULL, 0),
(607, 'HW604', 'Modi Door Closer, HDL-061', 4, '0.0000', '831.0000', '5.0000', 'be3a6be1c8c7f9d782f15bd4dc1a3e52.jpg', 18, 69, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 125, '0.0000', NULL, 0),
(608, 'HW605', 'Harrison Aluminium Extruded Door Closer Satin Chrome Code: 496', 4, '0.0000', '1544.0000', '5.0000', '2bba7ce291eb8f9b9698583815bdf068.jpg', 18, 69, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 3, '0.0000', NULL, 0),
(609, 'HW606', 'JBS 202 Grade Hinge Matt Finish', 4, '0.0000', '46.0000', '5.0000', '213f306d07aa571f1cf7de99e217bf0e.jpg', 18, 70, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 20, '0.0000', NULL, 0),
(610, 'HW607', 'Godrej, Floor Spring D100', 4, '0.0000', '5963.0000', '5.0000', 'e97322532536ce0d115fc0fb481dc335.jpg', 18, 70, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(611, 'HW608', 'Mannat Gold Butt Hinges Commercial', 4, '0.0000', '308.0000', '5.0000', '68736b03c90f09b9a223420ad8963a43.jpg', 18, 70, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 127, '0.0000', NULL, 0),
(612, 'HW609', 'Universal Soft Closing Hinge', 4, '0.0000', '1829.0000', '5.0000', '38d5e2403ff1e33659838b5dc8b4b5cb.jpg', 18, 70, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 43, '0.0000', NULL, 0),
(613, 'HW610', 'Godrej, Floor Spring D80', 4, '0.0000', '4247.0000', '5.0000', '9d34e2de60cd0fe7b02af4bfad9b018d.jpg', 18, 70, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(614, 'HW611', 'SN Pin Type Hinges, SNJ4-H3x12P', 4, '0.0000', '1187.0000', '5.0000', '32ddd121879288f6c9a7616017eb0a28.jpg', 18, 70, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 128, '0.0000', NULL, 0),
(615, 'HW612', 'JBS 202 Grade Hinge Gloss Finish', 4, '0.0000', '57.0000', '5.0000', 'f91538fef1f84c5dcd269b48d28d6ac2.jpg', 18, 70, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 20, '0.0000', NULL, 0),
(616, 'HW613', 'Mannat Gold Cut Hinges Commercial', 4, '0.0000', '281.0000', '5.0000', '01d3fc6b9a028a6b13a7ff8e930bb0b3.jpg', 18, 70, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 127, '0.0000', NULL, 0),
(617, 'HW614', 'Dortel Auto Close Hinge 16 Crank, Nickel palted, DHH-033', 4, '0.0000', '134.0000', '5.0000', 'e0ed8257810b5f6f5a890f75b35f6c93.jpg', 18, 70, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 29, '0.0000', NULL, 0),
(618, 'HW615', 'Mexx S.S. Hinges', 4, '0.0000', '2328.0000', '5.0000', 'c37533c0e1e1b4e0422539c972f7e886.jpg', 18, 70, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 49, '0.0000', NULL, 0),
(619, 'HW616', 'Godrej, Floor Spring - Compact B710', 4, '0.0000', '4810.0000', '5.0000', '26056bf9528eb2c866bd8e08336bc528.jpg', 18, 70, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(620, 'HW617', 'Mexx Anti Brass Railway Washer', 4, '0.0000', '4755.0000', '5.0000', '45e613078a51bdff6f52d26993df5eed.jpg', 18, 70, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 49, '0.0000', NULL, 0),
(621, 'HW618', 'Mexx Anti Brass L Hinges', 4, '0.0000', '1630.0000', '5.0000', '0da6d205d79f6a6ac72972f5367c1698.jpg', 18, 70, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 49, '0.0000', NULL, 0),
(622, 'HW619', 'Mexx Anti Brass Hinges', 4, '0.0000', '2768.0000', '5.0000', '04b73ffb23577c000314f0315119f9ac.jpg', 18, 70, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 49, '0.0000', NULL, 0),
(623, 'HW620', 'Mannat Gold Super Fine Butt Hinges', 4, '0.0000', '451.0000', '5.0000', 'd227b6690f5ef10c33a59c0be454daea.jpg', 18, 70, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 127, '0.0000', NULL, 0),
(624, 'HW621', 'Mexx Chrome Fancy Tower Bolt', 4, '0.0000', '2535.0000', '5.0000', '1817b6b479594c0b97361e112743ea14.jpg', 18, 71, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 49, '0.0000', NULL, 0),
(625, 'HW622', 'Spider 100 mm Tower Bolt 10mm Rod', 4, '0.0000', '140.0000', '5.0000', 'aec27750e1b40f0df35f1ea8f461d673.jpg', 18, 71, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 8, '0.0000', NULL, 0),
(626, 'HW623', 'Mexx Anti Brass Fancy Tower Bolt', 4, '0.0000', '4450.0000', '5.0000', '80572c78c8d59f53c47bdbe04bac93c2.jpg', 18, 71, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 49, '0.0000', NULL, 0),
(627, 'HW624', 'I-Ten Square Tower Bolt', 4, '0.0000', '790.0000', '5.0000', 'f62d2cfe357b2697f2fefbd10e050134.jpg', 18, 71, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 131, '0.0000', NULL, 0),
(628, 'HW625', 'Visko Tower Bolt', 4, '0.0000', '4146.0000', '5.0000', '8389c4d12bb13471a47d72eb5c803edc.jpg', 18, 71, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 37, '0.0000', NULL, 0),
(629, 'HW626', 'Visko Tower Bolt, 903', 4, '0.0000', '767.0000', '5.0000', '6a3f23795341e69de1c6ab272a058b0d.jpg', 18, 71, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 37, '0.0000', NULL, 0),
(630, 'HW627', 'Harrison Tower Bolt, Code: 0808', 4, '0.0000', '273.0000', '5.0000', 'ee886b9659564584151e066c81a0bf1e.jpg', 18, 71, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 3, '0.0000', NULL, 0),
(631, 'HW628', 'Mexx S.S. Fancy Tower Bolt', 4, '0.0000', '3777.0000', '5.0000', '907e2e7d6213316228466ab8819f2bbb.jpg', 18, 71, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 49, '0.0000', NULL, 0),
(632, 'HW629', 'Mexx Anti Brass Fancy Tower Bolt', 4, '0.0000', '5589.0000', '5.0000', '7d698822e6cb9de4409eb40d3cc9d88b.jpg', 18, 71, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 49, '0.0000', NULL, 0),
(633, 'HW630', 'Mexx Lacour S.L. Fancy Tower Bolt', 4, '0.0000', '5628.0000', '5.0000', 'e731c0573e3c71d4f8ed2ae0931c1211.jpg', 18, 71, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 49, '0.0000', NULL, 0),
(634, 'HW631', 'Rocket Bright Aldrop', 4, '0.0000', '1316.0000', '5.0000', 'c1a841482f1ff8d501422f3939adba49.jpg', 18, 72, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 133, '0.0000', NULL, 0),
(635, 'HW632', 'I-Ten Brown Curved Aldrop', 4, '0.0000', '699.0000', '5.0000', '25325d939f4ecbf76d6ccaccdb5c7973.jpg', 18, 72, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 131, '0.0000', NULL, 0),
(636, 'HW633', 'Q-Seven (3+1) Aldrop, Silver Satin, Q7-ROYAL', 4, '0.0000', '951.0000', '5.0000', '4154e1fb3d458a8de0b452d9b9ecb782.jpg', 18, 72, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 134, '0.0000', NULL, 0),
(637, 'HW634', 'Mahashakti Stainless Steel 10 inch Door', 4, '0.0000', '8948.0000', '5.0000', '59285223ca550c3418c5b9c64a453d96.jpg', 18, 72, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 118, '0.0000', NULL, 0),
(638, 'HW635', 'I-Ten Starfish Aldrop', 4, '0.0000', '699.0000', '5.0000', '1c00f85012a1d9726fa6140048ba5d7e.jpg', 18, 72, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 131, '0.0000', NULL, 0),
(639, 'HW636', 'I-Ten Brown Straight Aldrop', 4, '0.0000', '699.0000', '5.0000', 'e3754e34f9bcb7a8a6237aea56be459e.jpg', 18, 72, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 131, '0.0000', NULL, 0),
(640, 'HW637', 'Rocket Golden Aldrop', 4, '0.0000', '2419.0000', '5.0000', '6ae988ce20e164c54fc0de6738f4c541.jpg', 18, 72, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 133, '0.0000', NULL, 0),
(641, 'HW638', 'Mahashakti Steel Door Aldrop', 4, '0.0000', '4738.0000', '5.0000', 'a7930231404999aaa81152000ff09af5.jpg', 18, 72, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 118, '0.0000', NULL, 0),
(642, 'HW639', 'Q-Seven (3+1) Aldrop, Silver Satin', 4, '0.0000', '1055.0000', '5.0000', 'c8e39476c460dff8463dacbab94ae67d.jpg', 18, 72, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 134, '0.0000', NULL, 0),
(643, 'HW640', 'Q-Seven (3+1) Aldrop, Antic', 4, '0.0000', '1072.0000', '5.0000', '0445eedf7a0bd14f4a4aad65414147c5.jpg', 18, 72, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 134, '0.0000', NULL, 0),
(644, 'HW641', 'Godrej, Cam Lock', 4, '0.0000', '5250.0000', '5.0000', 'e68caf1856082db6aee202218e4fc4d1.jpg', 18, 73, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(645, 'HW642', 'Godrej, Fusion Rosette, 7729', 4, '0.0000', '5344.0000', '5.0000', 'b4518c047ec173e90c151611f13c4a4c.jpg', 18, 73, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(646, 'HW643', 'Godrej, Gloria Rossette', 4, '0.0000', '9000.0000', '5.0000', '7782cd8a068f988f8283904c0b264ea2.jpg', 18, 73, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(647, 'HW644', 'Godrej, Table Lock, Left Opening', 4, '0.0000', '5300.0000', '5.0000', '9c38246e79425212f10086ffe563afd7.jpg', 18, 73, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(648, 'HW645', 'Godrej, Anoushka Pull Handle', 4, '0.0000', '5475.0000', '5.0000', '6e4c39a94e71b03f8955aed7c77bcf9c.jpg', 18, 73, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(649, 'HW646', 'Godrej, Curvo Drawer Lock', 4, '0.0000', '5232.0000', '5.0000', 'a7c7221f7f7ae297b46501b5efa02fd8.jpg', 18, 73, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(650, 'HW647', 'Harrison Door Stopper', 4, '0.0000', '392.0000', '5.0000', '46ce1706443ecf8b9795f26213a7a3a0.jpg', 18, 73, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 3, '0.0000', NULL, 0),
(651, 'HW648', 'Godrej, Supernova Wardrobe Lock', 4, '0.0000', '4377.0000', '5.0000', '669cb36e26763658186badb853e827b4.jpg', 18, 73, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(652, 'HW649', 'Godrej, Drawer Channel Zinc Plated', 4, '0.0000', '5850.0000', '5.0000', 'e519cde10b24e0cda74c705e89dfd0d9.jpg', 18, 73, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(653, 'HW650', 'Godrej, Curvo Wardrobe Lock', 4, '0.0000', '4782.0000', '5.0000', 'e24ac31089b5a84a7418af762f71f3ae.jpg', 18, 73, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 2, '0.0000', NULL, 0),
(654, 'HW651', 'SN Chrome Plated 5 Pin Wall Pegs', 4, '0.0000', '13574.0000', '5.0000', '7d8d0c43669e7be93b830f736b64278e.jpg', 19, 74, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 128, '0.0000', NULL, 0),
(655, 'HW652', 'Q-Seven (3+1) Aldrop, Silver Satin, Q7-ROYAL', 4, '0.0000', '710.0000', '5.0000', 'bce870c6e75a0d68b8aa2927e6fbd890.jpg', 19, 74, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 134, '0.0000', NULL, 0),
(656, 'HW653', 'SN 2 Tone Cherry Wall Pegs', 4, '0.0000', '11835.0000', '5.0000', '10f7893be3f142b3181bbd998f430c78.jpg', 19, 74, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 128, '0.0000', NULL, 0),
(657, 'HW654', 'Yashika Home Classic Multipurpose Hook For 4', 4, '0.0000', '679.0000', '5.0000', '3be5437557f2e8923cd510afd6e035c3.jpg', 19, 74, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 136, '0.0000', NULL, 0),
(658, 'HW655', 'Yashika Home Dolphin Key Hanger For 6', 4, '0.0000', '629.0000', '5.0000', '67df696dc1c53fc2ac1243e323a311b3.jpg', 19, 74, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 136, '0.0000', NULL, 0),
(659, 'HW656', 'Origins Steel Finish Flute Key Holder', 4, '0.0000', '2598.0000', '5.0000', '6f70f9b1aae2a76c4f29bc386ccb5f5f.jpg', 19, 74, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 0, '0.0000', NULL, 0),
(660, 'HW657', 'Origins Steel Finish Trumpate Key holder, OST1', 4, '0.0000', '2598.0000', '5.0000', '0f44f752e1f6e607a27ab88e597a730b.jpg', 19, 74, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 0, '0.0000', NULL, 0),
(661, 'HW658', 'Jarman Golden Fancy Flute Key Stand', 4, '0.0000', '491.0000', '5.0000', '8345624253636db6d1209dd97556841f.jpg', 19, 74, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 138, '0.0000', NULL, 0),
(662, 'HW659', 'Jarman Brown Flute Key Stand', 4, '0.0000', '480.0000', '5.0000', '13c03211e7603990cd98c31f306fa01d.jpg', 19, 74, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 138, '0.0000', NULL, 0),
(663, 'HW660', 'SN 10 Pin Wall Pegs', 4, '0.0000', '2545.0000', '5.0000', '6e69ea69351e147549b79568ca398ca0.jpg', 19, 74, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 128, '0.0000', NULL, 0),
(664, 'HW661', 'Stanley Door Eye Viewer', 4, '0.0000', '556.0000', '5.0000', 'a90fcd29a1867212b2aa50fa0f0b0d35.jpg', 19, 75, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 62, '0.0000', NULL, 0),
(665, 'HW662', 'Shree Arc Auto Locking Hook', 4, '0.0000', '90.0000', '5.0000', 'd9efb7fc0d4577d9b1e02e6a081bb805.jpg', 19, 75, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 140, '0.0000', NULL, 0),
(666, 'HW663', 'Stanley Door Eye Viewer, Satin Stainless Steel', 4, '0.0000', '556.0000', '5.0000', '7a61a889ad83c3e113f61aa575d495c3.jpg', 19, 75, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 62, '0.0000', NULL, 0),
(667, 'HW664', 'Shree Arc Manual Hook', 4, '0.0000', '135.0000', '5.0000', '666a6d9bb3250a50f05c10a434f54ca0.jpg', 19, 75, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 140, '0.0000', NULL, 0),
(668, 'HW665', 'Shree Arc Scaf Hold Hook', 4, '0.0000', '338.0000', '5.0000', '82f5ce240cdd615cd7cf486b1292dfe1.jpg', 19, 75, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 140, '0.0000', NULL, 0),
(669, 'HW666', 'Golden Lock Door Viewer', 4, '0.0000', '3000.0000', '5.0000', '77b2f94cf6a06f259e10c9f40728b455.jpg', 19, 75, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 141, '0.0000', NULL, 0),
(670, 'HW667', 'Shree Arc Self Closing Hook', 4, '0.0000', '113.0000', '5.0000', '9cca19df54cda4e602bf03b4f0a46ef1.jpg', 19, 75, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 140, '0.0000', NULL, 0),
(671, 'HW668', 'Golden Lock Door Viewer, Cd-141-AB', 4, '0.0000', '3000.0000', '5.0000', '3edf25034314a83d6c27bb3bfc03ab77.jpg', 19, 75, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 141, '0.0000', NULL, 0),
(672, 'HW669', 'SS 304 Threaded Rod 1 Inch Dia.', 4, '0.0000', '3002.0000', '5.0000', '997abbf7449da6d8fb1803eada935e2d.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(673, 'HW670', 'SS 304 Threaded Rod 7/8 inch dia. (1 mtr. Length)', 4, '0.0000', '2304.0000', '5.0000', '505da16a34656e4e233d222f9bc12297.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(674, 'HW671', 'SS 304 Threaded Rod 3/4 inch dia. (1 mtr. Length)', 4, '0.0000', '1658.0000', '5.0000', '283ff95f5a241cc47f51354a4d28f618.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(675, 'HW672', 'SS 304 Threaded Rod 5/8 inch dia', 4, '0.0000', '1128.0000', '5.0000', 'eb6343902c2d0ffb6cfa4dd3431fb2f5.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(676, 'HW673', 'SS 304 Threaded Rod 1/2 inch dia', 4, '0.0000', '289.0000', '5.0000', '5cec3b51b658150ee2a97d5bb8a0e691.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(677, 'HW674', 'SS 304 Threaded Rod 3/8 inch dia', 4, '0.0000', '393.0000', '5.0000', '76bb5735abf4ccab443f8f68bf6558c2.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(678, 'HW675', 'SS 304 Threaded Rod 5/16 inch dia', 4, '0.0000', '270.0000', '5.0000', '861c513892c706cd2473bc59f16e7e78.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(679, 'HW676', 'SS 304 Threaded Rod 1/4 inch dia', 4, '0.0000', '178.0000', '5.0000', 'bd6c825e2297a59d107b3475caca1404.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(680, 'HW677', 'SS 304 Threaded Rod 3/16 inch dia.', 4, '0.0000', '174.0000', '5.0000', 'e86c5f5e62ea4c2ac47e244a66aab6d5.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(681, 'HW678', 'SS 304 Threaded Rod 36 mm. dia', 4, '0.0000', '6113.0000', '5.0000', '5557f1b8b086adbee9f4f6d398519cf5.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(682, 'HW679', 'SS 304 Anchor Fasteners Through Bolt Type With Nut & Washer 150 x 16 mm', 4, '0.0000', '3876.0000', '5.0000', '79a50bd7d52aea6448c6f329c0f67c51.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(683, 'HW680', 'SS 304 Anchor Fasteners Through Bolt Type With Nut & Washer 125 x 16 mm.', 4, '0.0000', '3420.0000', '5.0000', 'a31891e1b998f76a3635dd5b4808ee51.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0);
INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `mrp`, `hsn_code`, `is_featured`) VALUES
(684, 'HW681', 'SS 304 Anchor Fasteners Through Bolt Type With Nut & Washer 150 x 12 mm', 4, '0.0000', '2280.0000', '5.0000', '7522ad1beb43ac1df35b41a2de0b4105.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(685, 'HW682', 'SS 304 Anchor Fasteners Through Bolt Type With Nut & Washer 125 x 12 mm', 4, '0.0000', '1995.0000', '5.0000', 'b551cd9ba67c2eaa73a00aecd64a9b22.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(686, 'HW683', 'SS 304 Anchor Fasteners Through Bolt Type With Nut & Washer 150 x 10 mm', 4, '0.0000', '1596.0000', '5.0000', '74083e36af3dc3f82226fd16ec33092a.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(687, 'HW684', 'SS 304 Anchor Fasteners Through Bolt Type With Nut & Washer 125 x 10 mm', 4, '0.0000', '1425.0000', '5.0000', '24434deea219910a4565ac0d4afa76b6.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(688, 'HW685', 'SS 304 Anchor Fasteners Through Bolt Type With Nut & Washer 100 x 10 mm', 4, '0.0000', '1254.0000', '5.0000', '59c1691168f13d5d0bddfaae33800727.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(689, 'HW686', 'SS 304 Anchor Fasteners Through Bolt Type With Nut & Washer 75 x 10 mm', 4, '0.0000', '1083.0000', '5.0000', 'd4567a94ca6b0998e9ea2079c92d7ee4.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(690, 'HW687', 'SS 304 Anchor Fasteners Through Bolt Type With Nut & Washer 150 x 8 mm', 4, '0.0000', '750.0000', '5.0000', '3cd6177f87a5012d638934d3f1753977.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(691, 'HW688', 'SS 304 Anchor Fasteners Through Bolt Type With Nut & Washer 125 x 8 mm', 4, '0.0000', '969.0000', '5.0000', '1c50749ceb7206959aaabb3395b72553.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(692, 'HW689', 'SS 304 Anchor Fasteners Pin Type With Nut & Washer 200 x 16 mm', 4, '0.0000', '5200.0000', '5.0000', '5d7fa2c3efe0a4aba6df5870f798a18e.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(693, 'HW690', 'SS 304 Anchor Fasteners Pin Type With Nut & Washer 150 x 16 mm', 4, '0.0000', '3050.0000', '5.0000', 'd18655f81fe4a6639d40721996e85c6f.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(694, 'HW691', 'SS 304 Anchor Fasteners Pin Type With Nut & Washer 125 x 16 mm', 4, '0.0000', '3050.0000', '5.0000', 'b95e162acb4d4af7294c632c89069e06.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(695, 'HW692', 'SS 304 Anchor Fasteners Pin Type With Nut & Washer 100 x 16 mm', 4, '0.0000', '2540.0000', '5.0000', '5c5cef27739d70f204afaa9078b80768.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(696, 'HW693', 'SS 304 Anchor Fasteners Pin Type With Nut & Washer 200 x 12 mm', 4, '0.0000', '3000.0000', '5.0000', '60f2e026a94fb9a0985710fc1b7572b6.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(697, 'HW694', 'SS 304 Anchor Fasteners Pin Type With Nut & Washer 150 x 12 mm', 4, '0.0000', '2200.0000', '5.0000', 'c5dd04926a0810000cf4dab34790e4a8.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(698, 'HW695', 'SS 304 Anchor Fasteners Pin Type With Nut & Washer 125 x 12 mm', 4, '0.0000', '1630.0000', '5.0000', '820a3fcaf4ee8b6f1e93ce85f756aa0d.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(699, 'HW696', 'SS 304 Anchor Fasteners Pin Type With Nut & Washer 100 x 12 mm', 4, '0.0000', '1450.0000', '5.0000', 'bbdcca5569b86511cdbe548b3f6e9b4e.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(700, 'HW697', 'SS 304 Anchor Fasteners Pin Type With Nut & Washer 75 x 12 mm', 4, '0.0000', '1100.0000', '5.0000', '4ef626b5d0c6e09c00c1eb6d9fc660ce.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(701, 'HW698', 'SS 304 Anchor Fasteners Pin Type With Nut & Washer 200 x 10 mm', 4, '0.0000', '2500.0000', '5.0000', '117a735cb6f27906deb3eed7d52c29e7.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(702, 'HW699', 'SS Wood Screw 100 mm x 12 mm', 4, '0.0000', '1498.0000', '5.0000', 'c657d9394b7ff714b2848a06b719ff3d.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(703, 'HW700', 'SS Wood Screw 75 mm x 12 mm', 4, '0.0000', '980.0000', '5.0000', '1e886e53e40e0bbfd349693fbde99259.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(704, 'HW701', 'SS Wood Screw 60 mm x 12 mm', 4, '0.0000', '615.0000', '5.0000', '6863cb84a704399de02b11d1eca0eb85.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(705, 'HW702', 'SS Wood Screw 50 mm x 12 mm', 4, '0.0000', '343.0000', '5.0000', 'a93a75a87600db9b145c5f74caccfe65.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(706, 'HW703', 'SS Wood Screw 100 mm x 10 mm', 4, '0.0000', '1185.0000', '5.0000', '7f04f46ffabee051c76f16dd6ec398f6.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(707, 'HW704', 'SS Wood Screw 75 mm x 10 mm', 4, '0.0000', '909.0000', '5.0000', '995cc33dd404fa567ea52f6b844b87f9.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(708, 'HW705', 'SS Wood Screw 60 mm x 10 mm', 4, '0.0000', '553.0000', '5.0000', 'f3f25b552c62aac3ce2831c1ef2f8226.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(709, 'HW706', 'SS Wood Screw 50 mm x 10 mm', 4, '0.0000', '295.0000', '5.0000', 'ce580f3dad1a7cfa00e3bf1b82811317.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(710, 'HW707', 'SS Wood Screw 45 mm x 10 mm', 4, '0.0000', '257.0000', '5.0000', '6d3c3551c31ccd49a1f3183ba086cebf.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(711, 'HW708', 'SS Wood Screw 35 mm x 10 mm', 4, '0.0000', '219.0000', '5.0000', '19141aa8e8f3f6faa89bae28bc5a0ed1.jpg', 11, 76, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 142, '0.0000', NULL, 0),
(712, 'HW709', 'Wudtul Nail, WT/S/F 20', 4, '0.0000', '690.0000', '5.0000', 'b4c4142458e64de0776d71825ce5b726.jpg', 11, 77, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 143, '0.0000', NULL, 0),
(713, 'HW710', 'Wudtul Nails, H&P/S/F30', 4, '0.0000', '295.0000', '5.0000', '664b8bc26d6b9bb3ce8d860e7d113f28.jpg', 11, 77, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 143, '0.0000', NULL, 0),
(714, 'HW711', 'Wudtul Nails, WT/S/F12', 4, '0.0000', '174.0000', '5.0000', '6b5596d8a91c6eecd0ffbbec326437f6.jpg', 11, 77, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 143, '0.0000', NULL, 0),
(715, 'HW712', 'Wudtul Nails, H&P/S/F40', 4, '0.0000', '358.0000', '5.0000', '0a8eceeb59b86d46009f060c2d622284.jpg', 11, 77, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 143, '0.0000', NULL, 0),
(716, 'HW713', 'Wudtul Nails, WT/S/T38', 4, '0.0000', '446.0000', '5.0000', '85dd6f2d962cddea540ce40050b8e237.jpg', 11, 77, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 143, '0.0000', NULL, 0),
(717, 'HW714', 'Wudtul Nails, H&P/S/F15', 4, '0.0000', '174.0000', '5.0000', 'e9afa5c0e63b6bcd186d7b2c2d6af485.jpg', 11, 77, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 143, '0.0000', NULL, 0),
(718, 'HW715', 'Wudtul Nail, WT/S/T 50', 4, '0.0000', '925.0000', '5.0000', 'c4b491e7a842e2a4e99bb2e316c44f54.jpg', 11, 77, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 143, '0.0000', NULL, 0),
(719, 'HW716', 'Wudtul Nails, WT/S/F32', 4, '0.0000', '305.0000', '5.0000', '9d23cb9e44f9bd5b25b0b8a8a5e3114a.jpg', 11, 77, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 143, '0.0000', NULL, 0),
(720, 'HW717', 'Wudtul Nails, WT/S/T32', 4, '0.0000', '366.0000', '5.0000', 'e2b560ee001887ca12a88accee9a8afb.jpg', 11, 77, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 143, '0.0000', NULL, 0),
(721, 'HW718', 'Wudtul Nails, WT/S/F25', 4, '0.0000', '232.0000', '5.0000', '4cd7a9c76eedded4614aa2ff5069f57c.jpg', 11, 77, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 143, '0.0000', NULL, 0),
(722, 'HW719', 'Nord-Lock Steel Washer, NL12', 4, '0.0000', '9466.0000', '5.0000', '2f3fd44381022ded2a0319a9899906ed.jpg', 11, 78, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 144, '0.0000', NULL, 0),
(723, 'HW720', 'Nord-Lock Steel Washer, NL80', 4, '0.0000', '14876.0000', '5.0000', 'db3c245bd2577ff4da2797b5610fd28d.jpg', 11, 78, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 144, '0.0000', NULL, 0),
(724, 'HW721', 'Nord-Lock Steel Washer, NL22', 4, '0.0000', '15262.0000', '5.0000', '04f7915c34fbe78b7c729735f0317e58.jpg', 11, 78, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 144, '0.0000', NULL, 0),
(725, 'HW722', 'Nord-Lock Steel Washer, NL6', 4, '0.0000', '4830.0000', '5.0000', 'd71646e1b57a528d1985cb3ce6ed1fbc.jpg', 11, 78, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 144, '0.0000', NULL, 0),
(726, 'HW723', 'Ms Plain Washer, M-24', 4, '0.0000', '4268.0000', '5.0000', '790c5205cb9e408e43a2c2d63aeec580.jpg', 11, 78, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 0, '0.0000', NULL, 0),
(727, 'HW724', 'Ms Plain Washer, M-10', 4, '0.0000', '4878.0000', '5.0000', '6c4363872e563207d5ddaf0128d56e57.jpg', 11, 78, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 0, '0.0000', NULL, 0),
(728, 'HW725', 'Nord-Lock Stainless Steel Washer, NL6SS', 4, '0.0000', '16615.0000', '5.0000', 'c81345c871265d7b46b6243c0278551b.jpg', 11, 78, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 144, '0.0000', NULL, 0),
(729, 'HW726', 'Nord-Lock Stainless Steel Washer, NL3/8 inch SPSS', 4, '0.0000', '35935.0000', '5.0000', '905fc7ccc3eeb990254c03685c3b5cc9.jpg', 11, 78, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 144, '0.0000', NULL, 0),
(730, 'HW727', 'APS mm Ms Plain Washer', 4, '0.0000', '3354.0000', '5.0000', '4d023d8e320b8eab63259760ef5aead3.jpg', 11, 78, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 145, '0.0000', NULL, 0),
(731, 'HW728', 'Nord-Lock Steel Washer, NL36', 4, '0.0000', '10505.0000', '5.0000', 'ef8385cc60a8b501cfa355bc453583f6.jpg', 11, 78, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 144, '0.0000', NULL, 0),
(732, 'HW729', 'Eastman L - Type Spanner With or Without Tyre Lever, E-2011', 4, '0.0000', '160.0000', '5.0000', '098eebb8e5a04782363a3901b7ea6673.jpg', 8, 79, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 69, '0.0000', NULL, 0),
(733, 'HW730', 'Mansarovar 19 mm L Spanner Heavy Duty With Hole, No. 111', 4, '0.0000', '1341.0000', '5.0000', '4a85733ec8cab52f3d3ee2fa8062e780.jpg', 8, 79, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 147, '0.0000', NULL, 0),
(734, 'HW731', 'Jet Lath Tool Post Goti', 4, '0.0000', '165.0000', '5.0000', '5ea48ea97b7223466f748f5f03ee4e32.jpg', 8, 79, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 57, '0.0000', NULL, 0),
(735, 'HW732', 'Ajay 6 Pcs Combination Spanner Set, AJCS/6M', 4, '0.0000', '244.0000', '5.0000', 'a444ad48f832a1f75c8dc8ea03e866d0.jpg', 8, 79, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 149, '0.0000', NULL, 0),
(736, 'HW733', 'Taparia Ring Spanners Sets 8 Pieces,1808', 4, '0.0000', '600.0000', '5.0000', '7fe588ee10b532b84c7b75ce4a0cef35.jpg', 8, 79, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 66, '0.0000', NULL, 0),
(737, 'HW734', 'Eastman Double Open Ended Heavy Duty Spanner, E-2001', 4, '0.0000', '160.0000', '5.0000', '6a6e5fb2dd4842f23848060a53aeb66b.jpg', 8, 79, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 69, '0.0000', NULL, 0),
(738, 'HW735', 'Stanley 6 Point T-Handle Socket', 4, '0.0000', '424.0000', '5.0000', '757c9a64beeaf6a874716b3c26df6c0d.jpg', 8, 79, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 62, '0.0000', NULL, 0),
(739, 'HW736', 'Eastman Slogging Spanner-Open End - CRV, E-2081', 4, '0.0000', '460.0000', '5.0000', '04e2cc266497c2fc872b388fde616f80.jpg', 8, 79, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 69, '0.0000', NULL, 0),
(740, 'HW737', 'Jhalani Tubular Box Spanner 9x10', 4, '0.0000', '440.0000', '5.0000', '29132921edc78200e093d50f1e760dbf.jpg', 8, 79, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 151, '0.0000', NULL, 0),
(741, 'HW738', 'Pro''skit VDE 1000V Insulated Single Open End Wrench, HW-V124B', 4, '0.0000', '3079.0000', '5.0000', '0d99ea05a7cfda4df3486a0ae31e9f05.jpg', 8, 79, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 152, '0.0000', NULL, 0),
(742, 'HW739', 'Goodyear 75 mm Screwdriver Phillips', 4, '0.0000', '40.0000', '5.0000', 'c06b922cb647de6fdf6c3b7db02b1edf.jpg', 8, 80, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 68, '0.0000', NULL, 0),
(743, 'HW740', 'Taparia Philips Screw Driver, Tip No. 2', 4, '0.0000', '300.0000', '5.0000', '38d6e1e3f96f23d1b71b835fbd99d61d.jpg', 8, 80, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 66, '0.0000', NULL, 0),
(744, 'HW741', 'Stanley Phillips Screwdriver', 4, '0.0000', '450.0000', '5.0000', '7e8485649bb56b4e6ac5c87808b5df38.jpg', 8, 80, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 62, '0.0000', NULL, 0),
(745, 'HW742', 'Pro''skit Line Color Screwdrivers Philips, 89106B', 4, '0.0000', '311.0000', '5.0000', 'a42ff17d06811c96b1cb70b551d7984a.jpg', 8, 80, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 152, '0.0000', NULL, 0),
(746, 'HW743', 'Stanley Cushion Grip2 Phillips Screwdriver', 4, '0.0000', '2479.0000', '5.0000', '6b6f0240f0a0fafc087113802357dcb5.jpg', 8, 80, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 62, '0.0000', NULL, 0),
(747, 'HW744', 'Stanley Spark Detecting Screwdriver With Linesman Tester', 4, '0.0000', '1140.0000', '5.0000', 'd21bfe95121d41ba0179344557d4c144.jpg', 8, 80, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 62, '0.0000', NULL, 0),
(748, 'HW745', 'Pro''skit VDE Insulated Screwdriver, SD-800-P2', 4, '0.0000', '611.0000', '5.0000', '2d9a7b169df0c8df3d3ee16799045df0.jpg', 8, 80, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 152, '0.0000', NULL, 0),
(749, 'HW746', 'Taparia Three in One Tester, 817 & 1413, 1200mm', 4, '0.0000', '94.0000', '5.0000', '419f337e8d976c8ec91de708dbdee9cd.jpg', 8, 80, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 66, '0.0000', NULL, 0),
(750, 'HW747', 'Taparia Three in One tester, 817 & 1413, 1200 mm', 4, '0.0000', '940.0000', '5.0000', 'f36459f7db6f46e4e1710afd8b488ee5.jpg', 8, 80, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 66, '0.0000', NULL, 0),
(751, 'HW748', 'VTR Electrician Pattern Screwdriver', 4, '0.0000', '164.0000', '5.0000', '7ab58c0bb0dc053341c98d8291147eb2.jpg', 8, 80, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 154, '0.0000', NULL, 0),
(752, 'HW749', 'TATA AGRICO 8 Inch Combination Cutting Plier', 4, '0.0000', '257.0000', '5.0000', '8f31b8eae1ed52b083413d10839343b4.jpg', 8, 81, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 181, '0.0000', NULL, 0),
(753, 'HW750', 'Taparia Combination Plier', 4, '0.0000', '2110.0000', '5.0000', '5f78e724216e202ca28fed420f7bdc6e.jpg', 8, 81, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 66, '0.0000', NULL, 0),
(754, 'HW751', 'Goodyear Combination Plier', 4, '0.0000', '170.0000', '5.0000', '06abe7fc20c50fe79436ac2cdc5d8690.jpg', 8, 81, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 68, '0.0000', NULL, 0),
(755, 'HW752', 'Tata Agrico Combination Cutting plier', 4, '0.0000', '235.0000', '5.0000', '48dd7a65b7777dad4ae9ed3c0fed3f16.jpg', 8, 81, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 181, '0.0000', NULL, 0),
(756, 'HW753', 'Taparia Combination Plier, Design 178415', 4, '0.0000', '2000.0000', '5.0000', 'a10a057ec096cdd40a65293d02f3e660.jpg', 8, 81, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 66, '0.0000', NULL, 0),
(757, 'HW754', 'BAUM Combination Cutting Pliers', 4, '0.0000', '252.0000', '5.0000', 'a9b839150801493b23b7e9c4549e9002.jpg', 8, 81, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 155, '0.0000', NULL, 0),
(758, 'HW755', 'JCB Combination Pliers', 4, '0.0000', '367.0000', '5.0000', '80be1a4bf0eca4c31f4bc7b47fdba023.jpg', 8, 81, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 156, '0.0000', NULL, 0),
(759, 'HW756', 'Pro''skit Combination Plier, 1PK-052AS', 4, '0.0000', '1195.0000', '5.0000', '721b8cfe1cf49640eb21c49bb5f166e9.jpg', 8, 81, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 152, '0.0000', NULL, 0),
(760, 'HW757', 'Gripp 8 Inch Combination Plier', 4, '0.0000', '160.0000', '5.0000', '6a10fc6f8634f245a808fae2be2a9842.jpg', 8, 81, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 157, '0.0000', NULL, 0),
(761, 'HW758', 'Kennedy Combination Pliers With Side Cutter,KEN5583520K', 4, '0.0000', '1543.0000', '5.0000', '0944097e67fe20b96273f460a48591a5.jpg', 8, 81, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 63, '0.0000', NULL, 0),
(762, 'HW759', 'Goodyear Claw Hammer', 4, '0.0000', '275.0000', '5.0000', '69498525501354de01b029822f292095.jpg', 8, 82, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 68, '0.0000', NULL, 0),
(763, 'HW760', 'Goodyear Club Hammer With Wooden Handle', 4, '0.0000', '360.0000', '5.0000', 'af70f0ca1b0e6f50501d390f0eb08799.jpg', 8, 82, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 68, '0.0000', NULL, 0),
(764, 'HW761', 'Dell Economy Ball Pein Hammer', 4, '0.0000', '48.0000', '5.0000', '80c4332727dde82ed04e00e4621a9645.jpg', 8, 82, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 59, '0.0000', NULL, 0),
(765, 'HW762', 'Dell Economy Claw Hammer', 4, '0.0000', '51.0000', '5.0000', 'b1e970a7e6ab91c36a763d2d0a5f0274.jpg', 8, 82, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 59, '0.0000', NULL, 0),
(766, 'HW763', 'Eastman Ball Pein Hammer-American', 4, '0.0000', '650.0000', '5.0000', 'a1e4d015e40bc3606f276b2151cd4ed0.jpg', 8, 82, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 69, '0.0000', NULL, 0),
(767, 'HW764', 'Eastman Cross Pein Hammer, E-2065', 4, '0.0000', '650.0000', '5.0000', '5fcc408c03e852be25d84a9ac8254ccb.jpg', 8, 82, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 69, '0.0000', NULL, 0),
(768, 'HW765', 'Stanley Ball Pein Hammer', 4, '0.0000', '175.0000', '5.0000', '5c7297f870673e31b495ace30775c15a.jpg', 8, 82, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 62, '0.0000', NULL, 0),
(769, 'HW766', 'Ajay Ball Pein Hammer A-179', 4, '0.0000', '742.0000', '5.0000', '74334f3a32994b942599f23ffdba5624.jpg', 8, 82, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 149, '0.0000', NULL, 0),
(770, 'HW767', 'Ajay Cross Pein Hammer A-179', 4, '0.0000', '742.0000', '5.0000', '8330a498ae7f26eb14f03968ea78281f.jpg', 8, 82, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 149, '0.0000', NULL, 0),
(771, 'HW768', 'Goodyear Ball Pein Hammer With Fiber Glass Handle', 4, '0.0000', '230.0000', '5.0000', 'd55ab4a9b87f57663ebbc14992396c09.jpg', 8, 82, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 68, '0.0000', NULL, 0),
(772, 'HW769', 'Bizinto 30 M Measuring Tape, UV_HTN_1', 4, '0.0000', '416.0000', '5.0000', '3ca9689752665143d973702a96df6482.jpg', 8, 83, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 160, '0.0000', NULL, 0),
(773, 'HW770', 'Bizinto Self-retract Flexible Metric Tape Measure Tape', 4, '0.0000', '190.0000', '5.0000', '31fbe176e39ba77d081d1facff9c66d0.jpg', 8, 83, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 160, '0.0000', NULL, 0),
(774, 'HW771', 'Freemans 3 M TRUFLEX Steel Tape Rules', 4, '0.0000', '628.0000', '5.0000', 'ac5a18ecfe98bff842a7fb18686885a0.jpg', 8, 83, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 161, '0.0000', NULL, 0),
(775, 'HW772', 'Assorted Measuring Tape 3 Meter', 4, '0.0000', '800.0000', '5.0000', 'a8cb7db42a8d687e8c2a9c8ea968dd00.jpg', 8, 83, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 0, '0.0000', NULL, 0),
(776, 'HW773', 'FREEMANS 100m Laser Distance, PRO-L100', 4, '0.0000', '12315.0000', '5.0000', '1cabc4e790d8e2dffb3dfd9f9cdb3dd3.jpg', 8, 83, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 161, '0.0000', NULL, 0),
(777, 'HW774', 'Freemans MAX 5 m Steel Tape Rules With Belt Clip, MXC, 16 mm', 4, '0.0000', '1365.0000', '5.0000', 'fd2de1c1579179b121af01bc6b7d7ef9.jpg', 8, 83, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 161, '0.0000', NULL, 0),
(778, 'HW775', 'Freemans Open Reel Fibre Glass Tape Measures, FO, 100 m', 4, '0.0000', '1143.0000', '5.0000', '78018a734495cfda89791c3ea9073042.jpg', 8, 83, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 161, '0.0000', NULL, 0),
(779, 'HW776', 'Stanley Plastic Torpedo Level, 42-264', 4, '0.0000', '1674.0000', '5.0000', '1bde00644b7326d990b84e53f78426f8.jpg', 8, 83, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 62, '0.0000', NULL, 0),
(780, 'HW777', 'Freemans 5m IKON Steel Tape Rules, IK', 4, '0.0000', '1390.0000', '5.0000', '579c5c06cb66fd6fa0e6267fa9b3835c.jpg', 8, 83, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 161, '0.0000', NULL, 0),
(781, 'HW778', 'Pro''skit Fish Tape, DK-2033N', 4, '0.0000', '5427.0000', '5.0000', '84d9512689a5d2a7b8dc9e90775652c9.jpg', 8, 83, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 152, '0.0000', NULL, 0),
(782, 'HW779', 'JK Files, Steel Machinists Files', 4, '0.0000', '6900.0000', '5.0000', '76367adee0b7d875d7370779b5ec493b.jpg', 8, 84, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 162, '0.0000', NULL, 0),
(783, 'HW780', 'Taparia Half Round Bastard Steel Files', 4, '0.0000', '2780.0000', '5.0000', 'c7e2194b79ad50502fddf1f8c461973b.jpg', 8, 84, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 66, '0.0000', NULL, 0),
(784, 'HW781', 'Taparia Smooth Half Round Machinists Files', 4, '0.0000', '3190.0000', '5.0000', 'ba94c78395ba4925914767a35a2ce383.jpg', 8, 84, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 66, '0.0000', NULL, 0),
(785, 'HW782', 'Taparia 2nd Cut Slim Taper Saw Files', 4, '0.0000', '420.0000', '5.0000', 'e2d55b88ab0331e200be717f7309fcbc.jpg', 8, 84, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 66, '0.0000', NULL, 0),
(786, 'HW783', 'BLACK HORSE Smooth Flat Hand Machinist''s File', 4, '0.0000', '2625.0000', '5.0000', '1dcc68c9aaa4052dba7449084fa1d107.jpg', 8, 84, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 163, '0.0000', NULL, 0),
(787, 'HW784', 'Pro''skit 5 Pcs Needle File Set, 8PK-605L', 4, '0.0000', '1314.0000', '5.0000', 'd171a2d70d116ab153e4edce007f61a5.jpg', 8, 84, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 152, '0.0000', NULL, 0),
(788, 'HW785', 'JK Files Warding Smooth Machinist Files', 4, '0.0000', '3210.0000', '5.0000', 'c4498a80fb393322df557dcbbf07f14f.jpg', 8, 84, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 162, '0.0000', NULL, 0),
(789, 'HW786', 'Powergrip Needle File Set, PGNF 612', 4, '0.0000', '441.0000', '5.0000', '3ae0d57403a5f82a099ecfc25aba09b1.jpg', 8, 84, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 164, '0.0000', NULL, 0),
(790, 'HW787', 'Stanley All Purpose File Set, 22-319', 4, '0.0000', '1900.0000', '5.0000', 'c055a7a59ab8a4b0ded26fdbff6894b3.jpg', 8, 84, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 62, '0.0000', NULL, 0),
(791, 'HW788', 'Escon Flat Bastard Machinist File', 4, '0.0000', '2090.0000', '5.0000', '4cc970eae4f58bb032446c89337d7b14.jpg', 8, 84, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 165, '0.0000', NULL, 0),
(792, 'HW789', 'Stanley 5Pc Screw Extractor Set', 4, '0.0000', '408.0000', '5.0000', '77b60f43f4041027c469685ee4f37664.jpg', 8, 85, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 62, '0.0000', NULL, 0),
(793, 'HW790', 'Lovely Flaring Tool', 4, '0.0000', '310.0000', '5.0000', '4301257d574d2f47fbd314a51783ebc3.jpg', 8, 85, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 166, '0.0000', NULL, 0),
(794, 'HW791', 'Bizinto Hand Drill Machine', 4, '0.0000', '257.0000', '5.0000', '20975865340d6bef60627035bb2e923d.jpg', 8, 85, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 160, '0.0000', NULL, 0),
(795, 'HW792', 'Groz Low Profile Drum Trolley', 4, '0.0000', '7214.0000', '5.0000', 'cd0630928be119225eacf4d00783f4b5.jpg', 8, 85, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 167, '0.0000', NULL, 0),
(796, 'HW793', 'Swiss Burr 7 Pcs E Hand Deburring Set', 4, '0.0000', '1955.0000', '5.0000', '7f5ac2f53fcc8f8f01ba2bfb8b66da0f.jpg', 8, 85, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 0, '0.0000', NULL, 0),
(797, 'HW794', 'Ajay Scissor Jacks', 4, '0.0000', '848.0000', '5.0000', '7079158a22b958b8f2e477b8e4fde710.jpg', 8, 85, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 149, '0.0000', NULL, 0),
(798, 'HW795', 'WTC Cutting Plotter', 4, '0.0000', '25859.0000', '5.0000', '0a6bf41becbce91dd456d94cd8f52ad9.jpg', 8, 85, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 168, '0.0000', NULL, 0),
(799, 'HW796', 'Stanley Camp Axe Steel Shaft', 4, '0.0000', '491.0000', '5.0000', '4308cfd71a315071237ebf045ad325e3.jpg', 8, 85, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 62, '0.0000', NULL, 0),
(800, 'HW797', 'FREEMANS 30cm Digital Sprit Level', 4, '0.0000', '3270.0000', '5.0000', 'ec1bdc756f894f989cb0eadb16c573dc.jpg', 8, 85, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 161, '0.0000', NULL, 0),
(801, 'HW798', 'PRINCE Mortising Chain Set', 4, '0.0000', '2476.0000', '5.0000', 'c9e3420d629b09e16ee0f6f3318afb79.jpg', 8, 85, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 169, '0.0000', NULL, 0),
(802, 'HW799', 'Weal Care 5 kg Bucket Grease Pump Without Wheel', 4, '0.0000', '2200.0000', '5.0000', '0602b8f2796860276917a5ba001d3aa2.jpg', 8, 86, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 170, '0.0000', NULL, 0),
(803, 'HW800', 'Weal Care 3 Kg Bucket Grease Pump Without Wheel', 4, '0.0000', '3500.0000', '5.0000', '92f07742c6690c9cf57fc03c7a570350.jpg', 8, 86, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 170, '0.0000', NULL, 0),
(804, 'HW801', 'GoodYear Oil Can', 4, '0.0000', '120.0000', '5.0000', 'b37370dc52b071ec7ec7e0d032209436.jpg', 8, 86, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 68, '0.0000', NULL, 0),
(805, 'HW802', 'JCB High Pressure Grease Bucket', 4, '0.0000', '5198.0000', '5.0000', 'a3e217aac78c35be2b2e95a503d9cc6a.jpg', 8, 86, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 156, '0.0000', NULL, 0),
(806, 'HW803', 'R K Grease Nipple', 4, '0.0000', '6037.0000', '5.0000', 'b63088dae764254d54ef5b3216438525.jpg', 8, 86, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 171, '0.0000', NULL, 0),
(807, 'HW804', 'Groz Air Operated Grease Ratio Pumps 50:1', 4, '0.0000', '19661.0000', '5.0000', 'd4be932ba5500789ae75f282b59fc1d3.jpg', 8, 86, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 167, '0.0000', NULL, 0),
(808, 'HW805', 'Groz Electric Drum Pump', 4, '0.0000', '18795.0000', '5.0000', '626cb5aa14d9fd1b4d13da90ceb1df6a.jpg', 8, 86, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 167, '0.0000', NULL, 0),
(809, 'HW806', 'Ajay Bucket Grease Pump With Trolly', 4, '0.0000', '5727.0000', '5.0000', '0b276cc974dcdcd6ebf0271a340d4878.jpg', 8, 86, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 149, '0.0000', NULL, 0),
(810, 'HW807', 'Weal Care 5 kg Bucket Grease Pump With Wheel', 4, '0.0000', '3170.0000', '5.0000', '3811f7b09a4d119f318e1d98de27eb32.jpg', 8, 86, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 170, '0.0000', NULL, 0),
(811, 'HW808', 'Groz Lever Action Barrel Pump-Heavy Duty', 4, '0.0000', '1414.0000', '5.0000', '82f04553f5255479b44238d95cae26d6.jpg', 8, 86, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 167, '0.0000', NULL, 0),
(812, 'HW809', 'Harit Brass Garden Sprinkler', 4, '0.0000', '2868.0000', '5.0000', 'f2cb48622a1bad45b3813d9803cd4e34.jpg', 8, 87, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 172, '0.0000', NULL, 0),
(813, 'HW810', 'Rutland Hose Tidy, RTL5234090K', 4, '0.0000', '505.0000', '5.0000', 'ebc9456788fa3f868fe1f2bc7a856554.jpg', 8, 87, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 173, '0.0000', NULL, 0),
(814, 'HW811', 'Ketsy Water Sprinkler With Long Base Octagonal Head, 796', 4, '0.0000', '600.0000', '5.0000', 'af95a0d5131f90ccb1faa399b8573bad.jpg', 8, 87, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 67, '0.0000', NULL, 0),
(815, 'HW812', 'Sharpex 66 Inch Snake Catcher', 4, '0.0000', '2415.0000', '5.0000', '8db3786d74ccba67b231871f933ee687.jpg', 8, 87, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 175, '0.0000', NULL, 0),
(816, 'HW813', 'Ketsy 10 Pcs Gardening Tool Kit, 784', 4, '0.0000', '3500.0000', '5.0000', '149e6d03b8ae5ea1c2b848b98e1a4566.jpg', 8, 87, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 67, '0.0000', NULL, 0),
(817, 'HW814', 'Bizinto Garden Shears Pruners Scissor Gardening Cut Tools, UV_HTN_12', 4, '0.0000', '229.0000', '5.0000', '12c69fa3c985181d0c8d562fa7468f5f.jpg', 8, 87, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 160, '0.0000', NULL, 0),
(818, 'HW815', 'Mehta 18 inch Hedge Shear With Wooden Handle', 4, '0.0000', '399.0000', '5.0000', '8a64d0dbe50fb685505d6f4462414c67.jpg', 8, 87, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 176, '0.0000', NULL, 0),
(819, 'HW816', 'Kisankraft Pressure Sprayers', 4, '0.0000', '750.0000', '5.0000', 'a43de23e3b0608ab053ddb5048d742a0.jpg', 8, 87, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 0, '0.0000', NULL, 0);
INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `mrp`, `hsn_code`, `is_featured`) VALUES
(820, 'HW817', 'Decora Green Garden Braided Hoses', 4, '0.0000', '654.0000', '5.0000', '78caba968285f2e354176ad7003b60b3.jpg', 8, 87, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 0, '0.0000', NULL, 0),
(821, 'HW818', 'Agrimate -AF 2000 NT Fogging machine', 4, '0.0000', '50400.0000', '5.0000', 'ecfd56a3f6422f450cb421e5c0280826.jpg', 8, 87, '', '', '', '', '', '', NULL, 0, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 4, 4, 179, '0.0000', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_photos`
--

CREATE TABLE IF NOT EXISTS `sma_product_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_prices`
--

CREATE TABLE IF NOT EXISTS `sma_product_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `price_group_id` int(11) NOT NULL,
  `price` decimal(25,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `price_group_id` (`price_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sales`
--

CREATE TABLE IF NOT EXISTS `sma_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `sale_status` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` tinyint(4) DEFAULT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT '0',
  `paid` decimal(25,4) DEFAULT '0.0000',
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `return_sale_ref` varchar(55) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `return_sale_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `rounding` decimal(10,4) DEFAULT NULL,
  `eshop_sale` tinyint(1) NOT NULL DEFAULT '0',
  `offline_sale` tinyint(1) NOT NULL DEFAULT '0',
  `offline_reference_no` varchar(50) NOT NULL,
  `offline_payment_id` varchar(50) NOT NULL,
  `offline_transaction_type` varchar(50) NOT NULL,
  `cf1` varchar(250) DEFAULT NULL COMMENT 'Patient name pharma',
  `cf2` varchar(250) DEFAULT NULL COMMENT 'Doctor name pharma',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sales_items_tax`
--

CREATE TABLE IF NOT EXISTS `sma_sales_items_tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `attr_code` varchar(50) NOT NULL,
  `attr_name` varchar(250) NOT NULL,
  `attr_per` float NOT NULL,
  `tax_amount` decimal(25,4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sale_items`
--

CREATE TABLE IF NOT EXISTS `sma_sale_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `sale_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `cf1` varchar(250) NOT NULL,
  `cf2` varchar(250) NOT NULL,
  `mrp` decimal(25,4) NOT NULL,
  `hsn_code` varchar(100) DEFAULT NULL COMMENT 'For GST',
  PRIMARY KEY (`id`),
  KEY `sale_id` (`sale_id`),
  KEY `product_id` (`product_id`),
  KEY `product_id_2` (`product_id`,`sale_id`),
  KEY `sale_id_2` (`sale_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sma_settings`
--

CREATE TABLE IF NOT EXISTS `sma_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo2` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `pos_version` varchar(250) NOT NULL,
  `language` varchar(20) NOT NULL,
  `default_warehouse` int(2) NOT NULL,
  `accounting_method` tinyint(4) NOT NULL DEFAULT '0',
  `default_currency` varchar(3) NOT NULL,
  `default_tax_rate` int(2) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `default_tax_rate2` int(11) NOT NULL DEFAULT '0',
  `dateformat` int(11) NOT NULL,
  `sales_prefix` varchar(20) DEFAULT NULL,
  `quote_prefix` varchar(20) DEFAULT NULL,
  `purchase_prefix` varchar(20) DEFAULT NULL,
  `transfer_prefix` varchar(20) DEFAULT NULL,
  `delivery_prefix` varchar(20) DEFAULT NULL,
  `payment_prefix` varchar(20) DEFAULT NULL,
  `return_prefix` varchar(20) DEFAULT NULL,
  `returnp_prefix` varchar(20) DEFAULT NULL,
  `expense_prefix` varchar(20) DEFAULT NULL,
  `item_addition` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(20) NOT NULL,
  `product_serial` tinyint(4) NOT NULL,
  `default_discount` int(11) NOT NULL,
  `product_discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_method` tinyint(4) NOT NULL,
  `tax1` tinyint(4) NOT NULL,
  `tax2` tinyint(4) NOT NULL,
  `overselling` tinyint(1) NOT NULL DEFAULT '0',
  `restrict_user` tinyint(4) NOT NULL DEFAULT '0',
  `restrict_calendar` tinyint(4) NOT NULL DEFAULT '0',
  `timezone` varchar(100) DEFAULT NULL,
  `iwidth` int(11) NOT NULL DEFAULT '0',
  `iheight` int(11) NOT NULL,
  `twidth` int(11) NOT NULL,
  `theight` int(11) NOT NULL,
  `watermark` tinyint(1) DEFAULT NULL,
  `reg_ver` tinyint(1) DEFAULT NULL,
  `allow_reg` tinyint(1) DEFAULT NULL,
  `reg_notification` tinyint(1) DEFAULT NULL,
  `auto_reg` tinyint(1) DEFAULT NULL,
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `mailpath` varchar(55) DEFAULT '/usr/sbin/sendmail',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(10) DEFAULT NULL,
  `corn` datetime DEFAULT NULL,
  `customer_group` int(11) NOT NULL,
  `default_email` varchar(100) NOT NULL,
  `mmode` tinyint(1) NOT NULL,
  `bc_fix` tinyint(4) NOT NULL DEFAULT '0',
  `auto_detect_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `reference_format` tinyint(1) NOT NULL DEFAULT '1',
  `racks` tinyint(1) DEFAULT '0',
  `attributes` tinyint(1) NOT NULL DEFAULT '0',
  `product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `decimals` tinyint(2) NOT NULL DEFAULT '2',
  `qty_decimals` tinyint(2) NOT NULL DEFAULT '2',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `invoice_view` tinyint(1) DEFAULT '0',
  `tax_classification_view` tinyint(1) NOT NULL DEFAULT '0',
  `default_biller` int(11) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT '0',
  `each_spent` decimal(15,4) DEFAULT NULL,
  `ca_point` tinyint(4) DEFAULT NULL,
  `each_sale` decimal(15,4) DEFAULT NULL,
  `sa_point` tinyint(4) DEFAULT NULL,
  `update` tinyint(1) DEFAULT '0',
  `sac` tinyint(1) DEFAULT '0',
  `display_all_products` tinyint(1) DEFAULT '0',
  `display_symbol` tinyint(1) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `remove_expired` tinyint(1) DEFAULT '0',
  `barcode_separator` varchar(2) NOT NULL DEFAULT '_',
  `set_focus` tinyint(1) NOT NULL DEFAULT '0',
  `price_group` int(11) DEFAULT NULL,
  `barcode_img` tinyint(1) NOT NULL DEFAULT '1',
  `ppayment_prefix` varchar(20) DEFAULT 'POP',
  `disable_editing` smallint(6) DEFAULT '90',
  `qa_prefix` varchar(55) DEFAULT NULL,
  `update_cost` tinyint(1) DEFAULT NULL,
  `pos_type` varchar(15) NOT NULL,
  `default_printer` int(1) NOT NULL,
  `auto_acceptance` tinyint(1) NOT NULL DEFAULT '0',
  `invoice_view_purchase` tinyint(1) DEFAULT '0',
  `tax_classification_view__purchase` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_settings`
--

INSERT INTO `sma_settings` (`setting_id`, `logo`, `logo2`, `site_name`, `pos_version`, `language`, `default_warehouse`, `accounting_method`, `default_currency`, `default_tax_rate`, `rows_per_page`, `version`, `default_tax_rate2`, `dateformat`, `sales_prefix`, `quote_prefix`, `purchase_prefix`, `transfer_prefix`, `delivery_prefix`, `payment_prefix`, `return_prefix`, `returnp_prefix`, `expense_prefix`, `item_addition`, `theme`, `product_serial`, `default_discount`, `product_discount`, `discount_method`, `tax1`, `tax2`, `overselling`, `restrict_user`, `restrict_calendar`, `timezone`, `iwidth`, `iheight`, `twidth`, `theight`, `watermark`, `reg_ver`, `allow_reg`, `reg_notification`, `auto_reg`, `protocol`, `mailpath`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `corn`, `customer_group`, `default_email`, `mmode`, `bc_fix`, `auto_detect_barcode`, `captcha`, `reference_format`, `racks`, `attributes`, `product_expiry`, `decimals`, `qty_decimals`, `decimals_sep`, `thousands_sep`, `invoice_view`, `tax_classification_view`, `default_biller`, `envato_username`, `purchase_code`, `rtl`, `each_spent`, `ca_point`, `each_sale`, `sa_point`, `update`, `sac`, `display_all_products`, `display_symbol`, `symbol`, `remove_expired`, `barcode_separator`, `set_focus`, `price_group`, `barcode_img`, `ppayment_prefix`, `disable_editing`, `qa_prefix`, `update_cost`, `pos_type`, `default_printer`, `auto_acceptance`, `invoice_view_purchase`, `tax_classification_view__purchase`) VALUES
(1, 'logo300.png', 'logo3001.png', 'Simplysafe', '{"version":"2.06","sql":"2.06"}', 'english', 1, 2, 'INR', 1, 15, '3.0.2.22', 1, 5, 'SALE', 'QUOTE', 'PO', 'TR', 'DO', 'IPAY', 'SR', 'PR', '', 1, 'default', 1, 1, 1, 1, 1, 1, 1, 1, 0, 'Asia/Kolkata', 800, 800, 60, 60, 1, 0, 0, 0, NULL, 'mail', '/usr/sbin/sendmail', 'pop.gmail.com', 'info@simplypos.in', 'jEFTM4T63AiQ9dsidxhPKt9CIg4HQjCN58n/RW9vmdC/UDXCzRLR469ziZ0jjpFlbOg43LyoSmpJLBkcAHh0Yw==', '25', NULL, NULL, 1, 'info@simplysafe.in', 0, 4, 1, 0, 2, 1, 1, 1, 2, 0, '.', ',', 0, 0, 3, 'chetan_ghagre', 'b4444bf5-1e30-495a-a5d7-508e003df772', 0, '100.0000', 1, NULL, NULL, 0, 0, 1, 1, '₹', 0, '_', 0, 2, 1, 'POP', 90, '', 0, '', 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_state_master`
--

CREATE TABLE IF NOT EXISTS `sma_state_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `sma_state_master`
--

INSERT INTO `sma_state_master` (`id`, `code`, `name`) VALUES
(1, 'AP', 'Andhra Pradesh'),
(2, 'AR', 'Arunachal Pradesh'),
(3, 'AS', 'Assam'),
(4, 'BR', 'Bihar'),
(5, 'CG', 'Chhattisgarh'),
(6, 'GA', 'Goa'),
(7, 'GJ', 'Gujarat'),
(8, 'HR', 'Haryana'),
(9, 'HP', 'Himachal Pradesh'),
(10, 'JK', 'Jammu and Kashmir'),
(11, 'JH', 'Jharkhand'),
(12, 'KA', 'Karnataka'),
(13, 'KL', 'Kerala'),
(14, 'MP', 'Madhya Pradesh'),
(15, 'MH', 'Maharashtra'),
(16, 'MN', 'Manipur'),
(17, 'ML', 'Meghalaya'),
(18, 'MZ', 'Mizoram'),
(19, 'NL', 'Nagaland'),
(20, 'OR', 'Odisha(Orissa)'),
(21, 'PB', 'Punjab'),
(22, 'RJ', 'Rajasthan'),
(23, 'SK', 'Sikkim'),
(24, 'TN', 'Tamil Nadu'),
(25, 'TS', 'Telangana'),
(26, 'TR', 'Tripura'),
(27, 'UK', 'Uttar Pradesh'),
(28, 'UP', 'Uttarakhand'),
(29, 'WB', 'West Bengal'),
(30, 'AN', 'Andaman and Nicobar Islands'),
(31, 'CH', 'Chandigarh'),
(32, 'DH', 'Dadra and Nagar Haveli'),
(33, 'DD', 'Daman and Diu'),
(34, 'DL', 'Delhi'),
(35, 'LD', 'Lakshadweep'),
(36, 'PY', 'Pondicherry');

-- --------------------------------------------------------

--
-- Table structure for table `sma_tax_attr`
--

CREATE TABLE IF NOT EXISTS `sma_tax_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sma_tax_attr`
--

INSERT INTO `sma_tax_attr` (`id`, `name`, `code`) VALUES
(1, 'Central Goods and Service Tax', 'CGST'),
(2, 'State Goods and Service Tax', 'SGST'),
(3, 'Integrated Goods and Service Tax', 'IGST');

-- --------------------------------------------------------

--
-- Table structure for table `sma_tax_rates`
--

CREATE TABLE IF NOT EXISTS `sma_tax_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `rate` decimal(12,4) NOT NULL,
  `type` varchar(50) NOT NULL,
  `pos_substitut_tax` int(11) NOT NULL,
  `is_substitutable` tinyint(1) NOT NULL,
  `tax_config` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `sma_tax_rates`
--

INSERT INTO `sma_tax_rates` (`id`, `name`, `code`, `rate`, `type`, `pos_substitut_tax`, `is_substitutable`, `tax_config`) VALUES
(1, '0% GST', '0GST', '0.0000', '1', 0, 0, 'a:2:{i:1;a:4:{s:2:"id";s:1:"1";s:4:"name";s:4:"CGST";s:4:"code";s:4:"CGST";s:10:"percentage";d:0;}i:2;a:4:{s:2:"id";s:1:"2";s:4:"name";s:4:"SGST";s:4:"code";s:4:"SGST";s:10:"percentage";d:0;}}'),
(3, '18% GST', '18GST', '18.0000', '1', 29, 0, 'a:2:{i:1;a:4:{s:2:"id";s:1:"1";s:4:"name";s:4:"CGST";s:4:"code";s:4:"CGST";s:10:"percentage";d:9;}i:2;a:4:{s:2:"id";s:1:"2";s:4:"name";s:4:"SGST";s:4:"code";s:4:"SGST";s:10:"percentage";d:9;}}'),
(15, '5% GST', '5GST', '5.0000', '1', 31, 0, 'a:3:{i:1;a:4:{s:2:"id";s:1:"1";s:4:"name";s:4:"CGST";s:4:"code";s:4:"CGST";s:10:"percentage";d:2.5;}i:2;a:4:{s:2:"id";s:1:"2";s:4:"name";s:4:"SGST";s:4:"code";s:4:"SGST";s:10:"percentage";d:2.5;}i:3;a:4:{s:2:"id";s:1:"3";s:4:"name";s:32:"Integrated Goods and Service Tax";s:4:"code";s:4:"IGST";s:10:"percentage";d:0;}}'),
(16, '12%  GST', '12GST', '12.0000', '1', 28, 0, 'a:2:{i:1;a:4:{s:2:"id";s:1:"1";s:4:"name";s:4:"CGST";s:4:"code";s:4:"CGST";s:10:"percentage";d:6;}i:2;a:4:{s:2:"id";s:1:"2";s:4:"name";s:4:"SGST";s:4:"code";s:4:"SGST";s:10:"percentage";d:6;}}'),
(20, '28% GST', '28GST', '28.0000', '1', 30, 0, 'a:3:{i:1;a:4:{s:2:"id";s:1:"1";s:4:"name";s:4:"CGST";s:4:"code";s:4:"CGST";s:10:"percentage";d:14;}i:2;a:4:{s:2:"id";s:1:"2";s:4:"name";s:4:"SGST";s:4:"code";s:4:"SGST";s:10:"percentage";d:14;}i:3;a:4:{s:2:"id";s:1:"3";s:4:"name";s:32:"Integrated Goods and Service Tax";s:4:"code";s:4:"IGST";s:10:"percentage";d:0;}}'),
(28, '12% GST (IGST )', '12GSTI', '12.0000', '1', 0, 1, 'a:1:{i:3;a:4:{s:2:"id";s:1:"3";s:4:"name";s:32:"Integrated Goods and Service Tax";s:4:"code";s:4:"IGST";s:10:"percentage";d:12;}}'),
(29, '18% GST(IGST)', '18GSTI', '18.0000', '1', 0, 1, 'a:1:{i:3;a:4:{s:2:"id";s:1:"3";s:4:"name";s:32:"Integrated Goods and Service Tax";s:4:"code";s:4:"IGST";s:10:"percentage";d:18;}}'),
(30, '28% GST(IGST)', '28GSTI', '28.0000', '1', 0, 1, 'a:1:{i:3;a:4:{s:2:"id";s:1:"3";s:4:"name";s:32:"Integrated Goods and Service Tax";s:4:"code";s:4:"IGST";s:10:"percentage";d:28;}}'),
(31, '5% GST (IGST)', '5GSTI', '5.0000', '1', 0, 1, 'a:1:{i:3;a:4:{s:2:"id";s:1:"3";s:4:"name";s:32:"Integrated Goods and Service Tax";s:4:"code";s:4:"IGST";s:10:"percentage";d:5;}}');

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses`
--

CREATE TABLE IF NOT EXISTS `sma_warehouses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sma_warehouses`
--

INSERT INTO `sma_warehouses` (`id`, `code`, `name`, `address`, `map`, `phone`, `email`, `price_group_id`) VALUES
(1, 'Ware house 1-1', 'Warehouse 1', '5', '3ac5c17193d28938af8dccb19dc84256.jpeg', '012345678', 'whi@tecdiary.com', 2),
(2, 'WHII', 'Warehouse 2', '10', NULL, '0105292122', 'whii@tecdiary.com', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
