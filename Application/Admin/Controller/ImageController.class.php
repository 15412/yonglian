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
 * 后台通用分类管理控制器
 * @author rohochan <rohochan@gamil.com>
 */
class ImageController extends ThinkController {
	private $model = 'image'; /*在OneThink模型管理中查看自己模型标识（不是名称）修改此处*/
	
	public function index($model = null, $p = 0){
		return $this->lists($this->model, $p);
	}
	
	public function lists($model = null, $p = 0){
		return 	parent::lists($this->model, $p);
	}
	
	public function add($model = null ){
		$model = M('Model')->getByName($this->model);
		return 	parent::add( $model['id'] );
	}
	
	public function edit($model = null, $id = 0 ){
		$id || $this->error('请选择要操作的数据！');
		$model = M('Model')->getByName($this->model);
		return parent::edit( $model['id'], $id );
	}
	
	public function del($model = null, $ids=null ){
		$model = M('Model')->getByName($this->model);
		return parent::del( $model['id'], $ids );
	}
}
