package bephit.controllers;
 
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import javax.mail.Session;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import bephit.dao.*;
import bephit.forms.*;
import bephit.model.*;
//import bephit.Validation.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory; 
 
@Controller
@SessionAttributes({"currentuser","role","participants","provider","addparticipants","groups","group","editregister","mobile","groupsearch","zipcode","group_select","participantgroup"})
public class MainController {
	

	
	@Autowired  
	MainDAO mainDAO; 
	
    @Autowired
    UserDAO userDAO;
    
    @Autowired    
    ParticipantGroupDAO partDAO;
 
    @Autowired
    MailTemplateDAO mailTemplateDAO;
    
    
    @Autowired
    ResponseDAO responseDAO;
    
    @Autowired
    ParticipantAnswersDAO participantAnswersDAO;
    
    @Autowired  
	EmailSender emailSender;
    
    @Autowired 
    AdminUserDAO adminuserdao;
    
    @Autowired
    AdminActivityDAO activityDAO;
    
    @Autowired 
    MessageLogDAO messagelogdao;
    
    @Autowired  
	MessageStatusDAO messageStatusDAO;
    
    @Autowired  
	TwilioSMS messageSender;

	
    private static final Logger logger = LoggerFactory.getLogger(MainController.class); //Logger
	
 
    
    
    @RequestMapping(value={"/", "/welcome"}, method = RequestMethod.GET)
	public ModelAndView printWelcome(HttpServletRequest request,ModelMap model, Principal principal ) {
		
       int role=mainDAO.getrole();	
        
    
       
       
       
       
       	ParticipantsDetailsForm participantsDetailsForm1 = new ParticipantsDetailsForm();
		participantsDetailsForm1.setParticipantsDetails(mainDAO.getParticipants());         
        ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
		participantsDetailsForm.setParticipantsDetails(mainDAO.getlimitedParticipants(1));
        model.addAttribute("participantsDetailsForm", participantsDetailsForm);
       
        model.addAttribute("currentpage",1);      
        model.addAttribute("noofrows",participantsDetailsForm1.getParticipantsDetails().size());       
        participantsDetailsForm.setParticipantsDetails(mainDAO.getlimitedParticipants(1));
		model.addAttribute("noofpages",(int) Math.ceil(mainDAO.getnoofParticipants() * 1.0 / 20));	 
        model.addAttribute("menu","dashboard");
        model.addAttribute("success","false");
        model.addAttribute("button","viewall");
        ModelAndView mav = new ModelAndView("dashboard");
        ModelAndView mav_participant=new ModelAndView("viewregisterparticipants");
         //session start       
        AdminUserForm adminUserForm=new AdminUserForm();
        adminUserForm.setAdminuser(adminuserdao.getAdminUserby_username(principal.getName()));      
        mav.addObject("currentuser", adminUserForm);
        mav.addObject("role",role);
        mav_participant.addObject("role",role);
        //session stop
        if(role==0)
        {
       	ParticipantsDetailsForm participantsDetailsForm2 = new ParticipantsDetailsForm();
		String participantid=mainDAO.getparticipantid();	
		String providername=mainDAO.getprovidername(participantid);
		model.addAttribute("providername",providername);
		participantsDetailsForm2.setParticipantsDetails(mainDAO.getParticipants(participantid));
        model.addAttribute("participantsDetailsForm", participantsDetailsForm2);
        model.addAttribute("menu","participants");
        ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);
        
        	return mav_participant;
        }
        else
		return mav;
     

	}
    @RequestMapping(value={"/", "/video"}, method = RequestMethod.GET)
	public String video(HttpServletRequest request,ModelMap model, Principal principal ) {
		
       
       return "video";
        
    }

	@RequestMapping(value={"/", "/viewall"}, method = RequestMethod.GET)
	public String viewallpart(HttpServletRequest request,ModelMap model, Principal principal ) {
		
		ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
		participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants());
        model.addAttribute("participantsDetailsForm", participantsDetailsForm);       
        model.addAttribute("noofrows",mainDAO.getParticipants().size());       
        model.addAttribute("menu","dashboard");
        model.addAttribute("success","false");
        model.addAttribute("button","close");
		return "dashboard";
 
	}
	
	@RequestMapping(value="/AddUser.htm",method=RequestMethod.GET)
	public String showForm(){
		return "registerparticipants";
	}
	
	@RequestMapping(value="/editregisters",method=RequestMethod.POST)
	public @ResponseBody String addUser1(HttpSession session,HttpServletRequest request,@ModelAttribute(value="participant")ParticipantsDetails participant, BindingResult result,ModelMap model ){
      
		String sample=request.getParameter("Provider_name");		
		List<String> userList = new ArrayList<String>(); 
		String returnText="";		
		if(!result.hasErrors()){
			userList.add(participant.getProvider_name());                         
			ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
			List<String>  strlist=new ArrayList<String>(); 
				
		    
			/*participantGroupForm.setParticipantGroups(partDAO.getGroups1(user.getName()));
			model.addAttribute("participantGroupForm", participantGroupForm);*/
			strlist=partDAO.getGroups(participant.getProvider_name());
			returnText=returnText+"<select id='group_name' multiple='multiple' class='input_cmbbx1'>";
			for(String group:strlist)
			{
				returnText+="<option value='"+group+"'>"+group+"</option>";
				}			
			  session.setAttribute("groups",strlist);
		   returnText=returnText+"</select>";		 
			
			//returnText = "User has been added to the list. Total number of users are " + userList.size()+user.getName()+participantGroupForm;
			return returnText;
		}
		else{
			returnText = "Sorry, an error has occur. User has not been added to list.";
			return returnText;
		}
		
	}
	
	
	@RequestMapping(value="/AddUser.htm",method=RequestMethod.POST)
	public @ResponseBody String addUser(HttpSession session,HttpServletRequest request,@ModelAttribute(value="participant")ParticipantsDetails participant, BindingResult result,ModelMap model ){
      
		String sample=request.getParameter("Provider_name");			
		List<String> userList = new ArrayList<String>(); 
		String returnText="";		
		if(!result.hasErrors()){
			userList.add(participant.getProvider_name());                         
			ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
			List<String>  strlist=new ArrayList<String>(); 
				
		    
			/*participantGroupForm.setParticipantGroups(partDAO.getGroups1(user.getName()));
			model.addAttribute("participantGroupForm", participantGroupForm);*/
			strlist=partDAO.getGroups(participant.getProvider_name());
			returnText=returnText+"<select id='group_name' name='group_name' multiple='multiple' class='input_cmbbx1'>";
			for(String group:strlist)
			{
				returnText+="<option value='"+group+"'>"+group+"</option>";
				}		
			model.addAttribute("groups",strlist);
			session.setAttribute("groups",strlist);
		   returnText=returnText+"</select>";		
		 
			
			//returnText = "User has been added to the list. Total number of users are " + userList.size()+user.getName()+participantGroupForm;
			return returnText;
		}
		else{
			returnText = "Sorry, an error has occur. User has not been added to list.";
			return returnText;
		}
		
	}

	
	
	
	@RequestMapping(value={"/getgroupbyprovider"}, method = RequestMethod.GET)
	public String getgroup(@RequestParam("pid") String id, ModelMap model)
	{
		//String id=request.getParameter("pid");		
		ParticipantsGroupForm participantGroupForm=new ParticipantsGroupForm();
	    participantGroupForm.setParticipantGroups(partDAO.getGroupsbyprovider(id));	  
	    model.addAttribute("participantGroupForm", participantGroupForm); 
	    AdminUserForm adminuserform=new AdminUserForm();
        adminuserform.setAdminuser(adminuserdao.getAdminUser());
        model.addAttribute("adminuserform",adminuserform);
        
		return "registerparticipants";
 
	}
	
	@RequestMapping(value={"/", "/viewallparticipants"}, method = RequestMethod.GET)
	public String viewallparticipants(HttpServletRequest request,ModelMap model, Principal principal ) {
		
		ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
		participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants());
        model.addAttribute("participantsDetailsForm", participantsDetailsForm);
        ParticipantsGroupForm participantGroupForm=new ParticipantsGroupForm();
	    participantGroupForm.setParticipantGroups(partDAO.getGroups());
	  
	    model.addAttribute("participantGroupForm", participantGroupForm); 
     
        model.addAttribute("noofrows",mainDAO.getParticipants().size());       
        model.addAttribute("menu","participants");
        model.addAttribute("success","false");
        model.addAttribute("button","close");
		return "viewparticipants";
 
	}
	
	@RequestMapping(value={"/", "/viewallgroups"}, method = RequestMethod.GET)
	public String viewallpartGroup(HttpServletRequest request,ModelMap model, Principal principal ) {
		
		
		
		 ParticipantsGroupForm participantGroupForm=new ParticipantsGroupForm();
		    participantGroupForm.setParticipantGroups(partDAO.getGroups());
		  
		    model.addAttribute("participantGroupForm", participantGroupForm); 
	        model.addAttribute("noofrows",partDAO.getGroups().size());
	        model.addAttribute("menu","groups");
	        model.addAttribute("success","false");
	        model.addAttribute("button","close");
			return "viewparticipantgroups";
 
	}
	
	
	
	
	
	
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request,ModelMap model) {
		return "login";
 
	}
	
	@RequestMapping(value="/loginfailed", method = RequestMethod.GET)
	public String loginerror(HttpServletRequest request,ModelMap model) {
		
		model.addAttribute("error", "true");
		return "login";		
 
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(ModelMap model) {
		return "login";
 
	}
	
	@RequestMapping(value="/createuser", method=RequestMethod.GET)
	public String createSpitterProfile(HttpServletRequest request,Model model,Principal principal) {
     model.addAttribute(new UserProfile());
     model.addAttribute("Regsuccess", "false");
    	  return "edit";
    
    
	}
	
	
	@RequestMapping(value="/forgotpwd", method=RequestMethod.GET)
	public String showForgotpassword(HttpServletRequest request,Model model) {
	//	model.addAttribute(new UserProfile());
		
		
		
		
	return "forgotpwd";
	}
	

	
	@RequestMapping(value="/submituser", method=RequestMethod.POST)
	public String addUserProfileFromForm(HttpServletRequest request,@ModelAttribute("userProfile") @Valid UserProfile userProfile,
			BindingResult result,ModelMap model,Principal principal) {
		
		if (result.hasErrors())
		{
			if(userDAO.checkUsername(userProfile.getUsername())==1)
			{
				model.addAttribute("userProfile", userProfile);
				return "/edit";
			}
			else
			{
				model.addAttribute("username_exist","true");
				model.addAttribute("userProfile", userProfile);
				return "/edit";
			}
			
		}
		else
		{
		if(userDAO.checkUsername(userProfile.getUsername())==1)
		{
		userDAO.setUser(userProfile);
		model.addAttribute("Regsuccess", "true");
		return "login";
		}
		else
		{
			model.addAttribute("username_exist","true");
	     	model.addAttribute("userProfile", userProfile);
		    return "/edit";
		}
		}
			
	}
	
	@RequestMapping(value="/showaddparticipants", method=RequestMethod.GET)
	public String showAddParticipants(HttpSession session,HttpServletRequest request,ModelMap model) {
		
		session.removeAttribute("addparticipants");
		model.put("success", "false");
		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);
        model.addAttribute("menu","participants");
	     return "addparticipants";
	}
	
	@RequestMapping(value="/showRegisterParticipant", method=RequestMethod.GET)
public String showRegisterParticipants(HttpSession session,HttpServletRequest request,ModelMap model) {
		session.removeAttribute("participants");
		session.removeAttribute("group_select");
		model.remove("groups");
		model.remove("provider");
		session.invalidate();
		model.put("success", "false");
		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getAllGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);
        AdminUserForm adminuserform=new AdminUserForm();
        adminuserform.setAdminuser(adminuserdao.getAdminUser());
        model.addAttribute("adminuserform",adminuserform);
        return "registerparticipants";
	}
	
	@RequestMapping(value="/addparticipants",method=RequestMethod.GET)
	public String showAddpart(HttpServletRequest request,ModelMap model)
	{
		model.addAttribute("success","false");
		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);
        model.addAttribute("menu","participants");
        model.addAttribute("noofrows",mainDAO.getParticipants().size());
		return "/addparticipants";
	}
	@RequestMapping(value="/registerparticipants",method=RequestMethod.GET)
	public String showAddpart1(HttpSession session,HttpServletRequest request,ModelMap model)
	{
	//	session.removeAttribute("participants");
		model.addAttribute("success","false");
		/*ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);
       */ AdminUserForm adminuserform=new AdminUserForm();
        adminuserform.setAdminuser(adminuserdao.getAdminUser());
        model.addAttribute("adminuserform",adminuserform);
        model.addAttribute("menu","participants");
        model.addAttribute("noofrows",mainDAO.getParticipants().size());
		return "/registerparticipants";
	}
	
	@RequestMapping(value="/addparticipants", method=RequestMethod.POST)
	public String showAddParticipants(HttpSession session,HttpServletRequest request,@ModelAttribute("participant") @Valid ParticipantsDetails participant,
			BindingResult result,ModelMap model,Principal principal,String admin_id,String Desc) {		
		
		session.setAttribute("addparticipants", participant);
		
		model.addAttribute("groupnames",participant.getGroup_name());
		model.addAttribute("email_exist","false");		
		model.addAttribute("mobile_exists","false");
		
		AdminUserForm adminuserform=new AdminUserForm();
        adminuserform.setAdminuser(adminuserdao.getAdminUser());
        model.addAttribute("adminuserform",adminuserform);
        ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);model.addAttribute("menu","participants");
		
		int user_count=mainDAO.checkuser(participant.getUsername(),0,null);
		int email_count=mainDAO.checkemail(participant.getEmail_id(),0,null);
		int mobile_count=mainDAO.checkmobile(participant.getMobile_num(),0,null);
		
		if (result.hasErrors())
		{		//groups=partDAO.getparticipantGroups();
			
			//System.out.println("groups"+groups);
	        if(email_count==0 && mobile_count==0)
	        {
	        	model.addAttribute("email_exists","true");
	        	model.addAttribute("mobile_exists","true");
	        }
			
	        else if(email_count==0)
			{
				logger.info("email exists");
				model.addAttribute("email_exists","true");
				
			}
			if(mobile_count==0)
			{ 
				logger.info("mobile exists");
				model.addAttribute("mobile_exists","true");
							
			}
			if(user_count==0)
			{
				logger.info("user exists");
				model.addAttribute("user_exists","true");
							
			}
			/*AdminUserForm adminuserform=new AdminUserForm();
	        adminuserform.setAdminuser(adminuserdao.getAdminUser());
	        model.addAttribute("adminuserform",adminuserform);
			model.addAttribute("participantGroupForm",participantGroupForm);*/
	        model.addAttribute("menu","participants");
	        
			
		
	        return "addparticipants";
		}
		else
		{
			if(email_count==0 && mobile_count==0)
	        {
	        	model.addAttribute("email_exists","true");
	        	model.addAttribute("mobile_exists","true");
	        	return "/addparticipants";
	        }
		if(email_count==0)
		{
			logger.info("email exists");
			model.addAttribute("email_exists","true");
			model.addAttribute("menu","participants");
			return "/addparticipants";
			
		}
		else if(mobile_count==0)
		{ 
			logger.info("mobile exists");
			model.addAttribute("mobile_exists","true");
			model.addAttribute("menu","participants");
			return "/addparticipants";
						
		}
		else if(user_count==0)
		{
			logger.info("user exists");
			model.addAttribute("user_exists","true");
			model.addAttribute("menu","participants");
			return "/addparticipants";			
		}
		else
		{
			List<String> groupname=new ArrayList<String>();
			String[] groups=new String[100];
			groups=request.getParameterValues("group_name");		
			int count=groups.length;			
			for(int i=0;i<count;i++)
			{
				logger.info("loop groupname"+groups[i]);
			}	
		model.put("participant", participant);		
		//validation valid=new validation();
		String[] errmsges=new String[50];
	    //errmsges=valid.checkParticipant(participant);	
		model.put("errmsg",errmsges[0]);
		model.addAttribute("participantsDetailsForm", participant);
		/*ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);			
	*/	int a=mainDAO.setParticipants(participant,principal.getName(),groups,1);
	/*if(a==1)
	{
		model.addAttribute("merror",true);
		return "addparticipants";
	}*/
	String participantid=mainDAO.getmaxparticipantid();	
		 
		 messagelogdao.getMessageLog(participantid);		
	       
	       mainDAO.insertWeeklylog();
	       
	      		model.put("success","true");
				
				 model.addAttribute("menu","participants");
				    ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
					participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants());
			        model.addAttribute("participantsDetailsForm", participantsDetailsForm);	
			        AdminActivityForm adminActivityForm = new AdminActivityForm();
			        adminActivityForm.setAdminActivity(activityDAO.getAdminActivity());
			        model.addAttribute("adminActivityForm","adminActivityForm");
			        activityDAO.setAdminActivity(principal.getName(),"Added Participants " +participant.getFname());
			        			       
			        model.addAttribute("menu","dashboard");
			        model.addAttribute("noofrows",mainDAO.getParticipants().size());
					return "dashboard";
		}
		}
		
	}
	
	@RequestMapping(value="/registerparticipants", method=RequestMethod.POST)	
	public String showAddParticipants1(HttpSession session,HttpServletRequest request,@ModelAttribute("participant") @Valid ParticipantsDetails participant,
			BindingResult result,ModelMap model) {
		
		AdminUserForm adminuserform=new AdminUserForm();
        adminuserform.setAdminuser(adminuserdao.getAdminUser());
        model.addAttribute("adminuserform",adminuserform);
		String providername=participant.getProvider_name();
		session.setAttribute("group_select", participant.getGroup_name());		
		session.setAttribute("participants",participant);
		model.addAttribute("provider",participant.getProvider_name());
		//session.setAttribute("provider",participant.getProvider_name());
		model.addAttribute("email_exist","false");
		model.addAttribute("mobile_exists","false");
		int user_count=mainDAO.checkuser(participant.getUsername());
		int email_count=mainDAO.checkemail(participant.getEmail_id(),0,null);
		int mobile_count=mainDAO.checkmobile(participant.getMobile_num());
		
		if (result.hasErrors())
		{
			
			
			ParticipantsGroupForm participantGroupForm1 = new ParticipantsGroupForm();
			participantGroupForm1.setParticipantGroups(partDAO.getAllGroups());        
			
			if(email_count==0 && mobile_count==0)
	        {
	        	model.addAttribute("email_exists","true");
	        	model.addAttribute("mobile_exists","true");
	        }
			if(email_count==0)
			{
				logger.info("email exists");
				model.addAttribute("email_exists","true");
				
			}
			if(mobile_count==0)
			{ 
				logger.info("mobile exists");
				model.addAttribute("mobile_exists","true");
							
			}
			if(user_count==0)
			{
				logger.info("user exists");
				model.addAttribute("user_exists","true");
							
			}
			
			model.addAttribute("participantGroupForm1", participantGroupForm1);
	        model.addAttribute("menu","participants");
			return "/registerparticipants";
		}		
		else			
		{
			
			
			if(email_count==0 && mobile_count==0)
	        {
	        	model.addAttribute("email_exists","true");
	        	model.addAttribute("mobile_exists","true");
	        	return "/registerparticipants";
	        }
			
			if(email_count==0)
			{
				logger.info("email exists");
				model.addAttribute("email_exists","true");
				model.addAttribute("menu","participants");
				return "/registerparticipants";
				
			}
			else if(mobile_count==0)
			{ 
				logger.info("mobile exists");
				model.addAttribute("mobile_exists","true");
				model.addAttribute("menu","participants");
				return "/registerparticipants";
							
			}
			else if(user_count==0)
			{
				logger.info("user exists");
				model.addAttribute("user_exists","true");
				model.addAttribute("menu","participants");
				return "/registerparticipants";			
			}
			else
			{
				List<String> groupname=new ArrayList<String>();
				String[] groups=new String[100];
				groups=request.getParameterValues("group_name");		
				int count=groups.length;
				for(int i=0;i<count;i++)
				{
					logger.info("loop groupname"+groups[i]);
				}		
				model.addAttribute("participantsDetailsForm", participant);
				ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
				participantGroupForm.setParticipantGroups(partDAO.getAllGroups());					
		        model.addAttribute("participantGroupForm", participantGroupForm);
		       /* AdminUserForm adminuserform=new AdminUserForm();
		        adminuserform.setAdminuser(adminuserdao.getAdminUser());
		        model.addAttribute("adminuserform",adminuserform);*/
				model.put("participant", participant);		
		//validation valid=new validation();
		String[] errmsges=new String[50];
	    //errmsges=valid.checkParticipant(participant);	
		
				model.put("errmsg",errmsges[0]);					

		int a=mainDAO.setregisterParticipants(participant,providername,groups,0);
		/*if(a==1)
		{
			model.addAttribute("merror",true);
			return "registerparticipants";
		} */
		String participantid=mainDAO.getmaxparticipantid();
		
		 messagelogdao.getMessageLog(participantid);
		 
		 mainDAO.insertWeeklylog();
		//System.out.println("a"+a);

				model.put("success","true");
				
				    model.addAttribute("menu","participants");
				   /* ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
					participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants());
<<<<<<< .mine
			        model.addAttribute("participantsDetailsForm", participantsDetailsForm);	

		model.put("success","true");
		model.addAttribute("menu","participants");
		ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
		participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants());
	    model.addAttribute("participantsDetailsForm", participantsDetailsForm);	

			        model.addAttribute("menu","dashboard");
			        model.addAttribute("noofrows",mainDAO.getParticipants().size());
					return "login";
=======
			        model.addAttribute("participantsDetailsForm", participantsDetailsForm);
		*/
	    model.addAttribute("menu","dashboard");
		//model.addAttribute("noofrows",mainDAO.getParticipants().size());
	    model.addAttribute("Regsuccess","true");
		return "login";

	}
		}}
	
		
	@RequestMapping(value="/viewparticipants", method=RequestMethod.GET)
	public String viewParticipants(HttpServletRequest request,HttpSession session,ModelMap model, Principal principal) {
		model.addAttribute("success","false");
		session.removeAttribute("mobile");
		session.removeAttribute("groupsearch");
		session.removeAttribute("zipcode");
		ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
		participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants());
        model.addAttribute("participantsDetailsForm", participantsDetailsForm);
        model.addAttribute("menu","participants");
        ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);
        model.addAttribute("currentuser",request.getSession().getAttribute("currentuser"));      
        model.addAttribute("noofrows",participantsDetailsForm.getParticipantsDetails().size());       
        participantsDetailsForm.setParticipantsDetails(mainDAO.getlimitedParticipants(1));
		model.addAttribute("noofpages",(int) Math.ceil(mainDAO.getnoofParticipants() * 1.0 / 20));	 
        model.addAttribute("button","viewall");
        model.addAttribute("currentpage",1);
		return "viewparticipants";
	}
	@RequestMapping(value="/viewregisterparticipants", method=RequestMethod.GET)
	public String viewregisterParticipants(HttpServletRequest request,ModelMap model, Principal principal) {
		model.addAttribute("success","false");
		ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
		String participantid=mainDAO.getparticipantid();
		String providername=mainDAO.getprovidername(participantid);
		model.addAttribute("providername",providername);
		participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants(participantid));
		
			
		
        model.addAttribute("participantsDetailsForm", participantsDetailsForm);
        model.addAttribute("menu","participants");
       
		        
        //model.addAttribute("currentuser",request.getSession().getAttribute("currentuser"));
        
		return "viewregisterparticipants";
	}
	
	@RequestMapping(value="/updateparticipantmessage", method=RequestMethod.POST)
	public String updateParticipantmessage(HttpServletRequest request,@ModelAttribute("participant") @Valid ParticipantsDetails participant,
			BindingResult result,ModelMap model,Principal principal) {
		 model.addAttribute("success","false");
		ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
		String Participantid=mainDAO.getparticipantid();
		mainDAO.updateparticipantmessage(participant, Participantid,"personal");
		
		participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants(Participantid));
		model.addAttribute("participantsDetailsForm", participantsDetailsForm);
        model.addAttribute("menu","settings");
        model.addAttribute("success","true");
        /*ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);
        model.addAttribute("currentuser",request.getSession().getAttribute("currentuser"));*/
        
		return "participantsettings";
	}
	
	
	@RequestMapping(value="/deleteparticipants", method=RequestMethod.GET)
	public String removeParticipants(@RequestParam("id") String participant_id,ModelMap model, Principal principal) {
	
		int status=mainDAO.deleteParticipant(participant_id,principal.getName());
		if(status==1)
		{
        model.addAttribute("success","true");
		ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
		participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants());
        model.addAttribute("participantsDetailsForm", participantsDetailsForm);
        model.addAttribute("menu","participants");
		}
		 model.addAttribute("menu","participants");
		return "viewparticipants";
	}
	
	
	//Groups
	
	@RequestMapping(value="/showaddparticipantgroups", method=RequestMethod.GET)
	public String showAddParticipantGroups(HttpSession session,HttpServletRequest request,ParticipantGroups pgroups,ModelMap model) {		
	
		session.removeAttribute("participantgroup");		
		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);        
		//partDAO.setParticipantGroup(pgroups);	
        model.addAttribute("success","false");
        model.addAttribute("menu","groups");
		return "addparticipantgroups";
	}
	
	
	@RequestMapping(value="/addparticipantgroups", method=RequestMethod.POST)
	public String NewParticipantGroups(HttpSession session,HttpServletRequest request,@ModelAttribute("pgroups") @Valid ParticipantGroups pgroups,
			BindingResult result,ModelMap model,Principal principal) {
		session.setAttribute("participantgroup",pgroups);		
		model.addAttribute("Group_exists","false");
		
		
		int group_count=partDAO.checkGroupname(pgroups.getgroup_name());
		
		if(result.hasErrors())
		{
			
			
			            ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
				        participantGroupForm.setParticipantGroups(partDAO.getGroups());
                        model.addAttribute("participantGroupForm", participantGroupForm);
                        if(group_count==0)
                        {
                        	logger.info("Group exists");
        				model.addAttribute("Group_exists","true");
                        }
			            model.addAttribute("menu","groups");
			            return "addparticipantgroups";
			}
		else
		
			{
				if(group_count==0)
				{
					logger.info("group exists");
					model.addAttribute("Group_exists","true");
					
					model.addAttribute("menu","groups");
					return "/addparticipantgroups";
					
				}
         ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
 		participantGroupForm.setParticipantGroups(partDAO.getGroups());
         model.addAttribute("participantGroupForm", participantGroupForm);
         partDAO.setParticipantGroup(pgroups);   
         
            AdminActivityForm adminActivityForm = new AdminActivityForm();
	        adminActivityForm.setAdminActivity(activityDAO.getAdminActivity());
	        model.addAttribute("adminActivityForm","adminActivityForm");
	        activityDAO.setAdminActivity(principal.getName(),"Added Group " +pgroups.getgroup_name());



                 
         //pagination 
         model.addAttribute("currentuser",request.getSession().getAttribute("currentuser"));      
         model.addAttribute("noofrows",participantGroupForm.getParticipantGroups().size());       
         participantGroupForm.setParticipantGroups(partDAO.getlimitedParticipants_group(1));
 		model.addAttribute("noofpages",(int) Math.ceil(partDAO.getnoofParticipants_group() * 1.0 /20));
 		
         model.addAttribute("button","viewall");
         model.addAttribute("currentpage",1);
         model.addAttribute("success","true");
         model.addAttribute("menu","groups");
         //end pagination
        
		return "viewparticipantgroups";

		}
	}
	@RequestMapping(value="/addparticipantgroups", method=RequestMethod.GET)
	public String AddParticipantGroups(HttpSession session,HttpServletRequest request,ParticipantGroups pgroups,ModelMap model) {
		model.addAttribute("success","false");
		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);
		//partDAO.setParticipantGroup(pgroups);
        model.addAttribute("menu","groups");
        session.removeAttribute("participantgroup");
		return "addparticipantgroups";
	}
	
	
	
	@RequestMapping(value="/viewparticipantgroups", method=RequestMethod.GET)
	public String viewParticipantGroups(HttpServletRequest request,ModelMap model) {
		model.addAttribute("success","false");
		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm); 
        model.addAttribute("menu","groups");
        
        //pagination 
        model.addAttribute("currentuser",request.getSession().getAttribute("currentuser"));      
        model.addAttribute("noofrows",participantGroupForm.getParticipantGroups().size());       
        participantGroupForm.setParticipantGroups(partDAO.getlimitedParticipants_group(1));
		model.addAttribute("noofpages",(int) Math.ceil(partDAO.getnoofParticipants_group() * 1.0 / 20));
		
        model.addAttribute("button","viewall");
        model.addAttribute("currentpage",1);
        //end pagination
        
        
        
		return "viewparticipantgroups";
	}
	
	@RequestMapping(value="/showaddadminuser", method=RequestMethod.GET)
	public String showAddadminUser(HttpSession session,HttpServletRequest request,ModelMap model) {
		 session.removeAttribute("admin");
		model.addAttribute("menu","adminuser");
		return "addadminuser";
	}
	/*@RequestMapping(value="/viewadminuser", method=RequestMethod.GET)
	public String viewAdminUser(ModelMap model) {
		
		return "viewadminuser";
	}*/
	/*
	@RequestMapping(value="/activityofadmin", method=RequestMethod.GET)
	public String activityOfAdmin(HttpServletRequest request,ModelMap model) {
		
		return "activityofadmin";
	}*/
	@RequestMapping(value="/editregisterparticipant", method=RequestMethod.GET)
	public String editregisterparticipantsettings(HttpSession session,HttpServletRequest request,ModelMap model) {
		ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();		
		session.removeAttribute("participants");
		String participants_id=mainDAO.getparticipantid();		
		String name;
		name=mainDAO.getproviders(participants_id);
		model.addAttribute("provider",name);
		participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants(participants_id));		
		model.addAttribute("participantsDetailsForm", participantsDetailsForm);
		List<String>  strlist=new ArrayList<String>(); 
		List<String>  strlist1=new ArrayList<String>(); 		
		
	    /*participantGroupForm.setParticipantGroups(partDAO.getGroups1(user.getName()));
		model.addAttribute("participantGroupForm", participantGroupForm);*/
		strlist=partDAO.getGroups(name);
		//session.setAttribute("groups",strlist);
		model.addAttribute("groups",strlist);
		strlist1=partDAO.getparticipantGroups(participants_id);
		//session.setAttribute("group",strlist1);
		model.addAttribute("group",strlist1);		  
	    int counter = 0;
		int length = Math.min(strlist.size(), strlist1.size());
		model.addAttribute("length",length);		
		AdminUserForm adminuserform=new AdminUserForm();
        adminuserform.setAdminuser(adminuserdao.getAdminUser());
        model.addAttribute("adminuserform",adminuserform);
		//model.addAttribute("participantGroupForm", participantGroupForm);	
        model.addAttribute("menu","participants"); 
        return "editregisterparticipant";
	}
	@RequestMapping(value="/participantsettings", method=RequestMethod.GET)
	public String participantsettings(HttpServletRequest request,ModelMap model) {
		
		String Participantid=mainDAO.getparticipantid();
		ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
		participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants(Participantid));
		model.addAttribute("participantsDetailsForm", participantsDetailsForm);
       
		model.addAttribute("menu","settings");
		return "participantsettings";
	}
	
	@RequestMapping(value = "/textmsgsettings", method = RequestMethod.GET)
	public String textMsgSettings(HttpServletRequest request, ModelMap map) {
		TextMsgSettingsForm form = new TextMsgSettingsForm();
		form.setTextMsgSettings(mailTemplateDAO.getMsgSettings());
		map.addAttribute("form", form);
		map.addAttribute("menu","settings");
		logger.info("textmessage");
        map.addAttribute("success","false");
		return "textmsg";
	}
	
@RequestMapping(value="/textMsgSettings", method= RequestMethod.POST)
public String saveSettings(HttpServletRequest request,@ModelAttribute("textMsgSettings") @Valid TextMsgSettings textMsgSettings,BindingResult result,ModelMap map, Principal principal){
	
	if(result.hasErrors())
	{
		return "textmsg";
	}
	else
	{
	
	
	int status=mailTemplateDAO.updateMsgSettings(textMsgSettings);
	TextMsgSettingsForm textMsgSettingsForm=new TextMsgSettingsForm();
	mailTemplateDAO.updateMsgSettings(textMsgSettings);
	
	textMsgSettingsForm.setTextMsgSettings(mailTemplateDAO.getMsgSettings());
	map.addAttribute("form", textMsgSettingsForm);
	map.addAttribute("success", "true");
	map.addAttribute("menu","settings");
	return "textmsg";
	}
	
}
	
	@RequestMapping(value="/changepassword",method=RequestMethod.GET)
	public String changemypassword(HttpServletRequest request,ModelMap model)
	{
		model.addAttribute("menu","pwd");
		model.addAttribute("menu","settings");
		return "changepwd";
	}
	
	@RequestMapping(value="/findParticipant",method=RequestMethod.GET)
	public String findparticipant(HttpServletRequest request,HttpSession session,@RequestParam("mobile") String mobile,@RequestParam("groupname") String groupname,@RequestParam("city") String city,ModelMap model)
	{
		session.setAttribute("mobile", mobile);
		session.setAttribute("groupsearch", groupname);
		session.setAttribute("zipcode",city);
		if(mobile==""&&groupname==""&&city=="")
		{
			ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
			participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants());
	        model.addAttribute("participantsDetailsForm", participantsDetailsForm);
	        model.addAttribute("menu","participants");
	        ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
			participantGroupForm.setParticipantGroups(partDAO.getGroups());
	        model.addAttribute("participantGroupForm", participantGroupForm);
			return "viewparticipants";
		}
		else
		{
		ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
		participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants(mobile, groupname, city));
        model.addAttribute("participantsDetailsForm", participantsDetailsForm);
        model.addAttribute("menu","participants");
        ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);
		return "viewparticipants";
		}
		
	}
	
	
	//editparticipants
	
	
	
	@RequestMapping(value="/editparticipant", method=RequestMethod.GET)
	public String editParticipant(HttpSession session,HttpServletRequest request,@RequestParam("id") String participants_id,ModelMap model,ParticipantsDetails participant)
	{
	
		session.removeAttribute("addparticipants");
		ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
        participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants(participants_id));
		model.addAttribute("participantsDetailsForm", participantsDetailsForm);
		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();		
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);
		List<String> group=new ArrayList<String>();
		group=partDAO.getparticipantGroups(participants_id);
		model.addAttribute("group",group);	
        model.addAttribute("menu","participants");
		return "edit_participants";
	}
	
	
	
	@RequestMapping(value="/updateparticipant", method=RequestMethod.POST)
	public String updateParticipant(HttpSession session,HttpServletRequest request,@ModelAttribute("participant") @Valid ParticipantsDetails participant,
			BindingResult result,ModelMap model,Principal principal)
	{		
		//System.out.println("grou");
		session.setAttribute("addparticipants", participant);
		int email_count=mainDAO.checkemail(participant.getEmail_id(),1,participant.getUsername());
		int mobile_count=mainDAO.checkmobile(participant.getMobile_num(),1,participant.getParticipants_id());

		ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
		System.out.print("abcd"+participant.getParticipants_id()); 
            participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants(participant.getParticipants_id()));	               
            model.addAttribute("participantsDetailsForm", participantsDetailsForm);	 
		if (result.hasErrors())
		{
			String[] groupnames=request.getParameterValues("group_name");
			model.addAttribute("groupnames", groupnames);
			        
			if(email_count==0 && mobile_count==0)
			{
				model.addAttribute("email_exist","true");
				model.addAttribute("menu","participants");
				model.addAttribute("mobile_exists","true");
				model.addAttribute("menu","participants");
						
			}
			
			else if(email_count==0)
					{
				logger.info("email exists");
						model.addAttribute("email_exist","true");
						
					}
			else if(mobile_count==0)
					{ 
				logger.info("mobile exists");
						model.addAttribute("mobile_exists","true");
									
					} 				
			
			
			List<String> group=new ArrayList<String>();
			group=partDAO.getparticipantGroups(participant.getParticipants_id());
			model.addAttribute("group",group);	
			
		
	            ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
				participantGroupForm.setParticipantGroups(partDAO.getGroups());				
				
				model.addAttribute("participantGroupForm", participantGroupForm);
				
				
		        return "edit_participants";
		}
		
		else			
		{
			
			
			ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
			participantGroupForm.setParticipantGroups(partDAO.getGroups());				
			model.addAttribute("participantGroupForm", participantGroupForm);
					
			if(email_count==0 && mobile_count==0)
			{
				model.addAttribute("email_exist","true");
				model.addAttribute("menu","participants");
				model.addAttribute("mobile_exists","true");
				model.addAttribute("menu","participants");
				return "edit_participants";
				
			}
			
			if(email_count==0)
			{
				logger.info("email exists");
				model.addAttribute("email_exist","true");
				model.addAttribute("menu","participants");
				return "edit_participants";
						
			}
			else if(mobile_count==0)
			{ 
				logger.info("mobile exists");
				model.addAttribute("mobile_exists","true");
				model.addAttribute("menu","participants");
				return "edit_participants";
							
			}		
		
		String groups[]=request.getParameterValues("group_name");
		int status=mainDAO.updateParticipants(participant, participant.getParticipants_id(),principal.getName(),groups,1);
		String participantid=participant.getParticipants_id();
		messagelogdao.getMessageLog(participantid);
	
		//ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
        participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants());
        model.addAttribute("participantsDetailsForm", participantsDetailsForm);
        
        AdminActivityForm adminActivityForm = new AdminActivityForm();
        adminActivityForm.setAdminActivity(activityDAO.getAdminActivity());
        model.addAttribute("adminActivityForm","adminActivityForm");
        activityDAO.setAdminActivity(principal.getName(),"updated Participant " +participant.getFname());
		   
	        model.addAttribute("menu","participants");
	        model.addAttribute("success","true");
		return "viewparticipants";
		}
	}
	@RequestMapping(value="/updateregisterparticipant", method=RequestMethod.POST)
	public String updateregisterParticipant(HttpSession session,HttpServletRequest request,@ModelAttribute("participant") @Valid ParticipantsDetails participant,
			BindingResult result,ModelMap model,Principal principal)
	{
		
		
		
		String fname=request.getParameter("fname");
		session.setAttribute("participants",participant);	
		
		String providername=request.getParameter("Provider_name");
		session.setAttribute("editregister",participant.getFname());
		model.addAttribute("providername",providername);
		
		
		model.addAttribute("email_exist","false");
		model.addAttribute("mobile_exists","false");
		//int user_count=mainDAO.checkuser(participant.getusername());
		int email_count=mainDAO.checkemail(participant.getEmail_id(),1,participant.getUsername());
		int mobile_count=mainDAO.checkmobile(participant.getMobile_num(),1,participant.getParticipants_id());
		ParticipantsDetailsForm participantsDetailsForm=new ParticipantsDetailsForm();
		participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants(participant.getParticipants_id()));		
		model.addAttribute("participantsDetailsForm", participantsDetailsForm);
		if (result.hasErrors())
		{
			
			String[] groupnames=request.getParameterValues("group_name");
			model.addAttribute("groupnames", groupnames);
			ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
			participantGroupForm.setParticipantGroups(partDAO.getGroups()); 
			
			if(email_count==0 && mobile_count==0 )
			{
				model.addAttribute("email_exist","true");
				model.addAttribute("mobile_exists","true");
			}
			else if(email_count==0)
			{
				logger.info("email exists");
				model.addAttribute("email_exist","true");
				
			}
			else if(mobile_count==0)
			{ 
				logger.info("mobile exists");
				model.addAttribute("mobile_exists","true");
							
			}
			/*if(user_count==0)
			{
				System.out.println("user exists");
				model.addAttribute("user_exists","true");
							
			}*/
			AdminUserForm adminuserform=new AdminUserForm();
	        adminuserform.setAdminuser(adminuserdao.getAdminUser());
	        model.addAttribute("adminuserform",adminuserform);
			model.addAttribute("participantGroupForm", participantGroupForm);
	        model.addAttribute("menu","participants");
			return "/editregisterparticipant";
		}		
		else			
		{
			
			
			if(email_count==0 && mobile_count==0 )
			{
				model.addAttribute("email_exist","true");
				model.addAttribute("menu","participants");
				return "/editregisterparticipant";
			}
			if(email_count==0)
			{
				logger.info("email exists");
				model.addAttribute("email_exist","true");
				model.addAttribute("menu","participants");
				return "/editregisterparticipant";
				
			}
			else if(mobile_count==0)
			{ 
				logger.info("mobile exists");
				model.addAttribute("mobile_exists","true");
				model.addAttribute("menu","participants");
				return "/editregisterparticipant";
							
			}
			/*else if(user_count==0)
			{
				System.out.println("user exists");
				model.addAttribute("user_exists","true");
				model.addAttribute("menu","participants");
				return "/editregisterparticipant";			
			}*/
			else
			{
	
		
		String participants=mainDAO.getparticipantid();
		
        AdminUserForm adminuserform=new AdminUserForm();
        adminuserform.setAdminuser(adminuserdao.getAdminUser());  
        String[] groups=request.getParameterValues("group_name");
        
		int status=mainDAO.updateregisterParticipants(participant, participant.getParticipants_id(),providername,groups,0);
		
		 String participantid=participant.getParticipants_id();
		 messagelogdao.getMessageLog(participantid);		
		model.addAttribute("adminuserform",adminuserform);	  
		
	    participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants(participants));
		model.addAttribute("participantsDetailsForm", participantsDetailsForm);
		    ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
			participantGroupForm.setParticipantGroups(partDAO.getGroups());
	        model.addAttribute("participantGroupForm", participantGroupForm);
	        model.addAttribute("menu","participants");
	        model.addAttribute("success","true");
	        
	        AdminActivityForm adminActivityForm = new AdminActivityForm();
	        adminActivityForm.setAdminActivity(activityDAO.getAdminActivity());
	        model.addAttribute("adminActivityForm","adminActivityForm");
	        activityDAO.setAdminActivity(principal.getName(),"Updated Participants "+participant.getFname());
	       /* if (result.hasErrors())
			{
				ParticipantsDetailsForm participantsDetailsForm1 = new ParticipantsDetailsForm();
		        participantsDetailsForm1.setParticipantsDetails(mainDAO.getParticipants(participant.getParticipants_id()));
		        model.addAttribute("participantsDetailsForm1", participantsDetailsForm1);
				   
					participantGroupForm.setParticipantGroups(partDAO.getGroups());
			        model.addAttribute("participantGroupForm", participantGroupForm);	
			        model.addAttribute("menu","participants");
			        return "edit_participants";
			}*/
		return "viewregisterparticipants";
	
			}}
		}

	
	
	//Delete ParticipantGroups
	
	@RequestMapping(value="/deleteparticipantgroup", method=RequestMethod.GET)
	public String deleteParticipantgroup(HttpServletRequest request,@RequestParam("id") String group_id,ModelMap model,ParticipantGroups pgroups, Principal principal)
	{
		String group_name=partDAO.getGroupName(group_id);
		int status=partDAO.deleteParticipantgroup(group_id,principal.getName());
		if(status==1)
		{
	    model.addAttribute("success","true");
		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm); 
        partDAO.deleteParticipantgroup(group_id,principal.getName());
        AdminActivityForm adminActivityForm = new AdminActivityForm();
        adminActivityForm.setAdminActivity(activityDAO.getAdminActivity());
        model.addAttribute("adminActivityForm","adminActivityForm");
       
        activityDAO.setAdminActivity(principal.getName(),"Deleted Group" +group_name);
        model.addAttribute("menu","participants");
		}
		
		 model.addAttribute("menu","groups");
		return "viewparticipantgroups";
	}
	
	
	@RequestMapping(value="/deleteparticipantgroup", method=RequestMethod.POST)
	public String deleteParticipantgroup(HttpServletRequest request,ModelMap model,ParticipantGroups pgroups, Principal principal)
	{
	
		int status = 0;
		String[] SelectedIDs=new String[100];
		SelectedIDs=request.getParameterValues("chkUser");
		for(String id:SelectedIDs)
		{
		status=partDAO.deleteParticipantgroup(id,principal.getName());
		}
		
		if(status==1)
		{
	    model.addAttribute("success","true");
		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm); 
		}
		 model.addAttribute("menu","groups");
		return "viewparticipantgroups";
	}
	
	
	
	@RequestMapping(value="/participantdetails", method=RequestMethod.GET)
	public String participantdetails(HttpServletRequest request,@RequestParam("id") String participants_id,@RequestParam("back") String back,ModelMap model,ParticipantsDetails participant)
	{
		ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
        participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants(participants_id));
		model.addAttribute("participantsDetailsForm", participantsDetailsForm);
		
		model.addAttribute("currentuser",request.getSession().getAttribute("currentuser"));
		/*ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);	*/      
    
		if(back.equals("dashboard"))
		{ model.addAttribute("menu","dashboard");		
		}
		else if(back.equals("viewparticipant"))
		{ model.addAttribute("menu","participants");			
		}
        return "participantdetails";
	}
	
	@RequestMapping(value="/groupdetails", method=RequestMethod.GET)
	public String groupdetails(HttpServletRequest request,@RequestParam("id") String group_id,ModelMap model,ParticipantsDetails participant)
	{
		ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getparticularGroups(group_id));
        model.addAttribute("participantGroupForm", participantGroupForm); 
        model.addAttribute("menu","groups");
		return "groupdetails";
	}
	
	
	
	
	
	
	@RequestMapping(value="/viewparticipant_page", method=RequestMethod.GET)
	public String pageParticipants(HttpServletRequest request,@RequestParam("page") int page,ModelMap model) {	
		
	    ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
		participantsDetailsForm.setParticipantsDetails(mainDAO.getlimitedParticipants(page));
		model.addAttribute("noofpages",(int) Math.ceil(mainDAO.getnoofParticipants() * 1.0 / 20));
	    model.addAttribute("participantsDetailsForm", participantsDetailsForm);
	    ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);
        model.addAttribute("noofrows",mainDAO.getParticipants().size());
        model.addAttribute("currentpage",page);
        model.addAttribute("menu","dashboard");
        model.addAttribute("button","viewall");
		return "dashboard";
		
	}	
	
	
	
	@RequestMapping(value="/viewparticipants_page", method=RequestMethod.GET)
	public String pagesParticipants(HttpServletRequest request,@RequestParam("page") int page,ModelMap model) {	
		
	    ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
		participantsDetailsForm.setParticipantsDetails(mainDAO.getlimitedParticipants(page));
		model.addAttribute("noofpages",(int) Math.ceil(mainDAO.getnoofParticipants() * 1.0 / 20));
	    model.addAttribute("participantsDetailsForm", participantsDetailsForm);
	    
	    ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);
       
        model.addAttribute("noofrows",mainDAO.getParticipants().size());
        model.addAttribute("currentpage",page);
        model.addAttribute("menu","participants");
        model.addAttribute("button","viewall");
		return "viewparticipants";
		
	}	
	
	
	@RequestMapping(value="/viewparticipantgroup_page", method=RequestMethod.GET)
	public String pagesParticipants_group(HttpServletRequest request,@RequestParam("page") int page,ModelMap model) {	
		
	    ParticipantsGroupForm participantGroupForm=new ParticipantsGroupForm();
	    participantGroupForm.setParticipantGroups(partDAO.getlimitedParticipants_group(page));
	   	model.addAttribute("noofpages",(int) Math.ceil(partDAO.getnoofParticipants_group() * 1.0 / 20));
	    model.addAttribute("participantGroupForm", participantGroupForm); 
        model.addAttribute("noofrows",partDAO.getGroups().size());
        model.addAttribute("currentpage",page);
        model.addAttribute("menu","groups");
        model.addAttribute("button","viewall");
		return "viewparticipantgroups";
		
	}	
	
	
	
	
	@RequestMapping(value="/deleteSelectedparticipants", method=RequestMethod.POST)
	public String deleteSelectedParticipants(HttpServletRequest request,ModelMap model,ParticipantsDetails participant,Principal principal) 
	{	
		String[] SelectedIDs=new String[100];
		SelectedIDs=request.getParameterValues("chkUser");
		for(String id:SelectedIDs)
		{
		mainDAO.deleteParticipant(id,principal.getName());
		}
		ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
		participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants());
	    model.addAttribute("participantsDetailsForm", participantsDetailsForm);
	    
	    AdminActivityForm adminActivityForm = new AdminActivityForm();
        adminActivityForm.setAdminActivity(activityDAO.getAdminActivity());
        model.addAttribute("adminActivityForm","adminActivityForm");
        activityDAO.setAdminActivity(principal.getName(),"Deleted Participants "+participant.getFname());
        
        model.addAttribute("menu","participants");
		return "viewparticipants";
		
	}	
	
	
	
	@RequestMapping(value="/sendforgotpassword", method=RequestMethod.POST)
	public String sendforgot_password(HttpServletRequest request,ModelMap model) 
	{	
		
		if(!request.getParameter("email_id").equals(""))
		{
		int status=mainDAO.sendForgotpassword(request.getParameter("email_id"));
		
		if(status==1)
		{
			model.addAttribute("success","true");
			try{
	        //	messageSender.sendSMS("6144169072", "Deemsys test");
	        }
			catch(Exception e){e.printStackTrace();}
	        model.addAttribute("passwordsuccess",true);
	        model.addAttribute("menu","settings");
			 return "login"; 
		}
		else
		{
			model.addAttribute("success","false");
			model.addAttribute("error","Emailid not exists");
			model.addAttribute("menu","settings");
			return "forgotpwd";
		}
		}
		else
		{
			model.addAttribute("success","false");
			model.addAttribute("error","Required Field should not empty");
			model.addAttribute("menu","settings");
			return "forgotpwd";
		}
		 
		//------------------------------------------------------------------------//
	/*	
		String mail=request.getParameter("email_id").toString();
	    System.out.println(mail);
		logger.info("--Before Sending--"); //Logger Test
        //Email Test
        emailSender.sendEmail(mail, "learnguild@gmail.com", "Hi");
        logger.info("--After Sent--");
        model.addAttribute("success","true");
        
        try{
        	messageSender.sendSMS("6144670389", "Deemsys test");
        }catch(Exception e){e.printStackTrace();}
        
        */
      //------------------------------------------------------------------------//
        
        
      
		
		
		
	}	
	
	
	@RequestMapping(value ="/changePassword",method=RequestMethod.POST)
	public String addNewPwd(HttpServletRequest request,@ModelAttribute("updatePwds") @Valid UpdatePwd updatePwds,BindingResult result,ModelMap model,Principal principal){
		if(result.hasErrors()){
			
			model.addAttribute("menu","pwd");
			return "changepwd";
		}

		//model.put("updatePwds", "updatePwds");
		//UpdatePwdForm updatePwdForm=new UpdatePwdForm();
		String s1=mailTemplateDAO.getCurrentPwd();
		if(updatePwds.getNew_pwd().equals(updatePwds.getRetype_new_pwd()))
		{
		if(s1.equals(updatePwds.getCurrent_pwd()))
		{
			model.put("password_mismatch", "false");
			logger.debug("Password changed successfully");
			mailTemplateDAO.updateoldPwd(updatePwds);
			model.addAttribute("menu","pwd");
			int role=mainDAO.getrole();
			if(role!=0)
			{
				ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
				participantsDetailsForm.setParticipantsDetails(mainDAO.getlimitedParticipants(1));
		        model.addAttribute("participantsDetailsForm", participantsDetailsForm);
		        model.addAttribute("success","true");
				return "dashboard";
			}
			else
			{
				ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
				String participantid=mainDAO.getparticipantid();
				String providername=mainDAO.getprovidername(participantid);
				model.addAttribute("providername",providername);
				participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants(participantid));
				
					
				
		        model.addAttribute("participantsDetailsForm", participantsDetailsForm);
		        model.addAttribute("menu","participants");
		       
				model.addAttribute("success","true");
				return "viewregisterparticipants";
			}
				
			
		}
		else
		{
			logger.debug("Password change failed");
			model.put("password_mismatch", "true");
			model.addAttribute("menu","pwd");
			
			return "changepwd";
		}
		}
		else
		{
			logger.debug("Password change failed");
			model.put("retype_mismatch", "true");
			model.addAttribute("menu","pwd");
			
			return "changepwd";
		}
		
	}
	
	@RequestMapping(value="/viewresponse", method=RequestMethod.GET)
	public String viewResponse(HttpServletRequest request,@RequestParam("id") String participants_id,ModelMap model,ParticipantsDetails participant)
	{
		
		
		ResponseForm resposeForm=new ResponseForm();
		resposeForm.setResponse(responseDAO.getResponse(participants_id));
		model.addAttribute("responseForm", resposeForm);
		model.addAttribute("currentuser",request.getSession().getAttribute("currentuser"));
		/*ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);	*/      
    
		/*if(back.equals("dashboard"))
		{ model.addAttribute("menu","dashboard");		
		}
		else if(back.equals("viewparticipant"))
		{ model.addAttribute("menu","participants");			
		}*/
        return "viewresponse";
	}
	
	@RequestMapping(value="/viewanswers", method=RequestMethod.GET)
	public String viewAnswer(HttpServletRequest request,@RequestParam("id") String response_id,ModelMap model,ParticipantsDetails participant)
	{
		
	ParticipantAnswersForm participantAnswersForm=new ParticipantAnswersForm();
	participantAnswersForm.setParticipantAnswers(participantAnswersDAO.getResponse(response_id));		
		model.addAttribute("participantAnswersForm", participantAnswersForm);
		model.addAttribute("currentuser",request.getSession().getAttribute("currentuser"));
		List<String> audio=new ArrayList<String>();
		audio=participantAnswersDAO.getweeklylogs(response_id);
		for(String name:audio)
		{
			System.out.println("audiopath"+name);
		}
		model.addAttribute("audio",audio);
			
		/*ParticipantsGroupForm participantGroupForm = new ParticipantsGroupForm();
		participantGroupForm.setParticipantGroups(partDAO.getGroups());
        model.addAttribute("participantGroupForm", participantGroupForm);	*/      
    
		/*if(back.equals("dashboard"))
		{ model.addAttribute("menu","dashboard");		
		}
		else if(back.equals("viewparticipant"))
		{ model.addAttribute("menu","participants");			
		}*/
        return "viewanswers";
	}
  }