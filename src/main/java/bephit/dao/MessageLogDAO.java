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

import org.slf4j.LoggerFactory;
import org.slf4j.Logger;

import bephit.model.MessageLog;
//import org.joda.*;
import org.joda.time.DateTime;
import org.joda.time.DateTimeComparator;
import org.joda.time.DateTimeZone;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

public class MessageLogDAO {
	private DataSource dataSource;
	
	protected static Logger logger = org.slf4j.LoggerFactory.getLogger("Insert into log table");

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	
	public List<MessageLog> getMessageLog(String participantid) {

		Connection con = null;
		Statement statement = null;
		ResultSet messagelogresultset = null;
		ResultSet resultSet=null;
		ResultSet resultSet1=null;
		ResultSet logresultset=null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<MessageLog> messagelog = new ArrayList<MessageLog>();
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		DateTime send_date = new DateTime();
		DateTimeFormatter formatter = DateTimeFormat.forPattern("M/d/Y");
		//
		//--------------------------Time Zone-----------------------------//
        /*DateTimeZone TZ=DateTimeZone.forID("EST");
		DateTime today_date = new DateTime(TZ);
		today_date=dateFormat.
		System.out.println("Today Date:"+today_date);*/
		TimeZone zone=TimeZone.getTimeZone("EST");
		dateFormat.setTimeZone(zone);
		//------------------------End Time Zone-------------------------//
	
		Date date = new Date();

		try
		{
			resultSet = statement.executeQuery("select  b.broad_id,b.group_id,pg.participant_id from broad_cast_table as b join participant_group as pg on b.group_id=pg.group_id join participants_table as p on pg.participant_id=p.participants_id where participants_id='"+participantid+"'");
			
			while (resultSet.next())
			{
				messagelog.add(new MessageLog(resultSet.getString("broad_id")
						,resultSet.getString("group_id")
						,resultSet.getString("participant_id")));
			
		    }			
			
			for(int i=0;i<messagelog.size();i++)
			{
					
				messagelogresultset=statement.executeQuery("select * from participant_message_log where broad_id='"+messagelog.get(i).getBroad_id()+"' and Participant_id='"+messagelog.get(i).getParticipant_id()+"'");
				if(messagelogresultset.next())
				{
				
					continue;
				}
				else
				{
					String senddate="";
					List<String> broadcast_id=new ArrayList<String>();
					resultSet1=statement.executeQuery("select startdate from participants_table where participants_id='"+messagelog.get(i).getParticipant_id()+"'");
					if(resultSet1.next())
					{
						senddate=resultSet1.getString("startdate");
					}
					if(senddate.equals(""))
					{
					 senddate=dateFormat.format(date);
					}
					if(senddate.equals(null))
					{
					 senddate=dateFormat.format(date);
					}
					String message_log="insert into participant_message_log(Participant_id,broad_id,no_of_message_send,no_of_days,flag_status,dateofsend)values('"+messagelog.get(i).getParticipant_id()+"','"+messagelog.get(i).getBroad_id()+"','0','0','0','"+senddate+"')";
					logger.info(message_log);
					statement.executeUpdate(message_log);
					logresultset=statement.executeQuery("select * from participant_message_log where Participant_id='"+participantid+"'");
					while(logresultset.next())
					{
						broadcast_id.add(logresultset.getString("broad_id"));
					}
					
					for(int b=0;b<broadcast_id.size();b++)
					{
						int flag=0;
						for(int j=0;j<messagelog.size();j++)
						{
							
							if(messagelog.get(j).getBroad_id().equals(broadcast_id.get(b)))
							{
								flag=1;
								break;
							}
						}
						if(flag==1)
						{
							continue;
						}
						else
						{
							
							String deletelog="delete from participant_message_log where broad_id='"+broadcast_id.get(b)+"' and Participant_id='"+participantid+"'";
							statement.executeUpdate(deletelog);
							logger.info(deletelog);
						}
						
					}
					
					
					
					
					
				
				}		
							
			}				
			if(messagelog.size()==0)
			{
				String deletelog="delete from participant_message_log where Participant_id='"+participantid+"'";
				statement.executeUpdate(deletelog);	
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

		return messagelog;
	}
	
	public List<MessageLog> updateMessagelog() {

		Connection con = null;
		Statement statement = null;
		ResultSet messagelogresultset = null;
		ResultSet resultSet=null,resultSet1=null;
		ResultSet logresultset=null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<MessageLog> messagelog = new ArrayList<MessageLog>();
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		TimeZone zone=TimeZone.getTimeZone("EST");
		dateFormat.setTimeZone(zone);
		DateTime send_date = new DateTime();
		DateTimeFormatter formatter = DateTimeFormat.forPattern("M/d/Y");
		Date date = new Date();
		try
		{
			resultSet = statement.executeQuery("select b.broad_id as broad_id,b.group_id as group_id,pg.participant_id as participant_id from broad_cast_table as b join participant_group as pg on b.group_id=pg.group_id where broad_id=(select max(broad_id) from broad_cast_table)");
						
			while (resultSet.next()) {
				messagelog.add(new MessageLog(resultSet.getString("broad_id")
						,resultSet.getString("group_id")
						,resultSet.getString("participant_id")));
			
		                  }			
			
			for(int i=0;i<messagelog.size();i++)
			{
					
				messagelogresultset=statement.executeQuery("select * from participant_message_log where broad_id='"+messagelog.get(i).getBroad_id()+"' and Participant_id='"+messagelog.get(i).getParticipant_id()+"'");
				if(messagelogresultset.next())
				{
				
					continue;
				}
				else
				{
					String senddate="";
					resultSet1=statement.executeQuery("select startdate from participants_table where participants_id='"+messagelog.get(i).getParticipant_id()+"'");
					if(resultSet1.next())
					{
						senddate=resultSet1.getString("startdate");
											}
					if(senddate.equals(""))
					{
						senddate=dateFormat.format(date);
					}
					if(senddate.equals(null))
					{
						senddate=dateFormat.format(date);
					}				
					
					List<String> broadcast_id=new ArrayList<String>();
					String message_log="insert into participant_message_log(Participant_id,broad_id,no_of_message_send,no_of_days,flag_status,dateofsend)values('"+messagelog.get(i).getParticipant_id()+"','"+messagelog.get(i).getBroad_id()+"','0','0','0','"+senddate+"')";
					logger.info(message_log);
					statement.executeUpdate(message_log);
					/*logresultset=statement.executeQuery("select * from participant_message_log where Participant_id='"+participantid+"'");
					while(logresultset.next())
					{
						broadcast_id.add(logresultset.getString("broad_id"));
					}
					System.out.println("messagelog size"+messagelog.size());
					for(int b=0;b<broadcast_id.size();b++)
					{
						int flag=0;
						for(int j=0;j<messagelog.size();j++)
						{
							System.out.println(messagelog.get(j).getBroad_id()+"message_log"+ broadcast_id.get(b));
							if(messagelog.get(j).getBroad_id().equals(broadcast_id.get(b)))
							{
								flag=1;
								break;
							}
						}
						if(flag==1)
						{
							continue;
						}
						else
						{
							System.out.println(broadcast_id.get(b));
							String deletelog="delete from participant_message_log where broad_id='"+broadcast_id.get(b)+"'";
							statement.executeUpdate(deletelog);
						}
						
					}*/
					
					
					
					
					
				
				}		
							
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

		return messagelog;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*public List<String> getMessageLogs(String participantid) {

		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> broadcastid= new ArrayList<String>();
		List<String> groupid= new ArrayList<String>();
		List<String> participant_id= new ArrayList<String>();
		

		try
		{
			resultSet = statement.executeQuery("select  b.broad_id,b.group_id,pg.participant_id from broad_cast_table as b join participant_group as pg on b.group_id=pg.group_id join participants_table as p on pg.participant_id=p.participants_id where participants_id='"+93+"'");
			System.out.println("select * from admin_log_activity_table");
			if (resultSet.next()) {
				broadcastid.add(resultSet.getString("broad_id"));
		        groupid.add(resultSet.getString("group_id"));
		        participant_id.add(resultSet.getString("participant_id"));
						
			
		                  }
			for(int i=0;i<broadcastid.size();i++)
			{
				System.out.println("MessageLogs"+broadcastid.get(i));
				System.out.println("MessageLogs"+groupid.get(i));
				System.out.println("MessageLogs"+participant_id.get(i));
				
				
			}
			
			
			System.out.println(messagelog);
		} 
		catch (Exception ex) 
		{
			System.out.println(ex.toString());
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

		return messagelog;
	}
*/

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
