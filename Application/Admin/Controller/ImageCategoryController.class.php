<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2015 http://www.xue5156.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: rohochan <rohochan@gamil.com> <http://www.rohochan.com>
// +----------------------------------------------------------------------

namespace Admin\Controller;

/**
 * 图片分类管理控制器
 * @author rohochan <rohochan@gamil.com>
 */
 
 /*注意是继承ThinkController而不是AdminController*/
class ImageCategoryController extends GeneralCategoryController {
	
	protected  $type = 1; /*分类类型:1:图片分类 */
	
}
