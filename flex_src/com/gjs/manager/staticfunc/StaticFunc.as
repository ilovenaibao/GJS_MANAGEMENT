// ActionScript file
package com.gjs.manager.staticfunc
{
	import flash.net.*;
	
	import mx.containers.Panel;
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.styles.StyleManager;
	
	public class StaticFunc {
		
		public function StaticFunc() {
			
		}
		
		public static function getGlobelUrl(inputKind:String):String {
			//http://192.168.1.102:8080/GJS_MANAGEMENT/index.html
			var ret:String = new String();
			var url:String = FlexGlobals.topLevelApplication.url;
			if ("url" == inputKind) {
				ret = url;
			} else {
				var ip:String = new String();
				var port:String = new String();
				var project:String = new String();
				var tmpStr:Array = new Array();
				var tmpStart:int = 0, tmpEnd:int = 0;
				for (var p:int = 0, j:int = 0; p < url.length; ) {
					p = url.indexOf('/', p);
					if (0 < p) {
						j++;
						p++;
					} else {
						break;
					}
					if (2 == j) {
						tmpStart = p;
						p = url.indexOf(':', p);
						ip = url.substring(tmpStart, p++);
						tmpStart = p;
						p = url.indexOf('/', p);
						port = url.substring(tmpStart, p++);
						tmpStart = p;
						p = url.indexOf('/', p);
						project = url.substring(tmpStart, p);
						break;
					}
				}
				
				if ("ip" == inputKind) {
					ret = ip;
				} else if ("port" == inputKind) {
					ret = port;
				} else if ("project" == inputKind) {
					ret = project;
				}
				
			}
			
			return ret;
		}
		
		// resize 一个控件的大小
		public static function reSizeView(v1:Object, v2:Object):void {
			Panel(v2).parent.width = Panel(v1).parent.width;
		}
		
		// 打开新的html页面
		public static function openBlankPage(url:String):void {
			var request:URLRequest = new URLRequest(url);
			navigateToURL(request);
		}
		
		// 获取当前系统ip地址
		public static function getSystemCurrenIp():void {
			
		}
	}
}