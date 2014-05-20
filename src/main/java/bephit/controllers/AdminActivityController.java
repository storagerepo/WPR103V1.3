package bephit.controllers;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bephit.dao.AdminActivityDAO;
import bephit.forms.AdminActivityForm;



@Controller
public class AdminActivityController {
	protected static Logger logger=org.slf4j.LoggerFactory.getLogger("logs");
	
	
	@Autowired
	AdminActivityDAO adminactivityDAO;
	
	
	
	@RequestMapping(value="/activityofadmin",method=RequestMethod.GET)
	public String viewadminusers(HttpServletRequest request,ModelMap model,Principal principal)
	{
		
		AdminActivityForm adminactivityForm=new AdminActivityForm();
		adminactivityForm.setAdminActivity(adminactivityDAO.getAdminActivity());	
	   // adminactivityDAO.getAdminActivity(principal.getName());
		model.addAttribute("adminactivityForm",adminactivityForm);
		 model.addAttribute("menu","adminuser");
		return "activityofadmin";
		
	}

}
