package bephit.model;


import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

public class Response {
	
	String participant_id;
	String q1;
	String q2;
	String q3;
	String q4Audio;
	String q4AudioURL;	
	String q4Text;	
	String qm;
	String qs;
	String startDate;
	String weekNumber;
	String threeInRowSend;
	String modified;	
	String log_id;
	String q5;
	String appmodified;
	String audio;
	public String getParticipant_id() {
		return participant_id;
	}
	public void setParticipant_id(String participant_id) {
		this.participant_id = participant_id;
	}
	public String getQ1() {
		return q1;
	}
	public void setQ1(String q1) {
		this.q1 = q1;
	}
	public String getQ2() {
		return q2;
	}
	public void setQ2(String q2) {
		this.q2 = q2;
	}
	public String getQ3() {
		return q3;
	}
	public void setQ3(String q3) {
		this.q3 = q3;
	}
	public String getQ4Audio() {
		return q4Audio;
	}
	public void setQ4Audio(String q4Audio) {
		this.q4Audio = q4Audio;
	}
	public String getQ4AudioURL() {
		return q4AudioURL;
	}
	public void setQ4AudioURL(String q4AudioURL) {
		this.q4AudioURL = q4AudioURL;
	}
	public String getQ4Text() {
		return q4Text;
	}
	public void setQ4Text(String q4Text) {
		this.q4Text = q4Text;
	}
	public String getQm() {
		return qm;
	}
	public void setQm(String qm) {
		this.qm = qm;
	}
	public String getQs() {
		return qs;
	}
	public void setQs(String qs) {
		this.qs = qs;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getWeekNumber() {
		return weekNumber;
	}
	public void setWeekNumber(String weekNumber) {
		this.weekNumber = weekNumber;
	}
	public String getThreeInRowSend() {
		return threeInRowSend;
	}
	public void setThreeInRowSend(String threeInRowSend) {
		this.threeInRowSend = threeInRowSend;
	}
	public String getModified() {
		return modified;
	}
	public void setModified(String modified) {
		this.modified = modified;
	}
	public String getLog_id() {
		return log_id;
	}
	public void setLog_id(String log_id) {
		this.log_id = log_id;
	}
	public String getQ5() {
		return q5;
	}
	public void setQ5(String q5) {
		this.q5 = q5;
	}
	public String getAppmodified() {
		return appmodified;
	}
	public void setAppmodified(String appmodified) {
		this.appmodified = appmodified;
	}
	
	public String getAudio() {
		return audio;
	}
	public void setAudio(String audio) {
		this.audio = audio;
	}
	
	public Response(String participant_id, String q1, String q2, String q3,
			String q4Audio, String q4AudioURL, String q4Text, String qm,
			String qs, String startDate, String weekNumber,
			String threeInRowSend, String modified, String log_id, String q5,
			String appmodified) {
		super();
		this.participant_id = participant_id;
		this.q1 = q1;
		this.q2 = q2;
		this.q3 = q3;
		this.q4Audio = q4Audio;
		this.q4AudioURL = q4AudioURL;
		this.q4Text = q4Text;
		this.qm = qm;
		this.qs = qs;
		this.startDate = startDate;
		this.weekNumber = weekNumber;
		this.threeInRowSend = threeInRowSend;
		this.modified = modified;
		this.log_id = log_id;
		this.q5 = q5;
		this.appmodified = appmodified;
		
	}
	public Response() {
		super();
	}
	
	
	
}