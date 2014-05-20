package bephit.model;

import org.hibernate.validator.constraints.NotEmpty;

public class TextMsgSettings {
	@NotEmpty
private String account_sid;
	
	@NotEmpty
private String auth_token;
	
	@NotEmpty
private String mob_num;

public TextMsgSettings() {

}
public TextMsgSettings(String account_sid, String auth_token, String mob_num) {
	super();
	this.account_sid = account_sid;
	this.auth_token = auth_token;
	this.mob_num = mob_num;
}
public String getAccount_sid() {
	return account_sid;
}
public void setAccount_sid(String account_sid) {
	this.account_sid = account_sid;
}
public String getAuth_token() {
	return auth_token;
}
public void setAuth_token(String auth_token) {
	this.auth_token = auth_token;
}
public String getMob_num() {
	return mob_num;
}
public void setMob_num(String mob_num) {
	this.mob_num = mob_num;
}


}
