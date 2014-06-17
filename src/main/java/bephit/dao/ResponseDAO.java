package bephit.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import java.util.Map;
import javax.sql.DataSource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.springframework.web.servlet.view.document.AbstractExcelView;
import org.slf4j.Logger;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import bephit.model.Response;;

public class ResponseDAO extends AbstractExcelView{
	private DataSource dataSource;
	protected static Logger logger=org.slf4j.LoggerFactory.getLogger("logs");

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	@Override
	protected void buildExcelDocument(Map model, HSSFWorkbook workbook ,
			HttpServletRequest request, HttpServletResponse response1)
			throws Exception {
		
		response1.setHeader("Content-Disposition","attachment;filename='"+(String)model.get("title")+"'");
		
		HSSFSheet excelSheet = workbook.createSheet("Weekly_Survey_Report");
		excelSheet.setDefaultColumnWidth(20);
		/*CellStyle style = workbook.createCellStyle(); 
		 Font font = workbook.createFont();
		 style.setFillForegroundColor(HSSFColor.BROWN.index);
	        style.setFillPattern(CellStyle.SOLID_FOREGROUND);
	        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
	        font.setColor(HSSFColor.WHITE.index);
	        style.setFont(font);*/
		
		//Style 1
				CellStyle style = workbook.createCellStyle();
			        Font font = workbook.createFont();
			        font.setFontName("Arial");
			        style.setFillForegroundColor(HSSFColor.BLUE_GREY.index);
			        style.setFillPattern(CellStyle.SOLID_FOREGROUND);
			        style.setWrapText(true);
			        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			        font.setColor(HSSFColor.WHITE.index);
			        style.setFont(font);
				
			    //Style2
			        CellStyle style2 = workbook.createCellStyle();
			        Font font2 = workbook.createFont();
			        font2.setFontName("Arial");
			        style2.setFillForegroundColor(HSSFColor.YELLOW.index);
			        style2.setFillPattern(CellStyle.SOLID_FOREGROUND);
			        style2.setWrapText(true);
			        font2.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			        font2.setColor(HSSFColor.WHITE.index);
			        style2.setFont(font2); 
			        System.out.println("came inside report");

		@SuppressWarnings("unchecked")
		
		List<Response> response2=(List<Response>) model.get("response");
		String[] fields=(String[])model.get("fields");
		
		setExcelHeader(excelSheet,style,fields);
		setExcelRows(excelSheet,response2,fields);
		
	}
	
	//creating header records
	public void setExcelHeader(HSSFSheet excelSheet,CellStyle style,String[] fields)
	{
		HSSFRow excelHeader = excelSheet.createRow(0);
	
		int record = 0;
		
		
			for(String field:fields)
			{
				if (field.equals("participant_id")) 
				{
					
					excelHeader.createCell(record).setCellValue("participant_id");
					excelHeader.getCell(record).setCellStyle(style);
					record++;
					
				}
				else if (field.equals("q1")) {
					excelHeader.createCell(record).setCellValue("q1");
					excelHeader.getCell(record).setCellStyle(style);
					record++;
					
					}
				else if (field.equals("q2")) {
					excelHeader.createCell(record).setCellValue("q2");
					excelHeader.getCell(record).setCellStyle(style);
					record++;
					} 
				else if (field.equals("q3")) {
					excelHeader.createCell(record).setCellValue("q3");
					excelHeader.getCell(record).setCellStyle(style);
					record++;
					}
				else if (field.equals("q4Audio")) {
					excelHeader.createCell(record).setCellValue("q4Audio");
					excelHeader.getCell(record).setCellStyle(style);
					record++;
					}
				
				else if (field.equals("q4Text")) {
					excelHeader.createCell(record).setCellValue("q4Text");
					excelHeader.getCell(record).setCellStyle(style);
					record++;
					}
				else if (field.equals("qm")) {
					excelHeader.createCell(record).setCellValue("qm");
					excelHeader.getCell(record).setCellStyle(style);
					record++;	
				}
				else if (field.equals("qs")) {
					excelHeader.createCell(record).setCellValue("qs");
					excelHeader.getCell(record).setCellStyle(style);
					record++;
					}
				else if (field.equals("startDate")) {
					excelHeader.createCell(record).setCellValue("startDate");
					excelHeader.getCell(record).setCellStyle(style);
					record++;
					}
				else if (field.equals("weekNumber")) {
					excelHeader.createCell(record).setCellValue("weekNumber");
					excelHeader.getCell(record).setCellStyle(style);
					record++;
					}			
				else if (field.equals("modified")) {
					excelHeader.createCell(record).setCellValue("modified");
					excelHeader.getCell(record).setCellStyle(style);
					record++;
					}
				
				else if (field.equals("appmodified")) {
					excelHeader.createCell(record).setCellValue("appmodified");
					excelHeader.getCell(record).setCellStyle(style);
					record++;
					}
			}
		}

	
	//creating cell records
		
	public void setExcelRows(HSSFSheet excelSheet, List<Response> response1,String[] fields){
		int record = 1,c=0;
		
		for (Response response:response1 ){	
			
			HSSFRow excelRow = excelSheet.createRow(record++);
			c=0;
			for(String field:fields)
			{
				if (field.equals("participant_id")) 
				{						
					excelRow.createCell(c++).setCellValue(
							response.getParticipant_id());
				}
				else if (field.equals("q1")) {
					excelRow.createCell(c++).setCellValue(
							response.getQ1());
					}
				else if (field.equals("q2")) {
					excelRow.createCell(c++).setCellValue(
							response.getQ2());
					} 
				else if (field.equals("q3")) {
					excelRow.createCell(c++).setCellValue(
							response.getQ3());
					}
				else if (field.equals("q4Audio")) {
					excelRow.createCell(c++).setCellValue(
							response.getQ4Audio());}
				else if (field.equals("q4Text")) {
					excelRow.createCell(c++).setCellValue(
							response.getQ4Text());}
				else if (field.equals("qm")) {
					excelRow.createCell(c++).setCellValue(
							response.getQm());}
				else if (field.equals("qs")) {
					excelRow.createCell(c++).setCellValue(
							response.getQs());}
				else if (field.equals("startDate")) {
					excelRow.createCell(c++).setCellValue(
							response.getStartDate());}
				else if (field.equals("weekNumber")) {
					excelRow.createCell(c++).setCellValue(
							response.getWeekNumber());}
				else if (field.equals("modified")) {
					excelRow.createCell(c++).setCellValue(
							response.getModified());}
				else if (field.equals("appmodified")) {
					excelRow.createCell(c++).setCellValue(
							response.getAppmodified());}
							}
		}
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
					executeQuery("select * from weekly_answers2 where participant_id='"+participant_id+"'");
			logger.info("select * from weekly_logs");
			while (resultSet.next()) {
				
						response.add(new Response(resultSet.getString("participant_id"),resultSet.getString("q1"),resultSet.getString("q2"), resultSet.getString("q3"), resultSet.getString("q4Audio"),resultSet.getString("q4AudioURL"),resultSet.getString("q4Text"),resultSet.getString("qm"),resultSet.getString("qs"),resultSet.getString("startDate"),resultSet.getString("weekNumber"),resultSet.getString("threeInRowSend"),resultSet.getString("modified"),resultSet.getString("logid"),resultSet.getString("q5"),resultSet.getString("appmodified")));
			
		                  }
			
		
		} 
		catch (Exception ex) 
		{
			logger.info("error"+ex.toString());
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

	public List<Response> getResponse() {

		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		ResultSet resultSet1 = null;
		
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
			List<String> participant_id=new ArrayList<String>();
			
			/*resultSet1 = statement.
					executeQuery("select distinct participant_id from weekly_answers2");
			while(resultSet1.next())
			{
				participant_id.add(resultSet1.getString("participant_id"));
			}*/
		
			
			
		
			resultSet = statement.
					executeQuery("select * from weekly_answers2");
			logger.info("select * from weekly_logs");
			while (resultSet.next()) {
				
						response.add(new Response(resultSet.getString("participant_id"),resultSet.getString("q1"),resultSet.getString("q2"), resultSet.getString("q3"), resultSet.getString("q4Audio"),resultSet.getString("q4AudioURL"),resultSet.getString("q4Text"),resultSet.getString("qm"),resultSet.getString("qs"),resultSet.getString("startDate"),resultSet.getString("weekNumber"),resultSet.getString("threeInRowSend"),resultSet.getString("modified"),resultSet.getString("logid"),resultSet.getString("q5"),resultSet.getString("appmodified")));
			
		                  }
			
			
		} 
		catch (Exception ex) 
		{
			logger.info("error"+ex.toString());
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
