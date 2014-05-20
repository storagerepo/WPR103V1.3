package bephit.model;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class UpdatePwd {
	
	@NotEmpty
 private String new_pwd;
	
	@NotEmpty
 private String current_pwd;
	
	@NotEmpty
 private String retype_new_pwd;
 
public UpdatePwd() {
		super();
	}

public UpdatePwd(String new_pwd, String current_pwd, String retype_new_pwd) {
	super();
	this.new_pwd = new_pwd;
	this.current_pwd = current_pwd;
	this.retype_new_pwd = retype_new_pwd;
}

public String getNew_pwd() {
	return new_pwd;
}

public void setNew_pwd(String new_pwd) {
	this.new_pwd = new_pwd;
}

public String getCurrent_pwd() {
	return current_pwd;
}

public void setCurrent_pwd(String current_pwd) {
	this.current_pwd = current_pwd;
}

public String getRetype_new_pwd() {
	return retype_new_pwd;
}

public void setRetype_new_pwd(String retype_new_pwd) {
	this.retype_new_pwd = retype_new_pwd;
}

 
}
