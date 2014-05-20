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
import java.util.Random;
import java.security.SecureRandom;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import com.mysql.jdbc.PreparedStatement;

import bephit.controllers.MainController;
import bephit.model.AdminUser;
import bephit.model.EmailSender;
import bephit.model.ParticipantGroups;
import bephit.model.StreamDetails;
import bephit.model.TwilioSMS;

public class AdminUserDAO {
	
	@Autowired
	EmailSender emailSender;
	
	 @Autowired  
		TwilioSMS messageSender;
	
	 private static final Logger logger = LoggerFactory.getLogger(MainController.class); //Logger
		
	
	private DataSource dataSource;
	
	 private static final Random RANDOM = new SecureRandom();

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public int setAdminUser(AdminUser adminuser,String admin_id)
	{
		Connection con = null;
		Statement statement = null;		 
		ResultSet resultSet = null;
		int merror=0;
		/*Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
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
		try
		{
			 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			 Date date = new Date();
			 
			 //Generate random password
			 
			 String letters = "abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ23456789";

		      String pw = "";
		      int PASSWORD_LENGTH=6;
			for (int i=0; i<PASSWORD_LENGTH; i++)
		      {
		          int index = (int)(RANDOM.nextDouble()*letters.length());
		          pw += letters.substring(index, index+1);
		      }
		     
			//System.out.println("Password:"+pw);
			 
			 
			 
			 //end generate random password
			 
			 
			 
			 
			 
	String cmd="INSERT INTO admin_log_table(admin_firstname,admin_username,admin_password,admin_mobile,admin_email,secondary_email,date,status) VALUES('"+adminuser.getAdmin_firstname()+"','"+adminuser.getAdmin_username()+"','"+pw+"','"+adminuser.getAdmin_mobile()+"','"+adminuser.getAdmin_email()+"','"+adminuser.getSecondary_email()+"','"+dateFormat.format(date)+"',0)";
	String cmd_login="insert into login(username,password,email_id,secondary_email,role,status) values('"+adminuser.getAdmin_username()+"','"+pw+"','"+adminuser.getAdmin_email()+"','"+adminuser.getSecondary_email()+"',1,0)";
	String cmd_getid="SELECT LAST_INSERT_ID() as lastid";
	logger.info(cmd);	
	statement.execute(cmd);
	statement.execute(cmd_login);
	/*String Desc="added adminuser";*/
	/*String cmd_activity="insert into admin_log_activity_table(admin_id,ip_address,admin_date_time,admin_desc,done_by) values('"+admin_id+"','127.0.0.1','"+dateFormat.format(date)+"','"+Desc+"','"+admin_id+"')";
	System.out.println(cmd_activity);*/
	resultSet=statement.executeQuery(cmd_getid);
	resultSet.next();
	int lastinsertedid=Integer.parseInt(resultSet.getString("lastid"));
	String cmd_role="insert into user_roles(user_id,authority) values('"+lastinsertedid+"','ROLE_USER')";
	statement.execute(cmd_role);	
	//Send password
	
	//System.out.println(adminuser.getAdmin_email());
	//System.out.println("fname:"+adminuser.getAdmin_firstname());
	//System.out.println("uname:"+adminuser.getAdmin_username());
	//System.out.println("password:"+adminuser.getAdmin_password());
	//System.out.println("password:"+pw);
	
	logger.info("--Before Sending--"); //Logger Test
    //Email Test
    emailSender.password_sendEmail(adminuser.getAdmin_email(),"adherencemedicationproject@gmail.com","Adherence Project Registration",adminuser.getAdmin_firstname(),adminuser.getAdmin_username(),pw);
    System.out.println("secondaryemail"+adminuser.getSecondary_email());
    emailSender.password_sendEmail(adminuser.getSecondary_email(),"adherencemedicationproject@gmail.com","Adherence Project Registration",adminuser.getAdmin_firstname(),adminuser.getAdmin_username(),pw);
    logger.info("--After Sent--");
    
  /*  model.addAttribute("success","true");
   */
    /*  model.addAttribute("success","true");
     */ 
   
    try{
    	  String body="Welcome to the adherence project!  Your UserID is '"+adminuser.getAdmin_username()+"' and Your Password is '"+pw+"'.";
    	 
      	messageSender.sendSMS(adminuser.getAdmin_mobile(), "Adherence Project Password :"+body);
     }catch(Exception e){e.printStackTrace();
     merror=1;
     
     }
    
	//End Send Passwordlcvbnm,./,nbvcc                                                                                                                                                                  
		}
		catch(Exception ex)
		{
			logger.info(ex.toString());
			//System.out.println(ex.toString());
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
	
	public int setPermission_adminUser(String admin_id,String Status)
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
			 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			 Date date = new Date();		 
			 
			 
	String cmd="Update admin_log_table set status='"+Status+"' where admin_id='"+admin_id+"'";
	String cmd_getusername="select admin_username from admin_log_table where admin_id='"+admin_id+"'";
	resultSet=statement.executeQuery(cmd_getusername);
	
	resultSet.next();
	
	String cmd_update_status_login="Update login set status='"+Status+"' where username='"+resultSet.getString("admin_username")+"'";
	statement.execute(cmd_update_status_login);
	
	logger.info(cmd);

	statement.executeUpdate(cmd);
	
	
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
	
	
	public  int checkemail(String admin_email)
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
	    
	      String cmd_emaillist="Select count(*) as counting from  login where email_id='"+admin_email+"'";
          resultSet=statement.executeQuery(cmd_emaillist);
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
	
	
	public  int checkmobile(String admin_mobile,int from,String admin_id)
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
	    	{
	    	 cmd_mobilelist="Select count(*) as counting from `admin_log_table` where admin_mobile='"+admin_mobile+"'";
	    	}
	    	else if(from==1)
	    	{
	    	 cmd_mobilelist="Select count(*) as counting from `admin_log_table` where admin_mobile='"+admin_mobile+"' and admin_id!='"+admin_id+"'";
	    	}
	   
	      
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
	
	public List<AdminUser> getAdminUser() {

		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<AdminUser> adminuser = new ArrayList<AdminUser>();

		try
		{
			resultSet = statement.
					executeQuery("select * from admin_log_table order by admin_firstname asc");
			while (resultSet.next()) {
				adminuser.add(new AdminUser(resultSet.getString("admin_id"),
						resultSet.getString("admin_firstname"),
						resultSet.getString("admin_username"),
						resultSet.getString("admin_password"), 						
						resultSet.getString("admin_email"), 
						resultSet.getString("secondary_email"),
						resultSet.getString("admin_mobile"),
						resultSet.getString("date"),
						 resultSet.getString("status")
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

		return adminuser;
	}
	
	
	
	
	//get particular user
	
	
	public String get_pname(String admin_id) {

		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		String adminuser="";

		try
		{
			
			resultSet = statement.
					executeQuery("select * from admin_log_table where admin_id='"+admin_id+"'");
			
			logger.info("select * from admin_log_table where admin_id='"+admin_id+"'");
			while (resultSet.next()) {
				adminuser=resultSet.getString("admin_username");
			
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

		return adminuser;
	}
	public List<AdminUser> getAdminUser(String admin_id) {

		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<AdminUser> adminuser = new ArrayList<AdminUser>();

		try
		{
			resultSet = statement.
					executeQuery("select * from admin_log_table where admin_id='"+admin_id+"'");
			
			logger.info("select * from admin_log_table where admin_id='"+admin_id+"'");
			while (resultSet.next()) {
				adminuser.add(new AdminUser(resultSet.getString("admin_id"),
						resultSet.getString("admin_firstname"),
						resultSet.getString("admin_username"), resultSet
								.getString("admin_password"), resultSet
								.getString("admin_email"),resultSet.getString("secondary_email"), resultSet
								.getString("admin_mobile"),resultSet
								.getString("date"), resultSet
								.getString("status")
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

		return adminuser;
	}
	
	
	
	
	public int deleteAdminUser(String admin_id, String adminuser) {

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
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			 Date date = new Date();
			 String adminusername="";
			String cmd_getadmin_name="select admin_username from admin_log_table where admin_id='"+admin_id+"'";
			String Desc="Delete adminuser";
			resultSet=statement.executeQuery(cmd_getadmin_name);
			while(resultSet.next())
			{
				adminusername=resultSet.getString("admin_username");
			}			
			String login_id="",user_id="select login_id from login where username='"+adminusername+"'";
			logger.info(user_id);
			ResultSet resultset1=statement.executeQuery(user_id);
			while(resultset1.next())
			{
				login_id=resultset1.getString("login_id");
			}
			String userroles="delete from user_roles where USER_ID='"+login_id+"'";
			logger.info(userroles);
			String login="delete from login where username='"+adminusername+"'";
			logger.info(login);		
		
			statement.execute("delete from user_roles where USER_ID='"+login_id+"'");
			
			statement.execute("delete from login where username='"+adminusername+"'");
			
			statement.execute("delete from admin_log_table where admin_id='"+admin_id+"'");
			
			
			flag=1;
		/*	if(resultSet.next())*/
			/*	Desc=Desc+adminusername;
			statement.execute("delete from admin_log_table where admin_id='"+admin_id+"'");
			*/
			
		/*} */
		}
		catch (Exception ex) 
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
	
	public List<String> getpariticpantidby_pname(String admin_username) {

		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> adminuser = new ArrayList<String>();

		try
		{
			
			resultSet = statement.
					executeQuery("select participants_id from participants_table where Provider_name='"+admin_username+"'");
			
			logger.info("select participants_id from participants_table where Provider_name='"+admin_username+"'");
			while (resultSet.next()) {
				adminuser.add(resultSet.getString("participants_id"));
			
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

		return adminuser;
	}
	
	
	public List<AdminUser> getAdminUserby_username(String admin_username) {

		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<AdminUser> adminuser = new ArrayList<AdminUser>();

		try
		{
			resultSet = statement.
					executeQuery("select * from admin_log_table where admin_username='"+admin_username+"'");
			
			logger.info("select * from admin_log_table where admin_username='"+admin_username+"'");
			while (resultSet.next()) {
				adminuser.add(new AdminUser(resultSet.getString("admin_id"),
						resultSet.getString("admin_firstname"),
						resultSet.getString("admin_username"), resultSet
								.getString("admin_password"), resultSet
								.getString("admin_email"), resultSet.getString("secondary_email"),resultSet
								.getString("admin_mobile"), resultSet
								.getString("date"), resultSet
								.getString("status")
								
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

		return adminuser;
	}
	
	public List<AdminUser> getlimitedadminuser(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<AdminUser> adminuser = new ArrayList<AdminUser>();
		try {

			String cmd;
			int offset = 20 * (page - 1);
			int limit = 20;
			
				
					cmd = "select * from admin_log_table order by admin_firstname asc limit " + offset + ","+ limit+"" ;
							
				logger.info(cmd);
			resultSet = statement.executeQuery(cmd);
			while (resultSet.next()) {
				adminuser.add(new AdminUser(resultSet.getString("admin_id"),
						resultSet.getString("admin_firstname"),
						resultSet.getString("admin_username"), resultSet
								.getString("admin_password"), resultSet
								.getString("admin_email"),resultSet.getString("secondary_email"), resultSet
								.getString("admin_mobile"), resultSet
								.getString("date"), resultSet
								.getString("status")
								
								));
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
		return adminuser;

	}
	public int getnoofadminuser() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int noofRecords = 0;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<AdminUser> adminuser = new ArrayList<AdminUser>();
		try {

			String cmd;
			
					cmd = "select count(*) as noofrecords from admin_log_table";
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
	
	
	
	
	public int updateAdminUser(AdminUser adminuser,String admin_id)
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
		String userName = userDetails.getUsername();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try
		{
			
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			 Date date = new Date();
			 		 
			String cmd="UPDATE admin_log_table SET admin_firstname='"+adminuser.getAdmin_firstname()+"',admin_username= '"+adminuser.getAdmin_username()+"',admin_password='"+adminuser.getAdmin_password()+"',admin_email='"+adminuser.getAdmin_email()+"',secondary_email='"+adminuser.getSecondary_email()+"',admin_mobile='"+adminuser.getAdmin_mobile()+"' where admin_id='"+adminuser.getAdmin_id()+"'";
			String cmd_login="UPDATE login SET email_id='"+adminuser.getAdmin_email()+"',secondary_email='"+adminuser.getSecondary_email()+"' where username= '"+adminuser.getAdmin_username()+"'";
			statement.execute(cmd);
			statement.execute(cmd_login);
			logger.info(cmd);
           
            /*String Desc="Update adminuser";
            String cmd_activity="insert into admin_log_activity_table(admin_id,ip_address,admin_date_time,admin_desc,done_by) values('"+admin_id+"','127.0.0.1','"+dateFormat.format(date)+"','"+Desc+"','"+userName+"')";
            System.out.println(cmd_activity);
            statement.execute(cmd_activity);*/
            flag=1;
			
		} 
		catch (Exception ex) 
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
	    	//flag=0;
	    	
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



