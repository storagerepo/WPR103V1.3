package bephit.controllers;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.util.RedirectUrlBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import bephit.dao.*;
import bephit.forms.*;
import bephit.model.*;

@Controller
@SessionAttributes({"messagestreamdetails"})
public class MessageStreamController {
	protected static Logger logger = org.slf4j.LoggerFactory.getLogger("Insert into log table");

	@Autowired
	StreamDetailsDAO streamDAO;
	
	@Autowired
	AdminActivityDAO activityDAO;
	
	@RequestMapping(value="/mail", method=RequestMethod.GET)
	public String mailstreamdetails(HttpServletRequest request,ModelMap model)
	{
		
		return "mail";
	}

	@RequestMapping(value = "/createstream", method = RequestMethod.GET)
	public String createstream(HttpSession session,ModelMap model) {
		session.removeAttribute("messagestreamdetails");
		String StreamID = streamDAO.getMaxStreamID();
		model.addAttribute("currentstream", StreamID);
		 model.addAttribute("menu","message");
		return "createstream";
	}

	@RequestMapping(value = "/insertstream", method = RequestMethod.POST)
	public String insertstream(HttpSession session,HttpServletRequest request,@ModelAttribute("streamDetails") @Valid StreamDetails streamdetails,BindingResult result,ModelMap model,Principal principal) {
		session.setAttribute("messagestreamdetails",streamdetails);
		if(result.hasErrors())
		{
			
			model.addAttribute("menu","message");
			String StreamID = streamDAO.getMaxStreamID();
			model.addAttribute("currentstream", StreamID);
			return "createstream";
			
			
		}
		
		else
		{			
		String[] Messages = new String[1000];
		Messages = request.getParameterValues("message[]");
		streamDAO.insertNewstream(streamdetails, principal.getName(), Messages);		
		StreamDetailsForm streamForm = new StreamDetailsForm();
		streamForm.setStreamDetails(streamDAO.getStream());
		model.addAttribute("streamForm", streamForm);
	    AdminActivityForm adminActivityForm = new AdminActivityForm();
	    adminActivityForm.setAdminActivity(activityDAO.getAdminActivity());
	    model.addAttribute("adminActivityForm","adminActivityForm");
	    activityDAO.setAdminActivity(principal.getName(),"created Stream" +streamdetails.getStreamName());
		model.addAttribute("menu","message");
		model.addAttribute("success", "true");
		return "viewstream";

	}
	}

	@RequestMapping(value = "/viewstream", method = RequestMethod.GET)
	public String viewstream(HttpServletRequest request,ModelMap model) {
		model.addAttribute("success", "false");
		StreamDetailsForm streamForm = new StreamDetailsForm();
		streamForm.setStreamDetails(streamDAO.getStream());
		model.addAttribute("streamForm", streamForm);
		 model.addAttribute("menu","message");
	       model.addAttribute("currentuser",request.getSession().getAttribute("currentuser"));      
	     model.addAttribute("noofrows",streamForm.getStreamDetails().size());       
	    streamForm.setStreamDetails(streamDAO.getlimitedstream(1));
			model.addAttribute("noofpages",(int) Math.ceil(streamDAO.getnoofstream() * 1.0 / 20));	 
	        model.addAttribute("button","viewall");
	        model.addAttribute("currentpage",1);
		return "viewstream";
	}
	
	@RequestMapping(value="/edit_stream", method=RequestMethod.GET)
	public String edit_stream(HttpServletRequest request,@RequestParam("id") String streamId,ModelMap model, Principal principal) {
	
		StreamDetailsForm streamForm = new StreamDetailsForm();
		streamForm.setStreamDetails(streamDAO.getStream(streamId));
		List<String> messages=new ArrayList<String>();
		messages=streamDAO.getMessages(streamId);
		model.addAttribute("streamForm", streamForm);
		model.addAttribute("messages",messages);
		 model.addAttribute("menu","message");
        return "edit_stream";
	}
	
	
	
	
	@RequestMapping(value="/updatestream", method=RequestMethod.POST)
	public String updatestream(HttpServletRequest request,@ModelAttribute("streamDetails") @Valid StreamDetails streamDetails,BindingResult result,ModelMap model,Principal principal)
	 
	{
		
		List<String> sample=streamDAO.getMessageid(streamDetails.getStreamId());
		streamDAO.deleltemessageid(sample);
		String[] Messages = new String[100];
		Messages = request.getParameterValues("message[]");	
		     
		streamDAO.insertmessage(streamDetails, principal.getName(),Messages);
		 	
		if (result.hasErrors())
		{
			StreamDetailsForm streamForm = new StreamDetailsForm();
			streamForm.setStreamDetails(streamDAO.getStream(streamDetails.getStreamId()));
			model.addAttribute("streamForm", streamForm);
			
		        return "edit_stream";
		}
		
		model.addAttribute("success","true");
		StreamDetailsForm streamForm = new StreamDetailsForm();
		streamForm.setStreamDetails(streamDAO.getStream());
		model.addAttribute("streamForm", streamForm);	
		AdminActivityForm adminActivityForm = new AdminActivityForm();
        adminActivityForm.setAdminActivity(activityDAO.getAdminActivity());
        model.addAttribute("adminActivityForm","adminActivityForm");
        activityDAO.setAdminActivity(principal.getName(),"Updated Stream" +streamDetails.getStreamName());
		model.addAttribute("menu","message");
	    return "viewstream";  
        }
	
	@RequestMapping(value="/deletestream", method=RequestMethod.GET)
	public String removestream(@RequestParam("id") String stream_id,ModelMap model, Principal principal,StreamDetails streamdetails) {
	
		
			
		int status=streamDAO.deletestream(stream_id,principal.getName());
		if(status==1)
		{
			StreamDetailsForm streamForm = new StreamDetailsForm();
			streamForm.setStreamDetails(streamDAO.getStream());
			model.addAttribute("streamForm", streamForm);
			streamDAO.deletestream(stream_id,principal.getName());
			AdminActivityForm adminActivityForm = new AdminActivityForm();
	        adminActivityForm.setAdminActivity(activityDAO.getAdminActivity());
	        model.addAttribute("adminActivityForm","adminActivityForm");
			//activityDAO.setAdminActivity(principal.getName(),"Deleted Stream");
		}
		 model.addAttribute("menu","message");
		return "viewstream";
	}
	
	@RequestMapping(value="/streamdetails", method=RequestMethod.GET)
	public String streamdetails(HttpServletRequest request,@RequestParam("id") String stream_id,ModelMap model,StreamDetails streamdetails)
	{
		StreamDetailsForm streamForm = new StreamDetailsForm();
		streamForm.setStreamDetails(streamDAO.getStream(stream_id));
		model.addAttribute("streamForm", streamForm);
		
		
        model.addAttribute("menu","message");
		return "streamdetails";
	}
	
	@RequestMapping(value="/deleteSelectedstream", method=RequestMethod.POST)
	public String deleteSelectedstream(HttpServletRequest request,ModelMap model,StreamDetails streamdetails,Principal principal) 
	{	
		String[] SelectedIDs=new String[100];
		SelectedIDs=request.getParameterValues("chkUser");
		for(String id:SelectedIDs)
		{
		streamDAO.deletestream(id,principal.getName());		
		}
		StreamDetailsForm streamForm = new StreamDetailsForm();
		streamForm.setStreamDetails(streamDAO.getStream());
		model.addAttribute("streamForm", streamForm);
	     model.addAttribute("menu","message");
		return "viewstream";
		
	}	
	
	@RequestMapping(value="/viewstream_page", method=RequestMethod.GET)
	public String pagesstream(HttpServletRequest request,@RequestParam("page") int page,ModelMap model) {	
		
		StreamDetailsForm streamForm = new StreamDetailsForm();
	    streamForm.setStreamDetails(streamDAO.getlimitedstream(page));
	   	model.addAttribute("noofpages",(int) Math.ceil(streamDAO.getnoofstream() * 1.0 / 20));
	   	model.addAttribute("streamForm", streamForm);
	   	model.addAttribute("noofrows",streamForm.getStreamDetails().size());   
        model.addAttribute("currentpage",page);
        model.addAttribute("menu","message");
        model.addAttribute("button","viewall");
		return "viewstream";
		
	}	
	
	
	@RequestMapping(value={"/", "/viewallstream"}, method = RequestMethod.GET)
	public String viewallpartGroup(HttpServletRequest request,ModelMap model, Principal principal ) {
		
		
		
		StreamDetailsForm streamForm = new StreamDetailsForm();
		streamForm.setStreamDetails(streamDAO.getStream());
		  
		model.addAttribute("streamForm", streamForm);
		model.addAttribute("noofrows",streamForm.getStreamDetails().size());   
       
        model.addAttribute("menu","message");
        model.addAttribute("button","close");
	      
	        model.addAttribute("menu","message");
	        model.addAttribute("success","false");
	        model.addAttribute("button","close");
			return "viewstream";
 
	}
	@RequestMapping(value="/streammaxID", method=RequestMethod.POST)
	public @ResponseBody String streammaxID(HttpServletRequest request,ModelMap model,StreamDetails streamdetails)
	{
		String returnText;
		System.out.println("yes!!!");
		returnText=streamDAO.getMaxStreamID();
		
		return returnText;
	}
	
	
}