package bephit.dao;

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

import bephit.model.MailTemplateDetails;
import bephit.model.TextMsgSettings;
import bephit.model.UpdatePwd;

public class MailTemplateDAO {
	private DataSource dataSource;
	protected static Logger logger=org.slf4j.LoggerFactory.getLogger("logs");
			

	
	
	
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}


	
	
	
	public int insertMailTempplate(MailTemplateDetails mailTemplateDetails) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int flag = 0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd = "insert into mail_template(mail_template_name,mail_subject,from_name,from_mail,replay_mail,smtp_servername,port,username,password,message) values('"
					+ mailTemplateDetails.getMail_template_name()
					+ "','"
					+ mailTemplateDetails.getMail_subject()
					+ "','"
					+ mailTemplateDetails.getFrom_name()
					+ "','"
					+ mailTemplateDetails.getFrom_mail()
					+ "','"
					+ mailTemplateDetails.getReplay_mail()
					+ "','"
					+ mailTemplateDetails.getSmtp_servername()
					+ "','"
					+ mailTemplateDetails.getPort()
					+ "','"
					+ mailTemplateDetails.getUsername()
					+ "','"
					+ mailTemplateDetails.getPassword()
					+ "','"
					+ mailTemplateDetails.getMessage() + "')";
			
			logger.info(cmd);
			statement.execute(cmd);
			flag = 1;
		} catch (Exception e) {
			logger.info(e.toString());
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

	public List<MailTemplateDetails> getTemplates() {
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
		List<MailTemplateDetails> maiList = new ArrayList<MailTemplateDetails>();
		try {
			resultSet = statement.executeQuery("select * from mail_template");
			while (resultSet.next()) {
				maiList.add(new MailTemplateDetails(resultSet
						.getString("mail_template_name"), resultSet
						.getString("mail_subject"), resultSet
						.getString("from_name"), resultSet
						.getString("from_mail"), resultSet
						.getString("replay_mail"), resultSet
						.getString("smtp_servername"), resultSet
						.getString("port"), resultSet.getString("username"),
						resultSet.getString("password"), resultSet
								.getString("message")));
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
		return maiList;
	}
public List<TextMsgSettings> getMsgSettings(){
	Connection con = null;
	Statement statement = null;
	ResultSet resultSet = null;
	try {
		con = dataSource.getConnection();
		statement = con.createStatement();
	} catch (SQLException e1) {
		e1.printStackTrace();
	}
	List<TextMsgSettings> txtList=new ArrayList<TextMsgSettings>();
	try {
		resultSet = statement.executeQuery("select * from text_msg_api order by msg_id desc");
		while(resultSet.next()){
			txtList.add(new TextMsgSettings(resultSet.getString("account_sid"),resultSet.getString("auth_token"),resultSet.getString("mob_num")));
		}
		
	} catch (Exception e) {
		releaseResultSet(resultSet);
    	releaseStatement(statement);
    	releaseConnection(con);
    	}
	finally{
    	releaseResultSet(resultSet);
    	releaseStatement(statement);
    	releaseConnection(con);	    	
    }
   
	return txtList;
}
public String getCurrentPwd(){
	String userpwd="";
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
	try {
		String cmd="select password  from login where  username ='"+ userName +"'";
		
		resultSet=statement.executeQuery(cmd);
		resultSet.next();
		
	userpwd=resultSet.getString("password");
	
	}
	catch (Exception e) {
		logger.info(e.toString());
		releaseResultSet(resultSet);
    	releaseStatement(statement);
    	releaseConnection(con);
    	}
	finally{
    	releaseResultSet(resultSet);
    	releaseStatement(statement);
    	releaseConnection(con);	    	
    }
	return userpwd;
		
	
}
public int updateoldPwd(UpdatePwd updatePwds){
	Connection con = null;
	Statement statement = null;
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
		String cmd="update admin_log_table set admin_password='" + updatePwds.getNew_pwd() + "' where admin_username ='" + userName + "' ";
		String cmd_login="update login set password='" + updatePwds.getNew_pwd() + "' where username='"+userName+"'";
		String cmd1="update participants_table set password='" + updatePwds.getNew_pwd() + "' where username='" + userName + "' ";
		logger.info(cmd);
		statement.execute(cmd);
		statement.execute(cmd_login);
		statement.execute(cmd1);
		flag=1;
	} catch (Exception e) {
		logger.info(e.toString());
		releaseStatement(statement);
		releaseConnection(con);
		flag = 0;
		}
	finally {
		releaseStatement(statement);
		releaseConnection(con);

	}
	if (flag == 1)
		return 1;
	else
		return 0;
}
public int updateMsgSettings(TextMsgSettings tMsgSettings){
	Connection con = null;
	Statement statement = null;
	int flag = 0;
	try {
		con = dataSource.getConnection();
		statement = con.createStatement();
	} catch (SQLException e1) {
		e1.printStackTrace();
	}
	try {
		String cmd="update text_msg_api set account_sid='" + tMsgSettings.getAccount_sid() + "', auth_token='" + tMsgSettings.getAuth_token() + "', mob_num='" + tMsgSettings.getMob_num() +"';";
		logger.info(cmd);
	statement.execute(cmd);
flag=1;
	} catch (Exception e) {
		logger.info(e.toString());
		releaseStatement(statement);
		releaseConnection(con);
		flag = 0;
		}
	finally {
		releaseStatement(statement);
		releaseConnection(con);

	}
	if (flag == 1)
		return 1;
	else
		return 0;

}
	
	@Override
public String toString() {
	return "MailTemplateDAO []";
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
