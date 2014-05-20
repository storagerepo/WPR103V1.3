package bephit.model;

import javax.validation.GroupSequence;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@GroupSequence({AdminUser.class})
public class AdminUser
{
	@NotEmpty
	private String admin_firstname;
	
	
	@NotEmpty
	private String admin_username;
	
	
	private String admin_password;
	
	@NotEmpty
	@Email
	private String admin_email;
	
	
	@Email
	private String secondary_email;
	
	@NotEmpty
	@Length(max=10,min=10,message="Mobile number is not valid. Should be of length 10.",groups=AdminUser.class)
	@Pattern(regexp="(^$|[0-9]{10})",message="Mobile number is not valid")
	private String admin_mobile;

	private String date;
	
	
	private String status;
	private String admin_id;
	
	
	public String getAdmin_firstname() {
		return admin_firstname;
	}

	public void setAdmin_firstname(String admin_firstname) {
		this.admin_firstname = admin_firstname;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_username() {
		return admin_username;
	}

	public void setAdmin_username(String admin_username) {
		this.admin_username = admin_username;
	}

	public String getAdmin_password() {
		return admin_password;
	}

	public void setAdmin_password(String admin_password) {
		this.admin_password = admin_password;
	}

	public String getAdmin_email() {
		return admin_email;
	}

	public void setAdmin_email(String admin_email) {
		this.admin_email = admin_email;
	}

	public String getSecondary_email() {
		return secondary_email;
	}

	public void setSecondary_email(String secondary_email) {
		this.secondary_email = secondary_email;
	}

	public String getAdmin_mobile() {
		return admin_mobile;
	}

	public void setAdmin_mobile(String admin_mobile) {
		this.admin_mobile = admin_mobile;
	}

	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	
 
	public AdminUser()
	{
	super();
	}
	
	public AdminUser(String admin_id,String admin_firstname,String admin_username,String admin_password,String admin_email,String secondary_email,String admin_mobile,String date,String status)
	{
		this.admin_id=admin_id;
		
		this.admin_firstname=admin_firstname;
		this.admin_username=admin_username;
		this.admin_password=admin_password;
		this.admin_email=admin_email;
		this.secondary_email=secondary_email;
		this.admin_mobile=admin_mobile;		
		this.date=date;
		this.status=status;
		
	}
	
}
