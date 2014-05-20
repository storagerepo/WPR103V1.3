package bephit.dao;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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

import bephit.model.AdminUser;
import bephit.model.ParticipantsDetails;
import bephit.model.StreamDetails;

public class StreamDetailsDAO
{
	private DataSource dataSource;
	protected static Logger logger=org.slf4j.LoggerFactory.getLogger("logs");
	 
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public String getMaxStreamID(){
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
		String StreamID="1001";
	    try{
			resultSet = statement.executeQuery("select Max(stream_id) as streamid from stream");
			int stream_id=0;
			if(resultSet.next())
			{
				stream_id=Integer.parseInt(resultSet.getString("streamid"));
				stream_id=stream_id+1;	
				StreamID=Integer.toString(stream_id);
			}
			
	    }catch(Exception e){
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return StreamID;
		
	}

	
	public int insertNewstream(StreamDetails streamdetails,String admin_id,String[] Messages)
	{
		Connection con = null;
		Statement statement = null;		 
		ResultSet resultSet = null;
		int flag=0;
		String userName;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();		
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
		  userDetails = (UserDetails) principal;
		  
		}
		 userName = userDetails.getUsername();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}	
		try
		{
						 
			String cmd_mess="";
	int count=1;
	String stream_id="";
	for(String message :Messages)
	{		
		cmd_mess="insert into message_stream(stream_id,stream_message,msg_count) values(?,?,?)";
		PreparedStatement preparedStatement = con.prepareStatement(cmd_mess);
		preparedStatement.setInt(1,Integer.parseInt(streamdetails.getStreamId()));
		preparedStatement.setString(2,message);
		preparedStatement.setInt(3,count);	
		count++;
		preparedStatement.executeUpdate();
		logger.info(cmd_mess);
	}
	String cmd="insert into stream(stream_id,admin_name,stream_name,textingcontacts,stream_description,message_count,created_by) values(?,?,?,?,?,?,?)";
	PreparedStatement preparedStatement = con.prepareStatement(cmd);
	preparedStatement.setInt(1,Integer.parseInt(streamdetails.getStreamId()));
	preparedStatement.setString(2,admin_id);
	preparedStatement.setString(3,streamdetails.getStreamName());
	preparedStatement.setString(4,streamdetails.getTextingcontacts());
	preparedStatement.setString(5,streamdetails.getDescription());
	preparedStatement.setInt(6,count-1);
	preparedStatement.setString(7,userName);
	count++;
	preparedStatement.executeUpdate();
	
	
	
	
	
	logger.info(cmd);
	//statement.execute(cmd);
	
	
	flag=1;
		}
		catch(Exception ex)
		{
			logger.info(ex.toString());
			releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    	flag=0;
		}
		finally
		{
			releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	   
		}
		if(flag==1)
		return 1;
		else
			return 0;
	}
	public int insertmessage(StreamDetails streamdetails,String admin_id,String[] sample)
	{
		Connection con = null;
		Statement statement = null;		 
		ResultSet resultSet = null;
		int flag=0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}	
		try
		{
						 
			String cmd_mess="";
			//System.out.println("insert sample"+sample);
			int count=1;
			for(String message :sample)
			{		
			cmd_mess="insert into message_stream(stream_id,stream_message,msg_count) values(?,?,?)";
			PreparedStatement preparedStatement = con.prepareStatement(cmd_mess);
			preparedStatement.setInt(1,Integer.parseInt(streamdetails.getStreamId()));
			preparedStatement.setString(2,message);
			preparedStatement.setInt(3,count);	
			count++;
			preparedStatement.executeUpdate();
			logger.info("cmd_mess");
			}
			String cmd="UPDATE stream SET stream_name=?,textingcontacts=?,stream_description=?,message_count=? where stream_id=?";
			//String cmd="UPDATE stream SET stream_name='"+streamdetails.getStreamName()+"',textingcontacts='"+streamdetails.getTextingcontacts()+"',stream_description='"+streamdetails.getDescription()+"',message_count='"+(count-1)+"' where stream_id='"+streamdetails.getStreamId()+"';";
			
			PreparedStatement preparedStatement=con.prepareStatement(cmd);
			preparedStatement.setString(1,streamdetails.getStreamName());
			preparedStatement.setString(2,streamdetails.getTextingcontacts());
			preparedStatement.setString(3,streamdetails.getDescription());
			preparedStatement.setInt(4,count-1);
			preparedStatement.setString(5,streamdetails.getStreamId());
			
			preparedStatement.executeUpdate();
			
			logger.info(cmd);
			//statement.executeUpdate(cmd);
		
			
			
			flag=1;
						
		
		}
		catch(Exception ex)
		{
			logger.info(ex.toString());
			releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    	flag=0;
		}
		finally
		{
			releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	   
		}
		if(flag==1)
		return 1;
		else
			return 0;
	}
	public int deleltemessageid(List<String> sample)
	{
		Connection con = null;
		Statement statement = null;		 
		ResultSet resultSet = null;
		int flag=0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}	
		try
		{
						 
			String cmd_mess="";
		
			int count=1;
			for(String message :sample)
			{		
			cmd_mess="delete from message_stream where message_id='"+message+"'";
			count++;
			statement.execute(cmd_mess);
			}
			flag=1;
			logger.info(cmd_mess);
		}
		catch(Exception ex)
		{
			logger.info(ex.toString());
			releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    	flag=0;
		}
		finally
		{
			releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	   
		}
		if(flag==1)
		return 1;
		else
			return 0;
	}
	
	
	
	public List<StreamDetails> getStream(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
	
		String cmd;
		String userName;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();		
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
		  userDetails = (UserDetails) principal;
		  
		}
		 userName = userDetails.getUsername();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<StreamDetails> stream = new ArrayList<StreamDetails>();
	    try{
	       
	    	if(userName.equals("superadmin"))
	       cmd="select * from stream";
	    	else
	    		cmd="select * from stream where created_by='"+userName+"'";
	    	logger.info(cmd);
			resultSet=statement.executeQuery(cmd);
			while(resultSet.next()){
				stream.add(new StreamDetails(resultSet.getString("stream_id"),
						resultSet.getString("admin_name")
						,resultSet.getString("stream_name")	,
						resultSet.getString("textingcontacts"),
						resultSet.getString("stream_description"),resultSet.getString("message_count"),resultSet.getString("created_by")
						));
			}
			
	    }catch(Exception e){
	    	logger.info(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return stream;
		
	}
	
	public List<StreamDetails> getStream(String stream_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
	
		String cmd;
		String userName;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();		
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
		  userDetails = (UserDetails) principal;
		  
		}
		 userName = userDetails.getUsername();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<StreamDetails> stream = new ArrayList<StreamDetails>();
	    try{
	        if(userName.equals("superadmin"))
	        {
	       cmd="select * from stream where stream_id='"+stream_id+"'";
	        }
	        else
	        {
	        	cmd="select * from stream where stream_id='"+stream_id+"' and created_by='"+userName+"'";
	        }
	        logger.info(cmd);
			resultSet=statement.executeQuery(cmd);
			while(resultSet.next()){
				stream.add(new StreamDetails(resultSet.getString("stream_id"),resultSet.getString("admin_name")
						,resultSet.getString("stream_name")	,
						resultSet.getString("textingcontacts"),
						resultSet.getString("stream_description"),resultSet.getString("message_count"),resultSet.getString("created_by")
						));
			}
			
	    }catch(Exception e){
	    	logger.info(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return stream;
		
	}
	public List<String> getMessages(String stream_id){
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
		List<String> strlist = new ArrayList<String>();
	    try{
	        
	       cmd="select message_id,stream_id,stream_message from message_stream where stream_id='"+stream_id+"'";
	    
	       logger.info(cmd);
			resultSet=statement.executeQuery(cmd);
			int i=0;
			while(resultSet.next())
			{
				strlist.add(i,resultSet.getString("stream_message"));
				i++;
			}
			
	    }catch(Exception e){
	    	logger.info(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return strlist;
		
	}
	public List<String> getMessage(List<String> messageid){
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
		List<String> strlist = new ArrayList<String>();
		List<String> strlist1 = new ArrayList<String>();
	    try{
	        
	       cmd="select message_id,stream_id,stream_message from message_stream where stream_id='"+messageid+"'";
	    
	       logger.info(cmd);
			resultSet=statement.executeQuery(cmd);
			int i=0;
			while(resultSet.next())
			{
				strlist.add(i,resultSet.getString("stream_message"));
			    i++;
			}
			
			
	    }catch(Exception e){
	    	logger.info(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return strlist;
	 	
	}
	public List<String> getMessageid(String stream_id){
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
		List<String> strlist = new ArrayList<String>();
		List<String> strlist1 = new ArrayList<String>();
	    try{
	        
	       cmd="select message_id,stream_id,stream_message from message_stream where stream_id='"+stream_id+"'";
	    
	       logger.info(cmd);
			resultSet=statement.executeQuery(cmd);
			int i=0;
			while(resultSet.next())
			{
				strlist.add(i,resultSet.getString("message_id"));
			    i++;
			}
			
			
	    }catch(Exception e){
	    	logger.info(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return strlist;
	   
		
	}		
	public int deletestream(String stream_id,String admin){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int flag=0;
		String streamname="";
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try{
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	    	 Date date = new Date();
	    	 streamname="select stream_name from stream where stream_id='"+stream_id+"'";
				resultSet=statement.executeQuery(streamname);
				 InetAddress IP=InetAddress.getByName("127.0.0.1");
					try {
						IP = InetAddress.getLocalHost();
						//System.out.println("IP of my system is := "+IP.getHostAddress());
					} catch (UnknownHostException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			if(resultSet.next())
			{
				 streamname=resultSet.getString("stream_name");
			statement.execute("delete from stream where stream_id='"+stream_id+"'");
			statement.execute("delete from message_stream where stream_id='"+stream_id+"'");
			System.out.println("aaaaaa");
			String Desc="Deleted Stream" +streamname;
			String cmd_activity="insert into admin_log_activity_table(admin_id,ip_address,admin_date_time,admin_desc,done_by) values('"+admin+"','"+IP.getHostAddress()+"','"+dateFormat.format(date)+"','"+Desc+"','"+admin+"')";
			logger.info(cmd_activity);
			statement.execute(cmd_activity);
			 
			flag=1;
			}
			List <String> broad_id=new ArrayList<String>();
			String bid="select broad_id from broad_cast_table where stream_id='"+stream_id+"'";
			resultSet=statement.executeQuery(bid);
			while(resultSet.next()){
				broad_id.add(resultSet.getString("broad_id"));
				System.out.println("broad_id"+broad_id);
			}
			for (String broadid : broad_id) {
				statement.execute("delete from participant_message_log where broad_id='"+broadid+"'");
				
			}
			statement.execute("delete from broad_cast_table where stream_id='"+stream_id+"'");
	    }
			catch(Exception e){
				logger.info(e.toString());
	    	flag=0;
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
		
		
	   		if(flag==1)
	   			return 1;
	   		else
	   			return 0;
	   		
	}
	
		

	public List<StreamDetails> getlimitedstream(int page) {
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
		List<StreamDetails> stream = new ArrayList<StreamDetails>();
		try {

			String cmd;
			int offset = 20 * (page - 1);
			int limit = 20;
			if(userName.equals("superadmin"))
				   cmd= "select * from stream limit " + offset + ","+ limit+"" ;
				else
					cmd = "select * from stream where created_by='"+userName+"' limit " + offset + ","+ limit+"" ;
							
			logger.info(cmd);
			resultSet = statement.executeQuery(cmd);
			while (resultSet.next()) {
				stream.add(new StreamDetails(resultSet.getString("stream_id"),
						resultSet.getString("admin_name")
						,resultSet.getString("stream_name")	,
						resultSet.getString("textingcontacts"),
						resultSet.getString("stream_description"),resultSet.getString("message_count"),resultSet.getString("created_by")
						));
			}
		} catch (Exception e) {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return stream;

	}
	public int getnoofstream() {
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
		List<StreamDetails> stream = new ArrayList<StreamDetails>();
		try {

			String cmd;
			if(userName.equals("superadmin"))
				cmd = "select count(*) as noofrecords from stream";
				else
					cmd = "select count(*) as noofrecords from stream where created_by='"+userName+"'";
			logger.info(cmd);
			resultSet = statement.executeQuery(cmd);
			if (resultSet.next())
				noofRecords = resultSet.getInt("noofrecords");

		} catch (Exception e) {
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
