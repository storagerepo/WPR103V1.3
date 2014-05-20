package bephit.model;

public class BroadCastReports {
	private String broad_id;
	private String stream_name;
	private String group_name;
	private String days_weeks;
	private String frequency;	
	private String start_date;	
	private String status;
	private String message_count;
	private String enable;
	
	

	public BroadCastReports() {
		
	}



	public BroadCastReports(String broad_id, String stream_name,
			String group_name, String days_weeks, String frequency,
			String start_date,  String status,String message_count,
			String enable) {
		super();
		this.broad_id = broad_id;
		this.stream_name = stream_name;
		this.group_name = group_name;
		this.days_weeks = days_weeks;
		this.frequency = frequency;
		this.start_date = start_date;		
		this.status = status;
		this.message_count = message_count;
		this.enable = enable;
	}



	public String getBroad_id() {
		return broad_id;
	}



	public void setBroad_id(String broad_id) {
		this.broad_id = broad_id;
	}



	public String getStream_name() {
		return stream_name;
	}



	public void setStream_name(String stream_name) {
		this.stream_name = stream_name;
	}



	public String getGroup_name() {
		return group_name;
	}



	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}



	public String getDays_weeks() {
		return days_weeks;
	}



	public void setDays_weeks(String days_weeks) {
		this.days_weeks = days_weeks;
	}



	public String getFrequency() {
		return frequency;
	}



	public void setFrequency(String frequency) {
		this.frequency = frequency;
	}



	public String getStart_date() {
		return start_date;
	}



	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}



	


	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}
	public String getMessage_count() {
		return message_count;
	}



	public void setMessage_count(String message_count) {
		this.message_count = message_count;
	}



	public String getEnable() {
		return enable;
	}



	public void setEnable(String enable) {
		this.enable = enable;
	}
	
	


}
