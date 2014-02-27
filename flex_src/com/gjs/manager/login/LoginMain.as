// ActionScript file
package com.gjs.manager.login
{	
	import com.gjs.manager.client.ClientMain;
	import com.gjs.manager.staticfunc.StaticFunc;
	
	import flash.events.MouseEvent;
	
	import mx.controls.Alert;
	import mx.events.CloseEvent;
	
	import spark.components.Button;
	import spark.components.Label;
	import spark.components.Panel;
	import spark.components.TextInput;
	

	public class LoginMain {
		
		public function LoginMain() {
		}
		
		public static var mainContainer:Panel = null;
		public static var usrName:Label = new Label(); // 用户名
		public static var passwd:Label = new Label(); // 密码
		public static var usrNameInput:TextInput = new TextInput(); // 用户名输入
		public static var passwdInput:TextInput = new TextInput(); // 密码输入
		public static var bt_ok:Button = new Button(); // 确定
		
		public static function onInit(mainPanel:Panel):void {
			if (null == mainPanel) {
				Alert.show("Load page error!");
				return;
			}
			mainContainer = mainPanel;
			
			usrName.text = "用户名";
			usrName.horizontalCenter = LoginDefine.POS_X;
			usrName.verticalCenter = LoginDefine.POS_Y;
			usrName.scaleX = LoginDefine.TEXT_SCALE_SIZE;
			usrName.scaleY = LoginDefine.TEXT_SCALE_SIZE;
			
			passwd.text = "密码";
			passwd.horizontalCenter = LoginDefine.POS_X;
			passwd.verticalCenter = LoginDefine.POS_INPUT_Y;
			passwd.scaleX = LoginDefine.TEXT_SCALE_SIZE;
			passwd.scaleY = LoginDefine.TEXT_SCALE_SIZE;
			
			usrNameInput.id = LoginDefine.INPUT_USRNAME_ID;
			usrNameInput.horizontalCenter = LoginDefine.POS_INPUT_X;
			usrNameInput.verticalCenter = LoginDefine.POS_Y;
			usrNameInput.right = usrName;
			usrNameInput.widthInChars = LoginDefine.INPUT_STR_LEN;
			usrNameInput.scaleX = LoginDefine.TEXT_SCALE_SIZE;
			usrNameInput.scaleY = LoginDefine.TEXT_SCALE_SIZE;
			
			passwdInput.id = LoginDefine.INPUT_PASSWD_ID;
			passwdInput.horizontalCenter = LoginDefine.POS_INPUT_X;
			passwdInput.verticalCenter = LoginDefine.POS_INPUT_Y;
			passwdInput.right = usrName;
			passwdInput.widthInChars = LoginDefine.INPUT_STR_LEN;
			passwdInput.scaleX = LoginDefine.TEXT_SCALE_SIZE;
			passwdInput.scaleY = LoginDefine.TEXT_SCALE_SIZE;
			
			bt_ok.id = LoginDefine.BT_OK_ID;
			bt_ok.label = "确定";
			bt_ok.horizontalCenter = 0;
			bt_ok.verticalCenter = 60;
			bt_ok.toolTip = "新员工请到管理部申请账号";
			bt_ok.scaleX = LoginDefine.TEXT_SCALE_SIZE;
			bt_ok.scaleY = LoginDefine.TEXT_SCALE_SIZE;
			bt_ok.addEventListener(MouseEvent.CLICK, bt_ok_clickHandler);
			
			mainPanel.addElement(bt_ok);
			mainPanel.addElement(usrName);
			mainPanel.addElement(passwd);
			mainPanel.addElement(usrNameInput);
			mainPanel.addElement(passwdInput);
			

			
		}
		
		public static function bt_ok_clickHandler(event:MouseEvent):void {
			if ("1" == usrNameInput.text && "2" == passwdInput.text) {
				Alert.show("登陆成功！", "", 1, null, onLoginAlertCallBack);
			} else {
				Alert.show("Error!");
			}
			
		}
		
		public static function onLoginAlertCallBack(event:CloseEvent):void
		{
//			StaticFunc.openBlankPage("http://@127.0.0.1:8080/GJS_MANAGEMENT/client_list.html");
			if (null != mainContainer) {
				mainContainer.removeAllElements();
				ClientMain.onInit(mainContainer);
			}
		}
		
		public static function button_login_clickHandler(userName:TextInput, passwd:TextInput):void {
			if ("1" == userName.text && "2" == passwd.text) {
				Alert.show("登陆成功！", "", 1, null, onLoginAlertCallBack);
				
			} else {
				Alert.show("Error!");
			}
//			userName.text = passwd.text = "";
		
		}
	}
}