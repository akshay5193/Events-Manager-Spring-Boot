package com.akshay.events.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.akshay.events.models.Event;
import com.akshay.events.models.Message;
import com.akshay.events.models.User;
import com.akshay.events.models.UserEvent;
import com.akshay.events.repositories.EventRepository;
import com.akshay.events.repositories.MessageRepository;
import com.akshay.events.repositories.UserEventRepository;
import com.akshay.events.repositories.UserRepository;

@Service
public class DashboardService {

	@Autowired
	private EventRepository eventRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private MessageRepository messageRepository;
	
	@Autowired
	private UserEventRepository userEventRepository;
	
	
	public Event createEvent (Event event) {
		return eventRepository.save(event);
	}
	
	
	public List<Event> eventsInUserState (User user) {
		return eventRepository.findByStateContaining((String) user.getState());
	}
	
	public List<Event> eventsNotInUserState (User user) {
		return eventRepository.findByStateNotContaining((String) user.getState());
	}
	
	
	public Event getSelectedEvent(Long id) {
		Optional<Event> optionalEvent = eventRepository.findById(id);
		if (optionalEvent.isPresent()) {
			return optionalEvent.get();
		}
		else {
			System.out.println("No such event found...");
			return null;
		}
	}
	
	 
	public Message addNewMessage (Message message) {
		return messageRepository.save(message);
	}
	
	
	public List<Message> getEventMessages(Long eventId) {
		System.out.println("inside service and will now find the list of messages for this event -> " + eventId);
		return messageRepository.findByEventId(eventId);
	}
	
	
	public UserEvent makeUserAttendee(Event event, User user) {
		UserEvent attending = new UserEvent();
		attending.setAttendee(user);
		attending.setEvent(event);
		return userEventRepository.save(attending);
	}
	
	public List<UserEvent> getAllAttendees(Event event) {
		return userEventRepository.findByEventId(event.getId());
	}
	
	
}
