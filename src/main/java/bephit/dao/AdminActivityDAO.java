package bephit.dao;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import bephit.model.AdminActivity;
import bephit.model.BroadCast;
import bephit.model.ParticipantGroups;
import bephit.model.ParticipantsDetails;

public class AdminActivityDAO {
	protected static Logger logger = org.slf4j.LoggerFactory.getLogger("Insert into log table");
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	
	public List<AdminActivity> getAdminActivity() {

		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
		  userDetails = (UserDetails) principal;
		}
		String userName = userDetails.getUsername();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<AdminActivity> adminactivity = new ArrayList<AdminActivity>();

		try
		
		{
			resultSet = statement.
					executeQuery("select * from admin_log_activity_table");
			logger.info("select * from admin_log_activity_table");
			while (resultSet.next()) {
				adminactivity.add(new AdminActivity(resultSet.getString("log_id")
						,resultSet.getString("admin_id")
						,resultSet.getString("ip_address")
						,resultSet.getString("admin_date_time")
						,resultSet.getString("admin_desc")
						,resultSet.getString("done_by")
						));
			
		                  }
			
		} 
		catch (Exception ex) 
		{
			logger.info(ex.toString());
			releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
		} 
		finally 
		{
			releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	
	    	
		}

		return adminactivity;
	}
	
	
	public int setAdminActivity(String admin_id,String Desc) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int flag = 0;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		/*UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
		  userDetails = (UserDetails) principal;
		}
		String userName = userDetails.getUsername();*/
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	    	 Date date = new Date();
	    	 
	    	 InetAddress IP=InetAddress.getByName("127.0.0.1");
				try {
					IP = InetAddress.getLocalHost();
					//System.out.println("IP of my system is := "+IP.getHostAddress());
				} catch (UnknownHostException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		
			System.out.println("admin_log");
			String cmd_activity="insert into admin_log_activity_table(admin_id,ip_address,admin_date_time,admin_desc,done_by) values('"+admin_id+"','"+IP.getHostAddress()+"','"+dateFormat.format(date)+"','"+Desc+"','"+admin_id+"')";
			logger.info(cmd_activity);
			statement.execute(cmd_activity);
			
			flag = 1;
		} catch (Exception ex) {
			logger.info(ex.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
			flag = 0;
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		if (flag == 1)
			return 1;
		else
			return 0;
	}

	
	
	
	
	
	

	public void releaseConnection(Connection con){
		try{if(con != null)
			con.close();
		}catch(Exception e){}
	}
	public void releaseResultSet(ResultSet rs){
		try{if(rs != null)
			rs.close();
	}catch(Exception e){}
	}
	public void releaseStatement(Statement stmt){
		try{if(stmt != null)
			stmt.close();
	}catch(Exception e){}
	}


	
}
