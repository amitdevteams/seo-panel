<?php

/***************************************************************************
 *   Copyright (C) 2009-2011 by Geo Varghese(www.seopanel.in)  	   *
 *   sendtogeo@gmail.com   												   *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
 ***************************************************************************/

# class defines all seo tools controller functions
class SeoToolsController extends Controller{
	var $layout = 'ajax';	
	
	# index function
	function index($info=[]){
		$this->layout = "default";
		if(isAdmin()){
			$sql = "SELECT * FROM seotools WHERE status IN (1,2,3,4,5,6,7,8,9,10,11)";	
		}else{
			$sql = "SELECT * FROM seotools WHERE status IN (1,2,3,4,5,6,7,8,9,10,11) AND user_access IN (1,2,3,4,5,6,7,8,9,10,11)";			
		}
		$sql .= " order by priority, id";
		
		$menuList = array();
		$toolList = $this->db->select($sql);
		$userTypeCtrler = new UserTypeController();
		
		// if not admin, check tool access set for user,
		if (!isAdmin()) {
			$userSessInfo = Session::readSession('userInfo');
			$toolAccessList = $userTypeCtrler->getSeoToolAccessSettings($userSessInfo['userTypeId']);
				
			// loop through plugin list
			foreach ($toolList as $toolInfo) {
		
				// if access is set for plugin
				if (isset($toolAccessList[$toolInfo['id']]['value'])) {
		
					// access is on
					if (!empty($toolAccessList[$toolInfo['id']]['value'])) {
						$menuList[] = $toolInfo;
					}
						
				} else {
					$menuList[] = $toolInfo;
				}
		
			}
				
		} else {
			$menuList = $toolList;
		}
		
		if(count($menuList) <= 0){
			$this->set('msg', $_SESSION['text']['common']['noactivetools']);
			$this->render('common/notfound');
			exit;
		}
		
		$this->set('menuList', $menuList);
		$defaultArgs = empty($info['default_args']) ? "" : urldecode($info['default_args']);
		switch($info['menu_sec']){
			
			case "sitemap-generator":
				$defaultScript = "sitemap.php";
				
				break;
				
		    case "site-auditor":
				// $defaultScript = "siteauditor.php";
				
				$seoToolInfo = $this->__getSeoToolInfo('site-auditor', 'url_section');
				if($seoToolInfo['status'] == 2){					
					$info['menu_sec'] = 'site-auditor';
					$defaultScript = "siteauditor.php";
					$defaultArgs = empty($defaultArgs) ? "sec=" : $defaultArgs;	
				}
				break;
			case "rank-checker":
				// $defaultScript = "rank.php";
				$seoToolInfo = $this->__getSeoToolInfo('rank-checker', 'url_section');
				if($seoToolInfo['status'] == 3){					
					$info['menu_sec'] = 'rank-checker';
					$defaultScript = "rank.php";
					$defaultArgs = empty($defaultArgs) ? "sec=" : $defaultArgs;	
				}
				break;
				
			case "backlink-checker":
				// $defaultScript = "backlinks.php";
				$seoToolInfo = $this->__getSeoToolInfo('backlink-checker', 'url_section');
				if($seoToolInfo['status'] == 4){					
					$info['menu_sec'] = 'backlink-checker';
					$defaultScript = "backlinks.php";
					$defaultArgs = empty($defaultArgs) ? "sec=" : $defaultArgs;	
				}
				break;
				
			case "directory-submission":
				// $defaultScript = "directories.php";
				$seoToolInfo = $this->__getSeoToolInfo('directory-submission', 'url_section');
				if($seoToolInfo['status'] == 5){					
					$info['menu_sec'] = 'directory-submission';
					$defaultScript = "directories.php";
					$defaultArgs = empty($defaultArgs) ? "sec=" : $defaultArgs;	
				}
				break;
				
			case "saturation-checker":
				// $defaultScript = "saturationchecker.php";
				$seoToolInfo = $this->__getSeoToolInfo('saturation-checker', 'url_section');
				if($seoToolInfo['status'] == 6){					
					$info['menu_sec'] = 'saturation-checker';
					$defaultScript = "saturationchecker.php";
					$defaultArgs = empty($defaultArgs) ? "sec=" : $defaultArgs;	
				}
				break;
				
			case "pagespeed":
				// $defaultScript = "pagespeed.php";
				$seoToolInfo = $this->__getSeoToolInfo('pagespeed', 'url_section');
				if($seoToolInfo['status'] == 7){					
					$info['menu_sec'] = 'pagespeed';
					$defaultScript = "pagespeed.php";
					$defaultArgs = empty($defaultArgs) ? "sec=" : $defaultArgs;	
				}
				break;
				
			case "webmaster-tools":
				// $defaultScript = "webmaster-tools.php";
				$seoToolInfo = $this->__getSeoToolInfo('webmaster-tools', 'url_section');
				if($seoToolInfo['status'] == 8){					
					$info['menu_sec'] = 'webmaster-tools';
					$defaultScript = "webmaster-tools.php";
					$defaultArgs = empty($defaultArgs) ? "sec=" : $defaultArgs;	
				}
				break;
				
			case "sm-checker":
				// $defaultScript = "social_media.php";
				$seoToolInfo = $this->__getSeoToolInfo('sm-checker', 'url_section');
				if($seoToolInfo['status'] == 9){					
					$info['menu_sec'] = 'sm-checker';
					$defaultScript = "social_media.php";
					$defaultArgs = empty($defaultArgs) ? "sec=" : $defaultArgs;	
				}
				break;
				
			case "review-manager":
				// $defaultScript = "review.php";
				$seoToolInfo = $this->__getSeoToolInfo('review-manager', 'url_section');
				if($seoToolInfo['status'] == 11){					
					$info['menu_sec'] = 'review-manager';
					$defaultScript = "review.php";
					$defaultArgs = empty($defaultArgs) ? "sec=" : $defaultArgs;	
				}
				break;
				
			case "web-analytics":
			    // $defaultScript = "analytics.php";
				$seoToolInfo = $this->__getSeoToolInfo('web-analytics', 'url_section');
				if($seoToolInfo['status'] == 10){					
					$info['menu_sec'] = 'web-analytics';
					$defaultScript = "analytics.php";
					$defaultArgs = empty($defaultArgs) ? "sec=" : $defaultArgs;	
				}
			    break;

			default:
				$seoToolInfo = $this->__getSeoToolInfo('keyword-position-checker', 'url_section');
				if($seoToolInfo['status'] == 1){					
					$info['menu_sec'] = 'keyword-position-checker';
					$defaultScript = "reports.php";
					$defaultArgs = empty($defaultArgs) ? "sec=" : $defaultArgs;	
				}
		}	
		
		$this->set('menuSelected', $info['menu_sec']);
		$this->set('defaultScript', $defaultScript);
		$this->set('defaultArgs', $defaultArgs);
		$this->render('seotools/index');
	}

	# func to get all seo tools
	function __getAllSeoTools($whereCond = "1=1"){
		$sql = "select * from seotools where $whereCond order by id";
		$seoToolList = $this->db->select($sql);
		return $seoToolList;
	}

	# func to get seo tool info
	function __getSeoToolInfo($val, $col='id'){
		$sql = "select * from seotools where $col='$val'";
		$seoToolInfo = $this->db->select($sql, true);
		return $seoToolInfo;
	}
	
	# func to list seo tools
	function listSeoTools() {
		$seoToolList = $this->__getAllSeoTools();
		$this->set('list', $seoToolList);
		$this->render('seotools/listseotools');	
	}
	
	#function to change status of seo tools
	function changeStatus($seoToolId, $status, $col='status'){
		
		$seoToolId = intval($seoToolId);
		$sql = "update seotools set $col=$status where id=$seoToolId";
		$this->db->query($sql);
	}

	# func to edit seo tool
	function editSeoTool($info, $error=false){
	
		if($error){
			$this->set('post', $info);
		}else{
			$info['pid'] = intval($info['pid']);
			$this->set('post', $this->__getSeoToolInfo($info['pid']));
		}
	
		$this->render('seotools/editseotool');
	}

	function updateSeoTool($listInfo){
	
		$listInfo['id'] = intval($listInfo['id']);
		$this->set('post', $listInfo);
		$errMsg['priority'] = formatErrorMsg($this->validate->checkNumber($listInfo['priority']));
		if(!$this->validate->flagErr){
			$sql = "update seotools set	priority='".intval($listInfo['priority'])."' where id={$listInfo['id']}";
			$this->db->query($sql);
			$this->listSeoTools();
		}else{
			$this->set('errMsg', $errMsg);
			$this->editSeoTool($listInfo, true);
		}
	}
	
}
?>
