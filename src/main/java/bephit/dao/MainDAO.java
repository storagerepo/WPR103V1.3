package bephit.dao;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.sql.DataSource;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import bephit.controllers.MainController;
import bephit.model.EmailSender;
import bephit.model.ParticipantGroups;
import bephit.model.TwilioSMS;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import bephit.model.ParticipantsDetails;

public class MainDAO {
	private DataSource dataSource;
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);//Logger
	private static final Random RANDOM = new SecureRandom();
	@Autowired  
	EmailSender emailSender;
	
	@Autowired
	TwilioSMS messageSender;
	
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public  String getmaxparticipantid()
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
		String participants="";
		
		try {
			String cmd;		
			resultSet= statement.executeQuery("select  max(participants_id) as participant from participants_table;");
		    
			if(resultSet.next())
				{
				participants=resultSet.getString("participant");
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
		return participants;


		
	}
	
	public int updateparticipantmessage(ParticipantsDetails participant,String participants_id,String admin)
	{
		Connection con = null;
		Statement statement = null;
		int flag=0;
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
		//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	    try{
	    	 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	    	 Date date = new Date();
	    	 //System.out.println(dateFormat.format(date));
	    	/* String message="1";*/
	    	 String cmd;
	    	 if(participant.getMessage() != null)
	    		 cmd="UPDATE participants_table SET message ='"+participant.getMessage()+"' WHERE participants_id='"+participants_id+"'";
	    	 else
	    		 cmd="UPDATE participants_table SET message ='0' WHERE participants_id='"+participants_id+"'";
	    	logger.info(cmd);
	    	String Desc="Update participant ";
	    	
	    	
	    	
	    	String cmd_activity="insert into admin_log_activity_table(admin_id,ip_address,admin_date_time,admin_desc,done_by) values('"+admin+"','127.0.0.1','"+dateFormat.format(date)+"','"+Desc+"','"+userName+"')";
	    	    	
	    	logger.info("update message"+cmd);
	    	logger.info(cmd_activity);
			
	    	statement.execute(cmd);
			statement.execute(cmd_activity);
			flag=1;
	 }
	    catch(Exception e){
	    	logger.info(e.toString());
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    	flag=0;
	    	//return 0;
	    }finally{
	     	releaseStatement(statement);
	    	releaseConnection(con);	    
	    	
	    }
	    if(flag==1)
    		return 1;
    	else
    		return 0;
	
	}
	public  int checkuser(String admin_username)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int flag=0;
		//List<AdminUser> adminuser = new ArrayList<AdminUser>();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try{
	    	int enabled=1;
	    	int updateemail=1;
	   
	      String cmd_userlist="Select count(*) as counting from login where username='"+admin_username+"'";
          resultSet=statement.executeQuery(cmd_userlist);
          resultSet.next();
          int counts=Integer.parseInt(resultSet.getString("counting"));
       
          if(counts>0)
          {
        	  return 0;
          }
          else
          {
              return 1;
          }
	 }
	    catch(Exception e){
	    	logger.info(e.toString());
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    	flag=0;
	    	
	    	return 0;
	    }finally{
	     	releaseStatement(statement);
	    	releaseConnection(con);	    
	    	
	    }
	    
	}

	public  int checksecondaryemail(String admin_email,int from,String participantid)
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
		try{
	    	int enabled=1;
	    	int updateemail=1;
	    
	      String cmd_emaillist="";
	          
	      if(from==0)
	       	     cmd_emaillist="Select count(*) as counting from login where email_id='"+admin_email+"' or secondary_email='"+admin_email+"'";
	      else if(from==1)
	    	  cmd_emaillist="Select count(*) as counting from login where email_id='"+admin_email+"' or secondary_email='"+admin_email+"' and username!='"+participantid+"'";
	     
	      logger.info("maillist"+cmd_emaillist);	  
          resultSet=statement.executeQuery(cmd_emaillist);
          resultSet.next();
          int count=Integer.parseInt(resultSet.getString("counting"));
         // System.out.println("emailcount"+count);
         if(count>0)
          {
        	  return 0;
          }
          else
          {
              return 1;
          }
          
          /*else
          {
        	  ResultSet rs=statement.executeQuery("Select count(*) as counting from participants_table where email_id='"+admin_email+"' and participant_id!='"+participantid+"'" );
    		  rs.next();
              int count1=Integer.parseInt(resultSet.getString("counting"));
        	  if(count1>0)
              {        		 
        		  return 0;
              }
              else
              {
                 return 1; 
              }
          }*/
          
	 }
	    catch(Exception e){
	    	logger.info("check"+e.toString());
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    	flag=0;
	    	
	    return 0;	
	    }finally{
	     	releaseStatement(statement);
	    	releaseConnection(con);	    
	    	
	    }
		
	    
	}
	
	
	public  int checkemail(String admin_email,int from,String participantid)
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
		try{
	    	int enabled=1;
	    	int updateemail=1;
	    
	      String cmd_emaillist="";
	          
	      if(from==0)
	       	     cmd_emaillist="Select count(*) as counting from login where email_id='"+admin_email+"' or secondary_email='"+admin_email+"'";
	      else if(from==1)
	    	  cmd_emaillist="Select count(*) as counting from login where email_id='"+admin_email+"' and username!='"+participantid+"' or secondary_email='"+admin_email+"'";
	      logger.info("maillist"+cmd_emaillist);	  
          resultSet=statement.executeQuery(cmd_emaillist);
          resultSet.next();
          int count=Integer.parseInt(resultSet.getString("counting"));
         // System.out.println("emailcount"+count);
         if(count>0)
          {
        	  return 0;
          }
          else
          {
              return 1;
          }
          
          /*else
          {
        	  ResultSet rs=statement.executeQuery("Select count(*) as counting from participants_table where email_id='"+admin_email+"' and participant_id!='"+participantid+"'" );
    		  rs.next();
              int count1=Integer.parseInt(resultSet.getString("counting"));
        	  if(count1>0)
              {        		 
        		  return 0;
              }
              else
              {
                 return 1; 
              }
          }*/
          
	 }
	    catch(Exception e){
	    	logger.info(e.toString());
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    	flag=0;
	    	
	    return 0;	
	    }finally{
	     	releaseStatement(statement);
	    	releaseConnection(con);	    
	    	
	    }
		
	    
	}
	
	public  int checkmobile(String admin_mobile)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int flag=0;
		//List<AdminUser> adminuser = new ArrayList<AdminUser>();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try{
	    	int enabled=1;
	    	int updateemail=1;
	   
	    	
	    	
	      String cmd_mobilelist="Select count(*) as counting from participants_table where mobile_num='"+admin_mobile+"'";
          resultSet=statement.executeQuery(cmd_mobilelist);
          resultSet.next();
          int counts=Integer.parseInt(resultSet.getString("counting"));
        
          if(counts>0)
          {
        	  return 0;
          }
          else
          {
              return 1;
          }
	 }
	    catch(Exception e){
	    	logger.info(e.toString());
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    	flag=0;
	    	
	    	return 0;
	    }finally{
	     	releaseStatement(statement);
	    	releaseConnection(con);	    
	    	
	    }
	    
	}
	
	
	public int setregisterParticipants(ParticipantsDetails participant, String admin_id,String[] groups,int from) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int flag = 0;
		int merror=0;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		String providername="";
		if(from==0)
	{
		providername=admin_id;
	}
	else if(from==1)
	{
	
		// List<ParticipantsDetails> participants = new
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
		  userDetails = (UserDetails) principal;
		}
		providername = userDetails.getUsername();
	 }
		//Generate random password
		 
		 String letters = "abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ23456789";

	      String pw = "";
	      int PASSWORD_LENGTH=6;
		for (int i=0; i<PASSWORD_LENGTH; i++)
	      {
	          int index = (int)(RANDOM.nextDouble()*letters.length());
	          pw += letters.substring(index, index+1);
	      }
		
		// ArrayList<ParticipantsDetails>();
		try {
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Date date = new Date();
			//System.out.println("providername"+participant.getProvider_name());
			// System.out.println(dateFormat.format(date));
			String cmd = "INSERT INTO `participants_table` (id,`fname`,`username`,password,`mobile_num`,`gender`,`city`,`education`,`medical_details`,`time1`,`time1_am_pm`,`time2`,`time2_am_pm`,`time3`,`time3_am_pm`,startdate,`Provider_name`,`group_name`,`age`,`date_of_join`,`email_id`,`created_by`) VALUES ('"
					
            + ""					
            +"','"
					+ participant.getFname()					
					+"','"
					+participant.getUsername()
					+"','"
					+pw				
					+"','"
					+ participant.getMobile_num()
					+ "','"
					+ participant.getGender()
					+ "','"
					+ participant.getCity()
					+ "','"
					+ participant.getEducation()
					+ "','"
					+ participant.getMedical_details()
					+ "','"
					+ participant.getTime1()
					+ "','"
					+participant.getTime1_am_pm()
					+ "','"
					+participant.getTime2()
					+"','"
					+participant.getTime2_am_pm()
					+"','"
					+participant.getTime3()
					+"','"
					+participant.getTime3_am_pm()			
							
					+"','"
					+""+"','"
					
					+providername
					+"','"
					+ participant.getGroup_name()
					+ "','"
					+ participant.getAge()
					+ "','"
					+ dateFormat.format(date)
					+ "','" + participant.getEmail_id() + "','"+participant.getProvider_name()+"')";
			logger.info(cmd);
			
		
			
			
			
		  //  System.out.println("Password:"+pw);
		    
		    logger.info("passwordgeneration"+pw);
			 
		   
			 
			 
			 //end generate random password			
			
			//insert into role table
			String cmd_login="insert into login(username,password,email_id,secondary_email,role,status) values('"+participant.getUsername()+"','"+pw+"','"+participant.getEmail_id()+"','null',0,1)";
			 statement.execute(cmd);
			statement.execute(cmd_login);
			/*statement.execute(cmd);*/
			
			String cmd_getid="SELECT login_id from login where username='"+participant.getUsername()+"'";
			logger.info(cmd_login);
			/*String Desc="added adminuser"+admin_id;
			String cmd_activity="insert into admin_log_activity_table(admin_id,ip_address,admin_date_time,admin_desc) values('"+admin_id+"','127.0.0.1','"+dateFormat.format(date)+"','"+Desc+"')";
			System.out.println(cmd_activity);
			*/
			resultSet=statement.executeQuery(cmd_getid);
			resultSet.next();
			int lastinsertedid=Integer.parseInt(resultSet.getString("login_id"));
		
			String cmd_role="insert into user_roles(user_id,authority) values('"+lastinsertedid+"','ROLE_USER')";
			statement.execute(cmd_role);	
			//end insert
			try
			{
			//send mail password
			logger.info("--Before Sending--"); //Logger Test
		    //Email Test
		    emailSender.password_sendEmail(participant.getEmail_id(),"adherencemedicationproject","Adherence Project Registration",participant.getFname(),participant.getUsername(),pw);
		    
		    logger.info("--After Sent--");
		    
		    try{
		    	String body="Welcome to the adherence project!  Your UserID is '"+participant.getUsername()+"' and Your Password is '"+pw+"'.";
		    	 
		      	messageSender.sendSMS(participant.getMobile_num(), "Adherence Project Password :"+body);
		     }catch(Exception e){
		    	 logger.info(e.toString());
		    	 e.printStackTrace();
		    merror=1;	 
		     
		     }
		    
		    
		    
			}
			catch(Exception ex)
			{
				logger.info(ex.toString());
			}	
			
		/*	if(merror==1)
			{
				statement.executeUpdate("delete from login where username='"+participant.getUsername()+"'");
				statement.executeUpdate("delete from participants_table where username='"+participant.getUsername()+"'");
				String error="delete from login where username='"+participant.getUsername()+"'";
				statement.executeUpdate("delete from participant_table where username='"+participant.getUsername()+"'");
				System.out.println(error);
				
				
			}*/
			
			logger.info("insertcmd"+cmd);
			
			resultSet= statement.executeQuery("select  max(participants_id) as participant from participants_table;");
			String participants="";
			/*Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			UserDetails userDetails = null;
			if (principal instanceof UserDetails) {
			  userDetails = (UserDetails) principal;
			}
			String userName = userDetails.getUsername();*/
			if(resultSet.next())
				{
				participants=resultSet.getString("participant");
				}
			//System.out.println("participants........."+participants);			
			List<String> strlist = new ArrayList<String>();
			List<String> strlist1 = new ArrayList<String>();
					
			for(String group :groups)				
				{	
		    	resultSet= statement.executeQuery("select group_id,group_name from participant_group_table where group_name='"+group+"'");   
			     int i=0;
					while(resultSet.next())
					{
						strlist.add(i,resultSet.getString("group_id"));
						strlist1.add(i,resultSet.getString("group_name"));
						i++;
					}
				}
		 int count=groups.length;		
		for(int i=0;i<count;i++)
		{	
			String cmd_mess="insert into participant_group(group_id,group_name,participant_id) values('"+strlist.get(i)+"','"+strlist1.get(i)+"','"+participants+"')";
			statement.execute(cmd_mess);
			logger.info(cmd_mess);
			//System.out.println("cmd_mess"+cmd_mess);
	     }			
			/*
			 * String cmd_getparticipantname=
			 * "select fname from participants_table where participants_id='"
			 * +participant_id+"'";
			 * resultSet=statement.executeQuery(cmd_getparticipantname);
			 */
		     String Desc = "added participants" + participant.getFname();
		     
		    
			/*
			 * if(resultSet.next()) Desc=Desc+resultSet.getString(1);
			 */
		    /* InetAddress IP=InetAddress.getByName("127.0.0.1");
				try {
					IP = InetAddress.getLocalHost();
					//System.out.println("IP of my system is := "+IP.getHostAddress());
				} catch (UnknownHostException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}*/

		     /*String cmd_activity = "insert into admin_log_activity_table(admin_id,ip_address,admin_date_time,admin_desc,done_by) values('"
					+ admin_id
					+ "','"+IP.getHostAddress()+"','"
					+ dateFormat.format(date)
					+ "','" + Desc + "','"+providername+"')";
			System.out.println(cmd_activity);
			statement.execute(cmd_activity);*/
			flag = 1;
		
		
		}
		catch (Exception e) {
			logger.info(e.toString());
			releaseStatement(statement);
			releaseConnection(con);
			flag = 0;
			// return 0;
		} 
		finally {
			releaseStatement(statement);
			releaseConnection(con);

		}
		return merror;
}

	
	public int setParticipants(ParticipantsDetails participant, String admin_id,String[] groups,int from) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int flag = 0;
		int merror=0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		String providername="";
		if(from==0)
	{
		providername=admin_id;
	}
	else if(from==1)
	{
	
		// List<ParticipantsDetails> participants = new
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
		  userDetails = (UserDetails) principal;
		}
		providername = userDetails.getUsername();
	 }
		
		
		// ArrayList<ParticipantsDetails>();
		try {
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Date date = new Date();
			//System.out.println("providername"+participant.getProvider_name());
			// System.out.println(dateFormat.format(date));
			String cmd = "INSERT INTO `participants_table` (id,`fname`,`username`,password,`mobile_num`,`gender`,`city`,`education`,`medical_details`,`time1`,`time1_am_pm`,`time2`,`time2_am_pm`,`time3`,`time3_am_pm`,startdate,`Provider_name`,`group_name`,`age`,`date_of_join`,`email_id`,`created_by`) VALUES ('"
					+ participant.getId()					
					+"','"
					+ participant.getFname()					
					+"','"
					+participant.getUsername()
					+ "','"
					+ participant.getPassword()					
					+"','"
					+ participant.getMobile_num()
					+ "','"
					+ participant.getGender()
					+ "','"
					+ participant.getCity()
					+ "','"
					+ participant.getEducation()
					+ "','"
					+ participant.getMedical_details()
					+ "','"
					+ participant.getTime1()
					+ "','"
					+participant.getTime1_am_pm()
					+ "','"
					+participant.getTime2()
					+"','"
					+participant.getTime2_am_pm()
					+"','"
					+participant.getTime3()
					+"','"
					+participant.getTime3_am_pm()					
					+"','"
					+ participant.getStartdate()					
					+"','"
					+providername
					+"','"
					+ participant.getGroup_name()
					+ "','"
					+ participant.getAge()
					+ "','"
					+ dateFormat.format(date)
					+ "','" + participant.getEmail_id() + "','"+participant.getProvider_name()+"')";
			logger.info(cmd);
			
		
			
			
			//Generate random password
			 
			 String letters = "abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ23456789";

		      String pw = "";
		      int PASSWORD_LENGTH=6;
			for (int i=0; i<PASSWORD_LENGTH; i++)
		      {
		          int index = (int)(RANDOM.nextDouble()*letters.length());
		          pw += letters.substring(index, index+1);
		      }
		  //  System.out.println("Password:"+pw);
		    
		    logger.info("passwordgeneration"+pw);
			 
			 
			 
			 //end generate random password			
			
			//insert into role table
			String cmd_login="insert into login(username,password,email_id,secondary_email,role,status) values('"+participant.getUsername()+"','"+participant.getPassword()+"','"+participant.getEmail_id()+"','null',0,1)";
			
			statement.execute(cmd);
			statement.execute(cmd_login);
			/*statement.execute(cmd);*/
			
			String cmd_getid="SELECT login_id from login where username='"+participant.getUsername()+"'";
			logger.info(cmd_login);
			/*String Desc="added adminuser"+admin_id;
			String cmd_activity="insert into admin_log_activity_table(admin_id,ip_address,admin_date_time,admin_desc) values('"+admin_id+"','127.0.0.1','"+dateFormat.format(date)+"','"+Desc+"')";
			System.out.println(cmd_activity);
			*/resultSet=statement.executeQuery(cmd_getid);
			resultSet.next();
			int lastinsertedid=Integer.parseInt(resultSet.getString("login_id"));
		
			String cmd_role="insert into user_roles(user_id,authority) values('"+lastinsertedid+"','ROLE_USER')";
				
			//end insert
			try
			{
			//send mail password
			logger.info("--Before Sending--"); //Logger Test
		    //Email Test
		   emailSender.password_sendEmail(participant.getEmail_id(),"adherencemedicationproject","Adherence Project Registration",participant.getFname(),participant.getUsername(),participant.getPassword());
		    
		    logger.info("--After Sent--");
		    
		    try{
		    	 String body="Welcome to the adherence project!  Your UserID is '"+participant.getUsername()+"' and Your Password is '"+participant.getPassword()+"'.";
		    	 
		      	messageSender.sendSMS(participant.getMobile_num(), "Adherence Project Password :"+body);
		     }catch(Exception e){
		    	 
		    	 logger.info(e.toString());
		    	 e.printStackTrace();merror=1;}
		     
		   
		    
			}
			catch(Exception ex)
			{
				logger.info(ex.toString());
			}	
			
			logger.info("insertcmd"+cmd);
			/*if(merror==1)
			{
				statement.executeUpdate("delete from login where username='"+participant.getUsername()+"'");
				statement.executeUpdate("delete from participants_table where username='"+participant.getUsername()+"'");
				String error="delete from login where username='"+participant.getUsername()+"'";
				statement.executeUpdate("delete from participant_table where username='"+participant.getUsername()+"'");
				System.out.println(error);
				
				
			}*/
			
			statement.execute(cmd_role);
			resultSet= statement.executeQuery("select  max(participants_id) as participant from participants_table;");
			String participants="";
			/*Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			UserDetails userDetails = null;
			if (principal instanceof UserDetails) {
			  userDetails = (UserDetails) principal;
			}
			String userName = userDetails.getUsername();*/
			if(resultSet.next())
				{
				participants=resultSet.getString("participant");
				}
			//System.out.println("participants........."+participants);			
			List<String> strlist = new ArrayList<String>();
			List<String> strlist1 = new ArrayList<String>();
					
			for(String group :groups)				
				{	
		    	resultSet= statement.executeQuery("select group_id,group_name from participant_group_table where group_name='"+group+"'");   
			     int i=0;
					while(resultSet.next())
					{
						strlist.add(i,resultSet.getString("group_id"));
						strlist1.add(i,resultSet.getString("group_name"));
						i++;
					}
				}
		 int count=groups.length;		
		for(int i=0;i<count;i++)
		{	
			String cmd_mess="insert into participant_group(group_id,group_name,participant_id) values('"+strlist.get(i)+"','"+strlist1.get(i)+"','"+participants+"')";
			statement.execute(cmd_mess);
			logger.info(cmd_mess);
			//System.out.println("cmd_mess"+cmd_mess);
	     }			
			/*
			 * String cmd_getparticipantname=
			 * "select fname from participants_table where participants_id='"
			 * +participant_id+"'";
			 * resultSet=statement.executeQuery(cmd_getparticipantname);
			 */
		     String Desc = "added participants" + participant.getFname();
		     
		    
			/*
			 * if(resultSet.next()) Desc=Desc+resultSet.getString(1);
			 */
		    /* InetAddress IP=InetAddress.getByName("127.0.0.1");
				try {
					IP = InetAddress.getLocalHost();
					//System.out.println("IP of my system is := "+IP.getHostAddress());
				} catch (UnknownHostException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}*/

		     /*String cmd_activity = "insert into admin_log_activity_table(admin_id,ip_address,admin_date_time,admin_desc,done_by) values('"
					+ admin_id
					+ "','"+IP.getHostAddress()+"','"
					+ dateFormat.format(date)
					+ "','" + Desc + "','"+providername+"')";
			System.out.println(cmd_activity);
			statement.execute(cmd_activity);*/
			flag = 1;
		
		
		}
		catch (Exception e) {
			logger.info(e.toString());
			releaseStatement(statement);
			releaseConnection(con);
			flag = 0;
			// return 0;
		} 
		finally {
			releaseStatement(statement);
			releaseConnection(con);

		}
		return merror;
}
	
	public int setParticipants(ParticipantsDetails participant, String admin_id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
		  userDetails = (UserDetails) principal;
		}
		String userName = userDetails.getUsername();
		int flag = 0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		// List<ParticipantsDetails> participants = new
		// ArrayList<ParticipantsDetails>();
		try {
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Date date = new Date();
			
			// System.out.println(dateFormat.format(date));
			String cmd = "INSERT INTO `participants_table` (`fname`,`username`,`mobile_num`,`gender`,`city`,`education`,`medical_details`,`time1`,`time2`,`time3`,`Provider_name`,`group_name`,`age`,`date_of_join`,`email_id`,`created_by`) VALUES ('"
					+ participant.getFname()
					+ "','"
					+participant.getUsername()
					+"','"
					+ participant.getMobile_num()
					+ "','"
					+ participant.getGender()
					+ "','"
					+ participant.getCity()
					+ "','"
					+ participant.getEducation()
					+ "','"
					+ participant.getMedical_details()
					+ "','"
					+ participant.getTime1()
					+ "','"
					+participant.getTime2()
					+"','"
					+participant.getTime3()
					+"','"
					+userName
					+"','"
					+ participant.getGroup_name()
					+ "','"
					+ participant.getAge()
					+ "','"
					+ dateFormat.format(date)
					+ "','" + participant.getEmail_id() + "','"+userName+"')";
			logger.info(cmd);
			statement.executeUpdate(cmd);
			
			
			/*
			 * String cmd_getparticipantname=
			 * "select fname from participants_table where participants_id='"
			 * +participant_id+"'";
			 * resultSet=statement.executeQuery(cmd_getparticipantname);
			 */String Desc = "added participants" + participant.getFname();
			/*
			 * if(resultSet.next()) Desc=Desc+resultSet.getString(1);
			 */String cmd_activity = "insert into admin_log_activity_table(admin_id,ip_address,admin_date_time,admin_desc,done_by) values('"
					+ admin_id
					+ "','127.0.0.1','"
					+ dateFormat.format(date)
					+ "','" + Desc + "','"+userName+"')";
			 logger.info(cmd_activity);
			statement.execute(cmd_activity);
			flag = 1;
			
			
		} catch (Exception e) {
			
			logger.info(e.toString());
			releaseStatement(statement);
			releaseConnection(con);
			flag = 0;
			// return 0;
		} finally {
			releaseStatement(statement);
			releaseConnection(con);

		}
		if (flag == 1)
			return 1;
		else
			return 0;

	}

	public int updateregisterParticipants(ParticipantsDetails participant,String participants_id,String providername,String[] groups,int from)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet;
		int flag=0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	    try{
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
	    	 
	    	 //System.out.println(dateFormat.format(date));
//Generate random password
			 
			 String letters = "abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ23456789+@";

		      String pw = "";
		      int PASSWORD_LENGTH=6;
			for (int i=0; i<PASSWORD_LENGTH; i++)
		      {
		          int index = (int)(RANDOM.nextDouble()*letters.length());
		          pw += letters.substring(index, index+1);
		      }
		   
		    
		    
			 
			 
			 
			 //end generate random password			
			
	    	String Desc="Update participant "+participant.getFname();
	    	List<String> strlist = new ArrayList<String>();
			List<String> strlist1 = new ArrayList<String>();				
			statement.executeUpdate("delete from participant_group where participant_id='"+participants_id+"'");
			for(String group :groups)				
				{	
		    	resultSet= statement.executeQuery("select group_id,group_name from participant_group_table where group_name='"+group+"'");   
			     int i=0;
					while(resultSet.next())
					{
						strlist.add(i,resultSet.getString("group_id"));
						strlist1.add(i,resultSet.getString("group_name"));
						i++;
					}
				}
		 int count=groups.length;
		 
		for(int i=0;i<count;i++)
		{	
			String cmd_mess="insert into participant_group(group_id,group_name,participant_id) values('"+strlist.get(i)+"','"+strlist1.get(i)+"','"+participants_id+"')";
			statement.execute(cmd_mess);
			logger.info("cmd_mess"+cmd_mess);
	     }
		String Providername="";
		if(from==1)
		{
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
		  userDetails = (UserDetails) principal;
		}
		Providername = userDetails.getUsername();
		}
		else if(from==0)
		{
			Providername=providername;
		}
	    	
	    	String cmd_activity="insert into admin_log_activity_table(admin_id,ip_address,admin_date_time,admin_desc,done_by) values('"+Providername+"','"+IP.getHostAddress()+"','"+dateFormat.format(date)+"','"+Desc+"','"+Providername+"')";
	    	String cmd="UPDATE participants_table SET fname ='"+participant.getFname()+"',username ='"+participant.getUsername()+"',mobile_num ='"+participant.getMobile_num()+"',gender ='"+participant.getGender()+"'  ,city ='"+participant.getCity()+"' ,education = '"+participant.getEducation()+"',medical_details = '"+participant.getMedical_details()+"',time1='"+participant.getTime1()+"',time1_am_pm='"+participant.getTime1_am_pm()+"',time2='"+participant.getTime2()+"',time2_am_pm='"+participant.getTime2_am_pm()+"',time3='"+participant.getTime3()+"',time3_am_pm='"+participant.getTime3_am_pm()+"',Provider_name ='"+Providername+"',group_name = '"+participant.getGroup_name()+"',age = '"+participant.getAge()+"',date_of_join = '"+dateFormat.format(date)+"',email_id = '"+participant.getEmail_id()+"' WHERE participants_id='"+participants_id+"';";    	
	    	String cmd_login="UPDATE login SET email_id='"+participant.getEmail_id()+"' where username= '"+participant.getUsername()+"'";
	    	logger.info(cmd);
	    	logger.info(cmd_activity);
			
	    	statement.execute(cmd);
			statement.execute(cmd_activity);
			
			statement.execute(cmd);
			statement.execute(cmd_login);
			logger.info(cmd_login);
			flag=1;
	 }
	    catch(Exception e){
	    	logger.info(e.toString());
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    	flag=0;
	    	//return 0;
	    }finally{
	     	releaseStatement(statement);
	    	releaseConnection(con);	    
	    	
	    }
	    if(flag==1)
    		return 1;
    	else
    		return 0;
	    
	}
	

	public int updateParticipants(ParticipantsDetails participant,String participants_id,String providername,String[] groups,int from)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet;
		int flag=0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	    try{
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
	    	 
	    	 //System.out.println(dateFormat.format(date));
//Generate random password
			 
			 String letters = "abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ23456789+@";

		      String pw = "";
		      int PASSWORD_LENGTH=6;
			for (int i=0; i<PASSWORD_LENGTH; i++)
		      {
		          int index = (int)(RANDOM.nextDouble()*letters.length());
		          pw += letters.substring(index, index+1);
		      }
		   
		    
		    
			 
			 
			 
			 //end generate random password			
			
	    	String Desc="Update participant "+participant.getFname();
	    	List<String> strlist = new ArrayList<String>();
			List<String> strlist1 = new ArrayList<String>();				
			statement.executeUpdate("delete from participant_group where participant_id='"+participants_id+"'");
			for(String group :groups)				
				{	
		    	resultSet= statement.executeQuery("select group_id,group_name from participant_group_table where group_name='"+group+"'");   
			     int i=0;
					while(resultSet.next())
					{
						strlist.add(i,resultSet.getString("group_id"));
						strlist1.add(i,resultSet.getString("group_name"));
						i++;
					}
				}
		 int count=groups.length;
		 
		for(int i=0;i<count;i++)
		{	
			String cmd_mess="insert into participant_group(group_id,group_name,participant_id) values('"+strlist.get(i)+"','"+strlist1.get(i)+"','"+participants_id+"')";
			statement.execute(cmd_mess);
			logger.info("cmd_mess"+cmd_mess);
	     }
		String Providername="";
		if(from==1)
		{
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
		  userDetails = (UserDetails) principal;
		}
		Providername = userDetails.getUsername();
		}
		else if(from==0)
		{
			Providername=providername;
		}
	    	
	    	String cmd_activity="insert into admin_log_activity_table(admin_id,ip_address,admin_date_time,admin_desc,done_by) values('"+Providername+"','"+IP.getHostAddress()+"','"+dateFormat.format(date)+"','"+Desc+"','"+Providername+"')";
	    	String cmd="UPDATE participants_table SET id='"+participant.getId()+"', fname ='"+participant.getFname()+"',username ='"+participant.getUsername()+"',password='"+participant.getPassword()+"',mobile_num ='"+participant.getMobile_num()+"',gender ='"+participant.getGender()+"'  ,city ='"+participant.getCity()+"' ,education = '"+participant.getEducation()+"',medical_details = '"+participant.getMedical_details()+"',time1='"+participant.getTime1()+"',time1_am_pm='"+participant.getTime1_am_pm()+"',time2='"+participant.getTime2()+"',time2_am_pm='"+participant.getTime2_am_pm()+"',time3='"+participant.getTime3()+"',time3_am_pm='"+participant.getTime3_am_pm()+"',startdate='"+participant.getStartdate()+"',Provider_name ='"+Providername+"',group_name = '"+participant.getGroup_name()+"',age = '"+participant.getAge()+"',date_of_join = '"+dateFormat.format(date)+"',email_id = '"+participant.getEmail_id()+"' WHERE participants_id='"+participants_id+"';";    	
	    	String cmd_login="UPDATE login SET email_id='"+participant.getEmail_id()+"',password='"+participant.getPassword()+", where username= '"+participant.getUsername()+"'";
	    	logger.info(cmd);
	    	logger.info(cmd_activity);
			
	    	statement.execute(cmd);
			statement.execute(cmd_activity);
			
			statement.execute(cmd);
			statement.execute(cmd_login);
			logger.info(cmd_login);
			flag=1;
	 }
	    catch(Exception e){
	    	logger.info(e.toString());
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    	flag=0;
	    	//return 0;
	    }finally{
	     	releaseStatement(statement);
	    	releaseConnection(con);	    
	    	
	    }
	    if(flag==1)
    		return 1;
    	else
    		return 0;
	    
	}
	public  String getproviders(String participantid)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
		  userDetails = (UserDetails) principal;
		  //System.out.println(((UserDetails) principal).getAuthorities());
		}
		String userName = userDetails.getUsername();	
		//give full permission to superadmin
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		String name="";
		List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
		try {
			String cmd;
			String role_admin="ROLE_ADMIN";
			cmd="select * from participants_table where participants_id='"+participantid+"'";
				
			resultSet = statement
					.executeQuery(cmd);
			
			if(resultSet.next()) {
				name=resultSet.getString("Provider_name");
								
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
		return name;


		
	}
	
	public List<ParticipantsDetails> getParticipants() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
		  userDetails = (UserDetails) principal;
		  //System.out.println(((UserDetails) principal).getAuthorities());
		}
		String userName = userDetails.getUsername();
		
		//give full permission to superadmin
		
		
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
		try {
			String cmd;
			String role_admin="ROLE_ADMIN";
			if(userName.equals("superadmin"))
				cmd="select * from participants_table order by fname asc";
				else
			    cmd="select * from participants_table where Provider_name='"+userName+"' order by fname asc";
				
			resultSet = statement
					.executeQuery(cmd);
			//System.out.print("username" +userName);
			while (resultSet.next()) {
				participants.add(new ParticipantsDetails(resultSet
						.getString("participants_id"),resultSet
						.getString("id"), resultSet
						.getString("fname"), resultSet.getString("username"),
						resultSet.getString("password"),
						resultSet.getString("mobile_num"), resultSet
								.getString("gender"), resultSet
								.getString("city"), resultSet
								.getString("education"),resultSet
								.getString("medical_details"), resultSet
								.getString("time1"),resultSet.getString("time1_am_pm"),
								resultSet.getString("time2"),resultSet.getString("time2_am_pm"),
								resultSet.getString("time3"),resultSet.getString("time3_am_pm"),
								resultSet.getString("startdate"),
								resultSet.getString("Provider_name"),
								resultSet.getString("group_name"), resultSet
								.getString("age"), resultSet
								.getString("date_of_join"), resultSet
								.getString("email_id"), resultSet
								.getString("created_by"),resultSet.getString("message")));
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
		return participants;

	}

	
	public int sendForgotpassword(String email)
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
		List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
		try {
            String cmd;
            
			cmd = "select * from login where email_id='"+email+"' or secondary_email='"+email+"'";
			logger.info(cmd);
			resultSet = statement.executeQuery(cmd);
			if(resultSet.next()) {

				//------------------------------------------------------------------------//
				
				
				logger.info("--Before Sending--"); //Logger Test
		        //Email Test				
		        emailSender.password_sendEmail(email, "learnguild.com", "Forgot Password",resultSet.getString("username"),resultSet.getString("username"),resultSet.getString("password"));
		        logger.info("--After Sent--");
		        flag=1;
		      /*  model.addAttribute("success","true");
		       */ 
		        try{
		        /*	messageSender.sendSMS("6144670389", "Deemsys test");
		       */ }catch(Exception e){e.printStackTrace();}
		        
		        
		      //------------------------------------------------------------------------//
				
			}
		} catch (Exception e) {
			logger.info("email:"+e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
	    if(flag==1)
	    {
	    	return 1;
	    }
	    else
	    	return 0;

	}
	public List<ParticipantsDetails> getlimitedParticipants(int page) {
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
		List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
		try {

			String cmd;
			int offset = 20 * (page - 1);
			int limit = 20;
			if(userName.equals("superadmin"))
				   cmd="select * from participants_table  order by fname asc limit " + offset + ","+ limit+"" ;
				else
					cmd = "select * from participants_table where provider_name='"+userName+"'  order by fname asc limit " + offset + ","+ limit+"" ;
							
			logger.info(cmd);
			resultSet = statement.executeQuery(cmd);
			while (resultSet.next()) {
				participants.add(new ParticipantsDetails(resultSet
						.getString("participants_id"),
						resultSet.getString("id"),
						resultSet.getString("fname"),resultSet.getString("username"),
						resultSet.getString("password"),
						resultSet.getString("mobile_num"), resultSet
								.getString("gender"), resultSet
								.getString("city"), resultSet
								.getString("education"),resultSet
								.getString("medical_details"),resultSet
								.getString("time1"), resultSet.getString("time1_am_pm"),resultSet.getString("time2"),
								resultSet.getString("time2_am_pm"),resultSet.getString("time3"),resultSet.getString("time3_am_pm"),
								resultSet.getString("startdate"),
								resultSet.getString("Provider_name"),
								resultSet.getString("group_name"), resultSet
								.getString("age"), resultSet
								.getString("date_of_join"), resultSet
								.getString("email_id"), resultSet
								.getString("created_by"),resultSet.getString("message")));
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
		return participants;

	}

	public int getnoofParticipants() {
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
		List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
		try {

			String cmd;
			if(userName.equals("superadmin"))
				cmd = "select count(*) as noofrecords from participants_table";
				else
					cmd = "select count(*) as noofrecords from participants_table where provider_name='"+userName+"'";
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

	public int deleteParticipant(String participant_id, String admin) {
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
			
			String cmd_getparticipant_name = "select fname from participants_table where participants_id='"	+ participant_id + "'";
			String Desc = "Delete participant ";

			resultSet = statement.executeQuery(cmd_getparticipant_name);
			String cmd_activity;
			if (resultSet.next())
				Desc = Desc + resultSet.getString(1);
			
			//1.Delete from message log table
				String messagelog="delete from participant_message_log where Participant_id='"+ participant_id + "'";
				
				
			statement.execute(messagelog);
			
			//2.Delete From group mapping table
			String participant_group="delete from participant_group where participant_id='"+ participant_id + "'";
			
			statement.execute(participant_group);
			
			
			String selectedparticipantusername = "select username from participants_table where participants_id='"	+ participant_id + "'";
			
			
			String participantusername="",user_id="";
			logger.info("username"+selectedparticipantusername);
			ResultSet resultSet1=statement.executeQuery(selectedparticipantusername);
			while(resultSet1.next())
			{
				participantusername=resultSet1.getString("username");
			}
			String selectedloginid = "select login_id from login where username='"+ participantusername+ "'";
			logger.info(selectedloginid);
			ResultSet resultSet2=statement.executeQuery(selectedloginid);
			while(resultSet2.next())
			{
				user_id=resultSet2.getString("login_id");
			}
			//3.Delete from user roles table			
			String user_roles="delete from user_roles where USER_ID='"+user_id+"'";
			statement.execute(user_roles);
			logger.info(user_roles);
			
			//4.Delete from login table[important]
			String login="delete from login where username='"+participantusername+ "'";
			statement.execute(login);
			logger.info(login);
			
			
			logger.info("select log_id from weekly_logs where participant_id='"+ participant_id + "'");
			
			ResultSet resultset4=statement.executeQuery("select log_id from weekly_logs where participant_id='"+ participant_id + "'"); 
			List<String> weeklog_id=new ArrayList<String>();
			//String[] weeklog_id=new String[100];
			
			while(resultset4.next())
			{
			
			weeklog_id.add(resultset4.getString("log_id"));
			logger.info("log_id"+weeklog_id);
				//logger.info("delete from weekly_answers where log_id='"+resultset3.getString("log_id")+ "'");
			}
			
			for (String week_id : weeklog_id) {
				
				logger.info("Delete from weekly answers"+week_id);
				
				//5.Delete from weekly answers
				statement.execute("delete from weekly_answers where log_id='"+week_id+"'");	
				
			}
			
			//6.Delete from weekly logs
			statement.execute("delete from weekly_logs where participant_id='"+participant_id+ "'");
			
			//7.Delete from participant table
			String participant_table="delete from participants_table where participants_id='"+ participant_id + "'";
			statement.execute(participant_table);
			logger.info(participant_table);	
			
			
			//8.Delete from weekly audio
			String cmd_delete_weekly_audio="Delete from weekly_audio where participant_id='"+participant_id+"'";
			statement.execute(cmd_delete_weekly_audio);
			logger.info(cmd_delete_weekly_audio);
			
		
			cmd_activity = "insert into admin_log_activity_table(admin_id,ip_address,admin_date_time,admin_desc,done_by) values('"+admin+"','"+IP.getHostAddress()+"','"+dateFormat.format(date)+"','"+Desc+"','"+userName+"')";
					
			statement.execute(cmd_activity);
			flag = 1;

		} catch (Exception e) {
			logger.info(e.toString());
			flag = 0;
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
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

	// Select only ParticularGroup

	public List<ParticipantsDetails> getParticipants(String mobile,
			String groupname, String city) {
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
		List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
		try {
			
			String cmd="";
			if(!mobile.equals("")&&!groupname.equals("")&&!city.equals(""))
			{
			if(userName.equals("superadmin"))
			cmd = "select * from participants_table where mobile_num='"
					+ mobile + "' or group_name like '%" + groupname + "%' or city='"
					+ city + "'";
			else
				cmd = "select * from participants_table where mobile_num='"
				+ mobile + "' or group_name like '%" + groupname + "%' or city='"
				+ city + "' having Provider_name='"+userName+"'";
			}
			if(mobile.equals("")&&!groupname.equals("")&&city.equals(""))
			{
				if(userName.equals("superadmin"))
					cmd = "select * from participants_table where group_name like '%" + groupname + "%'";
					else
						cmd = "select * from participants_table where group_name like '%" + groupname + "%' having Provider_name='"+userName+"'";
			
			}
			if(!mobile.equals("")&&groupname.equals("")&&city.equals(""))
			{
				if(userName.equals("superadmin"))
					cmd = "select * from participants_table where mobile_num='"+mobile+"'";
					else
						cmd = "select * from participants_table where mobile_num='"+mobile+"' having Provider_name='"+userName+"'";
			
			}
			if(mobile.equals("")&&groupname.equals("")&&!city.equals(""))
			{
				if(userName.equals("superadmin"))
					cmd = "select * from participants_table where city='"+city+"'";
					else
						cmd = "select * from participants_table where city='"+city+"' having Provider_name='"+userName+"'";
			
			}
			if(mobile.equals("")&&!groupname.equals("")&&!city.equals(""))
			{
				if(userName.equals("superadmin"))
					cmd = "select * from participants_table where city='"+city+"' or group_name like '%" + groupname + "%'";
					else
						cmd = "select * from participants_table where city='"+city+"' or group_name like '%" + groupname + "%' having Provider_name='"+userName+"'";
			
			}
			if(!mobile.equals("")&&groupname.equals("")&&!city.equals(""))
			{
				if(userName.equals("superadmin"))
					cmd = "select * from participants_table where city='"+city+"' or mobile_num='"+mobile+"'";
					else
						cmd = "select * from participants_table where city='"+city+"' or mobile_num='"+mobile+"' having Provider_name='"+userName+"'";
			
			}
			if(!mobile.equals("")&&!groupname.equals("")&&city.equals(""))
			{
				if(userName.equals("superadmin"))
					cmd = "select * from participants_table where group_name like '%" + groupname + "%' or mobile_num='"+mobile+"'";
					else
						cmd = "select * from participants_table where group_name like '%" + groupname + "%' or mobile_num='"+mobile+"' having Provider_name='"+userName+"'";
			
			}			
			resultSet = statement.executeQuery(cmd);
			logger.info(cmd);
			while (resultSet.next()) {
				participants.add(new ParticipantsDetails(resultSet
						.getString("participants_id"), 
						resultSet.getString("id"),
						resultSet
						.getString("fname"),resultSet.getString("username"),
						resultSet.getString("password"),
						resultSet.getString("mobile_num"), resultSet
								.getString("gender"), resultSet
								.getString("city"), resultSet
								.getString("education"),resultSet
								.getString("medical_details"),resultSet
								.getString("time1"),resultSet.getString("time1_am_pm"), resultSet.getString("time2"),
								resultSet.getString("time2_am_pm"),
								resultSet.getString("time3"),
								resultSet.getString("time3_am_pm"),
								resultSet.getString("startdate"),
								resultSet.getString("Provider_name"),
								resultSet.getString("group_name"), resultSet
								.getString("age"), resultSet
								.getString("date_of_join"), resultSet
								.getString("email_id"), resultSet
								.getString("created_by"),resultSet.getString("message")));
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
		return participants;

	}

	public List<ParticipantsDetails> getParticipants(String participants_id) {
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
		try {
			String cmd = "select * from participants_table where participants_id='"
					+ participants_id + "'";
			resultSet = statement.executeQuery(cmd);
			logger.info(cmd);
			while (resultSet.next()) {
				participants.add(new ParticipantsDetails(resultSet
						.getString("participants_id"), resultSet.getString("id"),resultSet
						.getString("fname"),resultSet.getString("username"),
						resultSet.getString("password"),
						resultSet.getString("mobile_num"), resultSet
								.getString("gender"), resultSet
								.getString("city"), resultSet
								.getString("education"),resultSet
								.getString("medical_details"),resultSet
								.getString("time1"),resultSet.getString("time1_am_pm"), 
								resultSet.getString("time2"),
								resultSet.getString("time2_am_pm"),
								resultSet.getString("time3"),
								resultSet.getString("time3_am_pm"),
								resultSet.getString("startdate"),
								resultSet.getString("Provider_name"),
								resultSet.getString("group_name"), resultSet
								.getString("age"), resultSet
								.getString("date_of_join"), resultSet
								.getString("email_id"), resultSet
								.getString("created_by"),resultSet.getString("message")));
				
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
		return participants;

	}
	
	public String getprovidername(String participantid)
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
			String participants = "";
			try {
				String cmd = "select Provider_name from participants_table where participants_id='"
						+ participantid + "'";
				resultSet = statement.executeQuery(cmd);
				logger.info(cmd);
			if (resultSet.next()) {
					
								participants=resultSet.getString("Provider_name");
									
					
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
			return participants;
	
		}

	

	public HashMap<String, ArrayList<ParticipantsDetails>> getAllParticipants() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		HashMap<String, ArrayList<ParticipantsDetails>> ParticipantsMap = new HashMap<String, ArrayList<ParticipantsDetails>>();
		try {
			String cmd = "select * from participants_table";
			resultSet = statement.executeQuery(cmd);
			logger.info(cmd);
			while (resultSet.next()) {
				ParticipantsDetails p = (new ParticipantsDetails(
						resultSet
						.getString("participants_id"),
						resultSet.getString("id"),
						resultSet
						.getString("fname"),resultSet.getString("username"),
						resultSet.getString("password"),
						resultSet.getString("mobile_num"), resultSet
								.getString("gender"), resultSet
								.getString("city"), resultSet
								.getString("education"),resultSet
								.getString("medical_details"),resultSet
								.getString("time1"),resultSet.getString("time1_am_pm"), 
								resultSet.getString("time2"),
								resultSet.getString("time2_am_pm"),
								resultSet.getString("time3"),
								resultSet.getString("time3_am_pm"),
								resultSet.getString("startdate"),
								resultSet.getString("Provider_name"),
								resultSet.getString("group_name"), resultSet
								.getString("age"), resultSet
								.getString("date_of_join"), resultSet
								.getString("email_id"), resultSet
								.getString("created_by"),resultSet.getString("message")));
				if (ParticipantsMap.containsKey(p.getGroup_name())) {
					ArrayList<ParticipantsDetails> participants = ParticipantsMap
							.get(p.getGroup_name());
					participants.add(p);
					ParticipantsMap.put(p.getGroup_name(), participants);
				} else {
					ParticipantsMap.put(p.getGroup_name(),
							new ArrayList<ParticipantsDetails>());
				}
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
		return ParticipantsMap;
	}

	public List<ParticipantsDetails> getParticipantsbyGroupName(String grname) {
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
		try {
			String cmd = "select * from participants_table where group_name="
					+ grname;
			resultSet = statement.executeQuery(cmd);
			logger.info(cmd);
			while (resultSet.next()) {
				ParticipantsDetails p = (new ParticipantsDetails(
						resultSet
						.getString("participants_id"), 
						resultSet.getString("id"),
						resultSet
						.getString("fname"),resultSet.getString("username"),
						resultSet.getString("password"),
						resultSet.getString("mobile_num"), resultSet
								.getString("gender"), resultSet
								.getString("city"), resultSet
								.getString("education"),resultSet
								.getString("medical_details"),resultSet
								.getString("time1"), 
								resultSet.getString("time1_am_pm"),
								resultSet.getString("time2"),
								resultSet.getString("time2_am_pm"),
								resultSet.getString("time3"),
								resultSet.getString("time3_am_pm"),
								resultSet.getString("startdate"),
								resultSet.getString("Provider_name"),
								resultSet.getString("group_name"), resultSet
								.getString("age"), resultSet
								.getString("date_of_join"), resultSet
								.getString("email_id"), resultSet
								.getString("created_by"),resultSet.getString("message")));
				participants.add(p);
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
		return participants;
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
	
	public int getrole()
	{
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet=null;
		int flag=0;
		int role=4;
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
		//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	    try{
	    	String cmd_role="select role from login where username='"+userName+"'";
	    	resultSet=statement.executeQuery(cmd_role);
	    	resultSet.next();
	    	role=Integer.parseInt(resultSet.getString("role"));
	    	flag=1;
	    	//System.out.println(role);
	    	 
	 }
	    catch(Exception e){
	    	logger.info(e.toString());
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    	flag=0;
	    	//return 0;
	    }finally{
	     	releaseStatement(statement);
	    	releaseConnection(con);	    
	    	
	    }
	    if(flag==1)
    		return role;
    	else
    		return 4;
	
	}
	public String getparticipantid()
	{
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet=null;
		int flag=0;
		String p_id="";
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
		//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	    try{
	    	String cmd_role="select participants_id from participants_table where username='"+userName+"'";
	    	resultSet=statement.executeQuery(cmd_role);
	    	resultSet.next();
	    	p_id=resultSet.getString("participants_id");
	    	flag=1;
	    	//System.out.println(p_id);
	    	 
	 }
	    catch(Exception e){
	    	logger.info(e.toString());
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    	flag=0;
	    	//return 0;
	    }finally{
	     	releaseStatement(statement);
	    	releaseConnection(con);	    
	    	
	    }
	    if(flag==1)
    		return p_id;
    	else
    		return "65";
	
	}
	
	
	public  int checkuser(String admin_username,int from,String participantid)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int flag=0;
		//List<AdminUser> adminuser = new ArrayList<AdminUser>();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try{
	    	int enabled=1;
	    	int updateemail=1;
	    	String cmd_userlist="";
	    	if(from==0)	   
	      cmd_userlist="Select count(*) as counting from login where username='"+admin_username+"'";
	    	else if(from==1)
	    		cmd_userlist="Select count(*) as counting from login where username='"+admin_username+"'";
	    	 resultSet=statement.executeQuery(cmd_userlist);
	          resultSet.next();
	          int count=Integer.parseInt(resultSet.getString("counting"));
	         // System.out.println(count);
	         if(count>0)
	          {
	        	  return 0;
	          }
	          else
	          {
	              return 1;
	          }
	 }
	    catch(Exception e){
	    	logger.info(e.toString());
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    	flag=0;
	    	
	    	return 0;
	    }finally{
	     	releaseStatement(statement);
	    	releaseConnection(con);	    
	    	
	   }
	    
	}

	public  int checkmobile(String admin_mobile,int from,String participantid)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int flag=0;
		//List<AdminUser> adminuser = new ArrayList<AdminUser>();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try{
	    	int enabled=1;
	    	int updateemail=1;
	    	String cmd_mobilelist="";
	    	if(from==0)	   
	    		cmd_mobilelist ="Select count(*) as counting from participants_table where mobile_num='"+admin_mobile+"'";
	    	else if(from==1)
	    		cmd_mobilelist="Select count(*) as counting from participants_table where mobile_num='"+admin_mobile+"' and participants_id!='"+participantid+"'";
		 	    
	    	resultSet=statement.executeQuery(cmd_mobilelist);
	          resultSet.next();
	          int count=Integer.parseInt(resultSet.getString("counting"));
	          //System.out.println(count);
	         if(count>0)
	          {
	        	  return 0;
	          }
	          else
	          {
	              return 1;
	          }
	 }
	    catch(Exception e){
	    	logger.info(e.toString());
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    	flag=0;
	    	
	    	return 0;
	    }finally{
	     	releaseStatement(statement);
	    	releaseConnection(con);	    
	    	
	    }
	    
	}

	
	
	public int insertWeeklylog()
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
			System.out.println("YES!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			String cmd_getpartid="select max(participants_id) as pid from participants_table";
				String pid="";
			resultSet=statement.executeQuery(cmd_getpartid);
			if(resultSet.next())
			{
				pid=resultSet.getString("pid");
			}
			System.out.println(pid);
			String cmd;
			int days=7;
			for(int i=1;i<=12;i++)
			{
				
				cmd="insert into weekly_logs(participant_id,week,date_time,continous,count,status) values('"+pid+"','"+i+"',DATE_ADD(NOW(), INTERVAL '"+days+"' DAY),'0','0','0')";
				statement.execute(cmd);
				days=days+7;
				
			}
			
			
			
			
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());
			
		}
		return 0;
		
	}
	
	
	
	

}
