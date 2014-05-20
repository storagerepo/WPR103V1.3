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

import bephit.model.ParticipantGroups;
import bephit.model.ParticipantsDetails;
import bephit.model.UserProfile;;

public class UserDAO {
	private DataSource dataSource;
	 
		public void setDataSource(DataSource dataSource) {
			this.dataSource = dataSource;
		}
	
		
		
		public  int checkUsername(String user)
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
			try{
		    	int enabled=1;
		    	int updateemail=1;
		      String cmd_userlist="Select count(*) as counting from `deemsyspro_deem`.`users` where username='"+user+"'";
	          System.out.println(cmd_userlist);
		      resultSet=statement.executeQuery(cmd_userlist);
	          resultSet.next();
	          int count=Integer.parseInt(resultSet.getString("counting"));
	          System.out.println(count);
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
		    	System.out.println(e.toString());
		    	releaseStatement(statement);
		    	releaseConnection(con);
		    	return 0;
		    }finally{
		     	releaseStatement(statement);
		    	releaseConnection(con);	    
		    	
		    }
		    
		}
		
		
		
		
		
		
	public int setUser(UserProfile user)
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
	    	 //System.out.println(dateFormat.format(date));
	    	String cmd="INSERT INTO users(`FULLNAME`,`USERNAME`,`PASSWORD`,`ENABLED`,`EMAIL`,`PROFILE_IMAGE`,`UPDATEBYEMAIL`) VALUES('"+user.getFullName()+"','"+user.getUsername()+"','"+user.getPassword()+"','"+enabled+"','"+user.getEmail()+"','empty','"+updateemail+"')";
	    	
	    	statement.execute(cmd);
	    	resultSet=statement.executeQuery("select max(user_id) as maxuser from users");
	    	resultSet.next();
	    	
	    	
	    	
	    	
            String cmd_roles="INSERT INTO `deemspro_deem`.`user_roles`(`USER_ID`,`AUTHORITY`) VALUES('"+resultSet.getString("maxuser")+"','ROLE_USER')";
	    	System.out.println(cmd);
	    	System.out.println(cmd_roles);
			statement.execute(cmd_roles);
			flag=1;
	 }
	    catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    	flag=0;
	    	//return 0;
	    }finally{
	     	releaseStatement(statement);
	    	releaseConnection(con);	    
	    	releaseResultSet(resultSet);
	    }
	    	if(flag==1)
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
