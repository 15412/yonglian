<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;


/**
 * 前台首页控制器
 * 主要获取首页聚合数据
 */
class IndexController extends HomeController{
    /**
     * 开始页
     */
    public function start(){
        $this->display('startup');
    }
    
    /**
     * 首页
     */
    public function index(){
        //$category = D('Category')->getTree();
        //$lists    = D('Document')->lists(null);
        //$this->assign('category',$category);//栏目
        //$this->assign('lists',$lists);//列表
        //$this->assign('page',D('Document')->page);//分页
        $this->display();
    }
    
    /**
     * 公司简介
     */
    public function about(){
        $this->display();
    }
    
    /**
     * 	公司荣誉
     */
    public function honor(){
        $this->display();
    }
    
    /**
     * 合作伙伴
     */
    public function partners(){
        $this->display();
    }
    
    /**
     * 联系我们
     */
    public function contact(){
        $this->display();
    }

}