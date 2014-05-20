package bephit.model;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

public class StreamDetails {

	public String getCreated_by() {
		return created_by;
	}
	public void setCreated_by(String created_by) {
		this.created_by = created_by;
	}
	public StreamDetails()
	{
		
	}
	
	

	private String streamId;
	
	
	@NotEmpty
	private String streamName;
	
	@NotEmpty
	//@Pattern(regexp="(^$|[0-9])",message="Kindly give a number")
	private String textingcontacts;
	
	@NotEmpty
	private String description;
	
	
	private String admin_username; 
	private String message_count;
    private String message_id;
    private String stream_message;
    private String created_by;
    
     
    public StreamDetails(String streamId,String admin_username, String streamName,String textingcontacts, String description, String count,String created_by) {
	    super();
		this.streamId = streamId;
		this.admin_username=admin_username;
		this.streamName = streamName;
		this.textingcontacts=textingcontacts;
		this.description = description;
		this.message_count=count;
		this.created_by=created_by;
    }	
    public String getstream_message()
    {
    	return stream_message;
    }
    public String getTextingcontacts() {
		return textingcontacts;
	}
	public void setTextingcontacts(String textingcontacts) {
		this.textingcontacts = textingcontacts;
	}
	public void setstream_message()
    {
    	this.stream_message=stream_message;
    }
    public String getMessage_id() {
		return message_id;
	}
    public void setMessage_id(String message_id) {
		this.message_id = message_id;
	}
	public String getMessage_count() {
		return message_count;
	}

	public void setMessage_count(String message_count) {
		this.message_count = message_count;
	}

	public String getStreamId() {
		return streamId;
	}

	public void setStreamId(String streamId) {
		this.streamId = streamId;
	}

	public String getStreamName() {
		return streamName;
	}

	public void setStreamName(String streamName) {
		this.streamName = streamName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getAdmin_username() {
		return admin_username;
	}

	public void setAdmin_username(String admin_username) {
		this.admin_username = admin_username;
	}

	
}
