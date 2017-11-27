package com.lance.service;

import com.lance.bean.Message;

import java.util.List;

/**
 * Created by lance on 2017/11/26.
 */
public interface MessageService {
    public int save(Message message);
    public List<Message>listAllMessages(int page,int size);
    public List<Message>listUnreadMessages(int page,int size);
    public List<Message>listReadMessages(int page,int size);
    public Long countUnread();
    public Long countAll();
    public Long countRead();
    public Message getMessageById(Integer id);
    public List<Message> getMessageByName(String name);
    public  List<Message>getMessageByEmail(String email);
    public int deleteMessage(Integer id);
    public int updateMessage(Message message);
}
