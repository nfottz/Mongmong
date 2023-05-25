package com.gdu.mongmong.batch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.gdu.mongmong.service.UserService;

@Component
@EnableScheduling
public class RestUserHandler {

	@Autowired
	private UserService userService;
	
	@Scheduled(cron="0 0 1 1/1 * ?")
	public void execute() {
		userService.restUserHandle();
	}
	
}
