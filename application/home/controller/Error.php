<?php

namespace app\home\controller;

use think\Controller;

class Error extends Controller{
	public function _empty(){
		return $this->fetch('index');
	}
}