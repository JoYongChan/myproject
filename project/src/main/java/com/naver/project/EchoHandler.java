package com.naver.project;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler{
  
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
    private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
    
  
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
      
        sessionList.add(session);
        
    }
   
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        
    	
        for(WebSocketSession sess : sessionList){
        	sess.sendMessage(new TextMessage("aa"+ "|" + message.getPayload()));
        }
        
    }
    
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessionList.remove(session);
        
    }
 
}
