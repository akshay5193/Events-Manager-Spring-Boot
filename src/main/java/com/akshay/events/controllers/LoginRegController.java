package com.akshay.events.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.akshay.events.models.Event;
import com.akshay.events.models.User;
import com.akshay.events.models.UserEvent;
import com.akshay.events.services.DashboardService;
import com.akshay.events.services.LoginRegService;
import com.akshay.events.validator.UserValidator;

@Controller
public class LoginRegController {
	
	@Autowired
	private LoginRegService loginRegService;
	
	
	@Autowired 
	private UserValidator userValidator;
	
	@Autowired
	private DashboardService dashboardService;
	
		
	public LoginRegController () {
		
	}
	
	
	@GetMapping ("/")
	public String index(@ModelAttribute ("user") User user) {
		
		return "/registration.jsp";
	}

	
	
	@PostMapping(value="/registration")
    public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
        // if result has errors, return the registration page (don't worry about validations just now)
        // else, save the user in the database, save the user id in session, and redirect them to the /home route
    	userValidator.validate(user, result);
    	if (result.hasErrors()) {
    		return "/registration.jsp";
    	}
    	else {
    		Boolean newAccount = loginRegService.checkDuplicateAccount(user.getEmail());
    		System.out.println(newAccount);
    		if (newAccount) {
    			loginRegService.registerUser(user);
        		session.setAttribute("userId", user.getId());
        		System.out.println(user.getId());
        		return "redirect:/home";
    		}
    		else {
    			System.out.println("Account already exists with this email id...");
    			return "/registration.jsp";
    		}
    		
    	}
    }
	
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
    public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session, @ModelAttribute ("user") User user) {
        // if the user is authenticated, save their user id in session
        // else, add error messages and return the login page
    	
    	boolean isAuthenticated = loginRegService.authenticateUser(email, password);
    	System.out.println(isAuthenticated);
    	if (isAuthenticated) {
    		User currentUser = loginRegService.findByEmail(email);
    		session.setAttribute("userId", currentUser.getId());
    		System.out.println(currentUser.getId());
    		System.out.println(session.getAttribute("userId"));
    		return "redirect:/home";
    	}
    	else {
    		model.addAttribute("error", "Invalid Credentials. Please try again.");
    		return "/registration.jsp";
    	}
    	
    }
	
	
	@GetMapping ("/home")
	public String home(HttpSession session, Model model, @ModelAttribute ("event") Event event) {
        // get user from session, save them in the model and return the home page
		if (session.getAttribute("userId") != null) {
			
			Long userId = (Long) session.getAttribute("userId");
	    	User loggedInUser = loginRegService.findUserById(userId);
	    	model.addAttribute("user", loggedInUser);
	    	
	    	List<Event> eventsInUserState = dashboardService.eventsInUserState(loggedInUser);
	    	model.addAttribute("instateEvents", eventsInUserState);
	    	
	    	List<Event> eventsOutOfUserState = dashboardService.eventsNotInUserState(loggedInUser);
	    	model.addAttribute("outstateEvents", eventsOutOfUserState);
	    	
	    	
	    	
	    	return "home.jsp";
			
		}
		return "redirect:/";
    	
    }
    
    
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        // invalidate session
        // redirect to login page
    	session.invalidate();
    	return "redirect:/";
    }
    
    
}
