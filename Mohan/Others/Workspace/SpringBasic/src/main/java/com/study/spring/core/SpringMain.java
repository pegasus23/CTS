package com.study.spring.core;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.study.spring.app.Message;

public class SpringMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		@SuppressWarnings("resource")
		ApplicationContext appContext=new ClassPathXmlApplicationContext("spring.xml");
		Message msg=(Message)appContext.getBean("message");
		System.out.println(msg.printMessage());
		
		//SetterInjection 
	
	}

}
