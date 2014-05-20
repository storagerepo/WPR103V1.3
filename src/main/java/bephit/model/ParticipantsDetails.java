package bephit.model;


import javax.validation.GroupSequence;
import javax.validation.Valid;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.type.filter.RegexPatternTypeFilter;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

@GroupSequence({ParticipantsDetails.class})
public class ParticipantsDetails {
	private String participants_id;
	
	private String id;
	
	@NotEmpty
	private String fname;
	
		 
	@NotEmpty
	private String username;
	
	@NotEmpty
	private String password;
	
	@NotEmpty
	@Length(max=10,min=10,message="Mobile number is not valid. Should be of length 10.",groups=ParticipantsDetails.class)
	@Pattern(regexp="(^$|[0-9]{10})",message="Mobile number is not valid")
	private String mobile_num;

	private String gender;
	/*/(^\d{5}$)|(^\d{5}-\d{4}$)/*/
	//@Value("/(^\d{5}$)|(^\d{5}-\d{4}$)/")
	//@Pattern(regexp ="/(^|d{5}$)|(^|d{5}-|d{4}$)/", message = "Not a valid Zip code")
	private String city;
	
	
	private String education;
	
	private String medical_details;
	

	private String time1;
	
	private String time1_am_pm;
	
	
	private String time2;
	
	private String time2_am_pm;
	

	private String time3;
	
	private String time3_am_pm;
	
	private String startdate;

	private String Provider_name;
	
	@NotEmpty 
	private String group_name;
	
	
	private String age;
	
	//@NotEmpty
	private String date_of_join;
	
	@NotEmpty
	@Email
	private String email_id;
	
	private String created_by;
	private String message;
	public ParticipantsDetails() {
		super();
	}
	public ParticipantsDetails(String participants_id, String id, String fname,
			String username, String password, String mobile_num, String gender,
			String city, String education, String medical_details,
			String time1, String time1_am_pm, String time2, String time2_am_pm,
			String time3, String time3_am_pm, String startdate,
			String provider_name, String group_name, String age,
			String date_of_join, String email_id, String created_by,
			String message) {
		super();
		this.participants_id = participants_id;
		this.id = id;
		this.fname = fname;
		this.username = username;
		this.password = password;
		this.mobile_num = mobile_num;
		this.gender = gender;
		this.city = city;
		this.education = education;
		this.medical_details = medical_details;
		this.time1 = time1;
		this.time1_am_pm = time1_am_pm;
		this.time2 = time2;
		this.time2_am_pm = time2_am_pm;
		this.time3 = time3;
		this.time3_am_pm = time3_am_pm;
		this.startdate = startdate;
		Provider_name = provider_name;
		this.group_name = group_name;
		this.age = age;
		this.date_of_join = date_of_join;
		this.email_id = email_id;
		this.created_by = created_by;
		this.message = message;
	}
	public String getParticipants_id() {
		return participants_id;
	}
	public void setParticipants_id(String participants_id) {
		this.participants_id = participants_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMobile_num() {
		return mobile_num;
	}
	public void setMobile_num(String mobile_num) {
		this.mobile_num = mobile_num;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getMedical_details() {
		return medical_details;
	}
	public void setMedical_details(String medical_details) {
		this.medical_details = medical_details;
	}
	public String getTime1() {
		return time1;
	}
	public void setTime1(String time1) {
		this.time1 = time1;
	}
	public String getTime1_am_pm() {
		return time1_am_pm;
	}
	public void setTime1_am_pm(String time1_am_pm) {
		this.time1_am_pm = time1_am_pm;
	}
	public String getTime2() {
		return time2;
	}
	public void setTime2(String time2) {
		this.time2 = time2;
	}
	public String getTime2_am_pm() {
		return time2_am_pm;
	}
	public void setTime2_am_pm(String time2_am_pm) {
		this.time2_am_pm = time2_am_pm;
	}
	public String getTime3() {
		return time3;
	}
	public void setTime3(String time3) {
		this.time3 = time3;
	}
	public String getTime3_am_pm() {
		return time3_am_pm;
	}
	public void setTime3_am_pm(String time3_am_pm) {
		this.time3_am_pm = time3_am_pm;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getProvider_name() {
		return Provider_name;
	}
	public void setProvider_name(String provider_name) {
		Provider_name = provider_name;
	}
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getDate_of_join() {
		return date_of_join;
	}
	public void setDate_of_join(String date_of_join) {
		this.date_of_join = date_of_join;
	}
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public String getCreated_by() {
		return created_by;
	}
	public void setCreated_by(String created_by) {
		this.created_by = created_by;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	
	
	
	
	
}
