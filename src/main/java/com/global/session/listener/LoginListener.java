package com.global.session.listener;

import java.util.concurrent.atomic.AtomicInteger;

import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionAttributeListener;
import jakarta.servlet.http.HttpSessionBindingEvent;

@WebListener
public class LoginListener implements HttpSessionAttributeListener {

    private static final AtomicInteger loginCount = new AtomicInteger(0);

    @Override
    public void attributeAdded(HttpSessionBindingEvent event) {
        if ("LOGIN".equals(event.getName())) {
            loginCount.incrementAndGet();
        }
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent event) {
        if ("LOGIN".equals(event.getName())) {
            loginCount.decrementAndGet();
        }
    }
    
    public static AtomicInteger getLoginCount() {
    	return loginCount; 
    }
}


