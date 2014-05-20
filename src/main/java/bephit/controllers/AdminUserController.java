package bephit.controllers;
 
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.springframework.validation.BindingResult;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
@SessionAttributes({"currentuser","admin"})
public class AdminUserController

{
	@Autowired  
	MainDAO mainDAO;
	
	protected static Logger logger=org.slf4j.LoggerFactory.getLogger("logs");
	@Autowired
	AdminUserDAO adminuserDAO;
	
	
	@RequestMapping(value="/addadminuser", method=RequestMethod.POST)
	public String addnewadminuser(HttpSession session,HttpServletRequest request,@ModelAttribute("adminuser") @Valid AdminUser adminuser,
			BindingResult result,ModelMap model,Principal principal)
	{
		session.setAttribute("admin",adminuser);
		int user_count=mainDAO.checkuser(adminuser.getAdmin_username());
		int email_count=mainDAO.checkemail(adminuser.getAdmin_email(),0,null);
		int secondary_email=mainDAO.checksecondaryemail(adminuser.getSecondary_email(),0,null);
		int mobile_count=adminuserDAO.checkmobile(adminuser.getAdmin_mobile(),0,null);
		if (result.hasErrors())
		{
			
		   model.addAttribute("menu","adminuser");
			
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
				else if(secondary_email==0)
				{
					logger.info("email exists");
					model.addAttribute("semail_exist","true");
					
				}
				
				else if(mobile_count==0)
				{ 
					logger.info("mobile exists");
					model.addAttribute("mobile_exists","true");
								
				}
				if(user_count==0)
				{
					System.out.println("user exists");
					model.addAttribute("user_exists","true");
								
				}
				 return "addadminuser";
		}
		
		if(email_count==0 && mobile_count==0 )
		{
			model.addAttribute("email_exist","true");
			model.addAttribute("mobile_exists","true");
			return "addadminuser";
		}
		else if(email_count==0)
		{
			logger.info("email exists");
			model.addAttribute("email_exist","true");
			return "addadminuser";
			
		}
		else if(secondary_email==0)
		{
			logger.info("email exists");
			model.addAttribute("semail_exist","true");
			return "addadminuser";
			
		}
		else if(mobile_count==0)
		{ 
			logger.info("mobile exists");
			model.addAttribute("mobile_exists","true");
			return "addadminuser";
						
		}
		if(user_count==0)
		{
			System.out.println("user exists");
			model.addAttribute("user_exists","true");
			return "addadminuser";
						
		}

		session.removeAttribute("admin");
		
		AdminUserForm adminuserForm = new AdminUserForm();
		adminuserForm.setAdminuser(adminuserDAO.getAdminUser());
        model.addAttribute("adminuserForm", adminuserForm);	
		model.addAttribute("currentuser",request.getSession().getAttribute("currentuser"));
		adminuserDAO.setAdminUser(adminuser,principal.getName());
	    model.addAttribute("providerregsuccess","true");
		model.addAttribute("menu","adminuser");
		return "viewadminuser";
	}
	
	@RequestMapping(value="/addadminuser", method=RequestMethod.GET)
	public String showaddnewadminuser(HttpSession session,HttpServletRequest request,ModelMap model,Principal principal)
	{
       // session.invalidate();
		session.removeAttribute("admin");
		model.put("success", "false");
		  model.addAttribute("menu","adminuser");
		  model.addAttribute("currentuser",request.getSession().getAttribute("currentuser"));
		return "addadminuser";
	}

	@RequestMapping(value="/viewadminuser",method=RequestMethod.GET)
	public String viewadminusers(HttpServletRequest request,ModelMap model)
	{
		
		AdminUserForm adminuserForm = new AdminUserForm();
		adminuserForm.setAdminuser(adminuserDAO.getAdminUser());
        model.addAttribute("adminuserForm", adminuserForm);	
        model.addAttribute("menu","adminuser");
        model.addAttribute("currentuser",request.getSession().getAttribute("currentuser"));
            
	     model.addAttribute("noofrows",adminuserForm.getAdminuser().size());       
	    adminuserForm.setAdminuser(adminuserDAO.getlimitedadminuser(1));
			model.addAttribute("noofpages",(int) Math.ceil(adminuserDAO.getnoofadminuser() * 1.0 / 20));	 
	        model.addAttribute("button","viewall");
	        model.addAttribute("success","false");
	        model.addAttribute("currentpage",1);
		return "viewadminuser";
	}
	
	@RequestMapping(value="/viewadminuser_page", method=RequestMethod.GET)
	public String pagesadminuser(HttpServletRequest request,@RequestParam("page") int page,ModelMap model) {	
		
		AdminUserForm adminuserForm = new AdminUserForm();
		adminuserForm.setAdminuser(adminuserDAO.getlimitedadminuser(page));
		
	   	model.addAttribute("noofpages",(int) Math.ceil(adminuserDAO.getnoofadminuser() * 1.0 / 20));
	    model.addAttribute("adminuserForm", adminuserForm);	
	   	model.addAttribute("noofrows",adminuserForm.getAdminuser().size());   
        model.addAttribute("currentpage",page);
        model.addAttribute("menu","adminuser");
        model.addAttribute("button","viewall");
		return "viewadminuser";
		
	}	
	
	@RequestMapping(value={"/", "/viewalladminuser"}, method = RequestMethod.GET)
	public String viewalladminuser(HttpServletRequest request,ModelMap model, Principal principal ) {
		
		AdminUserForm adminuserForm = new AdminUserForm();
		adminuserForm.setAdminuser(adminuserDAO.getAdminUser());
		
		  model.addAttribute("adminuserForm", adminuserForm);	
		model.addAttribute("noofrows",adminuserForm.getAdminuser().size());    
       
        model.addAttribute("menu","adminuser");
        model.addAttribute("button","close");
        model.addAttribute("currentpage",1);
model.addAttribute("noofpages",1);
	        model.addAttribute("menu","adminuser");
	        model.addAttribute("success","false");
	        model.addAttribute("button","close");
			return "viewadminuser";
 
	}
	
	
	@RequestMapping(value="/deleteadminuser", method=RequestMethod.GET)
	public String removeadminuser(@RequestParam("id") String admin_id,ModelMap model, Principal principal) {
	
	
		List<String> participant_id=new ArrayList<String>();
		String provider_name=adminuserDAO.get_pname(admin_id);		
		participant_id=adminuserDAO.getpariticpantidby_pname(provider_name);	
		for (String participantid: participant_id) {
			mainDAO.deleteParticipant(participantid,provider_name);
		}	
		int status=adminuserDAO.deleteAdminUser(admin_id,principal.getName());//.deleteParticipant(participant_id);
		model.addAttribute("success","true");
		AdminUserForm adminuserForm = new AdminUserForm();
		adminuserForm.setAdminuser(adminuserDAO.getAdminUser());
        model.addAttribute("adminuserForm",adminuserForm);
        model.addAttribute("menu","adminuser");			
		return "viewadminuser";
	}	
	
	@RequestMapping(value="/editadminuser", method=RequestMethod.GET)
	public String editadminuser(HttpServletRequest request,@RequestParam("id") String admin_id,ModelMap model, Principal principal) {
	
		AdminUserForm adminuserForm = new AdminUserForm();
		adminuserForm.setAdminuser(adminuserDAO.getAdminUser(admin_id));
        model.addAttribute("adminuserForm",adminuserForm);
        model.addAttribute("menu","adminuser");
       
        return "editadminuser";
	}
	
	
	@RequestMapping(value="/updateadminuser", method=RequestMethod.POST)
	public String updateParticipants(@ModelAttribute("adminuser") @Valid AdminUser adminuser,BindingResult result,ModelMap model, Principal principal) {
		model.addAttribute("success","false");
		//.deleteParticipant(participant_id);
		int user_count=mainDAO.checkuser(adminuser.getAdmin_username());
		int email_count=mainDAO.checkemail(adminuser.getAdmin_email(),1,null);
		int secondary_email=mainDAO.checksecondaryemail(adminuser.getSecondary_email(),1,null);
		int mobile_count=adminuserDAO.checkmobile(adminuser.getAdmin_mobile(),1,adminuser.getAdmin_id());
		if (result.hasErrors())
		{
			if(email_count==0)
			{
				logger.info("email exists");
				model.addAttribute("email_exist","true");
				
			}
			if(secondary_email==0)
			{
				logger.info("email exists");
				
				model.addAttribute("semail_exist","true");
				
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
			
			model.addAttribute("adminuser", adminuser);	
			AdminUserForm adminuserForm = new AdminUserForm();
			adminuserForm.setAdminuser(adminuserDAO.getAdminUser(adminuser.getAdmin_id()));
	        model.addAttribute("adminuserForm",adminuserForm);
	        model.addAttribute("menu","adminuser");
	        return "editadminuser";
		}
		if(email_count==0)
		{
			logger.info("email exists");
			model.addAttribute("email_exist","true");
			
		}
		if(secondary_email==0)
		{
			logger.info("semail exists");
			model.addAttribute("semail_exist","true");
			
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
		
		int status=adminuserDAO.updateAdminUser(adminuser,principal.getName());
		AdminUserForm adminuserForm = new AdminUserForm();
		adminuserForm.setAdminuser(adminuserDAO.getAdminUser());
        model.addAttribute("adminuserForm",adminuserForm);
        model.addAttribute("menu","adminuser");
        model.addAttribute("success","true");
        AdminUserForm adminuserForm1 = new AdminUserForm();
		adminuserForm1.setAdminuser(adminuserDAO.getAdminUserby_username(principal.getName()));
        model.addAttribute("currentuser",adminuserForm1);
		return "viewadminuser";
	}
	
	
	
	@RequestMapping(value="/permission", method=RequestMethod.GET)
	public String permitadminuser(HttpServletRequest request,HttpServletResponse response,@RequestParam("id") String admin_id,@RequestParam("status") String status,@RequestParam("page") int page,ModelMap model) throws IOException 
	{	
		AdminUserForm adminuserForm = new AdminUserForm();
		   adminuserDAO.setPermission_adminUser(admin_id,status); 	
adminuserForm.setAdminuser(adminuserDAO.getlimitedadminuser(page));
		
	   	model.addAttribute("noofpages",(int) Math.ceil(adminuserDAO.getnoofadminuser() * 1.0 / 20));
	    model.addAttribute("adminuserForm", adminuserForm);	
	   	model.addAttribute("noofrows",adminuserForm.getAdminuser().size());   
        model.addAttribute("currentpage",page);
        model.addAttribute("menu","adminuser");
        model.addAttribute("button","viewall");  
        model.addAttribute("adminuserForm",adminuserForm);
        model.addAttribute("menu","adminuser");
       /* model.addAttribute("currentpage",page);*/
       
            
        return "viewadminuser";
	}
	
	
	
	
	@RequestMapping(value="/deleteSelectedadminuser", method=RequestMethod.POST)
	public String deleteSelectedadminuser(HttpServletRequest request,ModelMap model,String adminuser,Principal principal)
	{	
		String[] SelectedIDs=new String[100];
		SelectedIDs=request.getParameterValues("chkUser");
		for(String id:SelectedIDs)
		{		
		adminuserDAO.deleteAdminUser(id,principal.getName());
		}
		AdminUserForm adminuserForm = new AdminUserForm();
		adminuserForm.setAdminuser(adminuserDAO.getAdminUser());
        model.addAttribute("adminuserForm",adminuserForm);
        model.addAttribute("menu","adminuser");
       
        return "viewadminuser";
		
	}

	@RequestMapping(value="/admindetails", method=RequestMethod.GET)
	public String streamdetails(HttpServletRequest request,@RequestParam("id") String admin_id,ModelMap model,StreamDetails streamdetails)
	{AdminUserForm adminuserForm = new AdminUserForm();
	adminuserForm.setAdminuser(adminuserDAO.getAdminUser(admin_id));
    model.addAttribute("adminuserForm",adminuserForm);
    model.addAttribute("menu","adminuser");
		return "admindetails";
	}	
	
	@RequestMapping(value="/showRegisterProvider", method=RequestMethod.GET)
	public String showRegisterProvider(HttpSession session,HttpServletRequest request,ModelMap model) {
			
		    session.removeAttribute("admin");		
			model.put("success", "false");			
			AdminUserForm adminuserForm = new AdminUserForm();
			adminuserForm.setAdminuser(adminuserDAO.getAdminUser());
	        model.addAttribute("adminuserForm",adminuserForm);
	        return "registerprovider";
		}
	
	@RequestMapping(value="/registerprovider",method=RequestMethod.GET)
	public String showAddprovider(HttpServletRequest request,ModelMap model)
	{
		model.addAttribute("success","false");		
        AdminUserForm adminuserform=new AdminUserForm();
        adminuserform.setAdminuser(adminuserDAO.getAdminUser());
        model.addAttribute("adminuserform",adminuserform);
        model.addAttribute("menu","adminuser");
        
		return "/registerprovider";
	}
	/*@RequestMapping(value="/registerprovider", method=RequestMethod.POST)
	public String showAddProvider(HttpServletRequest request,@ModelAttribute("adminuser") @Valid AdminUser adminuser,
			BindingResult result,ModelMap model,Principal principal) {	

		 if (result.hasErrors())
		{
			 AdminUserForm adminuserform=new AdminUserForm();
		        adminuserform.setAdminuser(adminuserDAO.getAdminUser());
		        model.addAttribute("adminuserform",adminuserform);
		        model.addAttribute("menu","adminuser");
	       return "registerprovider";
		} 
		    AdminUserForm adminuserform=new AdminUserForm();
	        adminuserform.setAdminuser(adminuserDAO.getAdminUser());
	        model.addAttribute("adminuserform",adminuserform);
			adminuserDAO.setAdminUser(adminuser,principal.getName());
			model.addAttribute("menu","adminuser");
			return "login";
		
	
	}	*/
	
	@RequestMapping(value="/registerprovider", method=RequestMethod.POST)
	public String addproviderForm(HttpSession session,HttpServletRequest request,@ModelAttribute("adminuser") @Valid AdminUser adminuser,
			BindingResult result,ModelMap model,Principal principal) {
		
		session.setAttribute("admin",adminuser);
		//session.setAttribute("adminuser",adminuser);
		
		int flag=0;
		model.addAttribute("email_exist","false");
		model.addAttribute("mobile_exists","false");
		model.addAttribute("user_exists","false");
		int user_count=mainDAO.checkuser(adminuser.getAdmin_username());
		int email_count=mainDAO.checkemail(adminuser.getAdmin_email(),0,null);		
		int mobile_count=adminuserDAO.checkmobile(adminuser.getAdmin_mobile(),0,null);
		if (result.hasErrors())
		{		
			
			
			if(email_count==0)
			{
				logger.info("email exists");
				model.addAttribute("email_exist","true");
				
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
			model.addAttribute("adminuser", adminuser);
			return "/registerprovider";
		}
		
		else			
		{
						
			if(email_count==0)
			{
				logger.info("email exists");
				model.addAttribute("email_exist","true");
				model.addAttribute("adminuser", adminuser);
				flag=1;
				
			}
			if(mobile_count==0)
			{ 
				logger.info("mobile exists");
				model.addAttribute("mobile_exists","true");
				model.addAttribute("adminuser", adminuser);
				flag=1;
							
			}
			if(user_count==0)
			{
				logger.info("user exists");
				model.addAttribute("user_exists","true");
				model.addAttribute("adminuser", adminuser);
				flag=1;
							
			}
			if(flag==0)
			{
				adminuserDAO.setAdminUser(adminuser,"personal");
				model.addAttribute("providerRegsuccess","true");
				return "/login";
			}
			else
			{
				return "/registerprovider";
			}
			}
		
			
			
		}
	
	}
