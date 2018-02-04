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
        $image = D('Image');
        $result['banner'] = $image->getByTag('index_banner');
        $result['content'] = $image->getByTag('index_content');
        $result['profile'] = $image->getByTag('index_profile');
        $result['culture'] = $image->getByTag('index_culture');
        //$result['strength'] = $image->getByTag('index_strength');
        $result['strength_sample_room'] = $image->getByTag('index_strength_sample_room');
        $result['strength_cloth_warehouse_area'] = $image->getByTag('index_strength_cloth_warehouse_area');
        $result['strength_cutting_table_area'] = $image->getByTag('index_strength_cutting_table_area');
        $result['strength_sewing_area'] = $image->getByTag('index_strength_sewing_area');
        $result['strength_ironing_area'] = $image->getByTag('index_strength_ironing_area');
        $result['strength_finished_product_area'] = $image->getByTag('index_strength_finished_product_area');
        $result['strength_logistic_area'] = $image->getByTag('index_strength_logistic_area');
        $result['product'] = $image->getByTag('index_product');
        $this->assign('profile', C('WEB_SITE_PROFILE_'.strtoupper(get_lang())));
        $this->assign('result', $result);
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
            array('position' => 'mid2', 'sort' => 6),
            array('position' => 'right1', 'sort' => 2),
            array('position' => 'right2', 'sort' => 3),
            array('position' => 'right3', 'sort' => 4),
            array('position' => 'right4', 'sort' => 5)
        );
        $image = D('Image');
        $result = $image->getByTag('about_profile');
        $this->assign('imageMap', $imageMap);
        $this->assign('profile', C('WEB_SITE_PROFILE_'.strtoupper(get_lang())));
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
            array('position' => 'mid2', 'sort' => 6),
            array('position' => 'right1', 'sort' => 2),
            array('position' => 'right2', 'sort' => 3),
            array('position' => 'right3', 'sort' => 4),
            array('position' => 'right4', 'sort' => 5)
        );
        $image = D('Image');
        $result = $image->getByTag('about_profile');
        $this->assign('imageMap', $imageMap);
        $this->assign('profile', C('WEB_SITE_PROFILE_'.strtoupper(get_lang())));
        $this->assign('result', $result);
        $this->display();
    }
    
    /**
     *    公司荣誉
     */
    public function honor()
    {
        $image = D('Image');
        $result = $image->getByTag('about_honor');
        $this->assign('result', $result);
        $this->display();
    }

    /**
     *    公司历史
     */
    public function history()
    {
        $image = D('Image');
        $result = $image->getByTag('about_history');
        $this->assign('result', $result);
        $this->display();
    }

    /**
     * 合作伙伴
     */
    public function partners()
    {
        $image = D('Image');
        $result['banner'] = $image->getByTag('partners_banner');
        $result['content'] = $image->getByTag('partners_content');
        $this->assign('result', $result);
        $this->display();
    }

    /**
     * 联系我们
     */
    public function contact()
    {
        $image = D('Image');
        $result['banner'] = $image->getByTag('contact_banner');
        $contact = D('Contact');
        $result['contact'] = $contact->getActive();
        $this->assign('result', $result);
        $this->display();
    }

    public function video()
    {
        $this->display();
    }

}