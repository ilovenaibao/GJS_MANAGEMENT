package com.gjs.manager.login
{
	public class LoginDefine
	{
		public function LoginDefine()
		{
		}
		

		public static var BT_OK_ID:String = "id_bt_ok";
		public static var INPUT_USRNAME_ID:String = "id_input_usrname";
		public static var INPUT_PASSWD_ID:String = "id_input_passwd";

		
		// 字体作坊比例
		public static var TEXT_SCALE_SIZE:int = 2;
		// 用户名、密码 水平方向 
		public static var POS_X:int = -200;
		// 用户名、密码 竖直方向
		public static var POS_Y:int = -100;
		// 输入框水平距离 
		public static var POS_INPUT_X:int = POS_X + 250;
		public static var POS_INPUT_Y:int = POS_Y + 60;
		// 用户名、密码长度
		public static var INPUT_STR_LEN:int = 15;
	}
}