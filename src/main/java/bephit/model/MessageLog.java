package bephit.model;

public class MessageLog {

	private String broad_id;
	
	private String group_id;
	
	private String participant_id;
	
	public MessageLog(){
		
	}
	public MessageLog( String broad_id,String group_id,String participant_id) {
		super();
		this.broad_id=broad_id;
		this.group_id=group_id;
		this.participant_id=participant_id;
		
	}
	public String getBroad_id() {
		return broad_id;
	}
	public void setBroad_id(String broad_id) {
		this.broad_id = broad_id;
	}
	public String getGroup_id() {
		return group_id;
	}
	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}
	public String getParticipant_id() {
		return participant_id;
	}
	public void setParticipant_id(String participant_id) {
		this.participant_id = participant_id;
	}
	
	

	
}
