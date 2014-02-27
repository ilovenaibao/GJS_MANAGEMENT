// ActionScript file
package com.gjs.manager.client
{
	import com.gjs.manager.staticfunc.StaticFunc;
	
	import flash.system.Capabilities;
	import flash.system.System;
	
	import flashx.textLayout.formats.Float;
	
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import mx.collections.ICollectionView;
	import mx.controls.Alert;
	import mx.controls.DataGrid;
	import mx.controls.dataGridClasses.DataGridColumn;
	import mx.controls.dataGridClasses.DataGridListData;
	import mx.core.FlexGlobals;
	import mx.core.ScrollPolicy;
	import mx.events.ResizeEvent;
	import mx.managers.SystemManager;
	import mx.rpc.AbstractOperation;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.mxml.Operation;
	import mx.rpc.remoting.mxml.RemoteObject;
	import mx.states.AddItems;
	
	import org.flexunit.internals.runners.statements.ExpectException;
	import org.osmf.utils.URL;
	
	import spark.components.Application;
	import spark.components.Panel;
	
	public class ClientMain {
		
		public function ClientMain() {
		}
		
		public static var mainContainer:Panel = null;
		public static var clientGrid:DataGrid = new DataGrid(); // list客户列表框
		public static var url:String = null;
		
		public static function onInit(mainPanel:Panel):void {
			if (null == mainPanel) {
				Alert.show("Load page error!");
				return;
			}
			url = StaticFunc.getGlobelUrl("ip");
			mainContainer = mainPanel;
			mainPanel.title = "客户信息表";
			mainPanel.addEventListener(ResizeEvent.RESIZE, reSizeViewListener);
			
			reSizeAllView();
			clientGrid.columnCount = ClientDefine.ClientGridColumnCount; // column列数(姓名、性别、电话)
			// 删除以前打开的记录
			for (var preCount:int = 0; null != clientGrid.columns && preCount < clientGrid.columns.length; ) {
				clientGrid.columns.pop();
			}
			// 创建数组列
			var dataColumn:Array = new Array();
			var oneDataGridColumn:DataGridColumn = new DataGridColumn();
			clientGrid.columns = new Array();
			oneDataGridColumn.headerText = "姓名";
			oneDataGridColumn.dataField = "name";
			dataColumn.push(oneDataGridColumn);
			oneDataGridColumn = new DataGridColumn();
			oneDataGridColumn.headerText = "性别";
			oneDataGridColumn.dataField = "sex";
			dataColumn.push(oneDataGridColumn);
			oneDataGridColumn = new DataGridColumn();
			oneDataGridColumn.headerText = "电话";
			oneDataGridColumn.dataField = "tel";
			dataColumn.push(oneDataGridColumn);
			clientGrid.columns = dataColumn;
			clientGrid.verticalScrollPolicy = ScrollPolicy.ON;
			
			mainPanel.addElement(clientGrid);
			
			var clientOnInitRemote:RemoteObject = new RemoteObject();
			var opera:Operation = new Operation();
			clientOnInitRemote.destination = "com.gjs.manager.client.JavaClientMain";
			clientOnInitRemote.endpoint = "http://" + url + ":8080/GJS_MANAGEMENT/messagebroker/amf";
			clientOnInitRemote.operations = {"onInitClientList" : opera};
			clientOnInitRemote.addEventListener(ResultEvent.RESULT, onClientOninitRemoteResult);
			opera.send();
			/*var o:Operation = clientOnInitRemote.getOperation("onInitClientList") as Operation; 
			o.send();*/
			
			
			
		}
		
		public static function reSizeViewListener(event:ResizeEvent):void {
			reSizeAllView();
		}
		
		// reSize Client控件大小
		public static function reSizeAllView():void {
			clientGrid.width = mainContainer.parent.width * 8 / 10;
			clientGrid.height = mainContainer.parent.height * 8 / 10;
			clientGrid.invalidateDisplayList();
		}
		
		// 加载remote端数据库信息
		public static function onClientOninitRemoteResult(event:ResultEvent):void {
			var tmp:ArrayList = ArrayList(event.result);
			clientGrid.dataProvider = getGridData(tmp);
			reSizeAllView();
//			Alert.show("Loading Ok!");
		}
		
		public static function getGridData(input:ArrayList):ArrayCollection {
			var dp:ArrayCollection = new ArrayCollection();
			for (var i:int; i < input.length; i++) {
				// dp.addItem({name:"tom", sex:"nan", tel:"123213123"});
				var tmpOneColumn1:String = new String();
				var tmpOneColumn2:String = new String();
				var tmpOneColumn3:String = new String();
				tmpOneColumn1 = String(input.getItemAt(i));
				i++;
				tmpOneColumn2 = String(input.getItemAt(i));
				i++
					tmpOneColumn3 = String(input.getItemAt(i));
				dp.addItem({name:tmpOneColumn1, sex:tmpOneColumn2, tel:tmpOneColumn3});
			}
			return dp;
		}
		
		public static function test():void {
			Alert.show("1111");
		} 
		
	}
}