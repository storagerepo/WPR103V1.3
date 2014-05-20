package bephit.model;

public class MessageList {
	
	private String broad_id;
	private String stream_id;	
	private String group_id;
	private String frequency;
	private String startdate;
	private String provider_first_message_time;
	private String provider_second_message_time;
	private String provider_third_message_time;
	private String provider_first_am_pm;
	private String provider_second_am_pm;
	private String provider_third_am_pm;	
	private String provider_week_message_day;
	private String participant_id;
	private String username;
	private String mobile_num;
	private String time1;
	private String time1_am_pm;
	private String time2;
	private String time2_am_pm;
	private String time3;
	private String time3_am_pm;	
	private String message_count;	
	private String textingcontacts;	
	private String days_weeks;
	
	
	
	public String getDays_weeks() {
		return days_weeks;
	}





	public void setDays_weeks(String days_weeks) {
		this.days_weeks = days_weeks;
	}




	
	public MessageList(String broad_id, String stream_id, String group_id,
			String frequency, String startdate,
			String provider_first_message_time,
			String provider_second_message_time,
			String provider_third_message_time, String provider_first_am_pm,
			String provider_second_am_pm, String provider_third_am_pm,
			String provider_week_message_day, String participant_id,
			String username, String mobile_num, String time1,
			String time1_am_pm, String time2, String time2_am_pm, String time3,
			String time3_am_pm, String message_count, String textingcontacts,
			String days_weeks) {
		super();
		this.broad_id = broad_id;
		this.stream_id = stream_id;
		this.group_id = group_id;
		this.frequency = frequency;
		this.startdate = startdate;
		this.provider_first_message_time = provider_first_message_time;
		this.provider_second_message_time = provider_second_message_time;
		this.provider_third_message_time = provider_third_message_time;
		this.provider_first_am_pm = provider_first_am_pm;
		this.provider_second_am_pm = provider_second_am_pm;
		this.provider_third_am_pm = provider_third_am_pm;
		this.provider_week_message_day = provider_week_message_day;
		this.participant_id = participant_id;
		this.username = username;
		this.mobile_num = mobile_num;
		this.time1 = time1;
		this.time1_am_pm = time1_am_pm;
		this.time2 = time2;
		this.time2_am_pm = time2_am_pm;
		this.time3 = time3;
		this.time3_am_pm = time3_am_pm;
		this.message_count = message_count;
		this.textingcontacts = textingcontacts;
		this.days_weeks = days_weeks;
	}





	public String getTime1_am_pm() {
		return time1_am_pm;
	}





	public void setTime1_am_pm(String time1_am_pm) {
		this.time1_am_pm = time1_am_pm;
	}





	public String getTime2_am_pm() {
		return time2_am_pm;
	}





	public void setTime2_am_pm(String time2_am_pm) {
		this.time2_am_pm = time2_am_pm;
	}





	public String getTime3_am_pm() {
		return time3_am_pm;
	}





	public void setTime3_am_pm(String time3_am_pm) {
		this.time3_am_pm = time3_am_pm;
	}
	
	
	public String getMessage_count() {
		return message_count;
	}

	public void setMessage_count(String message_count) {
		this.message_count = message_count;
	}

	public String getTextingcontacts() {
		return textingcontacts;
	}

	public void setTextingcontacts(String textingcontacts) {
		this.textingcontacts = textingcontacts;
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

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getProvider_first_message_time() {
		return provider_first_message_time;
	}

	public void setProvider_first_message_time(String provider_first_message_time) {
		this.provider_first_message_time = provider_first_message_time;
	}

	public String getProvider_second_message_time() {
		return provider_second_message_time;
	}

	public void setProvider_second_message_time(String provider_second_message_time) {
		this.provider_second_message_time = provider_second_message_time;
	}

	public String getProvider_week_message_day() {
		return provider_week_message_day;
	}

	public void setProvider_week_message_day(String provider_week_message_day) {
		this.provider_week_message_day = provider_week_message_day;
	}

	public String getParticipant_id() {
		return participant_id;
	}

	public void setParticipant_id(String participant_id) {
		this.participant_id = participant_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getMobile_num() {
		return mobile_num;
	}

	public void setMobile_num(String mobile_num) {
		this.mobile_num = mobile_num;
	}

	public String getTime1() {
		return time1;
	}

	public void setTime1(String time1) {
		this.time1 = time1;
	}

	public String getTime2() {
		return time2;
	}

	public void setTime2(String time2) {
		this.time2 = time2;
	}

	public String getTime3() {
		return time3;
	}

	public void setTime3(String time3) {
		this.time3 = time3;
	}

	public String getProvider_third_message_time() {
		return provider_third_message_time;
	}
	public void setProvider_third_message_time(String provider_third_message_time) {
		this.provider_third_message_time = provider_third_message_time;
	}
	public String getProvider_first_am_pm() {
		return provider_first_am_pm;
	}
	public void setProvider_first_am_pm(String provider_first_am_pm) {
		this.provider_first_am_pm = provider_first_am_pm;
	}
	public String getProvider_second_am_pm() {
		return provider_second_am_pm;
	}
	public void setProvider_second_am_pm(String provider_second_am_pm) {
		this.provider_second_am_pm = provider_second_am_pm;
	}
	public String getProvider_third_am_pm() {
		return provider_third_am_pm;
	}
	public void setProvider_third_am_pm(String provider_third_am_pm) {
		this.provider_third_am_pm = provider_third_am_pm;
	}

 
   

}
