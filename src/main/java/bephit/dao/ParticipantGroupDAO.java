package bephit.dao;

import java.sql.Connection;

import org.jboss.logging.LoggerProvider;
import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

//import ch.qos.logback.classic.Logger;

import bephit.forms.ParticipantsGroupForm;
import bephit.model.ParticipantGroups;
import bephit.model.ParticipantsDetails;
import bephit.model.UserProfile;

public class ParticipantGroupDAO {
	protected static Logger logger = org.slf4j.LoggerFactory.getLogger("Insert into log table");

	private DataSource dataSource;
	 
		public void setDataSource(DataSource dataSource) {
			this.dataSource = dataSource;
		}
		
		public  List<String> getGroups(String providername)
		{
			Connection con = null;
			Statement statement = null;
			ResultSet resultSet = null;
			int flag=0;
			List<String> participantgroup = new ArrayList<String>();
			try {
				con = dataSource.getConnection();
				statement = con.createStatement();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
		    try{
		    	int enabled=1;
		    	int updateemail=1;
		      String cmd_groupslist="select * from participant_group_table where created_by='"+providername+"'";
	       
	          logger.info(cmd_groupslist);
				resultSet=statement.executeQuery(cmd_groupslist);
	          while(resultSet.next())
	          {
	        	  
	          participantgroup.add(resultSet.getString("group_name"));
	          
	          }
	         
	           
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
		    	//if(flag==1)
		    		//return 1;
		    	//else
		    		//return 0;
		    }
		    return participantgroup;
		}
		
		
		public  List<String> getparticipantGroups(String participantid)
		{
			Connection con = null;
			Statement statement = null;
			ResultSet resultSet = null;
			int flag=0;
			List<String> participantgroup = new ArrayList<String>();
			try {
				con = dataSource.getConnection();
				statement = con.createStatement();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
		    try{
		    	int enabled=1;
		    	int updateemail=1;
		      String cmd_groupslist="select * from participant_group where participant_id='"+participantid+"'";
		      logger.info(cmd_groupslist);		      
				resultSet=statement.executeQuery(cmd_groupslist);
	          while(resultSet.next())
	          {
	        	  
	          participantgroup.add(resultSet.getString("group_name"));
	          
	          }
	         
	           
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
		    	//if(flag==1)
		    		//return 1;
		    	//else
		    		//return 0;
		    }
		    return participantgroup;
		}
		
		
		
	public int setParticipantGroup(ParticipantGroups pgroups)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int flag=0;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
		  userDetails = (UserDetails) principal;
		}
		String userName1 = userDetails.getUsername();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	    try{
	    	
	    	//String cmd="INSERT INTO users(`FULLNAME`,`USERNAME`,`PASSWORD`,`ENABLED`,`EMAIL`,`PROFILE_IMAGE`,`UPDATEBYEMAIL`) VALUES('"+user.getFullName()+"','"+user.getUsername()+"','"+user.getPassword()+"','"+enabled+"','"+user.getEmail()+"','empty','"+updateemail+"')";
          String cmd_pgroups="INSERT INTO `participant_group_table`(`group_name`,`group_decs`,created_by) VALUES('"+pgroups.getgroup_name()+"','"+pgroups.getgroup_decs()+"','"+userName1+"')";
          logger.info(cmd_pgroups);
		  statement.execute(cmd_pgroups);
			
			String Desc="added Groups"+pgroups.getgroup_name();
			flag=1;
	 }
	    catch(Exception e){
	    	logger.info(e.toString());
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    	flag=0;
	     }finally{
	     	releaseStatement(statement);
	    	releaseConnection(con);	    
	    	
	    }
	    if(flag==1)
    		return 1;
    	else
    		return 0;
	    
	}
	
	
	public int deleteParticipantgroup(String group_id,String admin)
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
		//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	    try{
	    	int enabled=1;
	    	int updateemail=1;
	    	int local_age;
	    List<String> participant_id=new ArrayList<String>();
	    
	    	/*if(Integer.parseInt(pgroups.getgroup_scope())==0)
	    	local_age=0;
	    	else
	    		local_age=Integer.parseInt(pgroups.getlocal_age());*/
	    	 //System.out.println(dateFormat.format(date));
	    	//String cmd="INSERT INTO users(`FULLNAME`,`USERNAME`,`PASSWORD`,`ENABLED`,`EMAIL`,`PROFILE_IMAGE`,`UPDATEBYEMAIL`) VALUES('"+user.getFullName()+"','"+user.getUsername()+"','"+user.getPassword()+"','"+enabled+"','"+user.getEmail()+"','empty','"+updateemail+"')";
        resultSet=statement.executeQuery("select participant_id from participant_group where group_id='"+group_id+"'");
	    while(resultSet.next())
	    {
	    participant_id.add(resultSet.getString("participant_id"));
	    }
	    for(String participantid:participant_id)
	    {
	    	statement.execute("delete from participant_message_log where Participant_id='"+participantid+"'");
	    	statement.execute("UPDATE participants_table SET group_name ='' WHERE participants_id='"+participantid+"'");
	    	logger.info("delete from participant_message_log where Participant_id='"+participantid+"'");
	    }
	    statement.execute("delete from participant_group where group_id='"+group_id+"'");
	    statement.execute("delete from  broad_cast_table where group_id='"+group_id+"'");
	   
	    	String cmd_pgroups="delete from participant_group_table where group_id='"+group_id+"'";
       //  statement.executeUpdate("delete from participant_group_table where group_id='"+group_id+"'");
          logger.info(cmd_pgroups);
			statement.execute(cmd_pgroups);
			/*String Desc="Deleted Groups"+pgroups.getgroup_name();*/
			flag=1;
	 }
	    catch(Exception e){
	    	logger.info(e.toString());
	    	
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    	flag=0;
	     }finally{
	     	releaseStatement(statement);
	    	releaseConnection(con);	    
	    	
	    }
	    if(flag==1)
    		return 1;
    	else
    		return 0;
	}
	
	
	
	
	
	public  List<ParticipantGroups> getGroups()
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
		 
		
		List<ParticipantGroups> participantgroup = new ArrayList<ParticipantGroups>();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	    try{
	    	int enabled=1;
	    	int updateemail=1;
	    	String cmd_groupslist="";
          if(userName.equals("superadmin"))
	      cmd_groupslist="Select * from `participant_group_table`";
          else
        	    cmd_groupslist="Select * from `participant_group_table` where created_by='"+userName+"'";
       
          logger.info(cmd_groupslist);
			resultSet=statement.executeQuery(cmd_groupslist);
          while(resultSet.next())
          {
        	  
          participantgroup.add(new ParticipantGroups(resultSet.getString("group_id"),resultSet.getString("group_name"),resultSet.getString("group_decs"),resultSet.getString("created_by")));
          
          }
           
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
	    	//if(flag==1)
	    		//return 1;
	    	//else
	    		//return 0;
	    }
	    return participantgroup;
	}
	
	public  List<ParticipantGroups> getAllGroups()
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int flag=0;
		String userName;
		/*Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();*/		
	/*	UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
		  userDetails = (UserDetails) principal;
		  
		}
		 userName = userDetails.getUsername();
		 */
		
		List<ParticipantGroups> participantgroup = new ArrayList<ParticipantGroups>();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	    try{
	    	int enabled=1;
	    	int updateemail=1;
	    	String cmd_groupslist="";
          /*if(userName.equals("superadmin"))*/
	      cmd_groupslist="Select * from `participant_group_table`";
         /* else
        	    cmd_groupslist="Select * from `participant_group_table`";
            */
	      logger.info(cmd_groupslist);
          
			resultSet=statement.executeQuery(cmd_groupslist);
          while(resultSet.next())
          {
        	  
          participantgroup.add(new ParticipantGroups(resultSet.getString("group_id"),resultSet.getString("group_name"),resultSet.getString("group_decs"),resultSet.getString("created_by")));
          
          }
           
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
	    	//if(flag==1)
	    		//return 1;
	    	//else
	    		//return 0;
	    }
	    return participantgroup;
	}
	
	
	
	
	public  List<ParticipantGroups> getGroupsbyprovider(String provider)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int flag=0;
		String userName;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();		
		
		List<ParticipantGroups> participantgroup = new ArrayList<ParticipantGroups>();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	    try{
	    	int enabled=1;
	    	int updateemail=1;
	    	String cmd_groupslist="";
        
        	    cmd_groupslist="Select * from `participant_group_table` where created_by='"+provider+"'";
            logger.info(cmd_groupslist);
         
			resultSet=statement.executeQuery(cmd_groupslist);
          while(resultSet.next())
          {
        	  
          participantgroup.add(new ParticipantGroups(resultSet.getString("group_id"),resultSet.getString("group_name"),resultSet.getString("group_decs"),resultSet.getString("created_by")));
          
          }
           
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
	    	//if(flag==1)
	    		//return 1;
	    	//else
	    		//return 0;
	    }
	    return participantgroup;
	}
	public  List<ParticipantGroups> getparticularGroups(String id)
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
		   //userName="suresh";
		}
		userName = userDetails.getUsername();
		 
		/*else
		   userName="suresh";	*/
		
		List<ParticipantGroups> participantgroup = new ArrayList<ParticipantGroups>();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	    try{
	    	int enabled=1;
	    	int updateemail=1;
	    	String cmd_groupslist="";
 if(userName.equals("superadmin"))
 {
	      cmd_groupslist="Select * from `participant_group_table` where group_id='"+id+"'";
 }
 else
 {
	   cmd_groupslist="Select * from `participant_group_table` where created_by='"+userName+"' and group_id='"+id+"'";
 
 }
 logger.info(cmd_groupslist);
         
			resultSet=statement.executeQuery(cmd_groupslist);
          while(resultSet.next())
          {
        	  
          participantgroup.add(new ParticipantGroups(resultSet.getString("group_id"),resultSet.getString("group_name"),resultSet.getString("group_decs"),resultSet.getString("created_by")));
          
          }
           
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
	    	//if(flag==1)
	    		//return 1;
	    	//else
	    		//return 0;
	    }
	    return participantgroup;
	}
	
	public  int checkGroupname(String pgroups)
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
		List<ParticipantGroups> participantgroup = new ArrayList<ParticipantGroups>();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try{
	    	int enabled=1;
	    	int updateemail=1;
	    	String cmd_groupslist="";
	    	if(userName.equals("superadmin"))
	    	  	  cmd_groupslist="Select count(*) as counting from `participant_group_table` where group_name='"+pgroups+"'";
	  	    else
	    	      cmd_groupslist="Select count(*) as counting from `participant_group_table` where group_name='"+pgroups+"'";
	      
	    	logger.info( cmd_groupslist);
	    	resultSet=statement.executeQuery(cmd_groupslist);
          resultSet.next();
          int count=Integer.parseInt(resultSet.getString("counting"));
          
       
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
	
	
	public  String getGroupName(String group_id)
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
	//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	String  groupname ="";   
	try{
		   
	     //String cmd_group="select group_name from `participant_group_table` where group_id='"+group_id+"'";
	          //System.out.println(cmd_group);
		
	          resultSet=statement.executeQuery("select group_name from participant_group_table where group_id='"+group_id+"'");
	          if(resultSet.next())
	          {
	         groupname=resultSet.getString("group_name");
	       
	          }
	          logger.info(groupname);
	          
	           
	}
	   catch(Exception e){
		   logger.info(e.toString());
	   	releaseStatement(statement);
	   	releaseConnection(con);
	   
	   	//return 0;
	   }finally{
	    releaseStatement(statement);
	   	releaseConnection(con);	   
	   	//if(flag==1)
	   	//return 1;
	   	//else
	   	//return 0;
	   }
	   return groupname;
	}
	
	public List<ParticipantGroups> getlimitedParticipants_group(int page) {
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
		List<ParticipantGroups> participantgroup = new ArrayList<ParticipantGroups>();
		try {

			String cmd;
			int offset = 20 * (page - 1);
			int limit = 20;
			if(userName.equals("superadmin"))
				cmd="select * from participant_group_table  order by group_name asc limit " + offset + ","+ limit+"";
			else
			cmd = "select * from participant_group_table where created_by='"+userName+"' order by group_name asc limit " + offset + ","+ limit+" " ;
			logger.info(cmd);
			resultSet = statement.executeQuery(cmd);
			while (resultSet.next()) {
				  participantgroup.add(new ParticipantGroups(resultSet.getString("group_id"),resultSet.getString("group_name"),resultSet.getString("group_decs"),resultSet.getString("created_by")));
			        
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
		return participantgroup;

	}

	public int getnoofParticipants_group() {
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
		List<ParticipantGroups> participantgroup = new ArrayList<ParticipantGroups>();
		try {

			String cmd;
			if(userName.equals("superadmin"))
			cmd = "select count(*) as noofrecords from participant_group_table";
			else
				cmd = "select count(*) as noofrecords from participant_group_table where created_by='"+userName+"'";
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
