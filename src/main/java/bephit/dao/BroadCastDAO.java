package bephit.dao;

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

import bephit.model.AdminUser;
import bephit.model.BroadCastReports;
import bephit.model.ParticipantsDetails;
import bephit.model.StreamDetails;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import bephit.model.BroadCast;
import bephit.model.ParticipantsDetails;
import bephit.model.StreamDetails;

public class BroadCastDAO {
	private DataSource dataSource;
	protected static Logger logger=org.slf4j.LoggerFactory.getLogger("Insert into log table");

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public String getMaxBroadCastID() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
		String brid = "10000";
		try {
			resultSet = statement
					.executeQuery("select Max(broad_id) as max_id from broad_cast_table");
			int br_id = 0;
			if (resultSet.next()) {

				br_id = Integer.parseInt(resultSet.getString("max_id"));
				//System.out.println(br_id);
				br_id = br_id + 1;
				brid = Integer.toString(br_id);
				
			}

		} catch (Exception e) {
			logger.info(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return brid;

	}

	public int insertNewBroadCast(BroadCast broadCast) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int flag = 0;
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
		try {
//			DateFormat dateFormat=new SimpleDateFormat();
	
			
			
			
			String cmd = "INSERT INTO broad_cast_table(broad_id,stream_id,group_id,frequency,days_weeks,start_date,fstream_time,sstream_time,tstream_time,fstream_time_am_pm,sstream_time_am_pm,tstream_time_am_pm,stream_week_day,status,created_by) values('"
					+ broadCast.getBroad_id()
					+ "','"
					+ broadCast.getStream_id()
					+ "','"
					+ broadCast.getGroup_id()
					+ "','"
					+ broadCast.getFrequency()
					+ "','"
					+ broadCast.getDays_weeks()
					+ "','"
					+ broadCast.getStart_date()
					+ "','"
					+ broadCast.getFstream_time()
					+ "','"
					+ broadCast.getSstream_time()
					+ "','"
					+ broadCast.getTstream_time()
					+ "','"
					+ broadCast.getFstream_time_am_pm()
					+ "','"
					+ broadCast.getSstream_time_am_pm()
					+"','"
					+ broadCast.getTstream_time_am_pm()
					+"','"					
					+ broadCast.getStream_week_day() + "','0','"+userName+"')";
			logger.info(cmd);
			statement.execute(cmd);
			
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

	public List<BroadCastReports> getReports() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String repotscmd;
	
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<BroadCastReports> reportList = new ArrayList<BroadCastReports>();
		try {
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			UserDetails userDetails = null;
			if (principal instanceof UserDetails) {
			  userDetails = (UserDetails) principal;
			}
			String userName = userDetails.getUsername();
			if(userName.equals("superadmin"))
				repotscmd="select b.broad_id,str.stream_name,pg.group_name,b.days_weeks,b.frequency,str.message_count,b.start_date,b.status,b.enable from broad_cast_table as b join stream as str on str.stream_id=b.stream_id join participant_group_table as pg on b.group_id=pg.group_id";
				else			
			repotscmd = "select b.broad_id,str.stream_name,pg.group_name,b.days_weeks,b.frequency,str.message_count,b.start_date,b.status,b.enable from broad_cast_table as b join stream as str on str.stream_id=b.stream_id join participant_group_table as pg on b.group_id=pg.group_id where b.created_by='"+userName+"'";
			
			resultSet=statement.executeQuery(repotscmd);
			logger.info(repotscmd);
			while (resultSet.next()) {
				reportList.add(new BroadCastReports(resultSet
						.getString("broad_id"),resultSet
						.getString("stream_name"),resultSet
						.getString("group_name"), resultSet
						.getString("days_weeks"),resultSet
						.getString("frequency"), resultSet
						.getString("start_date"),
						resultSet.getString("status"),resultSet
								.getString("message_count"),resultSet.getString("enable")));

			}

		} catch (Exception e) {
			logger.info(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
	
		return reportList;

	}

	public List<BroadCast> getBroadCast() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;

		String cmd;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<BroadCast> bcast = new ArrayList<BroadCast>();
		try {
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			UserDetails userDetails = null;
			if (principal instanceof UserDetails) {
			  userDetails = (UserDetails) principal;
			}
			String userName = userDetails.getUsername();
			
		
			if(userName.equals("superadmin"))
				cmd = "select * from broad_cast_table";
			else 			
			    cmd = "select * from broad_cast_table where created_by='"+userName+"'";

			logger.info(cmd);
			resultSet = statement.executeQuery(cmd);
			while (resultSet.next())
			{
				bcast.add(new BroadCast(resultSet.getString("broad_id"),
						resultSet.getString("stream_id"), resultSet
								.getString("group_id"), resultSet
								.getString("frequency"), resultSet
								.getString("days_weeks"), resultSet
								.getString("start_date"), resultSet
								.getString("fstream_time"), resultSet
								.getString("sstream_time"), resultSet
								.getString("stream_week_day"), resultSet
								.getString("status")));
			}

			

		} catch (Exception e) {
			logger.info(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return bcast;
	}

	public int setenable_messaging(String broad_id,String enable)
	{
		Connection con = null;
		Statement statement = null;		 
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}	
		try
		{
			
	String cmd_update_enable="Update broad_cast_table set enable="+enable+" where broad_id='"+broad_id+"'";
	statement.executeUpdate(cmd_update_enable);
	
	logger.info(cmd_update_enable);
	
	
	
		}
		catch(Exception ex)
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
		return 1;
	}
	public List<BroadCastReports> getlimitedbroadcast(int page) {
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
		List<BroadCastReports> reportList = new ArrayList<BroadCastReports>();
		try {

			
			int offset = 20 * (page - 1);
			int limit = 20;
			String repotscmd;
			if(userName.equals("superadmin"))
				repotscmd="select b.broad_id,str.stream_name,pg.group_name,b.days_weeks,b.frequency,str.message_count,b.start_date,b.status,b.enable from broad_cast_table as b join stream as str on str.stream_id=b.stream_id join participant_group_table as pg on b.group_id=pg.group_id limit " + offset + ","+ limit+"";
			else
				repotscmd = "select b.broad_id,str.stream_name,pg.group_name,b.days_weeks,b.frequency,str.message_count,b.start_date,b.status,b.enable from broad_cast_table as b join stream as str on str.stream_id=b.stream_id join participant_group_table as pg on b.group_id=pg.group_id where b.created_by='"+userName+"' limit " + offset + ","+ limit+"";
			
			resultSet=statement.executeQuery(repotscmd);
			logger.info(repotscmd);

			while (resultSet.next()) {
				reportList.add(new BroadCastReports(resultSet
						.getString("broad_id"),resultSet
						.getString("stream_name"),resultSet
						.getString("group_name"),resultSet
						.getString("days_weeks"), resultSet
						.getString("frequency"), resultSet
						.getString("start_date"),
						resultSet.getString("status"),resultSet
								.getString("message_count"),resultSet.getString("enable")));
			}
		} catch (Exception e) {
			logger.info(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return reportList;

	}
	public int getnoofbroadcast() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int noofRecords = 0;
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
		List<BroadCastReports> reportList = new ArrayList<BroadCastReports>();
		try {

			String cmd;
			if(userName.equals("superadmin"))
				cmd="select count(*) as noofrecords from broad_cast_table";
			else
					cmd = "select count(*) as noofrecords from broad_cast_table where created_by='"+userName+"'";
			logger.info(cmd);
			resultSet = statement.executeQuery(cmd);
			if (resultSet.next())
				noofRecords = resultSet.getInt("noofrecords");

		} catch (Exception e) {
			logger.info(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return noofRecords;

	}
	
	
	
	
	
	public void releaseConnection(Connection con) {
		try {
			if (con != null)
				con.close();
		} catch (Exception e) {
		}
	}

	public void releaseResultSet(ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
		} catch (Exception e) {
		}
	}

	public void releaseStatement(Statement stmt) {
		try {
			if (stmt != null)
				stmt.close();
		} catch (Exception e) {
		}
	}

}
