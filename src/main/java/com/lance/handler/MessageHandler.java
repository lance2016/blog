package com.lance.handler;

import com.lance.bean.Message;
import com.lance.service.MessageService;
import com.sun.org.apache.regexp.internal.RE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by lance on 2017/11/26.
 */
@Controller
@RequestMapping("/message")
public class MessageHandler {
    @Autowired
    MessageService messageService;

    //获取当时日期
    public static String getNowDate() {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS");
        String formatStr =formatter.format(new Date());
        return formatStr;
    }


    @ModelAttribute
    public void Message(@RequestParam(value="id",required=false) Integer id,Map<String,Object> map) {
        System.out.println("----------------message modelAttribute method++++++++++++"+id);
        if(id!=null){
            Message message=messageService.getMessageById(id);
            if(message==null)
                System.out.println("没有该message");
            else{
                System.out.println("从数据库中查出message");
                map.put("message",message);
            }
        }
    }

    //搜索框搜索Message
    @ResponseBody
    @RequestMapping(value = "searchMessage",method = RequestMethod.POST)
    public List<Message> searchUser(@RequestParam String criteria){
        System.out.println(" ++++++++++++"+criteria);
        Message m=new Message();
        m.setName(criteria);
        m.setContent(criteria);
        m.setCreatetime(criteria);
        m.setEmail(criteria);
        return messageService.searchMessage(m);
    }


    //修改状态
    @ResponseBody
    @RequestMapping(value = "updateMessageState",method = RequestMethod.POST)
    public int updateMessageState(@RequestParam Integer id,Integer state,Map<String,Object>map){
        Message message= (Message) map.get("message");
        System.out.println(id+state);
        //修改成已读状态
        if(state==1||state==2){
            if(message.getIsread()==0)
                message.setIsread(1);
        }
        //修改成未读状态
        else if(state==0){
            if(message.getIsread()==1)
                message.setIsread(0);
        }

        messageService.updateMessage(message);
        System.out.println(message+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        return 1;
    }
    @ResponseBody
    @RequestMapping(value = "saveMessage",method = RequestMethod.POST)
    public int save(@RequestParam String name,String content,String email){
        String format = "\\p{Alpha}\\w{2,15}[@][a-z0-9]{3,}[.]\\p{Lower}{2,}";
        if(name.trim().equals("")||content.trim().equals("")||email.trim().equals(""))
            return 0;
        else  if (!email.matches(format))
            return -1;//邮箱格式不正确
        else{
            Message message=new Message(name,content,email,0,getNowDate());
            messageService.save(message);
            return 1;
        }

    }

    @ResponseBody
    @RequestMapping(value = "getMessage",method = RequestMethod.POST)
    public Message getMessageById(@RequestParam Integer id){
        return messageService.getMessageById(id);
    }
    //获取未读消息
    @ResponseBody
    @RequestMapping("/getUnread")
    public Long getUnread(){
        return  messageService.countUnread();
    }
    @ResponseBody
    @RequestMapping("/getReadPage")
    public Long getRead(){
        return  messageService.countUnread();
    }
    //显示所有消息
    @ResponseBody
    @RequestMapping(value = "listAllMessages",method = RequestMethod.POST)
    public List<Message> listAllMessages(@RequestParam int page){
        return messageService.listAllMessages(page,10);
    }

    //显示未读消息
    @ResponseBody
    @RequestMapping(value = "listUnreadMessages",method = RequestMethod.POST)
    public List<Message> listUnreadMessages(@RequestParam int page){
        return messageService.listUnreadMessages(page,10);
    }

    //显示已读消息
    @ResponseBody
    @RequestMapping(value = "listReadMessages",method = RequestMethod.POST)
    public List<Message> listReadMessages(@RequestParam int page){
        return messageService.listReadMessages(page,10);
    }

    //删除消息
    @ResponseBody
    @RequestMapping(value = "deleteMessage",method = RequestMethod.POST)
    public int deleteMessage(@RequestParam Integer id){
        return messageService.deleteMessage(id);
    }

    //计算所有消息总页数
    @ResponseBody
    @RequestMapping(value = "getTotalPage",method = RequestMethod.POST)
    public Long getTotalPage(@RequestParam int pageSize){
        System.out.println(pageSize);
        Long total=messageService.countAll();
        if(total%pageSize==0)
            return total/pageSize;
        else{
            System.out.println(total);
            return (total/pageSize)+1;
        }
    }


    //计算未读消息总页数
    @ResponseBody
    @RequestMapping(value = "getUnreadPage",method = RequestMethod.POST)
    public Long getUnreadPage(@RequestParam int pageSize){
        System.out.println(pageSize);
        Long total=messageService.countUnread();
        if(total%pageSize==0)
            return total/pageSize;
        else{
            System.out.println(total);
            return (total/pageSize)+1;
        }
    }
    //计算已读消息总页数
    @ResponseBody
    @RequestMapping(value = "getReadPage",method = RequestMethod.POST)
    public Long getReadPage(@RequestParam int pageSize){
        System.out.println(pageSize);
        Long total=messageService.countRead();
        if(total%pageSize==0)
            return total/pageSize;
        else{
            System.out.println(total);
            return (total/pageSize)+1;
        }
    }

}
