package bephit.model;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

public class BroadCast {
 
	private String br_id;
	
	@NotEmpty
	private String broad_id;
	
	@NotEmpty
	private String stream_id;
	
	@NotEmpty
	private String group_id;
	
    @NotEmpty    
	private String days_weeks;
    
	
	@NotEmpty
	private String frequency;
	
	@NotEmpty
	private String start_date;
	
	private String status;
	
	@NotEmpty
	private String fstream_time;
	
	@NotEmpty
	private String sstream_time;
	
	
	@NotEmpty
	private String tstream_time;
	
	
	@NotEmpty
	private String fstream_time_am_pm;
	
	public String getTstream_time() {
		return tstream_time;
	}

	public void setTstream_time(String tstream_time) {
		this.tstream_time = tstream_time;
	}
	@NotEmpty
	private String sstream_time_am_pm;
	
	public String getFstream_time_am_pm() {
		return fstream_time_am_pm;
	}

	public void setFstream_time_am_pm(String fstream_time_am_pm) {
		this.fstream_time_am_pm = fstream_time_am_pm;
	}

	public String getSstream_time_am_pm() {
		return sstream_time_am_pm;
	}

	public void setSstream_time_am_pm(String sstream_time_am_pm) {
		this.sstream_time_am_pm = sstream_time_am_pm;
	}
	@NotEmpty
	private String stream_week_day;

	@NotEmpty
	private String tstream_time_am_pm;
	
	
	
	public String getTstream_time_am_pm() {
		return tstream_time_am_pm;
	}

	public void setTstream_time_am_pm(String tstream_time_am_pm) {
		this.tstream_time_am_pm = tstream_time_am_pm;
	}

	public BroadCast()
	{
	
	}
	/*public BroadCast(String broad_id,
			String stream_id,
			String group_id, 
			String frequency,
			String start_date,
			String fstream_time,
			String sstream_time,
			String stream_week_day,
			String status) {
		super();
		this.br_id = br_id;
		this.broad_id = broad_id;
		this.stream_id = stream_id;
		this.group_id = group_id;
		this.frequency = frequency;
		this.start_date = start_date;
		this.fstream_time = fstream_time;
		this.sstream_time = sstream_time;
		this.stream_week_day = stream_week_day;
		this.status = status;
	}*/
	/*public String getBr_id() {
		return br_id;
	}
	public void setBr_id(String br_id) {
		this.br_id = br_id;
	}*/
	
	public BroadCast(String broad_id, String stream_id, String group_id,String days_weeks,
			String frequency, String start_date, String fstream_time,
			String sstream_time, String stream_week_day, String status
			) {
		super();
		this.broad_id = broad_id;
		this.stream_id = stream_id;
		this.group_id = group_id;
		this.days_weeks = days_weeks;
		this.frequency = frequency;
		this.start_date = start_date;
		this.fstream_time = fstream_time;
		this.sstream_time = sstream_time;
		this.stream_week_day = stream_week_day;
		this.status = status;
	
	}
	public String getDays_weeks() {
		return days_weeks;
	}
	public BroadCast(String br_id, String broad_id, String stream_id,
			String group_id, String days_weeks, String frequency,
			String start_date, String status, String fstream_time,
			String sstream_time,String tstream_time, String fstream_time_am_pm,
			String sstream_time_am_pm,String tstream_time_am_pm, String stream_week_day) {
		super();
		this.br_id = br_id;
		this.broad_id = broad_id;
		this.stream_id = stream_id;
		this.group_id = group_id;
		this.days_weeks = days_weeks;
		this.frequency = frequency;
		this.start_date = start_date;
		this.status = status;
		this.fstream_time = fstream_time;
		this.sstream_time = sstream_time;
		this.sstream_time = tstream_time;
		this.fstream_time_am_pm = fstream_time_am_pm;
		this.sstream_time_am_pm = sstream_time_am_pm;
		this.tstream_time_am_pm = tstream_time_am_pm;
		this.stream_week_day = stream_week_day;
	}

	public void setDays_weeks(String days_weeks) {
		this.days_weeks = days_weeks;
	}
	public String getBroad_id() {
		return broad_id;
	}
	public void setBroad_id(String broad_id) {
		this.broad_id = broad_id;
	}
	public String getStream_id() {
		return stream_id;
	}
	public void setStream_id(String stream_id) {
		this.stream_id = stream_id;
	}
	public String getGroup_id() {
		return group_id;
	}
	public void setGroup_id(String group_id) {
		this.group_id = group_id;
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
	public String getFstream_time() {
		return fstream_time;
	}
	public void setFstream_time(String fstream_time) {
		this.fstream_time = fstream_time;
	}
	public String getSstream_time() {
		return sstream_time;
	}
	public void setSstream_time(String sstream_time) {
		this.sstream_time = sstream_time;
	}
	public String getStream_week_day() {
		return stream_week_day;
	}
	public void setStream_week_day(String stream_week_day) {
		this.stream_week_day = stream_week_day;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	

}
