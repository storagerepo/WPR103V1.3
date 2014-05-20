package bephit.model;

public class MailTemplateDetails {

	private String mail_template_name;
	private String mail_subject;
	private String from_name;
	private String from_mail;
	private String replay_mail;
	private String smtp_servername;
	private String port;
	private String username;
	private String password;
	private String message;
	public MailTemplateDetails(){
		
	}
	public MailTemplateDetails( String mail_template_name,
			String mail_subject, String from_name, String from_mail,
			String replay_mail, String smtp_servername, String port,
			String username, String password, String message) {
		super();
		this.mail_template_name = mail_template_name;
		this.mail_subject = mail_subject;
		this.from_name = from_name;
		this.from_mail = from_mail;
		this.replay_mail = replay_mail;
		this.smtp_servername = smtp_servername;
		this.port = port;
		this.username = username;
		this.password = password;
		this.message = message;
	}
	
	public String getMail_template_name() {
		return mail_template_name;
	}
	public void setMail_template_name(String mail_template_name) {
		this.mail_template_name = mail_template_name;
	}
	public String getMail_subject() {
		return mail_subject;
	}
	public void setMail_subject(String mail_subject) {
		this.mail_subject = mail_subject;
	}
	public String getFrom_name() {
		return from_name;
	}
	public void setFrom_name(String from_name) {
		this.from_name = from_name;
	}
	public String getFrom_mail() {
		return from_mail;
	}
	public void setFrom_mail(String from_mail) {
		this.from_mail = from_mail;
	}
	public String getReplay_mail() {
		return replay_mail;
	}
	public void setReplay_mail(String replay_mail) {
		this.replay_mail = replay_mail;
	}
	public String getSmtp_servername() {
		return smtp_servername;
	}
	public void setSmtp_servername(String smtp_servername) {
		this.smtp_servername = smtp_servername;
	}
	public String getPort() {
		return port;
	}
	public void setPort(String port) {
		this.port = port;
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
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

	
}
