<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Model;
use Think\Model;

/**
 * 图片模型
 */
class ImageModel extends Model{

	/**
	 * 根据图片分类标签获取图片列表
	 * @param  string $tag 图片标签
	 * @return array 结果
	 * @author rohochan <rohochan@gmail.com>
	 */
	public function getByTag($tag=''){
        $result = $this->field('i.*')->alias('i')->join('left join __GENERAL_CATEGORY__ as c on i.image_category_id=c.id')->where(array('c.tag'=>$tag, 'i.status'=>1))->select();
        if (!empty($result)) {
            $langMap = C('LANG_MAP');
            foreach ($result as $key => $value) {
            	$pictureId = $value[$langMap[LANG_SET].'_picture_id'];
                $result[$key]['picture_id'] = $pictureId?:$value[reset($langMap).'_picture_id'];
            }
        }
        return $result;
	}

}
