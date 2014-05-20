package bephit.model;

public class MessageStatus {

	private String participant_id;
	
	private String participantname;
	
	private String broad_id;
	
	private String stream_id;
	
	private String messageno;
	
	private String status;
	
	private String sendtime;
	
	
	
	public  MessageStatus(){
		
	}

	public MessageStatus(String participant_id, String participantname,
			String broad_id, String stream_id, String messageno, String status,
			String sendtime) {
		super();
		this.participant_id = participant_id;
		this.participantname = participantname;
		this.broad_id = broad_id;
		this.stream_id = stream_id;
		this.messageno = messageno;
		this.status = status;
		this.sendtime = sendtime;
	}



	public String getParticipant_id() {
		return participant_id;
	}



	public void setParticipant_id(String participant_id) {
		this.participant_id = participant_id;
	}



	public String getParticipantname() {
		return participantname;
	}



	public void setParticipantname(String participantname) {
		this.participantname = participantname;
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



	public String getMessageno() {
		return messageno;
	}



	public void setMessageno(String messageno) {
		this.messageno = messageno;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public String getSendtime() {
		return sendtime;
	}



	public void setSendtime(String sendtime) {
		this.sendtime = sendtime;
	}
	

	
}
