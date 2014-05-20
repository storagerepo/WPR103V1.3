package bephit.model;


import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

public class ParticipantGroups {
	private String group_id;
	
	
	@NotEmpty
	private String group_name;
	
	
	@NotEmpty
	private String group_decs;
	
	private String created_by;
	
	public ParticipantGroups()
	{
		
	}	
	public ParticipantGroups(String group_id,
	 String group_name,
	
	 String group_decs,
	 
	 String created_by
	)
	{
		this.group_id=group_id;
		 this.group_name=group_name;
		
		 this.group_decs=group_decs;
		 this.created_by=created_by;
		 		
	}
	public String getgroup_id()
	{
		return group_id;
	}
	public String getCreated_by() {
		return created_by;
	}
	public void setCreated_by(String created_by) {
		this.created_by = created_by;
	}
	public void setgroup_id(String group_id)
	{
		this.group_id=group_id;
	}
	public String getgroup_name()
	{
		return group_name;
	}
	public void setgroup_name(String group_name)
	{
		this.group_name=group_name;
	}
	
	public String getgroup_decs()
	{
		return group_decs;
	}
	public void setgroup_decs(String group_decs)
	{
		this.group_decs=group_decs;
	}
	
	
	
}
