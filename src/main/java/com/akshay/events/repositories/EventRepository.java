package com.akshay.events.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.akshay.events.models.Event;

@Repository
public interface EventRepository extends CrudRepository <Event, Long> {
	
	List<Event> findAll();

	

//	@Query("SELECT e FROM Event e WHERE state != ?1")
//	List<Event> findUserOutStateEvents(String state);
	
	List<Event> findByStateContaining(String stateName);
	List<Event> findByStateNotContaining(String stateName);
}
