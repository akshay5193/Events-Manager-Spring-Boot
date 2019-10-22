package com.akshay.events.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.akshay.events.models.UserEvent;

@Repository
public interface UserEventRepository extends CrudRepository <UserEvent, Long> {
	
	List<UserEvent> findAll();
	List<UserEvent> findByEventId(Long eventId);
}
