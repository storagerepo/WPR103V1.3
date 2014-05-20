package bephit.model;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

import javax.swing.plaf.basic.BasicViewportUI;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
 
import bephit.dao.MailTemplateDAO;

import com.twilio.sdk.resource.instance.Account;
import com.twilio.sdk.resource.instance.Message;

import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.factory.MessageFactory;

@Component("messageSender")
public class TwilioSMS {
	//---------Original Credential------------deemsyspro_deem.Participant_message_log
   public static final String ACCOUNT_SID = "AC786e7d442679f6354ffad69c823e8293"; //Store in DB
   public static final String AUTH_TOKEN = "1fa46f72637ea7c1f51b758c486f9e66"; //Store in DB
	
	@Autowired
	MailTemplateDAO mailTemplateDAO;
	//-----------Test credentials--------------	
	/*public static final String ACCOUNT_SID = "ACc3b8379c7d3c8670b70941adeba1a531";
	public static final String AUTH_TOKEN = "094ba16d028e446f5e20cc41890b3a86";
	*/
	
    private void sendMessage(final String toNumber, final String MessageBody, final String mediaUrl) throws TwilioRestException {
 
        
    	List<TextMsgSettings> txtSettings=new ArrayList<TextMsgSettings>();
    	txtSettings=mailTemplateDAO.getMsgSettings();
    	TwilioRestClient client = new TwilioRestClient(txtSettings.get(0).getAccount_sid(), txtSettings.get(0).getAuth_token());
        Account account = client.getAccount();
        MessageFactory messageFactory = account.getMessageFactory();
       
        List<NameValuePair> params=new ArrayList<NameValuePair>();
        
        params.add(new BasicNameValuePair("To",toNumber));
        params.add(new BasicNameValuePair("From",txtSettings.get(0).getMob_num()));
        params.add(new BasicNameValuePair("Body",MessageBody));
        
       
        Message message=messageFactory.create(params);
           
        System.out.println(message.getStatus());
        
    }
    
    public void sendSMS(final String toNumber, final String MessageBody) throws TwilioRestException {
        sendMessage(toNumber, MessageBody, null);
    }

    public void sendMMS(final String toNumber, final String MessageBody, final String mediaUrl) throws TwilioRestException {
    	sendMessage(toNumber, MessageBody, mediaUrl);
    }

}
