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
class IndexController extends HomeController
{
    /**
     * 开始页
     */
    public function start()
    {
        $this->display('startup');
    }

    /**
     * 首页
     */
    public function index()
    {
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
    public function about()
    {
        $imageMap = array(
            array('position' => 'left1', 'sort' => 10),
            array('position' => 'left2', 'sort' => 9),
            array('position' => 'left3', 'sort' => 8),
            array('position' => 'left4', 'sort' => 7),
            array('position' => 'mid1', 'sort' => 1),
            array('position' => 'mid2', 'sort' => 2),
            array('position' => 'right1', 'sort' => 3),
            array('position' => 'right2', 'sort' => 4),
            array('position' => 'right3', 'sort' => 5),
            array('position' => 'right4', 'sort' => 6)
        );
        $image = M('Image');
        $result = $image->field('i.*')->alias('i')->join('left join __GENERAL_CATEGORY__ as c on i.image_category_id=c.id')->where(array('c.tag' => 'about_profile', 'i.status' => 1))->select();
        if (!empty($result)) {
            $langMap = C('LANG_MAP');
            foreach ($result as $key => $value) {
                $result[$key]['picture_id'] = $value[$langMap[LANG_SET].'_picture_id'];
            }
        }
        $this->assign('imageMap', $imageMap);
        $this->assign('result', $result);
        $this->display();
    }


    /**
     *    公司简介
     */
    public function profile()
    {
        $imageMap = array(
            array('position' => 'left1', 'sort' => 10),
            array('position' => 'left2', 'sort' => 9),
            array('position' => 'left3', 'sort' => 8),
            array('position' => 'left4', 'sort' => 7),
            array('position' => 'mid1', 'sort' => 1),
            array('position' => 'mid2', 'sort' => 2),
            array('position' => 'right1', 'sort' => 3),
            array('position' => 'right2', 'sort' => 4),
            array('position' => 'right3', 'sort' => 5),
            array('position' => 'right4', 'sort' => 6)
        );
        $image = M('Image');
        $result = $image->field('i.*')->alias('i')->join('left join __GENERAL_CATEGORY__ as c on i.image_category_id=c.id')->where(array('c.tag' => 'about_profile', 'i.status' => 1))->select();
        if (!empty($result)) {
            $langMap = C('LANG_MAP');
            foreach ($result as $key => $value) {
                $result[$key]['picture_id'] = $value[$langMap[LANG_SET].'_picture_id'];
            }
        }
        $this->assign('imageMap', $imageMap);
        $this->assign('result', $result);
        $this->display();
    }
    
    /**
     *    公司荣誉
     */
    public function honor()
    {
        $this->display();
    }

    /**
     *    公司历史
     */
    public function history()
    {
        $this->display();
    }

    /**
     * 合作伙伴
     */
    public function partners()
    {
        $this->display();
    }

    /**
     * 联系我们
     */
    public function contact()
    {
        $this->display();
    }

}