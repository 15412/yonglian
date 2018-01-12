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
class GeneralCategoryController extends ThinkController {
	
	private $model = 'general_category'; /*在OneThink模型管理中查看自己模型标识（不是名称）修改此处*/
	protected $type = 0; /*分类类型:1:图片分类 */
	
	/**
	 * 分类管理列表
	 * @author rohochan <rohochan@gamil.com>
	 */
	public function index(){
		//$tree = D('GeneralCategory')->getTree(0,'id,name,title,sort,pid,allow_publish,status');
		$tree = D('GeneralCategory')->getTree(0,'id,name,sort,pid,status',$this->type);
		//dump($tree);
		
		$this->assign('tree', $tree);
		C('_SYS_GET_CATEGORY_TREE_', true); //标记系统获取分类树模板
		$this->meta_title = '分类管理';
		$this->display();
	}
	
	/**
	 * 显示分类树，仅支持内部调
	 * @param  array $tree 分类树
	 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
	 */
	public function tree($tree = null){
		C('_SYS_GET_CATEGORY_TREE_') || $this->_empty();
		$this->assign('tree', $tree);
		$this->display('tree');
	}

	/* 编辑分类 */
	public function editOld($id = null, $pid = 0){
	   $generalCategory = D('GeneralCategory');

		if(IS_POST){ //提交表单
			if(false !==$generalCategory->update()){
				$this->success('编辑成功！', U('index'));
			} else {
				$error =$generalCategory->getError();
				$this->error(empty($error) ? '未知错误！' : $error);
			}
		} else {
			$cate = '';
			if($pid){
				/* 获取上级分类信息 */
				$cate =$generalCategory->info($pid, 'id,name,status');
				if(!($cate && 1 == $cate['status'])){
					$this->error('指定的上级分类不存在或被禁用！');
				}
			}
			
			/* 获取分类信息 */
			$info = $id ?$generalCategory->info($id) : '';
			
			$this->assign('info',	   $info);
			$this->assign('category',   $cate);
			$this->meta_title = '编辑分类';
			$this->display();
		}
	}

	/* 新增分类 */
	public function addOld($pid = 0){
		$generalCategory = D('GeneralCategory');
		if(IS_POST){ //提交表单
			if(false !==$generalCategory->update()){
				$this->success('新增成功！', U('index'));
			} else {
				$error =$generalCategory->getError();
				$this->error(empty($error) ? '未知错误！' : $error);
			}
		} else {
			$cate = array();
			if($pid){
				/* 获取上级分类信息 */
				$cate =$generalCategory->info($pid, 'id,name,status');
				if(!($cate && 1 == $cate['status'])){
					$this->error('指定的上级分类不存在或被禁用！');
				}
			}
			/* 获取分类信息 */
			$this->assign('info',null);
			$this->assign('category', $cate);
			$this->meta_title = '新增分类';
			$this->display('edit');
		}
	}
	
	/* 新增分类 */
	public function add($pid = 0,$model = null){
		//获取模型信息
		$model = M('Model')->where(array('status' => 1))->getByName( $this->model ); 
		//$model = M('Model')->where(array('status' => 1))->find($model);
		$model || $this->error('模型不存在！');
		if(IS_POST){
			$_POST['type'] = $this->type;
			$Model  =   D(parse_name(get_table_name($model['id']),1));
			// 获取模型的字段信息
			$Model  =   $this->checkAttr($Model,$model['id']);
			if($Model->create() && $Model->add()){
				$this->success('添加'.$model['title'].'成功！', U('index'));
			} else {
				$this->error($Model->getError());
			}
		} else {
			$cate = array();
			if($pid){
				/* 获取上级分类信息 */
				$generalCategory = D('GeneralCategory');
				$cate =$generalCategory->info($pid, 'id,name,type,status');
				if(!($cate && 1 == $cate['status'])){
					$this->error('指定的上级分类不存在或被禁用！');
				}
			}
			/* 获取分类信息 */
			$this->assign('category', $cate);
			$fields = get_model_attribute($model['id']);
			
			$this->assign('model', $model);
			$this->assign('fields', $fields);
			$this->meta_title = '新增'.$model['title'];
			$this->display($model['template_add']?$model['template_add']:'');
		}
	}
	
	/* 编辑分类 */
	public function edit( $model = null, $id = 0, $pid = 0 ){
		$id || $this->error('请选择要编辑的数据！');
		$model = M('Model')->getByName( $this->model ); /*通过Model名称获取Model完整信息*/
		//获取模型信息
		//$model = M('Model')->find($model);
		$model || $this->error('模型不存在！');
		
		if(IS_POST){
			$Model  =   D(parse_name(get_table_name($model['id']),1));
			// 获取模型的字段信息
			$Model  =   $this->checkAttr($Model,$model['id']);
			if($Model->create() && $Model->save()){
				//清空当前分类缓存
				$sysGeneralCategoryList = S('sys_general_category_list');
				$webSearchHotKeyword = S('WEB_SEARCH_HOT_KEYWORD');
				$name = I('post.name');
				unset($sysGeneralCategoryList[$id]);
				/*if (array_key_exists($id,$sysGeneralCategoryList)) {
					$sysGeneralCategoryList[$id]['name'] = $name;
				}*/
				
				if (isset($webSearchHotKeyword[$id])) {
				//if (array_key_exists($id,$webSearchHotKeyword)) {
					$webSearchHotKeyword[$id]['name'] = $name;
				}
				
				//更新缓存
				S('sys_general_category_list',$sysGeneralCategoryList);
				S('WEB_SEARCH_HOT_KEYWORD',$webSearchHotKeyword);
				//$webSearchHotKeyword = null;
				
				$this->success('保存'.$model['title'].'成功！', U('index'));
			} else {
				$this->error($Model->getError());
			}
		} else {
			$cate = '';
			$generalCategory = D('GeneralCategory');
			if($pid){
				/* 获取上级分类信息 */
				$cate =$generalCategory->info($pid, 'id,name,status');
				if(!($cate && 1 == $cate['status'])){
					$this->error('指定的上级分类不存在或被禁用！');
				}
			}
			/* 获取分类信息 */
			$info = $id ?$generalCategory->info($id) : '';
			$this->assign('info',$info);
			$this->assign('category',$cate);
			
			$fields	 = get_model_attribute($model['id']);
			
			//获取数据
			$data = M(get_table_name($model['id']))->find($id);
			$data || $this->error('数据不存在！');
			
			$this->assign('model', $model);
			$this->assign('fields', $fields);
			$this->assign('data', $data);
			$this->meta_title = '编辑'.$model['title'];
			$this->display($model['template_edit']?$model['template_edit']:'');
		}
	}
	
	/**
	 * 删除一个分类
	 * @author huajie <banhuajie@163.com>
	 */
	public function remove(){
		$cate_id = I('id');
		if(empty($cate_id)){
			$this->error('参数错误!');
		}
		
		//判断该分类下有没有子分类，有则不允许删除
		$child = M('GeneralCategory')->where(array('pid'=>$cate_id))->field('id')->select();
		if(!empty($child)){
			$this->error('请先删除该分类下的子分类!');
		}
		
		//判断该分类下有没有内容
		/*$document_list = M('Document')->where(array('category_id'=>$cate_id))->field('id')->select();
		if(!empty($document_list)){
			$this->error('请先删除该分类下的文章!（包含回收站）');
		}*/
		
		if ('ImageCategory' == CONTROLLER_NAME) {
			$result = M('Image')->field('id')->where(array('category_id'=>$cate_id))->select();
			if ($result) {
				$this->error('请先移除该分类下的图片!');
			}
		}
		
		//删除该分类信息
		$res = M('GeneralCategory')->delete($cate_id);
		if($res !== false){
			//记录行为
			action_log('update_category', 'category', $cate_id, UID);
			//清空首页头部导航缓存
			S('header_course',null);
			$this->success('删除分类成功！');
		}else{
			$this->error('删除分类失败！');
		}
	}
	
	
	/**
	 * 操作分类初始化
	 * @param string $type
	 * @author huajie <banhuajie@163.com>
	 */
	public function operate($type = 'move'){
		//检查操作参数
		if(strcmp($type, 'move') == 0){
			$operate = '移动';
		}elseif(strcmp($type, 'merge') == 0){
			$operate = '合并';
		}else{
			$this->error('参数错误！');
		}
		$from = intval(I('get.from'));
		empty($from) && $this->error('参数错误！');
		
		//根据ID获取分类类型
		$result = M('GeneralCategory')->field(true)->find($from);
		
		//获取分类
		$map = array('status'=>1, 'id'=>array('neq', $from));
		$map['type'] = $result['type']?array('eq', $result['type']):array('gt', 0);
		$list = M('GeneralCategory')->where($map)->field('id,pid,name,sort,create_time')->select();
		
		//移动分类时增加移至根分类
		if(strcmp($type, 'move') == 0){
			//不允许移动至其子孙分类
			$list = tree_to_list(list_to_tree($list));
			$list = list_sort_by($list,'sort', $sortby='desc');
			$pid = M('GeneralCategory')->getFieldById($from, 'pid');
			$pid && array_unshift($list, array('id'=>0,'name'=>'根分类'));
		}
		
		$list = tree_to_html(list_to_tree($list));
		
		$this->assign('type', $type);
		$this->assign('operate', $operate);
		$this->assign('from', $from);
		$this->assign('list', $list);
		$this->meta_title = $operate.'分类';
		$this->display();
	}
	
	/**
	 * 移动分类
	 * @author huajie <banhuajie@163.com>
	 */
	public function move(){
		$to = I('post.to');
		$from = I('post.from');
		$res = M('GeneralCategory')->where(array('id'=>$from))->setField('pid', $to);
		if($res !== false){
			$this->success('分类移动成功！', U('index'));
		}else{
			$this->error('分类移动失败！');
		}
	}
	
	/**
	 * 合并分类
	 * @author huajie <banhuajie@163.com>
	 */
	public function merge(){
		$to = I('post.to');
		$from = I('post.from');
		$Model = M('GeneralCategory');
		
		//检查分类绑定的模型
		$from_models = explode(',', $Model->getFieldById($from, 'model'));
		$to_models = explode(',', $Model->getFieldById($to, 'model'));
		foreach ($from_models as $value){
			if(!in_array($value, $to_models)){
				$this->error('请给目标分类绑定' . get_document_model($value, 'title') . '模型');
			}
		}
		
		//检查分类选择的文档类型
		$from_types = explode(',', $Model->getFieldById($from, 'type'));
		$to_types = explode(',', $Model->getFieldById($to, 'type'));
		foreach ($from_types as $value){
			if(!in_array($value, $to_types)){
				$types = C('DOCUMENT_MODEL_TYPE');
				$this->error('请给目标分类绑定文档类型：' . $types[$value]);
			}
		}
		
		//合并文档
		$res = M('Document')->where(array('category_id'=>$from))->setField('category_id', $to);
		
		if($res !== false){
			//删除被合并的分类
			$Model->delete($from);
			//清空首页头部导航缓存
			S('header_course',null);
			$this->success('合并分类成功！', U('index'));
		}else{
			$this->error('合并分类失败！');
		}
	}
	
	/**
	 * 设置一条或者多条数据的状态
	 * @author huajie <banhuajie@163.com>
	 */
	public function setStatus($model='GeneralCategory'){
		if ('ImageCategory' == CONTROLLER_NAME) {
			//联动更新状态
			$ids	=   I('request.ids');
			$status =   I('request.status');
			$generalCategory = M('GeneralCategory');
			$imageCategoryResult = $generalCategory->field('id,pid')->where(array('type'=>1,'status'=>1))->order('pid')->select();
			//$condition = array('status'=>abs(1-$status),'course_id'=>array('in',implode(get_all_child_category($imageCategoryResult,$ids),',')));
			$condition = array('course_id'=>array('in',implode(get_all_child_category($imageCategoryResult,$ids),',')));
			
			$image = M('Image');
			$updateResult = $image->where($condition)->save(array('status'=>$status));
		}
		return parent::setStatus($model);
	}
	
}
