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
 * 联系我们模型
 */
class ContactModel extends Model{

	/**
	 * 根据生效数据列表
	 * @return array 结果
	 * @author rohochan <rohochan@gmail.com>
	 */
	public function getActive(){
        $result = $this->where(array('status'=>1))->order('sort asc')->select();
        if (!empty($result)) {
            $langMap = C('LANG_MAP');
            $lang = $langMap[LANG_SET];
            $defaultLang = reset($langMap);
            foreach ($result as $key => $value) {
                $result[$key]['company_name'] = $value['company_name_'.$lang];
                $result[$key]['tel'] = $value['tel_'.$lang];
                $result[$key]['fax'] = $value['fax_'.$lang];
                $result[$key]['email'] = $value['email_'.$lang];
                $result[$key]['address'] = $value['address_'.$lang];
            }
        }
        return $result;
	}

}
