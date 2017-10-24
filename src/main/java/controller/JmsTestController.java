package controller;

import domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.ProducerService;

import javax.annotation.Resource;
import javax.jms.Destination;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * Created by 阿越 on 2017/5/23.
 */
@Controller
@RequestMapping("jms")
public class JmsTestController {
    @Resource
    private ProducerService producerService;

    /**
     * 这里是根据配置文件定义的queue来注入的，也就是这里将会把不同的内容推送到不同的queue中
     */
    @Resource
    @Qualifier("queueDestination")
    private Destination destination;

    @RequestMapping("test")
    public String testSend() throws Exception {
        //发送更新数据请求
        String message = "有新内容！";
        System.out.println("发送方发送内容为："+message);
        producerService.sendMessage(destination, message);
        return "redirect:/";
    }
}
