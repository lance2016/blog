package com.lance.service.impl;

import com.lance.bean.Message;
import com.lance.bean.MessageExample;
import com.lance.dao.mapper.MessageMapper;
import com.lance.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lance on 2017/11/26.
 */
@Service
public class MessageServiceImpl implements MessageService {
    @Autowired
    MessageMapper messageMapper;
    @Override
    public int save(Message message) {
        return messageMapper.insert(message);
    }

    @Override
    public List<Message> listAllMessages(int page,int size) {
        MessageExample example=new MessageExample();
        example.setOrderByClause("isread asc,createtime desc limit "+(page-1)*size+","+size);
        return messageMapper.selectByExample(example);
    }

    @Override
    public List<Message> listUnreadMessages(int page, int size) {
        MessageExample example=new MessageExample();
        example.createCriteria().andIsreadEqualTo(0);
        example.setOrderByClause("createtime desc limit "+(page-1)*size+","+size);
        return messageMapper.selectByExample(example);
    }

    @Override
    public List<Message> listReadMessages(int page, int size) {
        MessageExample example=new MessageExample();
        example.createCriteria().andIsreadEqualTo(1);
        example.setOrderByClause("createtime desc limit "+(page-1)*size+","+size);
        return messageMapper.selectByExample(example);
    }

    @Override
    public Long countUnread() {
        MessageExample example=new MessageExample();
        return messageMapper.countByExample(example);
    }

    @Override
    public Long countAll() {
        MessageExample example=new MessageExample();
        return messageMapper.countAllByExample(example);
    }

    @Override
    public Long countRead() {
        MessageExample example=new MessageExample();
        return messageMapper.countReadByExample(example);
    }

    @Override
    public Message getMessageById(Integer id) {

        return messageMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Message> getMessageByName(String name) {
        return null;
    }

    @Override
    public List<Message> getMessageByEmail(String email) {
        return null;
    }

    @Override
    public int deleteMessage(Integer id) {
        return messageMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateMessage(Message message) {
        return messageMapper.updateByPrimaryKey(message);
    }
}
