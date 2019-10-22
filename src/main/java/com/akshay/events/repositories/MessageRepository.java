package com.akshay.events.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.akshay.events.models.Event;
import com.akshay.events.models.Message;

@Repository
public interface MessageRepository extends CrudRepository <Message, Long> {
	
	List<Message> findAll();
	List<Message> findByEventId(Long eventId);
}
