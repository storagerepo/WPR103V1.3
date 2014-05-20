package bephit.forms;

import java.util.List;

import bephit.model.MailTemplateDetails;


public class MailTemplateForm {
	public List<MailTemplateDetails> getMailTemplateDetails() {
		return mailTemplateDetails;
	}

	public void setMailTemplateDetails(List<MailTemplateDetails> mailTemplateDetails) {
		this.mailTemplateDetails = mailTemplateDetails;
	}

	private List<MailTemplateDetails> mailTemplateDetails;

}
