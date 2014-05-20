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

import bephit.model.Response;;

public class ResponseDAO {
	private DataSource dataSource;
	protected static Logger logger=org.slf4j.LoggerFactory.getLogger("logs");

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	
	public List<Response> getResponse(String participant_id) {

		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Response> response = new ArrayList<Response>();

		try
		{
			resultSet = statement.
					executeQuery("select * from weekly_logs where participant_id='"+participant_id+"' and status=1");
			logger.info("select * from weekly_logs");
			while (resultSet.next()) {
				
						response.add(new Response(resultSet.getString("log_id"), resultSet.getString("participant_id"),resultSet.getString("week"),resultSet.getString("date_time"), resultSet.getString("continous"), resultSet.getString("count"),resultSet.getString("status")));
			
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

		return response;
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
