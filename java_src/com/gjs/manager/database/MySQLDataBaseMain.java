package com.gjs.manager.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MySQLDataBaseMain {

	// 驱动程序名
	public String driver = "com.mysql.jdbc.Driver";
	// URL指向要访问的数据库名scutcs
	public String ipadress = "192.168.1.102";
	public String port = "3306";
	public String table = "test";
	public String url = "jdbc:mysql://" + ipadress + ":" + port + "/" + table;
	// MySQL配置时的用户名
	public String user = "tesla";
	// Java连接MySQL配置时的密码
	public String password = "tesla";
	// 连接参数
	public Connection conn = null;

	public MySQLDataBaseMain() {

	}
	
	public MySQLDataBaseMain(String ip, String port, String table) {
		ipadress = ip;
		this.port = port;
		this.table = table;
	}

	public boolean connectDatabase() {
		boolean ret = false;
		try {
			// 加载驱动程序
			Class.forName(driver);
			// 连续数据库
			conn = DriverManager.getConnection(url, user, password);
			if (null != conn && !conn.isClosed()) {
				System.out.println("Succeeded connecting to the Database!");
				ret = true;
			} else {
				System.out.println("Error connecting to the Database!");
			}
		} catch (ClassNotFoundException e) {
			System.out.println("Sorry,can`t find the Driver!");
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}

	public boolean disConnectDatabase() {
		boolean ret = false;
		if (null != conn) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("null connecting to the Database!");
		}
		return ret;
	}

	public ResultSet selectDatabase(String sql) {
		ResultSet rs = null;
		try {
			// statement用来执行SQL语句
			Statement statement = conn.createStatement();
			if (null != statement) {
				rs = statement.executeQuery(sql);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	public Object getSelectResult(ResultSet rs, Object input) {
		Object ret = null;

		try {
			String value = null;
			while (rs.next()) {
				// 选择sname这列数据
				value = rs.getString("sname");
				// 首先使用ISO-8859-1字符集将name解码为字节序列并将结果存储新的字节数组中。
				// 然后使用GB2312字符集解码指定的字节数组
				// name = new String(name.getBytes("ISO-8859-1"), "GB2312");
				// 输出结果
				System.out.println(rs.getString("sno") + "\t" + value);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return ret;
	}

}
