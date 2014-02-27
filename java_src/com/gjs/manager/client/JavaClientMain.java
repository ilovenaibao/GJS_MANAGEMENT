package com.gjs.manager.client;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.gjs.manager.database.MySQLDataBaseMain;

import flex.messaging.io.ArrayList;

public class JavaClientMain {

	public JavaClientMain() {

	}

	private class ClientListColumn {
		String usrname;
		String sex;
		String tel;

		public ClientListColumn() {
			usrname = new String();
			sex = new String();
			tel = new String();
		}
	}

	public ArrayList onInitClientList() {
		ArrayList ret = new flex.messaging.io.ArrayList();
		MySQLDataBaseMain clientDatabase = new MySQLDataBaseMain();
		boolean connectFlag = clientDatabase.connectDatabase(); // open database
		if (!connectFlag) {
			return ret;
		}
		String sql = "select * from admin";
		ResultSet rs = clientDatabase.selectDatabase(sql);
		if (null != rs) {
			try {
				while (rs.next()) {
					ClientListColumn oneColumn = new ClientListColumn();
					oneColumn.usrname = rs.getString("username");
					oneColumn.sex = rs.getString("sex");
					oneColumn.tel = "" + rs.getInt("tel");
//					ret.add("{name:" + oneColumn.usrname + ", sex:" + oneColumn.sex + ", tel:" + oneColumn.tel);
					ret.add(oneColumn.usrname);
					ret.add(oneColumn.sex);
					ret.add(oneColumn.tel);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		clientDatabase.disConnectDatabase(); // close database
		return ret;
	}
}
