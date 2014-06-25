package bephit.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import bephit.model.Response;;

public class InternalAuditsExcelView extends AbstractExcelView {

	@Override
	protected void buildExcelDocument(Map model, HSSFWorkbook workbook,	HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		/*workbook.createName("responsedetails");*/
		HSSFSheet excelSheet = workbook.createSheet("Animal List");
		setExcelHeader(excelSheet);
		 CellStyle style = workbook.createCellStyle(); 
		 Font font = workbook.createFont();
		 style.setFillForegroundColor(HSSFColor.BROWN.index);
	        style.setFillPattern(CellStyle.SOLID_FOREGROUND);
	        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
	        font.setColor(HSSFColor.WHITE.index);
	        style.setFont(font);
		List<Response> response1 = (List<Response>) model.get("response");
		setExcelRows(excelSheet,response1);
	
	}

	public void setExcelHeader(HSSFSheet excelSheet) {
		HSSFRow excelHeader = excelSheet.createRow(0);
		excelHeader.createCell(0).setCellValue("participant_id");
		excelHeader.createCell(1).setCellValue("q1");
		excelHeader.createCell(2).setCellValue("q2");
		excelHeader.createCell(3).setCellValue("q3");		
		excelHeader.createCell(4).setCellValue("q4Audio");
		excelHeader.createCell(5).setCellValue("q4Text");
		excelHeader.createCell(6).setCellValue("qm");
		excelHeader.createCell(7).setCellValue("qs");
		excelHeader.createCell(8).setCellValue("startDate");
		excelHeader.createCell(9).setCellValue("weekNumber");
		excelHeader.createCell(10).setCellValue("modified");
		excelHeader.createCell(11).setCellValue("appmodified");
	
	}
	
	public void setExcelRows(HSSFSheet excelSheet, List<Response> response){
		int record = 1;
		for (Response responsedetails:response) {
			HSSFRow excelRow = excelSheet.createRow(record++);
			excelRow.createCell(0).setCellValue(responsedetails.getParticipant_id());
			excelRow.createCell(1).setCellValue(responsedetails.getQ1());
			excelRow.createCell(2).setCellValue(responsedetails.getQ2());
			excelRow.createCell(3).setCellValue(responsedetails.getQ3());
			excelRow.createCell(4).setCellValue(responsedetails.getQ4Audio());
			excelRow.createCell(5).setCellValue(responsedetails.getQ4Text());
			excelRow.createCell(6).setCellValue(responsedetails.getQm());
			excelRow.createCell(7).setCellValue(responsedetails.getQs());
			excelRow.createCell(8).setCellValue(responsedetails.getStartDate());
			excelRow.createCell(9).setCellValue(responsedetails.getWeekNumber());
			excelRow.createCell(10).setCellValue(responsedetails.getModified());
			excelRow.createCell(11).setCellValue(responsedetails.getAppmodified());
		}
	}
}
