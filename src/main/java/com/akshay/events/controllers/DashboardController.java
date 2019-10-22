package com.akshay.events.controllers;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.akshay.events.models.Event;
import com.akshay.events.models.Message;
import com.akshay.events.models.User;
import com.akshay.events.models.UserEvent;
import com.akshay.events.services.DashboardService;
import com.akshay.events.services.LoginRegService;

@Controller
public class DashboardController {
	
	@Autowired
	private DashboardService dashboardService;
	
	@Autowired 
	private LoginRegService loginRegService;
	
	
	@PostMapping ("/newEvent")
	public String addEvent(@Valid @ModelAttribute ("event") Event event, BindingResult result, HttpSession session) {
		
		if (result.hasErrors()) {
			return "/home.jsp";
		}
		else {
			User loggedinUser = loginRegService.findUserById((Long) session.getAttribute("userId")); 
			event.setHost(loggedinUser);
			dashboardService.createEvent(event);
			System.out.println(event.getHost().getFirstName());
			return "redirect:/home";
		}
		
	}
	
	
	@GetMapping ("/events/{id}")
	public String getEventDetails (@PathVariable ("id") Long id, Model model, HttpSession session, @ModelAttribute ("msg") Message msg) {
		
		Event selectedEvent = dashboardService.getSelectedEvent(id);
		session.setAttribute("event", selectedEvent);
		model.addAttribute("selectedEvent", selectedEvent);
		
		User loggedInUser = loginRegService.findUserById((Long) session.getAttribute("userId"));
    	model.addAttribute("user", loggedInUser);
		return "/eventPage.jsp";
	}
	
	
	@PostMapping ("/newMessage")
	public String postMessage(Model model, HttpSession session, @ModelAttribute ("msg") Message msg) {
		
		System.out.println("entered the postMessage method...");
		
		User loggedInUser = loginRegService.findUserById((Long) session.getAttribute("userId"));
    	model.addAttribute("user", loggedInUser);
    	msg.setUser(loggedInUser);
    	
    	System.out.println(loggedInUser.getFirstName() + " -> got the user who is commenting");
    	
    	Event currentEvent = (Event) session.getAttribute("event");
    	msg.setEvent(currentEvent);
    	
    	System.out.println(currentEvent.getName() + " -> got the event for this message... *********");
    	
		Message newMessage = dashboardService.addNewMessage(msg);
		List<Message> eventMessages = dashboardService.getEventMessages(currentEvent.getId()); 
		model.addAttribute("eventMessages", eventMessages);
		
		System.out.println(eventMessages.size() + " number of messages for this event");
		
		System.out.println(newMessage.getMessage());
		System.out.println(newMessage.getEvent().getName());
		System.out.println(newMessage.getUser().getFirstName());
		
		return "redirect:/events/" + currentEvent.getId();
	}
	
	
	@GetMapping("/events/{id}/edit")
	public String loadEditEventPage(@ModelAttribute ("event") Event event, @PathVariable ("id") Long id, Model model) {
		System.out.println(id);
		Event oldEvent = dashboardService.getSelectedEvent(id);
		model.addAttribute("event", oldEvent);
		return "/editEvent.jsp";
	}
	
	
	@PostMapping ("/updateEvent/{id}")
	public String updateEvent (@Valid @ModelAttribute ("event") Event event, BindingResult result, HttpSession session, @PathVariable ("id") Long id) {
		System.out.println("inside update controller method");
		if (result.hasErrors()) {
			System.out.println("controller if condition satisfied");
			return "/editEvent.jsp";
		}
		else {
			System.out.println("Controller else...");
			
			User loggedinUser = loginRegService.findUserById((Long) session.getAttribute("userId")); 
			Event eventToUpdate = dashboardService.getSelectedEvent(id);
			List<User> eventAttendees = eventToUpdate.getAttendees();
			
			eventToUpdate = event;
			eventToUpdate.setAttendees(eventAttendees);

			eventToUpdate.setHost(loggedinUser);
			
			System.out.println(eventToUpdate.getHost());
			dashboardService.createEvent(eventToUpdate);
			System.out.println(eventToUpdate.getHost().getFirstName());
			System.out.println(eventToUpdate.getName());
			return "redirect:/home";
		}
	}
	
	
	
	@GetMapping ("/events/{id}/join")
	public String joinEvent(@PathVariable ("id") Long id, Model model, HttpSession session) {

		Event event = dashboardService.getSelectedEvent(id);
		User loggedinUser = loginRegService.findUserById((Long) session.getAttribute("userId")); 
		
		System.out.println(loggedinUser.getFirstName() + " -> this is logged in user");
		
		dashboardService.makeUserAttendee(event, loggedinUser);
		
		List<UserEvent> attendees = dashboardService.getAllAttendees(event); 
		model.addAttribute("attendees", attendees);
		
		System.out.println(attendees.size() + " -> is the current number of attendees & the first attendee is-> " + event.getAttendees().get(0).getFirstName());
		
		return "redirect:/home";
		
	}
	
	
	
	
	@GetMapping("/events/{id}/cancel")
	public String cancelEvent(@PathVariable("id") Long id, HttpSession session) {
		
		Event event = dashboardService.getSelectedEvent(id);
		User loggedinUser = loginRegService.findUserById((Long) session.getAttribute("userId")); 
		
		List<User> guests = event.getAttendees();
		Iterator<User> iterator = guests.iterator();
		while (iterator.hasNext()) {
			User cancellingUser = iterator.next();
			if (cancellingUser.getId() == loggedinUser.getId()) {
				iterator.remove();
			}
		}

		event.setAttendees(guests);
		dashboardService.createEvent(event);
		return "redirect:/home";
	}
	
	

}
