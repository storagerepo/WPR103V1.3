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
import java.util.TimeZone;

import javax.sql.DataSource;

import org.joda.time.DateTime;
import org.joda.time.DateTimeZone;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;


import bephit.model.MessageStatus;
import bephit.model.ParticipantsDetails;

public class MessageStatusDAO {
	private DataSource dataSource;
	
	protected static Logger logger = org.slf4j.LoggerFactory.getLogger("Insert into log table");

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	
	public List<MessageStatus> getMessageStatusDetails(String broadcastid) {

		Connection con = null;
		Statement statement = null;
		ResultSet messagelogresultset = null;
		ResultSet resultSet=null;
		ResultSet logresultset=null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<MessageStatus> messagestatus = new ArrayList<MessageStatus>();

		try
		{
			resultSet = statement.executeQuery("select ms.participant_id,p.fname as participant_name,ms.broad_id,ms.stream_id,ms.message_no,ms.status,ms.sendtime from message_status as ms join participants_table as p on ms.participant_id=p.participants_id where ms.broad_id='"+broadcastid+"'");
			
			while (resultSet.next()) {
				messagestatus.add(new MessageStatus(
						resultSet.getString("participant_id"),
						resultSet.getString("participant_name"),						
						resultSet.getString("broad_id")
						,resultSet.getString("stream_id")
						,resultSet.getString("message_no")
						,resultSet.getString("status")
						,resultSet.getString("sendtime")
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

		return messagestatus;
	}
	
	public int setMessageStatusDetails(String participant_id,String broadcast_id,String stream_id,String message_no,String status) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		// List<ParticipantsDetails> participants = new
		// ArrayList<ParticipantsDetails>();
		try {
		    DateTimeZone tz=DateTimeZone.forID("EST");
			//DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
			DateTime date=new DateTime(tz);
			DateTimeFormatter formatter = DateTimeFormat.forPattern("M/d/Y");
			//date = formatter.parseDateTime(date.toString());
		
					String cmd = "INSERT INTO `message_status` (`participant_id`,`broad_id`,`stream_id`,`message_no`,`status`,`sendtime`) VALUES ('"
					+ participant_id
					+ "','"
					+ broadcast_id
					+ "','"
					+ stream_id
					+ "','"
					+ message_no
					+ "','"
					+ status
					+ "','"
					+ date.toLocalDateTime().toString("MM/dd/yyyy H:m:ss")
					+ "')";
			logger.info(cmd);
			statement.executeUpdate(cmd);
		
			
		} catch (Exception e) {
			
			logger.info(e.toString());
			releaseStatement(statement);
			releaseConnection(con);
			
			// return 0;
		} finally {
			releaseStatement(statement);
			releaseConnection(con);

		}
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
