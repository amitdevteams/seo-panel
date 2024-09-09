/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

CREATE TABLE IF NOT EXISTS `alerts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `alert_subject` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `alert_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alert_category` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'general',
  `alert_message` text COLLATE utf8_unicode_ci NOT NULL,
  `alert_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'success',
  `visited` tinyint(1) NOT NULL DEFAULT '0',
  `alert_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `alert_user_delete` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `analytic_sources` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `source_name` (`source_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `auditorpagelinks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `report_id` bigint(20) NOT NULL,
  `link_url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `link_anchor` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `link_title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `nofollow` tinyint(1) NOT NULL DEFAULT '0',
  `extrenal` tinyint(1) NOT NULL DEFAULT '0',
  `brocken` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `report_id` (`report_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `auditorprojects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `website_id` int(11) NOT NULL,
  `max_links` int(11) NOT NULL DEFAULT '500',
  `exclude_links` text COLLATE utf8_unicode_ci NOT NULL,
  `check_pr` tinyint(1) NOT NULL DEFAULT '0',
  `check_backlinks` tinyint(1) NOT NULL DEFAULT '0',
  `check_indexed` tinyint(1) NOT NULL DEFAULT '0',
  `store_links_in_page` tinyint(1) NOT NULL DEFAULT '0',
  `check_brocken` tinyint(1) NOT NULL DEFAULT '0',
  `score` float NOT NULL DEFAULT '0',
  `cron` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `website_id` (`website_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `auditorreports` (
  `id` bigint(24) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `page_url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `page_title` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_description` text COLLATE utf8_unicode_ci,
  `page_keywords` text COLLATE utf8_unicode_ci,
  `pagerank` float NOT NULL DEFAULT '0',
  `google_backlinks` int(11) NOT NULL DEFAULT '0',
  `bing_backlinks` int(11) NOT NULL DEFAULT '0',
  `google_indexed` int(11) NOT NULL DEFAULT '0',
  `bing_indexed` int(11) NOT NULL DEFAULT '0',
  `total_links` int(11) NOT NULL DEFAULT '0',
  `external_links` int(11) NOT NULL DEFAULT '0',
  `brocken` tinyint(1) NOT NULL DEFAULT '0',
  `crawled` tinyint(1) NOT NULL DEFAULT '0',
  `score` smallint(6) NOT NULL DEFAULT '0',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `page_authority` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id_2` (`project_id`,`page_url`),
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `backlinkresults` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `website_id` int(11) NOT NULL,
  `google` int(11) NOT NULL,
  `msn` int(11) NOT NULL,
  `alexa` int(11) NOT NULL,
  `result_time` int(11) NOT NULL DEFAULT '0',
  `result_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `result_date` (`result_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `country` (
  `country_code` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `country_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`country_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `country` (`country_code`, `country_name`) VALUES
('AD', 'Andorra'),
('AE', 'United Arab Emirates'),
('AF', 'Afghanistan'),
('AG', 'Antigua and Barbuda'),
('AI', 'Anguilla'),
('AL', 'Albania'),
('AM', 'Armenia'),
('AN', 'Netherlands Antilles'),
('AO', 'Angola'),
('AP', 'Asia/Pacific Region'),
('AQ', 'Antarctica'),
('AR', 'Argentina'),
('AS', 'American Samoa'),
('AT', 'Austria'),
('AU', 'Australia'),
('AW', 'Aruba'),
('AX', 'Aland Islands'),
('AZ', 'Azerbaijan'),
('BA', 'Bosnia and Herzegovina'),
('BB', 'Barbados'),
('BD', 'Bangladesh'),
('BE', 'Belgium'),
('BF', 'Burkina Faso'),
('BG', 'Bulgaria'),
('BH', 'Bahrain'),
('BI', 'Burundi'),
('BJ', 'Benin'),
('BM', 'Bermuda'),
('BN', 'Brunei Darussalam'),
('BO', 'Bolivia'),
('BR', 'Brazil'),
('BS', 'Bahamas'),
('BT', 'Bhutan'),
('BV', 'Bouvet Island'),
('BW', 'Botswana'),
('BY', 'Belarus'),
('BZ', 'Belize'),
('CA', 'Canada'),
('CC', 'Cocos (Keeling) Islands'),
('CD', 'Congo'),
('CF', 'Central African Republic'),
('CG', 'Congo'),
('CH', 'Switzerland'),
('CI', 'Cote d''Ivoire'),
('CK', 'Cook Islands'),
('CL', 'Chile'),
('CM', 'Cameroon'),
('CN', 'China'),
('CO', 'Colombia'),
('CR', 'Costa Rica'),
('CU', 'Cuba'),
('CV', 'Cape Verde'),
('CX', 'Christmas Island'),
('CY', 'Cyprus'),
('CZ', 'Czech Republic'),
('DE', 'Germany'),
('DJ', 'Djibouti'),
('DK', 'Denmark'),
('DM', 'Dominica'),
('DO', 'Dominican Republic'),
('DZ', 'Algeria'),
('EC', 'Ecuador'),
('EE', 'Estonia'),
('EG', 'Egypt'),
('EH', 'Western Sahara'),
('ER', 'Eritrea'),
('ES', 'Spain'),
('ET', 'Ethiopia'),
('EU', 'Europe'),
('FI', 'Finland'),
('FJ', 'Fiji'),
('FK', 'Falkland Islands (Malvinas)'),
('FM', 'Micronesia Federated States of'),
('FO', 'Faroe Islands'),
('FR', 'France'),
('GA', 'Gabon'),
('GB', 'United Kingdom'),
('GD', 'Grenada'),
('GE', 'Georgia'),
('GF', 'French Guiana'),
('GG', 'Guernsey'),
('GH', 'Ghana'),
('GI', 'Gibraltar'),
('GL', 'Greenland'),
('GM', 'Gambia'),
('GN', 'Guinea'),
('GP', 'Guadeloupe'),
('GQ', 'Equatorial Guinea'),
('GR', 'Greece'),
('GS', 'South Georgia and the South Sandwich Islands'),
('GT', 'Guatemala'),
('GU', 'Guam'),
('GW', 'Guinea-Bissau'),
('GY', 'Guyana'),
('HK', 'Hong Kong'),
('HM', 'Heard Island and McDonald Islands'),
('HN', 'Honduras'),
('HR', 'Croatia'),
('HT', 'Haiti'),
('HU', 'Hungary'),
('ID', 'Indonesia'),
('IE', 'Ireland'),
('IL', 'Israel'),
('IM', 'Isle of Man'),
('IN', 'India'),
('IO', 'British Indian Ocean Territory'),
('IQ', 'Iraq'),
('IR', 'Iran Islamic Republic of'),
('IS', 'Iceland'),
('IT', 'Italy'),
('JE', 'Jersey'),
('JM', 'Jamaica'),
('JO', 'Jordan'),
('JP', 'Japan'),
('KE', 'Kenya'),
('KG', 'Kyrgyzstan'),
('KH', 'Cambodia'),
('KI', 'Kiribati'),
('KM', 'Comoros'),
('KN', 'Saint Kitts and Nevis'),
('KP', 'Korea Democratic People''s Republic of'),
('KR', 'Korea Republic of'),
('KW', 'Kuwait'),
('KY', 'Cayman Islands'),
('KZ', 'Kazakhstan'),
('LA', 'Lao People''s Democratic Republic'),
('LB', 'Lebanon'),
('LC', 'Saint Lucia'),
('LI', 'Liechtenstein'),
('LK', 'Sri Lanka'),
('LR', 'Liberia'),
('LS', 'Lesotho'),
('LT', 'Lithuania'),
('LU', 'Luxembourg'),
('LV', 'Latvia'),
('LY', 'Libyan Arab Jamahiriya'),
('MA', 'Morocco'),
('MC', 'Monaco'),
('MD', 'Moldova Republic of'),
('ME', 'Montenegro'),
('MG', 'Madagascar'),
('MH', 'Marshall Islands'),
('MK', 'Macedonia'),
('ML', 'Mali'),
('MM', 'Myanmar'),
('MN', 'Mongolia'),
('MO', 'Macao'),
('MP', 'Northern Mariana Islands'),
('MQ', 'Martinique'),
('MR', 'Mauritania'),
('MS', 'Montserrat'),
('MT', 'Malta'),
('MU', 'Mauritius'),
('MV', 'Maldives'),
('MW', 'Malawi'),
('MX', 'Mexico'),
('MY', 'Malaysia'),
('MZ', 'Mozambique'),
('NA', 'Namibia'),
('NC', 'New Caledonia'),
('NE', 'Niger'),
('NF', 'Norfolk Island'),
('NG', 'Nigeria'),
('NI', 'Nicaragua'),
('NL', 'Netherlands'),
('NO', 'Norway'),
('NP', 'Nepal'),
('NR', 'Nauru'),
('NU', 'Niue'),
('NZ', 'New Zealand'),
('OM', 'Oman'),
('PA', 'Panama'),
('PE', 'Peru'),
('PF', 'French Polynesia'),
('PG', 'Papua New Guinea'),
('PH', 'Philippines'),
('PK', 'Pakistan'),
('PL', 'Poland'),
('PM', 'Saint Pierre and Miquelon'),
('PN', 'Pitcairn'),
('PR', 'Puerto Rico'),
('PS', 'Palestinian Territory'),
('PT', 'Portugal'),
('PW', 'Palau'),
('PY', 'Paraguay'),
('QA', 'Qatar'),
('RE', 'Reunion'),
('RO', 'Romania'),
('RS', 'Serbia'),
('RU', 'Russian Federation'),
('RW', 'Rwanda'),
('SA', 'Saudi Arabia'),
('SB', 'Solomon Islands'),
('SC', 'Seychelles'),
('SD', 'Sudan'),
('SE', 'Sweden'),
('SG', 'Singapore'),
('SH', 'Saint Helena'),
('SI', 'Slovenia'),
('SJ', 'Svalbard and Jan Mayen'),
('SK', 'Slovakia'),
('SL', 'Sierra Leone'),
('SM', 'San Marino'),
('SN', 'Senegal'),
('SO', 'Somalia'),
('SR', 'Suriname'),
('ST', 'Sao Tome and Principe'),
('SV', 'El Salvador'),
('SY', 'Syrian Arab Republic'),
('SZ', 'Swaziland'),
('TC', 'Turks and Caicos Islands'),
('TD', 'Chad'),
('TF', 'French Southern Territories'),
('TG', 'Togo'),
('TH', 'Thailand'),
('TJ', 'Tajikistan'),
('TK', 'Tokelau'),
('TL', 'Timor-Leste'),
('TM', 'Turkmenistan'),
('TN', 'Tunisia'),
('TO', 'Tonga'),
('TR', 'Turkey'),
('TT', 'Trinidad and Tobago'),
('TV', 'Tuvalu'),
('TW', 'Taiwan'),
('TZ', 'Tanzania United Republic of'),
('UA', 'Ukraine'),
('UG', 'Uganda'),
('UM', 'United States Minor Outlying Islands'),
('US', 'United States'),
('UY', 'Uruguay'),
('UZ', 'Uzbekistan'),
('VA', 'Holy See (Vatican City State)'),
('VC', 'Saint Vincent and the Grenadines'),
('VE', 'Venezuela'),
('VG', 'Virgin Islands British'),
('VI', 'Virgin Islands U.S.'),
('VN', 'Vietnam'),
('VU', 'Vanuatu'),
('WF', 'Wallis and Futuna'),
('WS', 'Samoa'),
('YE', 'Yemen'),
('YT', 'Mayotte'),
('ZA', 'South Africa'),
('ZM', 'Zambia'),
('ZW', 'Zimbabwe');

CREATE TABLE IF NOT EXISTS `crawl_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `crawl_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'other',
  `ref_id` text COLLATE utf8_unicode_ci,
  `subject` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `crawl_link` text COLLATE utf8_unicode_ci NOT NULL,
  `crawl_referer` text COLLATE utf8_unicode_ci,
  `crawl_cookie` text COLLATE utf8_unicode_ci,
  `crawl_post_fields` text COLLATE utf8_unicode_ci,
  `crawl_useragent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `crawl_status` tinyint(4) NOT NULL DEFAULT '1',
  `proxy_id` int(11) unsigned NOT NULL DEFAULT '0',
  `log_message` text COLLATE utf8_unicode_ci,
  `crawl_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `crawl_status` (`crawl_status`),
  KEY `crawl_type` (`crawl_type`),
  KEY `proxy_id` (`proxy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(160) COLLATE utf8_unicode_ci NOT NULL,
  `iso_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `unicode` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `position` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `paypal` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `iso_code` (`iso_code`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=68 ;

INSERT INTO `currency` (`id`, `name`, `iso_code`, `symbol`, `unicode`, `position`, `paypal`, `status`) VALUES
(1, 'United Arab Emirates Dirham', 'AED', 'Ø¯.', '', 'after', 0, 1),
(2, 'Netherlands Antillian Guilder', 'ANG', 'Æ’', '&#x0192;', 'before', 0, 1),
(3, '', 'AOA', 'AOA', 'AOA', 'before', 0, 1),
(4, 'Argentine Peso', 'ARS', '$', '&#36;', 'before', 0, 1),
(5, 'Australian Dollar', 'AUD', '$', '&#36;', 'before', 1, 1),
(6, '', 'BAM', 'KM', 'KM', 'before', 0, 1),
(7, 'Barbados Dollar', 'BBD', '$', '&#36;', 'before', 0, 1),
(8, '', 'BGL', 'Ð»Ð', '&#1083;&', 'before', 0, 1),
(9, 'Bahraini Dinar', 'BHD', 'BD', 'BD', 'after', 0, 1),
(10, 'Brunei Dollar', 'BND', '$', '&#36;', 'before', 0, 1),
(11, 'Brazilian Real', 'BRL', 'R$', 'R&#36;', 'before', 1, 1),
(12, 'Canadian Dollar', 'CAD', '$', '&#36;', 'before', 1, 1),
(13, 'Swiss Franc', 'CHF', 'Fr', 'Fr', 'before', 1, 1),
(14, 'Chilean Unidades de Fomento', 'CLF', 'UF', 'UF', 'after', 0, 1),
(15, 'Chilean Peso', 'CLP', '$', '&#36;', 'before', 0, 1),
(16, 'Yuan (Chinese) Renminbi', 'CNY', 'Â¥', '&#165;', 'before', 0, 1),
(17, 'Colombian Peso', 'COP', '$', '&#36;', 'before', 0, 1),
(18, 'Costa Rican Colon', 'CRC', 'â‚¡', '&#x20A1;', 'before', 0, 1),
(19, 'Czech Republic Koruna', 'CZK', 'KÄ', 'K&#269;', 'after', 1, 1),
(20, 'Danish Krone', 'DKK', 'kr', 'kr', 'before', 1, 1),
(21, 'Estonian Kroon (EEK)', 'EEK', 'KR', 'KR', 'before', 0, 1),
(22, 'Egyptian Pound', 'EGP', 'EÂ£', 'E&#163;', 'before', 0, 1),
(23, 'Euro', 'EUR', 'â‚¬', '&#128;', 'before', 1, 1),
(24, 'Fiji Dollar', 'FJD', 'FJ$', 'FJ&#36;', 'before', 0, 1),
(25, 'British Pound', 'GBP', '£', '&#163;', 'before', 1, 1),
(26, 'Guatemalan Quetzal', 'GTQ', 'Q', 'Q', 'before', 0, 1),
(27, 'Hong Kong Dollar', 'HKD', '$', '&#36;', 'before', 1, 1),
(28, '', 'HRK', 'kn', 'kn', 'before', 0, 1),
(29, 'Hungarian Forint', 'HUF', 'Ft', 'Ft', 'before', 1, 1),
(30, 'Indonesian Rupiah', 'IDR', 'Rp', 'Rp', 'before', 0, 1),
(31, 'Israeli Shekel', 'ILS', 'â‚ª', '&#x20AA;', 'before', 1, 1),
(32, 'Indian Rupee', 'INR', 'Rs', 'Rs', 'before', 0, 1),
(33, 'Jordanian Dinar', 'JOD', 'Ø¯.', '', '', 0, 1),
(34, 'Japanese Yen', 'JPY', 'Â¥', '&#165;', 'before', 1, 1),
(35, 'Kenyan Schilling', 'KES', 'KSh', 'Ksh', 'before', 0, 1),
(36, '(South) Korean Won', 'KRW', 'â‚©', '&#x20A9;', 'before', 0, 1),
(37, 'Kuwaiti Dinar', 'KWD', 'KD', 'KD', 'after', 0, 1),
(38, 'Cayman Islands Dollar', 'KYD', '$', '&#36;', 'before', 0, 1),
(39, '', 'LTL', 'Lt', 'Lt', 'before', 0, 1),
(40, '', 'LVL', 'Ls', 'Ls', 'before', 0, 1),
(41, 'Moroccan Dirham', 'MAD', 'Ø¯.', '', '', 0, 1),
(42, 'Maldive Rufiyaa', 'MVR', 'Rf', 'Rf', 'before', 0, 1),
(43, '', 'MXN', '$', '&#36;', 'before', 1, 1),
(44, 'Malaysian Ringgit', 'MYR', 'RM', 'RM', 'before', 1, 1),
(45, 'Nigerian Naira', 'NGN', 'â‚¦', '&#x20A6;', 'before', 0, 1),
(46, 'Norwegian Kroner', 'NOK', 'kr', 'kr', 'before', 1, 1),
(47, 'New Zealand Dollar', 'NZD', '$', '&#36;', 'before', 1, 1),
(48, 'Omani Rial', 'OMR', 'OMR', '&#65020;', 'after', 0, 1),
(49, 'Peruvian Nuevo Sol', 'PEN', 'S/.', 'S/.', 'before', 0, 1),
(50, 'Philippine Peso', 'PHP', 'â‚±', '&#x20B1;', 'before', 1, 1),
(51, 'Polish Zloty', 'PLN', 'zÅ‚', 'Z&#322;', 'before', 1, 1),
(52, 'Qatari Rial', 'QAR', 'QAR', '&#65020;', 'after', 0, 1),
(53, 'Romanian Leu', 'RON', 'lei', 'lei', 'before', 0, 1),
(54, 'Russian Ruble', 'RUB', 'Ñ€Ñ', '&#1088;&', 'before', 1, 1),
(55, 'Saudi Arabian Riyal', 'SAR', 'SAR', '&#65020;', 'after', 0, 1),
(56, 'Swedish Krona', 'SEK', 'kr', 'kr', 'before', 1, 1),
(57, 'Singapore Dollar', 'SGD', '$', '&#36;', 'before', 1, 1),
(58, 'Thai Baht', 'THB', 'à¸¿', '&#322;', 'before', 1, 1),
(59, 'Turkish Lira', 'TRY', 'TL', 'TL', 'before', 1, 1),
(60, 'Trinidad and Tobago Dollar', 'TTD', '$', '&#36;', 'before', 0, 1),
(61, 'Taiwan Dollar', 'TWD', '$', '&#36;', 'before', 0, 1),
(62, '', 'UAH', 'â‚´', '&#8372;', 'before', 0, 1),
(63, 'US Dollar', 'USD', '$', '&#36;', 'before', 1, 1),
(64, 'Venezualan Bolivar', 'VEF', 'Bs ', 'Bs.', 'before', 0, 1),
(65, 'Vietnamese Dong', 'VND', 'â‚«', '&#x20AB;', 'before', 0, 1),
(66, 'East Caribbean Dollar', 'XCD', '$', '&#36;', 'before', 0, 1),
(67, 'South African Rand', 'ZAR', 'R', 'R', 'before', 0, 1);

CREATE TABLE IF NOT EXISTS `directories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `submit_url` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `captcha_script` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT 'captcha.php',
  `search_script` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT 'index.php?q=[--keyword--]',
  `title_col` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT 'TITLE',
  `url_col` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT 'URL',
  `description_col` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT 'DESCRIPTION',
  `name_col` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT 'OWNER_NAME',
  `email_col` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT 'OWNER_EMAIL',
  `category_col` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT 'CATEGORY_ID',
  `cptcha_col` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT 'CAPTCHA',
  `imagehash_col` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT 'IMAGEHASH',
  `imagehashurl_col` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT 'imagehash',
  `reciprocal_col` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'RECPR_URL',
  `extra_val` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT 'LINK_TYPE=normal&submit=Continue&AGREERULES=on',
  `is_captcha` tinyint(1) NOT NULL DEFAULT '0',
  `working` tinyint(1) NOT NULL DEFAULT '1',
  `google_pagerank` smallint(6) NOT NULL DEFAULT '0',
  `alexa_rank` int(11) NOT NULL DEFAULT '-1',
  `lang_code` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `checked` tinyint(1) NOT NULL DEFAULT '0',
  `script_type_id` int(11) NOT NULL DEFAULT '1',
  `rank` int(11) NOT NULL DEFAULT '0',
  `is_reciprocal` tinyint(1) NOT NULL DEFAULT '0',
  `pagerank` float NOT NULL DEFAULT '0',
  `domain_authority` float NOT NULL,
  `page_authority` float NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `submit_url` (`submit_url`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=160 ;

INSERT INTO `directories` (`id`, `domain`, `submit_url`, `captcha_script`, `search_script`, `title_col`, `url_col`, `description_col`, `name_col`, `email_col`, `category_col`, `cptcha_col`, `imagehash_col`, `imagehashurl_col`, `reciprocal_col`, `extra_val`, `is_captcha`, `working`, `google_pagerank`, `alexa_rank`, `lang_code`, `checked`, `script_type_id`, `rank`, `is_reciprocal`, `pagerank`, `domain_authority`, `page_authority`) VALUES
(145, 'http://www.listasweb.info', 'http://www.listasweb.info/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 2, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(144, 'http://www.oroop.com', 'http://www.oroop.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(143, 'http://www.webdirectorybook.com', 'http://www.webdirectorybook.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=reciprocal&submit=Continue&AGREERULES=on', 0, 0, 2, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(142, 'http://www.westcelt.org', 'http://www.westcelt.org/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 1, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(141, 'http://www.wishdc.org', 'http://www.wishdc.org/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 1, 1, 0, -1, 'en', 1, 1, 0, 0, 5.26, 31.92, 43.14),
(140, 'http://www.w3c-software.com', 'http://www.w3c-software.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 1, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(139, 'http://www.interactive-directory.com', 'http://www.interactive-directory.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(138, 'http://www.go2directory.info', 'http://www.go2directory.info/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 1, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(137, 'http://www.firstfindengine.com', 'http://www.firstfindengine.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=reciprocal&submit=Continue&AGREERULES=on&RECPR_URL=http://www.firstfindengine.com', 0, 0, 1, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(136, 'http://www.faceahead.com', 'http://www.faceahead.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 1, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(135, 'http://www.extreme-directory.net', 'http://www.extreme-directory.net/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 2, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(134, 'http://www.minidirectory.info', 'http://www.minidirectory.info/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 1, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(133, 'http://www.lexormedia.com', 'http://www.lexormedia.com/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(132, 'http://www.easyadsworld.com', 'http://www.easyadsworld.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(131, 'http://www.corporategoof.com', 'http://www.corporategoof.com/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(130, 'http://www.seodir.eu', 'http://www.seodir.eu/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(129, 'http://www.directorydr.com', 'http://www.directorydr.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(128, 'http://directorywind.com', 'http://directorywind.com/submit.php?LINK_TYPE=2', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=2&submit=Continue&AGREERULES=on', 0, 0, 3, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(127, 'http://www.visuallinkdirectory.com', 'http://www.visuallinkdirectory.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 2, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(126, 'http://www.thecommercialdirectory.com', 'http://www.thecommercialdirectory.com/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 1, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(125, 'http://www.freeonlineregister.com', 'http://www.freeonlineregister.com/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=reciprocal&submit=Continue&AGREERULES=on&RECPR_URL=http://www.freeonlineregister.com', 0, 0, 1, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(124, 'http://www.vccllc.com', 'http://www.vccllc.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 1, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(123, 'http://www.findinfo.ws', 'http://www.findinfo.ws/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 3, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(122, 'http://www.devdir.biz', 'http://www.devdir.biz/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=reciprocal&submit=Continue&AGREERULES=on&RECPR_URL=http://www.devdir.biz', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(121, 'http://www.stepmind.com', 'http://www.stepmind.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 1, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(120, 'http://www.edirectori.com', 'http://www.edirectori.com/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(119, 'http://www.netnamesindex.com', 'http://www.netnamesindex.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=reciprocal&submit=Continue&AGREERULES=on&RECPR_URL=http://www.netnamesindex.com', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(117, 'http://www.worldurllink.com', 'http://www.worldurllink.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=reciprocal&submit=Continue&AGREERULES=on&RECPR_URL=http://www.worldurllink.com', 0, 0, 2, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(116, 'http://www.websitelists.info', 'http://www.websitelists.info/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 2, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(115, 'http://www.urlvault.info', 'http://www.urlvault.info/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=reciprocal&submit=Continue&AGREERULES=on&RECPR_URL=http://www.urlvault.info', 0, 0, 2, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(114, 'http://www.seolistsite.com', 'http://www.seolistsite.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=reciprocal&submit=Continue&AGREERULES=on&RECPR_URL=http://www.seolistsite.com', 0, 0, 1, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(113, 'http://www.searchpowertour.com', 'http://www.searchpowertour.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=reciprocal&submit=Continue&AGREERULES=on&RECPR_URL=http://www.searchpowertour.com', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(112, 'http://www.netdirectorylink.com', 'http://www.netdirectorylink.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=reciprocal&submit=Continue&AGREERULES=on', 0, 0, 1, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(111, 'http://www.monsterlinkdirectory.com', 'http://www.monsterlinkdirectory.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=reciprocal&submit=Continue&AGREERULES=on&RECPR_URL=http://www.monsterlinkdirectory.com', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(110, 'http://www.inlinkdirectory.com', 'http://www.inlinkdirectory.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=reciprocal&submit=Continue&AGREERULES=on&RECPR_URL=http://www.inlinkdirectory.com', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(109, 'http://www.heydirectory.com', 'http://www.heydirectory.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 3, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(108, 'http://www.generalnetdirectory.com', 'http://www.generalnetdirectory.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=reciprocal&submit=Continue&AGREERULES=on', 0, 0, 1, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(107, 'http://www.freeweblist.info', 'http://www.freeweblist.info/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(106, 'http://www.freeonlineindex.com', 'http://www.freeonlineindex.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=reciprocal&submit=Continue&AGREERULES=on&RECPR_URL=http://www.freeonlineindex.com', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(104, 'http://www.directoryfreelink.com', 'http://www.directoryfreelink.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=reciprocal&submit=Continue&AGREERULES=on&RECPR_URL=http://www.directoryfreelink.com', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(103, 'http://www.cheapwebdir.com', 'http://www.cheapwebdir.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 1, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(102, 'http://www.anyweblist.com', 'http://www.anyweblist.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=reciprocal&submit=Continue&AGREERULES=on&RECPR_URL=http://www.anyweblist.com', 0, 0, 2, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(101, 'http://www.zerotres.com', 'http://www.zerotres.com/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(100, 'http://www.thehdb.com', 'http://www.thehdb.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(99, 'http://www.linkfly.info', 'http://www.linkfly.info/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=free&submit=Continue&AGREERULES=on', 0, 0, 2, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(98, 'http://www.jordangreen.info', 'http://www.jordangreen.info/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=free&submit=Continue&AGREERULES=on', 0, 0, 1, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(97, 'http://www.ggfb.org', 'http://www.ggfb.org/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(96, 'http://www.etup.org', 'http://www.etup.org/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(94, 'http://z0p.com', 'http://z0p.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 1, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(93, 'http://www.yournetdirectory.com', 'http://www.yournetdirectory.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 2, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(92, 'http://www.teacherslounge.info', 'http://www.teacherslounge.info/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(91, 'http://www.homessearchengine.com', 'http://www.homessearchengine.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 1, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(90, 'http://www.zzdirectory.com', 'http://www.zzdirectory.com/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 1, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(89, 'http://www.liveurls.net', 'http://www.liveurls.net/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(88, 'http://www.agrieducation.org', 'http://www.agrieducation.org/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 1, 3, -1, 'en', 1, 1, 0, 0, 5.65, 39.77, 49.86),
(87, 'http://www.freewd.org', 'http://www.freewd.org/submit.php?LINK_TYPE=2', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=2&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(86, 'http://www.coolwebsitelistings.com', 'http://www.coolwebsitelistings.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(85, 'http://www.ns8.biz', 'http://www.ns8.biz/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 1, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(84, 'http://www.gfxmedia.us', 'http://www.gfxmedia.us/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 1, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(83, 'http://www.biowatchmed.net', 'http://www.biowatchmed.net/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 2, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(82, 'http://www.lemurgene.com', 'http://www.lemurgene.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 2, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(80, 'http://www.tuenschel.com', 'http://www.tuenschel.com/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=reciprocal&submit=Continue&AGREERULES=on&RECPR_URL=http://www.tuenschel.com', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(79, 'http://www.migliana.com', 'http://www.migliana.com/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=reciprocal&submit=Continue&AGREERULES=on&RECPR_URL=http://www.migliana.com', 0, 0, 2, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(78, 'http://www.prolificpi.com', 'http://www.prolificpi.com/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=reciprocal&submit=Continue&AGREERULES=on&RECPR_URL=http://www.prolificpi.com', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(77, 'http://www.mymaxlinks.info', 'http://www.mymaxlinks.info/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 2, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(76, 'http://www.counterdeal.com', 'http://www.counterdeal.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=reciprocal&submit=Continue&AGREERULES=on', 0, 0, 3, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(73, 'http://www.mytopdirectory.info', 'http://www.mytopdirectory.info/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(72, 'http://www.thelivinglink.net', 'http://www.thelivinglink.net/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 4, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(70, 'http://www.towerpromote.com', 'http://www.towerpromote.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 2, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(68, 'http://www.picna.com', 'http://www.picna.com/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=reciprocal&submit=Continue&AGREERULES=on&RECPR_URL=http://www.picna.com', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(67, 'http://www.owdirectory.com', 'http://www.owdirectory.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 1, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(66, 'http://www.haqj.com', 'http://www.haqj.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(65, 'http://www.gkiv.com', 'http://www.gkiv.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(64, 'http://www.insectuniverse.com', 'http://www.insectuniverse.com/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=reciprocal&submit=Continue&AGREERULES=on&RECPR_URL=http://www.insectuniverse.com', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(63, 'http://www.greatdir.net', 'http://www.greatdir.net/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(62, 'http://www.jambezi.com', 'http://www.jambezi.com/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=reciprocal&submit=Continue&AGREERULES=on&RECPR_URL=http://www.jambezi.com', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(61, 'http://www.tkdirectory.com', 'http://www.tkdirectory.com/submit.php?LINK_TYPE=1', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'reciprocal=1&LINK_TYPE=1&submit=Continue&AGREERULES=on', 0, 0, 1, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(58, 'http://www.directoryrank.net', 'http://www.directoryrank.net/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(57, 'http://www.submitsitenow.info', 'http://www.submitsitenow.info/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 2, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(56, 'http://www.addyourlnksnow.com', 'http://www.addyourlnksnow.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=free&submit=Continue&AGREERULES=on', 0, 0, 2, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(54, 'http://www.holidaydig.com', 'http://www.holidaydig.com/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=free&submit=Continue&AGREERULES=on', 0, 0, 2, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(55, 'http://www.yrkdirectory.com', 'http://www.yrkdirectory.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(53, 'http://www.mymaxlinks.org', 'http://www.mymaxlinks.org/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(52, 'http://www.sblinks.org', 'http://www.sblinks.org/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(51, 'http://www.lutonengineering.com', 'http://www.lutonengineering.com/submit.php?LINK_TYPE=2', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=2&submit=Continue&AGREERULES=on', 0, 0, 3, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(50, 'http://www.doubledirectory.com', 'http://www.doubledirectory.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 2, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(49, 'http://www.boomdirectory.com', 'http://www.boomdirectory.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 1, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(47, 'http://www.deblinley.com', 'http://www.deblinley.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 1, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(48, 'http://www.jhucr.org', 'http://www.jhucr.org/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(46, 'http://www.directorybin.com', 'http://www.directorybin.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 1, 3, -1, 'en', 1, 1, 0, 0, 5.79, 41.16, 50.57),
(45, 'http://www.magdalyns.com', 'http://www.magdalyns.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(44, 'http://www.goobz.biz', 'http://www.goobz.biz/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 2, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(43, 'http://www.gainweb.org', 'http://www.gainweb.org/submit.php?LINK_TYPE=2', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=2&submit=Continue&AGREERULES=on', 0, 1, 4, -1, 'en', 1, 1, 1, 0, 6.09, 41.58, 51),
(42, 'http://www.indiabusinessdirectory.info', 'http://www.indiabusinessdirectory.info/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(41, 'http://www.omega-link.co.uk', 'http://www.omega-link.co.uk/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 1, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(40, 'http://www.webslink.info', 'http://www.webslink.info/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 1, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(39, 'http://www.nuclearland.com', 'http://www.nuclearland.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 2, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(37, 'http://www.freelistingdirectory.info', 'http://www.freelistingdirectory.info/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=reciprocal&submit=Continue&AGREERULES=on&RECPR_URL=http://www.freelistingdirectory.info', 0, 0, 1, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(35, 'http://www.crazyleafdesign.com/webdirectory', 'http://www.crazyleafdesign.com/webdirectory/submit?LINK_TYPE=1', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=1&submit=Continue&AGREERULES=on', 1, 0, 0, -1, 'en', 1, 1, 2, 0, 6.12, 51.88, 52.77),
(34, 'http://www.linkspremium.com', 'http://www.linkspremium.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 2, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(33, 'http://www.hitalyzer.com', 'http://www.hitalyzer.com/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 1, 3, -1, 'en', 1, 1, 0, 0, 5.48, 38.03, 47.35),
(32, 'http://directory.seoexecutive.com', 'http://directory.seoexecutive.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=free&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(31, 'http://directory.allaboutadtips.com', 'http://directory.allaboutadtips.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 2, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(30, 'http://www.clickmybrick.com', 'http://www.clickmybrick.com/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(29, 'http://www.placeyourlinks.com', 'http://www.placeyourlinks.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 3, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(28, 'http://www.seocourt.com', 'http://www.seocourt.com/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 1, 1, 0, -1, 'en', 1, 1, 0, 0, 5.8, 46.71, 53.19),
(27, 'http://www.linkedout.info', 'http://www.linkedout.info/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 2, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(26, 'http://www.triplewdirectory.com', 'http://www.triplewdirectory.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 1, 0, -1, 'en', 1, 1, 0, 0, 5.56, 40.12, 50.1),
(25, 'http://www.yvir.com', 'http://www.yvir.com/submit.php?LINK_TYPE=2', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'z=1&LINK_TYPE=2&submit=Continue&AGREERULES=on', 0, 0, 1, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(23, 'http://www.1abc.org', 'http://www.1abc.org/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=free&submit=Continue&AGREERULES=on', 0, 1, 0, -1, 'en', 1, 1, 0, 0, 6.17, 54.24, 62.04),
(22, 'http://www.pblake.com', 'http://www.pblake.com/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 4, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(21, 'http://www.aaawebdirectory.com', 'http://www.aaawebdirectory.com/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=free&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(20, 'http://www.sanory.com', 'http://www.sanory.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 3, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(19, 'http://www.domaining.in', 'http://www.domaining.in/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=free&submit=Continue&AGREERULES=on', 0, 0, 4, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(18, 'http://www.miriblack.com', 'http://www.miriblack.com/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 1, 1, 0, -1, 'en', 1, 1, 0, 0, 5.67, 47.02, 54.01),
(17, 'http://www.alistsites.com', 'http://www.alistsites.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 1, 0, -1, 'en', 1, 1, 0, 0, 5.88, 41.57, 51.35),
(16, 'http://www.cheapdirectory.net', 'http://www.cheapdirectory.net/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=reciprocal&submit=Continue&AGREERULES=on', 0, 0, 3, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(15, 'http://www.ewebdir.com', 'http://www.ewebdir.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=free&submit=Continue&AGREERULES=on', 1, 1, 0, -1, 'en', 1, 1, 0, 0, 4.9, 27.28, 38.47),
(14, 'http://www.tfwd.org', 'http://www.tfwd.org/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=free&submit=Continue&AGREERULES=on', 0, 1, 1, -1, 'en', 1, 1, 0, 0, 4.8, 28.47, 39.2),
(13, 'http://www.pr3plus.com', 'http://www.pr3plus.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 1, 1, 0, -1, 'en', 1, 1, 0, 0, 5.49, 34.8, 45.67),
(12, 'http://www.123hitlinks.info', 'http://www.123hitlinks.info/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=free&submit=Continue&AGREERULES=on', 1, 1, 0, -1, 'en', 1, 1, 0, 0, 5.8, 44.27, 53.65),
(10, 'http://www.directoryvault.com', 'http://www.directoryvault.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 1, 0, -1, 'en', 1, 1, 0, 0, 6.11, 44.64, 53.95),
(9, 'http://www.skypemedia.com', 'http://www.skypemedia.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 2, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(8, 'http://www.webhotlink.com', 'http://www.webhotlink.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=free&submit=Continue&AGREERULES=on', 0, 1, 0, -1, 'en', 1, 1, 0, 0, 5.3, 34.91, 45.7),
(6, 'http://www.freewebsitedirectory.com', 'http://www.freewebsitedirectory.com/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 6.34, 53.58, 61.49),
(5, 'http://www.777media.com', 'http://www.777media.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(3, 'http://www.onpaco.com', 'http://www.onpaco.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 1, 0, -1, 'en', 1, 1, 0, 0, 5.58, 33.32, 44.39),
(2, 'http://www.fat64.net', 'http://www.fat64.net/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 1, 1, 0, -1, 'en', 1, 1, 0, 0, 5.79, 43.47, 52.97),
(1, 'http://directory.seofreetools.net', 'http://directory.seofreetools.net/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=reciprocal&submit=Continue&AGREERULES=on', 1, 1, 0, -1, 'en', 1, 1, 1, 0, 6.65, 47.24, 51.26),
(146, 'http://www.sblinks.info', 'http://www.sblinks.info/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(147, 'http://www.thehopedirectory.com', 'http://www.thehopedirectory.com/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(148, 'http://www.clocktowerstudio.com', 'http://www.clocktowerstudio.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 2, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(149, 'http://www.infotechwv.com', 'http://www.infotechwv.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(150, 'http://www.dawsoneng.com', 'http://www.dawsoneng.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 2, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(151, 'http://www.cafrid.com', 'http://www.cafrid.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 1, 1, 0, -1, 'en', 1, 1, 0, 0, 4.64, 29.42, 41.05),
(152, 'http://www.fusionsalcedo.com', 'http://www.fusionsalcedo.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 1, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(153, 'http://www.justaskluke.com', 'http://www.justaskluke.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(154, 'http://www.logha.com', 'http://www.logha.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(155, 'http://www.pacdec.org', 'http://www.pacdec.org/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(156, 'http://www.sitechakra.com', 'http://www.sitechakra.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 2, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(157, 'http://www.webbacklinks.com', 'http://www.webbacklinks.com/submit.php', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 0, 0, -1, 'en', 1, 1, 0, 0, 0, 0, 0),
(158, 'http://www.searchnsearch.com', 'http://www.searchnsearch.com/submit.php', 'captcha.php', 'index.php?search=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=normal&submit=Continue&AGREERULES=on', 0, 1, 1, -1, 'en', 1, 1, 0, 0, 5.38, 29.48, 38.96);

CREATE TABLE IF NOT EXISTS `dirsubmitinfo` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `website_id` int(11) unsigned NOT NULL,
  `directory_id` int(11) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `submit_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `di_directory_meta` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `captcha_script` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT 'captcha.php',
  `search_script` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT 'index.php?q=[--keyword--]',
  `title_col` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT 'TITLE',
  `url_col` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT 'URL',
  `description_col` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT 'DESCRIPTION',
  `name_col` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT 'OWNER_NAME',
  `email_col` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT 'OWNER_EMAIL',
  `category_col` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT 'CATEGORY_ID',
  `cptcha_col` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT 'CAPTCHA',
  `imagehash_col` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT 'IMAGEHASH',
  `imagehashurl_col` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT 'imagehash',
  `reciprocal_col` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'RECPR_URL',
  `extra_val` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT 'LINK_TYPE=normal&submit=Continue&AGREERULES=on',
  `link_type_col` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'LINK_TYPE',
  `normal` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'normal',
  `free` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'free',
  `reciprocal` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'reciprocal',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

INSERT INTO `di_directory_meta` (`id`, `name`, `captcha_script`, `search_script`, `title_col`, `url_col`, `description_col`, `name_col`, `email_col`, `category_col`, `cptcha_col`, `imagehash_col`, `imagehashurl_col`, `reciprocal_col`, `extra_val`, `link_type_col`, `normal`, `free`, `reciprocal`, `status`) VALUES
(1, 'phpLD', 'captcha.php', 'index.php?q=[--keyword--]', 'TITLE', 'URL', 'DESCRIPTION', 'OWNER_NAME', 'OWNER_EMAIL', 'CATEGORY_ID', 'CAPTCHA', 'IMAGEHASH', 'imagehash', 'RECPR_URL', 'LINK_TYPE=[--type--]&submit=Continue&AGREERULES=on', 'LINK_TYPE', 'normal', 'free', 'reciprocal', 1);

CREATE TABLE IF NOT EXISTS `featured_directories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `directory_name` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `directory_link` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `google_pagerank` smallint(6) NOT NULL DEFAULT '0',
  `coupon_code` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `coupon_offer` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

INSERT INTO `featured_directories` (`id`, `directory_name`, `directory_link`, `google_pagerank`, `coupon_code`, `coupon_offer`, `status`) VALUES
(1, 'directory.seopanel.in', 'http://directory.seofreetools.net/submit.php?LINK_TYPE=featured', 4, '', 0, 1),
(4, 'beta-i.org', 'http://beta-i.org/submit.php?LINK_TYPE=4', 6, '', 0, 0),
(5, 'directorymaximizer.com', 'http://www.directorymaximizer.com/af.php?af=207564&ad=5&p=1', 6, '', 0, 0);

CREATE TABLE IF NOT EXISTS `information_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info_type` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'news',
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `update_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

INSERT INTO `information_list` (`id`, `info_type`, `content`, `update_date`) VALUES
(1, 'news', '	<a style="text-decoration: none" href="https://www.seopanel.org/aboutus/sponsors/" target="_blank" id=''news_info''>\n		<b style="color:red;">New*</b> <b>Donate</b> <b style="color: green">$500</b> \n		and become a <b>premium sponsor of Seo Panel</b>. Also get <b>all plugins</b> we develop for Free!\n	</a>\n	', '2016-12-16');

CREATE TABLE IF NOT EXISTS `keywordcrontracker` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `keyword_id` int(16) DEFAULT NULL,
  `searchengine_id` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `keyword_id` (`keyword_id`),
  KEY `searchengine_id` (`searchengine_id`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `keywords` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang_code` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_code` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website_id` int(11) DEFAULT NULL,
  `searchengines` varchar(120) CHARACTER SET latin1 DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `crawled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `keyword_analytics` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `keyword_id` int(11) NOT NULL,
  `clicks` int(11) NOT NULL,
  `impressions` int(11) NOT NULL,
  `ctr` float NOT NULL,
  `average_position` float NOT NULL,
  `report_date` date NOT NULL,
  `source` enum('google','yahoo','bing','baidu','yandex') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'google',
  PRIMARY KEY (`id`),
  KEY `keyword_id` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `pagespeeddetails` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `website_id` int(11) NOT NULL,
  `desktop_score_details` text COLLATE utf8_unicode_ci NOT NULL,
  `mobile_score_details` text COLLATE utf8_unicode_ci NOT NULL,
  `result_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `result_date` (`result_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `pagespeedresults` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `website_id` int(11) NOT NULL,
  `desktop_speed_score` smallint(6) NOT NULL,
  `mobile_speed_score` smallint(6) NOT NULL,
  `mobile_usability_score` smallint(6) NOT NULL,
  `result_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `result_date` (`result_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `proxylist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `proxy` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `port` int(8) DEFAULT NULL,
  `proxy_auth` tinyint(1) NOT NULL DEFAULT '0',
  `proxy_username` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `proxy_password` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `checked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `qwp_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `set_label` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `set_name` varchar(64) CHARACTER SET latin1 NOT NULL,
  `set_val` text COLLATE utf8_unicode_ci NOT NULL,
  `set_type` enum('small','bool','medium','large','text') CHARACTER SET latin1 DEFAULT 'small',
  PRIMARY KEY (`id`),
  UNIQUE KEY `set_name` (`set_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

INSERT INTO `qwp_settings` (`id`, `set_label`, `set_name`, `set_val`, `set_type`) VALUES
(2, 'Allow user to access the web proxy', 'QWP_ALLOW_USER_WEB_PROXY', '0', 'bool'),
(3, 'Allow web server to act as a proxy', 'QWP_ALLOW_WEB_SERVER_ACT_AS_PROXY', '1', 'bool');

CREATE TABLE IF NOT EXISTS `rankresults` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `website_id` int(11) NOT NULL,
  `google_pagerank` int(8) NOT NULL DEFAULT '0',
  `alexa_rank` int(11) NOT NULL,
  `moz_rank` float NOT NULL,
  `result_time` int(11) NOT NULL DEFAULT '0',
  `domain_authority` float NOT NULL,
  `page_authority` float NOT NULL,
  `result_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `result_date` (`result_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `reports_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `report_interval` int(11) NOT NULL DEFAULT '1',
  `email_notification` tinyint(1) NOT NULL DEFAULT '0',
  `last_generated` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

INSERT INTO `reports_settings` (`id`, `user_id`, `report_interval`, `email_notification`, `last_generated`) VALUES
(1, 1, 1, 1, 1481760000);

CREATE TABLE IF NOT EXISTS `review_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `website_id` int(11) NOT NULL,
  `name` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'google_my_business',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `website_id` (`website_id`,`url`),
  KEY `review_links_web_rel` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `review_link_results` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `review_link_id` int(11) NOT NULL,
  `reviews` int(11) NOT NULL DEFAULT '0',
  `rating` float NOT NULL DEFAULT '0',
  `report_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `review_link_rel` (`review_link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `saturationresults` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `website_id` int(11) NOT NULL,
  `google` int(11) NOT NULL,
  `msn` int(11) NOT NULL,
  `result_time` int(11) NOT NULL DEFAULT '0',
  `result_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `result_date` (`result_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `searchengines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cookie_send` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `no_of_results_page` int(8) DEFAULT NULL,
  `start` int(11) NOT NULL DEFAULT '0',
  `start_offset` int(8) NOT NULL DEFAULT '0',
  `max_results` int(11) NOT NULL DEFAULT '100',
  `regex` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_pattern` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_pattern` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_index` int(11) NOT NULL DEFAULT '1',
  `title_index` int(11) NOT NULL DEFAULT '2',
  `description_index` int(11) NOT NULL DEFAULT '3',
  `encoding` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

INSERT INTO `searchengines` (`id`, `domain`, `url`, `cookie_send`, `no_of_results_page`, `start`, `start_offset`, `max_results`, `regex`, `from_pattern`, `to_pattern`, `url_index`, `title_index`, `description_index`, `encoding`, `status`) VALUES
(1, 'www.google.com', 'http://www.google.com/search?hl=[--lang--]&num=[--num--]&q=[--keyword--]&start=[--start--]&cr=country[--country--]&as_qdr=all&gws_rd=cr&nfpr=1', '', 100, 0, 100, 100, '<div.*?class="?g.*?>.*?<div.*?class="r"*?>.*?<a href="(.*?)".*?>.*?<span.*?>(.*?)<\\/span><\\/h3>', '<div id="?ires"?>', '<\\/ol>', 1, 2, 3, NULL, 1),
(2, 'www.yahoo.com', 'http://search.yahoo.com/search?p=[--keyword--]&n=[--num--]&b=[--start--]&vl=lang_[--lang--]&fl=1&v=1&vc=[--country--]', 'sB=v=1&n=100&sh=1&rw=new', 100, 1, 100, 100, '<li.*?<h3.*?><a.*?RU=(.*?)\\/.*?>(.*?)<\\/a><\\/h3>.*?<p.*?>(.*?)<\\/p>', NULL, NULL, 1, 2, 3, NULL, 1),
(3, 'www.bing.com', 'http://www.bing.com/search?q=[--keyword--]&scope=web&first=[--start--]&setmkt=[--lang--]-[--country--]', 'SRCHHPGUSR=NEWWND=0&NRSLT=50&SRCHLANG=[--lang--]', 50, 1, 50, 50, '<li.*?<h2><a.*?href="(.*?)".*?>(.*?)<\\/a><\\/h2>.*?<p.*?>(.*?)<\\/p>', NULL, NULL, 1, 2, 3, NULL, 1);

CREATE TABLE IF NOT EXISTS `searchresultdetails` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `searchresult_id` bigint(24) unsigned DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(160) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `searchresults` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `keyword_id` int(16) DEFAULT NULL,
  `searchengine_id` int(11) DEFAULT NULL,
  `rank` int(8) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `result_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `result_date` (`result_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `seoplugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `version` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `installed` tinyint(1) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

INSERT INTO `seoplugins` (`id`, `label`, `name`, `author`, `description`, `version`, `website`, `status`, `installed`, `priority`) VALUES
(1, 'Meta Tag Generator', 'MetaTagGenerator', 'Geo Varghese', 'Meta Tag Generator', '1.0.0', 'https://www.seopanel.org/plugins/', 1, 1, 100),
(2, 'Test Plugin', 'TestPlugin', 'Geo Varghese', 'Seo Panel Test Plugin: Check the structure of test plugin and it will help you to create new Seo Panel Plugins.', '1.0.0', 'https://www.seopanel.org/plugins/', 0, 1, 100),
(3, 'Quick Web Proxy', 'QuickWebProxy', 'Seo Panel', 'It will help you to create a web proxy server using your hosting server or external proxy servers', '1.0.0', 'https://www.seopanel.org/plugin/l/94/quick-web-proxy/', 1, 1, 100);

CREATE TABLE IF NOT EXISTS `seotools` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_section` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_access` tinyint(1) NOT NULL DEFAULT '1',
  `reportgen` tinyint(1) NOT NULL DEFAULT '1',
  `cron` tinyint(1) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '100',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

INSERT INTO `seotools` (`id`, `name`, `url_section`, `user_access`, `reportgen`, `cron`, `priority`, `status`) VALUES
(1, 'Keyword Position Checker', 'keyword-position-checker', 1, 1, 1, 10, 1),
(2, 'Site Auditor', 'site-auditor', 1, 1, 0, 100, 1),
(3, 'Rank Checker', 'rank-checker', 1, 1, 1, 100, 1),
(4, 'Backlinks Checker', 'backlink-checker', 1, 1, 1, 100, 1),
(5, 'Directory Submission', 'directory-submission', 1, 1, 0, 100, 1),
(6, 'Search Engine Saturation', 'saturation-checker', 1, 1, 1, 100, 1),
(7, 'PageSpeed Insights', 'pagespeed', 1, 1, 1, 100, 1),
(8, 'Webmaster Tools', 'webmaster-tools', 1, 1, 1, 20, 1),
(9, 'Social Media Checker', 'sm-checker', 1, 1, 1, 100, 1),
(10, 'Website Analytics', 'web-analytics', 1, 1, 1, 100, 1),
(11, 'Review Manager', 'review-manager', 1, 1, 1, 100, 1);

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `set_label` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `set_name` varchar(64) CHARACTER SET latin1 NOT NULL,
  `set_val` text COLLATE utf8_unicode_ci NOT NULL,
  `set_category` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'system',
  `set_type` enum('small','bool','medium','large','text') CHARACTER SET latin1 DEFAULT 'small',
  `display` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `set_name` (`set_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=57 ;

INSERT INTO `settings` (`id`, `set_label`, `set_name`, `set_val`, `set_category`, `set_type`, `display`) VALUES
(1, 'Seo Panel Title', 'SP_TITLE', 'Seo Panel: World''s first open source seo control panel for managing multiple web sites', 'system', 'large', 1),
(2, 'Seo Panel Description', 'SP_DESCRIPTION', 'A complete free control panel for managing search engine optimization of your websites. It\ncontaining lots of hot seo tools to increase and track the performance your websites. Its an open\nsource software and also you can develop your own seo plugins for seo panel.', 'system', 'text', 1),
(3, 'Seo Panel Keywords', 'SP_KEYWORDS', 'Seo Panel,seo control panel,search engine optimization panel,seo tools kit,keyword rank checker,google pagerank checker,alexa rank checker,sitemap generator,meta tag generator,back link checker,Website Submission tool', 'system', 'text', 1),
(4, 'Number of entries per page', 'SP_PAGINGNO', '10', 'system', 'small', 1),
(5, 'Delay between each spider crawl(seconds)', 'SP_CRAWL_DELAY', '5', 'report', 'small', 1),
(6, 'Allow user to generate reports', 'SP_USER_GEN_REPORT', '0', 'report', 'bool', 1),
(7, 'Image hotlink protection enabled', 'SP_HOTLINKING', '1', 'system', 'bool', 0),
(8, 'User registration interface', 'SP_USER_REGISTRATION', '0', 'system', 'bool', 1),
(9, 'Enable Proxy', 'SP_ENABLE_PROXY', '0', 'proxy', 'bool', 1),
(10, 'Default Language', 'SP_DEFAULTLANG', 'en', 'system', 'small', 1),
(11, 'User agent', 'SP_USER_AGENT', 'Mozilla/5.0 (Windows; U; MSIE 9.0; WIndows NT 9.0; en-US))', 'report', 'large', 1),
(12, 'Seo Panel API Key', 'SP_API_KEY', '11a9b9070c7d7633831f603f0454ef5b', 'api', 'large', 1),
(13, 'Maximum number of pages allowed per website', 'SA_MAX_NO_PAGES', '500', 'siteauditor', 'small', 1),
(14, 'Site auditor crawl delay', 'SA_CRAWL_DELAY_TIME', '20', 'siteauditor', 'small', 1),
(15, 'Maximum length of page title', 'SA_TITLE_MAX_LENGTH', '80', 'siteauditor', 'small', 0),
(16, 'Minimum length of page title', 'SA_TITLE_MIN_LENGTH', '50', 'siteauditor', 'small', 0),
(17, 'Maximum length of meta description', 'SA_DES_MAX_LENGTH', '200', 'siteauditor', 'small', 0),
(18, 'Minimumlength of meta description', 'SA_DES_MIN_LENGTH', '120', 'siteauditor', 'small', 0),
(19, 'Maximum length of meta keywords', 'SA_KEY_MAX_LENGTH', '200', 'siteauditor', 'small', 0),
(20, 'Minimumlength of meta keyword', 'SA_KEY_MIN_LENGTH', '80', 'siteauditor', 'small', 0),
(21, 'Google pagerank check level first', 'SA_PR_CHECK_LEVEL_FIRST', '3', 'siteauditor', 'small', 0),
(22, 'Backlinks check level', 'SA_BL_CHECK_LEVEL', '25', 'siteauditor', 'small', 0),
(23, 'Google pagerank check level second', 'SA_PR_CHECK_LEVEL_SECOND', '6', 'siteauditor', 'small', 0),
(24, 'Maximum links in a page', 'SA_TOTAL_LINKS_MAX', '50', 'siteauditor', 'small', 0),
(25, 'Enable SMTP', 'SP_SMTP_MAIL', '0', 'system', 'bool', 1),
(26, 'SMTP Host', 'SP_SMTP_HOST', '', 'system', 'medium', 1),
(27, 'SMTP Username', 'SP_SMTP_USERNAME', '', 'system', 'medium', 1),
(28, 'SMTP Password', 'SP_SMTP_PASSWORD', '', 'system', 'medium', 1),
(29, 'Allow users to schedule reports', 'SP_ALLOW_USER_SCHEDULE_REPORT', '1', 'report', 'bool', 1),
(30, 'System report generation interval', 'SP_SYSTEM_REPORT_INTERVAL', '1', 'report', 'small', 1),
(31, 'Enable report email notification', 'SP_REPORT_EMAIL_NOTIFICATION', '1', 'report', 'bool', 1),
(32, 'Number of keywords needs to be checked in each cron execution', 'SP_NUMBER_KEYWORDS_CRON', '1', 'report', 'small', 0),
(33, 'Crawl relative links in a page', 'SP_RELATIVE_LINK_CRAWL', '1', 'siteauditor', 'bool', 1),
(34, 'Enable HTTP Proxy Tunnel', 'CURLOPT_HTTPPROXYTUNNEL_VAL', '1', 'proxy', 'bool', 1),
(35, 'Deactivate Proxy When Crawling Failed', 'PROXY_DEACTIVATE_CRAWL', '0', 'proxy', 'bool', 1),
(36, 'Check With Another Proxy When Crawling Failed', 'CHECK_WITH_ANOTHER_PROXY_IF_FAILED', '0', 'proxy', 'bool', 1),
(37, 'SMTP Mail Port', 'SP_SMTP_PORT', '25', 'system', 'small', 1),
(38, 'Time Zone', 'SP_TIME_ZONE', 'Europe/London', 'system', 'medium', 1),
(39, 'Maximum number of proxies used in single execution', 'CHECK_MAX_PROXY_COUNT_IF_FAILED', '3', 'proxy', 'small', 1),
(40, 'API Secret', 'API_SECRET', '', 'api', 'medium', 1),
(41, 'Company Name', 'SP_COMPANY_NAME', 'Seo Panel', 'system', 'medium', 1),
(42, 'Currency', 'SP_PAYMENT_CURRENCY', 'USD', 'system', 'medium', 1),
(43, 'Seo Panel version', 'SP_VERSION_NUMBER', '4.11.0', 'system', 'medium', 0),
(44, 'Moz API Link', 'SP_MOZ_API_LINK', 'http://lsapi.seomoz.com/linkscape', 'moz', 'medium', 0),
(45, 'Moz API Link', 'SP_MOZ_API_ACCESS_ID', '', 'moz', 'large', 1),
(46, 'Moz API Link', 'SP_MOZ_API_SECRET', '', 'moz', 'large', 1),
(47, 'Page authority check level first', 'SA_PA_CHECK_LEVEL_FIRST', '40', 'siteauditor', 'small', 0),
(48, 'Page authority check level second', 'SA_PA_CHECK_LEVEL_SECOND', '75', 'siteauditor', 'small', 0),
(49, 'Google API Key', 'SP_GOOGLE_API_KEY', '', 'google', 'large', 1),
(50, 'Number of websites needs to be checked in each cron execution', 'SP_NUMBER_WEBSITES_CRON', '1', 'report', 'small', 0),
(51, 'Send custom header with curl request', 'SP_SEND_CUSTOM_HEADER_IN_CURL', '1', 'report', 'bool', 1),
(52, 'Google API Client Id', 'SP_GOOGLE_API_CLIENT_ID', '', 'google', 'large', 1),
(53, 'Google API Client Secret', 'SP_GOOGLE_API_CLIENT_SECRET', '', 'google', 'large', 1),
(54, 'Google Analytics Tracking Code', 'SP_GOOGLE_ANALYTICS_TRACK_CODE', '', 'google', 'text', 1),
(55, 'Enable Proxy for Google API', 'SP_ENABLE_PROXY_GOOGLE_API', '1', 'proxy', 'bool', 1),
(56, 'Mail Encryption', 'SP_MAIL_ENCRYPTION', '', 'system', 'medium', 1);

CREATE TABLE IF NOT EXISTS `skipdirectories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `website_id` int(11) NOT NULL,
  `directory_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `website_id` (`website_id`,`directory_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `social_media_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `website_id` int(11) NOT NULL,
  `name` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'facebook',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `website_id` (`website_id`,`url`),
  KEY `social_media_links_web_rel` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `social_media_link_results` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sm_link_id` int(11) NOT NULL,
  `likes` int(11) NOT NULL DEFAULT '0',
  `followers` int(11) NOT NULL DEFAULT '0',
  `report_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `social_media_link_rel` (`sm_link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `testplugin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET latin1 NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `themes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `folder` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `version` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `installed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

INSERT INTO `themes` (`id`, `name`, `folder`, `author`, `description`, `version`, `website`, `status`, `installed`) VALUES
(1, 'Classic', 'classic', 'Geo Varghese', 'Classic theme of Seo Panel', '1.0.0', 'https://www.seopanel.org/theme/l/1/classic/', 1, 1),
(2, 'Simple', 'simple', 'Geo Varghese', 'Simple theme of Seo Panel', '1.0.0', 'https://www.seopanel.org/theme/l/2/simple/', 0, 1);

CREATE TABLE IF NOT EXISTS `timezone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timezone_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `timezone_label` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `gmt_diff` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '+00.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=91 ;

INSERT INTO `timezone` (`id`, `timezone_name`, `timezone_label`, `gmt_diff`) VALUES
(1, 'Pacific/Midway', '(GMT-11:00) Midway Island, Samoa', '-11:00'),
(2, 'America/Adak', '(GMT-10:00) Hawaii-Aleutian', '-10:00'),
(3, 'Etc/GMT+10', '(GMT-10:00) Hawaii', '-10:00'),
(4, 'Pacific/Marquesas', '(GMT-09:30) Marquesas Islands', '-09:30'),
(5, 'Pacific/Gambier', '(GMT-09:00) Gambier Islands', '-09:00'),
(6, 'America/Anchorage', '(GMT-09:00) Alaska', '-09:00'),
(7, 'America/Ensenada', '(GMT-08:00) Tijuana, Baja California', '-08:00'),
(8, 'Etc/GMT+8', '(GMT-08:00) Pitcairn Islands', '-08:00'),
(9, 'America/Los_Angeles', '(GMT-08:00) Pacific Time (US & Canada)', '-08:00'),
(10, 'America/Denver', '(GMT-07:00) Mountain Time (US & Canada)', '-07:00'),
(11, 'America/Chihuahua', '(GMT-07:00) Chihuahua, La Paz, Mazatlan', '-07:00'),
(12, 'America/Dawson_Creek', '(GMT-07:00) Arizona', '-07:00'),
(13, 'America/Belize', '(GMT-06:00) Saskatchewan, Central America', '-06:00'),
(14, 'America/Cancun', '(GMT-06:00) Guadalajara, Mexico City, Monterrey', '-06:00'),
(15, 'Chile/EasterIsland', '(GMT-06:00) Easter Island', '-06:00'),
(16, 'America/Chicago', '(GMT-06:00) Central Time (US & Canada)', '-06:00'),
(17, 'America/New_York', '(GMT-05:00) Eastern Time (US & Canada)', '-05:00'),
(18, 'America/Havana', '(GMT-05:00) Cuba', '-05:00'),
(19, 'America/Bogota', '(GMT-05:00) Bogota, Lima, Quito, Rio Branco', '-05:00'),
(20, 'America/Caracas', '(GMT-04:30) Caracas', '-04:30'),
(21, 'America/Santiago', '(GMT-04:00) Santiago', '-04:00'),
(22, 'America/La_Paz', '(GMT-04:00) La Paz', '-04:00'),
(23, 'Atlantic/Stanley', '(GMT-04:00) Faukland Islands', '-04:00'),
(24, 'America/Campo_Grande', '(GMT-04:00) Brazil', '-04:00'),
(25, 'America/Goose_Bay', '(GMT-04:00) Atlantic Time (Goose Bay)', '-04:00'),
(26, 'America/Glace_Bay', '(GMT-04:00) Atlantic Time (Canada)', '-04:00'),
(27, 'America/St_Johns', '(GMT-03:30) Newfoundland', '-03:30'),
(28, 'America/Araguaina', '(GMT-03:00) UTC-3', '-03:00'),
(29, 'America/Montevideo', '(GMT-03:00) Montevideo', '-03:00'),
(30, 'America/Miquelon', '(GMT-03:00) Miquelon, St. Pierre', '-03:00'),
(31, 'America/Godthab', '(GMT-03:00) Greenland', '-03:00'),
(32, 'America/Argentina/Buenos_Aires', '(GMT-03:00) Buenos Aires', '-03:00'),
(33, 'America/Sao_Paulo', '(GMT-03:00) Brasilia', '-03:00'),
(34, 'America/Noronha', '(GMT-02:00) Mid-Atlantic', '-02:00'),
(35, 'Atlantic/Cape_Verde', '(GMT-01:00) Cape Verde Is.', '-01:00'),
(36, 'Atlantic/Azores', '(GMT-01:00) Azores', '-01:00'),
(37, 'Europe/Belfast', '(GMT) Greenwich Mean Time : Belfast', '+00:00'),
(38, 'Europe/Dublin', '(GMT) Greenwich Mean Time : Dublin', '+00:00'),
(39, 'Europe/Lisbon', '(GMT) Greenwich Mean Time : Lisbon', '+00:00'),
(40, 'Europe/London', '(GMT) Greenwich Mean Time : London', '+00:00'),
(41, 'Africa/Abidjan', '(GMT) Monrovia, Reykjavik', '+00:00'),
(42, 'Europe/Berlin', '(GMT+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna', '+01:00'),
(43, 'Europe/Belgrade', '(GMT+01:00) Belgrade, Bratislava, Budapest, Ljubljana, Prague', '+01:00'),
(44, 'Europe/Brussels', '(GMT+01:00) Brussels, Copenhagen, Madrid, Paris', '+01:00'),
(45, 'Africa/Algiers', '(GMT+01:00) West Central Africa', '+01:00'),
(46, 'Africa/Windhoek', '(GMT+01:00) Windhoek', '+01:00'),
(47, 'Asia/Beirut', '(GMT+02:00) Beirut', '+02:00'),
(48, 'Africa/Cairo', '(GMT+02:00) Cairo', '+02:00'),
(49, 'Asia/Gaza', '(GMT+02:00) Gaza', '+02:00'),
(50, 'Africa/Blantyre', '(GMT+02:00) Harare, Pretoria', '+02:00'),
(51, 'Asia/Jerusalem', '(GMT+02:00) Jerusalem', '+02:00'),
(52, 'Europe/Minsk', '(GMT+02:00) Minsk', '+02:00'),
(53, 'Asia/Damascus', '(GMT+02:00) Syria', '+02:00'),
(54, 'Europe/Moscow', '(GMT+03:00) Moscow, St. Petersburg, Volgograd', '+03:00'),
(55, 'Africa/Addis_Ababa', '(GMT+03:00) Nairobi', '+03:00'),
(56, 'Asia/Tehran', '(GMT+03:30) Tehran', '+03:30'),
(57, 'Asia/Dubai', '(GMT+04:00) Abu Dhabi, Muscat', '+04:00'),
(58, 'Asia/Yerevan', '(GMT+04:00) Yerevan', '+04:00'),
(59, 'Asia/Kabul', '(GMT+04:30) Kabul', '+04:30'),
(60, 'Asia/Yekaterinburg', '(GMT+05:00) Ekaterinburg', '+05:00'),
(61, 'Asia/Tashkent', '(GMT+05:00) Tashkent', '+05:00'),
(62, 'Asia/Kolkata', '(GMT+05:30) Chennai, Kolkata, Mumbai, New Delhi', '+05:30'),
(63, 'Asia/Katmandu', '(GMT+05:45) Kathmandu', '+05:45'),
(64, 'Asia/Dhaka', '(GMT+06:00) Astana, Dhaka', '+06:00'),
(65, 'Asia/Novosibirsk', '(GMT+06:00) Novosibirsk', '+06:00'),
(66, 'Asia/Rangoon', '(GMT+06:30) Yangon (Rangoon)', '+06:30'),
(67, 'Asia/Bangkok', '(GMT+07:00) Bangkok, Hanoi, Jakarta', '+07:00'),
(68, 'Asia/Krasnoyarsk', '(GMT+07:00) Krasnoyarsk', '+07:00'),
(69, 'Asia/Hong_Kong', '(GMT+08:00) Beijing, Chongqing, Hong Kong, Urumqi', '+08:00'),
(70, 'Asia/Irkutsk', '(GMT+08:00) Irkutsk, Ulaan Bataar', '+08:00'),
(71, 'Australia/Perth', '(GMT+08:00) Perth', '+08:00'),
(72, 'Australia/Eucla', '(GMT+08:45) Eucla', '+08:45'),
(73, 'Asia/Tokyo', '(GMT+09:00) Osaka, Sapporo, Tokyo', '+09:00'),
(74, 'Asia/Seoul', '(GMT+09:00) Seoul', '+09:00'),
(75, 'Asia/Yakutsk', '(GMT+09:00) Yakutsk', '+09:00'),
(76, 'Australia/Adelaide', '(GMT+09:30) Adelaide', '+09:30'),
(77, 'Australia/Darwin', '(GMT+09:30) Darwin', '+09:30'),
(78, 'Australia/Brisbane', '(GMT+10:00) Brisbane', '+10:00'),
(79, 'Australia/Hobart', '(GMT+10:00) Hobart', '+10:00'),
(80, 'Asia/Vladivostok', '(GMT+10:00) Vladivostok', '+10:00'),
(81, 'Australia/Lord_Howe', '(GMT+10:30) Lord Howe Island', '+10:30'),
(82, 'Etc/GMT-11', '(GMT+11:00) Solomon Is., New Caledonia', '+11:00'),
(83, 'Asia/Magadan', '(GMT+11:00) Magadan', '+11:00'),
(84, 'Pacific/Norfolk', '(GMT+11:30) Norfolk Island', '+11:30'),
(85, 'Asia/Anadyr', '(GMT+12:00) Anadyr, Kamchatka', '+12:00'),
(86, 'Pacific/Auckland', '(GMT+12:00) Auckland, Wellington', '+12:00'),
(87, 'Etc/GMT-12', '(GMT+12:00) Fiji, Kamchatka, Marshall Is.', '+12:00'),
(88, 'Pacific/Chatham', '(GMT+12:45) Chatham Islands', '+12:45'),
(89, 'Pacific/Tongatapu', '(GMT+13:00) Nuku''alofa', '+13:00'),
(90, 'Pacific/Kiritimati', '(GMT+14:00) Kiritimati', '+14:00');

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `utype_id` int(11) DEFAULT NULL,
  `username` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang_code` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `created` int(11) NOT NULL,
  `status` tinyint(4) DEFAULT '1',
  `expiry_date` date DEFAULT NULL,
  `confirm_code` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `confirm` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

INSERT INTO `users` (`id`, `utype_id`, `username`, `password`, `first_name`, `last_name`, `email`, `lang_code`, `created`, `status`, `expiry_date`, `confirm_code`, `confirm`) VALUES
(1, 1, 'spadmin', 'a4d312c461703c46a56b1bdcda9b5cdc', 'Seo Panel', 'Admin', '', 'en', 0, 1, NULL, '', 0);

CREATE TABLE IF NOT EXISTS `usertypes` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `user_type` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

INSERT INTO `usertypes` (`id`, `user_type`, `description`, `status`) VALUES
(1, 'admin', 'Super User', 1),
(2, 'user', 'Normal User', 1);

CREATE TABLE IF NOT EXISTS `user_report_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `report_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `user_specs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type_id` int(11) NOT NULL,
  `spec_column` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `spec_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `spec_category` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'system',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_type_id` (`user_type_id`,`spec_column`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

INSERT INTO `user_specs` (`id`, `user_type_id`, `spec_column`, `spec_value`, `spec_category`) VALUES
(1, 2, 'keywordcount', '50', 'system'),
(2, 2, 'websitecount', '10', 'system'),
(3, 2, 'price', '0', 'system'),
(4, 2, 'searchengine_count', '3', 'system'),
(5, 2, 'directory_submit_limit', '150', 'system'),
(6, 2, 'directory_submit_daily_limit', '100', 'system'),
(7, 2, 'site_auditor_max_page_limit', '500', 'system'),
(8, 2, 'plugin_1', '1', 'system'),
(9, 2, 'plugin_2', '1', 'system'),
(10, 2, 'plugin_3', '1', 'system'),
(11, 2, 'seotool_1', '1', 'system'),
(12, 2, 'seotool_2', '1', 'system'),
(13, 2, 'seotool_3', '1', 'system'),
(14, 2, 'seotool_4', '1', 'system'),
(15, 2, 'seotool_5', '1', 'system'),
(16, 2, 'seotool_6', '1', 'system'),
(17, 2, 'seotool_7', '1', 'system'),
(18, 2, 'seotool_8', '1', 'system');

CREATE TABLE IF NOT EXISTS `user_tokens` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `access_token` text COLLATE utf8_unicode_ci NOT NULL,
  `refresh_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token_type` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `expires_in` int(11) NOT NULL DEFAULT '3600' COMMENT 'seconds',
  `created` datetime NOT NULL,
  `token_category` enum('google','twitter','facebook','linkedin') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'google',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `user_website_access` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `website_id` int(11) NOT NULL,
  `access` enum('read','write') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'read',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`website_id`),
  KEY `website_id_user_access_delete` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `webmaster_keywords` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `website_id` (`website_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `webmaster_sitemaps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `website_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_submitted` datetime NOT NULL,
  `last_downloaded` datetime NOT NULL,
  `is_pending` tinyint(4) NOT NULL DEFAULT '0',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `errors` int(11) NOT NULL DEFAULT '0',
  `submitted` int(11) NOT NULL DEFAULT '0',
  `indexed` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `website_id` (`website_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `websites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner_email` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title3` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title4` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title5` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description2` text COLLATE utf8_unicode_ci,
  `description3` text COLLATE utf8_unicode_ci,
  `description4` text COLLATE utf8_unicode_ci,
  `description5` text COLLATE utf8_unicode_ci,
  `reciprocal_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `crawled` tinyint(1) NOT NULL DEFAULT '0',
  `analytics_view_id` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `website_analytics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `website_id` int(11) NOT NULL,
  `source_id` bigint(20) NOT NULL,
  `users` int(11) NOT NULL,
  `newUsers` int(11) NOT NULL,
  `sessions` int(11) NOT NULL,
  `bounceRate` float NOT NULL,
  `avgSessionDuration` float NOT NULL,
  `goalCompletionsAll` int(11) NOT NULL,
  `report_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `website_analytics_delete` (`website_id`),
  KEY `source_analytics_delete` (`source_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

CREATE TABLE IF NOT EXISTS `website_search_analytics` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `website_id` int(11) NOT NULL,
  `clicks` int(11) NOT NULL,
  `impressions` int(11) NOT NULL,
  `ctr` float NOT NULL,
  `average_position` float NOT NULL,
  `report_date` date NOT NULL,
  `source` enum('google','yahoo','bing','baidu','yandex') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'google',
  PRIMARY KEY (`id`),
  KEY `website_id` (`website_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


ALTER TABLE `alerts`
  ADD CONSTRAINT `alert_user_delete` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `review_links`
  ADD CONSTRAINT `review_links_web_rel` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `review_link_results`
  ADD CONSTRAINT `review_link_rel` FOREIGN KEY (`review_link_id`) REFERENCES `review_links` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `social_media_links`
  ADD CONSTRAINT `social_media_links_web_rel` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `social_media_link_results`
  ADD CONSTRAINT `social_media_link_rel` FOREIGN KEY (`sm_link_id`) REFERENCES `social_media_links` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `user_website_access`
  ADD CONSTRAINT `website_id_user_access_delete` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_id_website_access_delete` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `website_analytics`
  ADD CONSTRAINT `source_analytics_delete` FOREIGN KEY (`source_id`) REFERENCES `analytic_sources` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `website_analytics_delete` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Seo Panel 4.3.0 changes
--

UPDATE `searchengines` SET `regex` = '<div.*?class="?g.*?>.*?<div.*?class="r"*?>.*?<a href="(.*?)".*?>.*?<h3.*?>(.*?)<\\/h3>' WHERE `url` LIKE '%google%';

CREATE TABLE `sync_searchengines` (
  `id` int(11) NOT NULL,
  `sync_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `result` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `sync_searchengines` ADD PRIMARY KEY (`id`);
ALTER TABLE `sync_searchengines` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


INSERT INTO `settings` (`set_label`, `set_name`, `set_val`, `set_category`, `set_type`, `display`) VALUES
('Enable Sendgrid API', 'SP_SENDGRID_API', '0', 'mail', 'bool', 1);

update settings set set_category='mail' where 
set_name in ('SP_SMTP_MAIL', 'SP_SMTP_HOST', 'SP_SMTP_USERNAME', 'SP_SMTP_PASSWORD', 'SP_SMTP_PORT', 'SP_MAIL_ENCRYPTION');

--
-- Seo Panel 4.6.0 changes
--

INSERT INTO `settings` (`set_label`, `set_name`, `set_val`, `set_category`, `set_type`, `display`) VALUES
('Seo Panel Demo', 'SP_DEMO', '0', 'system', 'large', 0),
('Seo Panel Hosted Version', 'SP_HOSTED_VERSION', '0', 'system', 'large', 0);

ALTER TABLE `usertypes` ADD `access_type` ENUM('read','write') NOT NULL DEFAULT 'write' AFTER `status`;

CREATE TABLE `mail_logs` (
  `id` bigint(20) NOT NULL,
  `from_address` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `to_address` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `cc_address` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `log_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail_category` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'general'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `mail_logs` ADD PRIMARY KEY (`id`);
ALTER TABLE `mail_logs` MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Seo Panel 4.7.0 changes
--

INSERT INTO `settings` (`set_label`, `set_name`, `set_val`, `set_category`, `set_type`, `display`) VALUES
('Enable reCAPTCHA', 'SP_ENABLE_RECAPTCHA', '0', 'google', 'bool', 1),
('reCAPTCHA Site Key', 'SP_RECAPTCHA_SITE_KEY', '', 'google', 'large', 1),
('reCAPTCHA Secret Key', 'SP_RECAPTCHA_SECRET_KEY', '', 'google', 'large', 1);

--
-- Seo Panel 4.8.0 changes
--

INSERT INTO `settings` (`set_label`, `set_name`, `set_val`, `set_category`, `set_type`, `display`) VALUES
('Country', 'SP_DEFAULT_COUNTRY', 'US', 'system', 'small', 1),
('Enable DataForSEO', 'SP_ENABLE_DFS', '0', 'dataforseo', 'bool', 1),
('DataForSEO API Login', 'SP_DFS_API_LOGIN', '', 'dataforseo', 'large', 1),
('DataForSEO API Password', 'SP_DFS_API_PASSWORD', '', 'dataforseo', 'large', 1),
('DataForSEO Balance', 'SP_DFS_BALANCE', '0', 'dataforseo', 'small', 1),
('Enable for Backlink and Saturation Checker', 'SP_ENABLE_DFS_BACK_SATU', '0', 'dataforseo', 'bool', 1),
('Enable Sandbox', 'SP_ENABLE_DFS_SANDBOX', '0', 'dataforseo', 'bool', 1);

--
-- Seo Panel 4.9.0 changes
--

UPDATE `searchengines` SET `regex` = '<div.*?class=\"?g.*?>.*?<div.*?class=\"y.*?\">.*?<a href=\"(.*?)\".*?>.*?<h3.*?>(.*?)<\\/h3>' 
WHERE `url` LIKE '%google%';

CREATE TABLE `crawl_engines` (
  `id` int UNSIGNED NOT NULL,
  `engine_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `engine_category` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `regex1` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `regex2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `regex3` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `regex4` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_part` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `crawl_engines`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `engine_name` (`engine_name`,`engine_category`);

ALTER TABLE `crawl_engines` MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

INSERT INTO `crawl_engines` (`engine_name`, `engine_category`, `regex1`, `regex2`, `regex3`, `regex4`, `url`, `url_part`, `status`) VALUES
('alexa', 'rank', '/\\<popularity url\\=\"(.*?)\" TEXT\\=\"([0-9]+)\"/si', NULL, NULL, NULL, '', NULL, 1),
('bing', 'backlink', '/([0-9\\,]+) results/si', '/id=\"count\".*?>.*?\\(([0-9\\,]+).*?\\)/si', '/id=\"count\".*?>.*?([0-9\\,]+).*?/si', '/class=\"sb_count\".*?>.*?([0-9\\,]+).*?<\\/span>/si', '', NULL, 1),
('alexa', 'backlink', '/linksin\".*?big.*?>(.*?)</si', NULL, NULL, NULL, '', NULL, 1),
('google', 'backlink', '/about ([0-9\\,]+) result/si', '/<div id=resultStats>([0-9\\,]+) result/si', '/([0-9\\,]+) result/si', '/about <b>([0-9\\,]+)<\\/b> linking/si', '', NULL, 1),
('google', 'saturation', '/about ([0-9\\,]+) result/si', '/<div id=resultStats>([0-9\\,]+) result/si', '/([0-9\\,]+) result/si', '/about <b>([0-9\\,]+)<\\/b> linking/si', '', NULL, 1),
('bing', 'saturation', '/([0-9\\,]+) results/si', '/id=\"count\".*?>.*?\\(([0-9\\,]+).*?\\)/si', '/id=\"count\".*?>.*?([0-9\\,]+).*?/si', '/class=\"sb_count\".*?>.*?([0-9\\,]+).*?<\\/span>/si', '', NULL, 1),
('facebook', 'social_media', '/description\".*?content=\".*?([\\d,]+) likes/is', '/Total Likes.*?>([\\d,]+).*?Total Follows/is', NULL, NULL, '', '?locale=en_US', 1),
('twitter', 'social_media', '/followers_count\".*?(\\d+)/is', NULL, NULL, NULL, 'https://cdn.syndication.twimg.com/widgets/followbutton/info.json?screen_names={ACC_NAME}', NULL, 1),
('instagram', 'social_media', '/edge_followed_by.*?\"count\":(.*?)\\}/is', NULL, NULL, NULL, '', '/?__a=1', 1),
('linkedin', 'social_media', '/<div.*?follower-count.*?>(.*?)<\\/div>/is', NULL, NULL, NULL, 'https://www.linkedin.com/pages-extensions/FollowCompany?id={CID}&counter=bottom', NULL, 1),
('pinterest', 'social_media', '/pinterestapp:followers.*?content=\"(.*?)\"/is', NULL, NULL, NULL, '', NULL, 1),
('youtube', 'social_media', '/subscriberCountText\".*?\"(\\d.*?) subscribers\"/is', NULL, NULL, NULL, '', '/about', 1),
('google', 'review', '/<span>([0-9.,]+) Google reviews<\\/span>/is', '/<\\/g-popup>.*?aria-label=\"Rated (\\d+\\.\\d+) out/is', NULL, NULL, '', NULL, 1),
('glassdoor', 'review', '/\"reviewCount\":([0-9.,]+)/is', '/\"overallRating\":(\\d+\\.\\d+)/is', NULL, NULL, '', NULL, 1);

--
-- Seo Panel 4.10.0 changes
--

UPDATE `seoplugins` SET `version` = '2.1.0' WHERE name='QuickWebProxy';
INSERT INTO `qwp_settings` (`set_label`, `set_name`, `set_val`, `set_type`) VALUES ('Blocked Urls In Proxy', 'QWP_PROXY_BLOCK_URLS', '', 'text');

--
-- Seo Panel 4.11.0 changes
--

UPDATE `currency` SET `symbol` = '€' WHERE `currency`.`id` = 23;
UPDATE `currency` SET `symbol` = 'د.إ' WHERE `currency`.`id` = 1;
UPDATE `currency` SET `symbol` = 'ƒ' WHERE `currency`.`id` = 2;
UPDATE `currency` SET `symbol` = '₩' WHERE `currency`.`id` = 36;
UPDATE `currency` SET `symbol` = '₡' WHERE `currency`.`id` = 18;
UPDATE `currency` SET `symbol` = 'Kč' WHERE `currency`.`id` = 19;
UPDATE `currency` SET `symbol` = 'E£' WHERE `currency`.`id` = 22;
UPDATE `currency` SET `symbol` = '₪' WHERE `currency`.`id` = 31;
UPDATE `currency` SET `symbol` = '¥' WHERE `currency`.`id` = 34;
UPDATE `currency` SET `symbol` = '₦' WHERE `currency`.`id` = 45;
UPDATE `currency` SET `symbol` = '﷼' WHERE `currency`.`id` = 48;
UPDATE `currency` SET `symbol` = '₱' WHERE `currency`.`id` = 50;
UPDATE `currency` SET `symbol` = 'Zł' WHERE `currency`.`id` = 51;
UPDATE `currency` SET `symbol` = '₽' WHERE `currency`.`id` = 54;
UPDATE `currency` SET `symbol` = 'ł' WHERE `currency`.`id` = 58;
UPDATE `currency` SET `symbol` = '₫' WHERE `currency`.`id` = 65;
UPDATE `currency` SET `symbol` = '¥' WHERE `currency`.`id` = 16;

INSERT INTO `crawl_engines` (`id`, `engine_name`, `engine_category`, `regex1`, `regex2`, `regex3`, `regex4`, `url`, `url_part`, `status`) VALUES
(NULL, 'yelp', 'review', '/reviewCount.*?:(\\d+),/is', '/aggregateRating.*?:([0-9]*\\.?[0-9]+),/is', NULL, NULL, '', NULL, 1),
(NULL, 'trustpilot', 'review', '/\"reviewCount\":\"(\\d+)\"/is', '/\"ratingValue\":\"(\\d+\\.\\d+)\"/is', NULL, NULL, '', NULL, 1),
(NULL, 'tripadvisor', 'review', '/\"reviewCount\":(\\d+)/is', '/\"ratingValue\":\"(\\d+\\.\\d+)\"/is', NULL, NULL, '', NULL, 1),
(NULL, 'reddit', 'social_media', '/subscribers=\"(\\d+)\"/is', NULL, NULL, NULL, '', NULL, 1);

CREATE TABLE `analytics_properties` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `account_name` varchar(120) NOT NULL,
  `account_id` varchar(120) NOT NULL,
  `property_name` varchar(120) NOT NULL,
  `property_id` varchar(120) NOT NULL,
  `datetime_created` datetime NOT NULL DEFAULT current_timestamp(),
  `datetime_updated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `analytics_properties` ADD PRIMARY KEY (`id`), ADD KEY `analytics_properties_user_id_delete` (`user_id`);
ALTER TABLE `analytics_properties` MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE `analytics_properties` ADD CONSTRAINT `analytics_properties_user_id_delete` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `backlinkresults` CHANGE `alexa` `alexa` INT(11) NOT NULL DEFAULT '0';
ALTER TABLE `rankresults` CHANGE `alexa_rank` `alexa_rank` INT(11) NOT NULL DEFAULT '0';

UPDATE `crawl_engines` SET `regex1` = '/\"follower_count\":(\\d+)/is' WHERE engine_name='pinterest' and engine_category='social_media';
UPDATE `crawl_engines` SET `regex2` = '/media_result_group.*?\"Rated (\\d+\\.\\d+) out/is' WHERE engine_name='google' and engine_category='review';

UPDATE `searchengines` SET `regex` = '<div.*?class=\"?g.*?>.*?href=\"(.*?)\".*?>.*?<h3.*?>(.*?)<\\/h3>', `from_pattern` = 'id=\"search\"', `to_pattern` = 'id=\"bottomads\"' where  url LIKE '%google%';


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
