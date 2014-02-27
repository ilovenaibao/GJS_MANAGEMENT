package com.gjs.manager.login;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.gjs.manager.database.MySQLDataBaseMain;

public class JavaLoginMain {
	public String ip = null;
	public String port = null;
	public String table = null;
	MySQLDataBaseMain database = null;

	public JavaLoginMain() {
		
	}
	
	public JavaLoginMain(String ip, String port, String table) {
		this.ip = ip;
		this.port = port;
		this.table = table;
	}
	
	public int LoginOneUser(String login_id) {
		int ret = 0;
		if (!LoginOnInit()) {
			return ret;
		}
		ret = LoginKindChecked(login_id);
		return ret;
	}
	
	public boolean LoginOnInit() { // 初始化login主要是check 是否能连接数据库
		boolean ret = false;
		database = new MySQLDataBaseMain(ip, port, table);
		ret = database.connectDatabase();
		return ret;
	}
	
	public int LoginKindChecked(String login_id) { // 判断login的方式：管理员(1)、普通用户(2)、Guest临时用户登录(3)
		int ret = 0;
		String sql = "select usr_kind from inter_user where login_id='" + login_id + "'";
		ResultSet rs = database.selectDatabase(sql);
		try {
		if (null != rs && !rs.next()) {
			String usr_kind = rs.getString("usr_kind");
			ret = (int)(usr_kind.charAt(0)) - 48;
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return ret;
	}
	
	
}
