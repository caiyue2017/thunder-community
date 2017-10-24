package service.Impl;

import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Service;
import service.ProducerService;

import javax.annotation.Resource;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;

/**
 * Created by 阿越 on 2017/5/23.
 * 发送者
 */
@Service("producerService")
public class ProducerServiceImpl implements ProducerService{
    @Resource
    private JmsTemplate jmsTemplate;

    public void sendMessage(Destination destination, final String message) {
        jmsTemplate.send(destination, new MessageCreator() {
            public Message createMessage(Session session) throws JMSException {
                return session.createTextMessage(message);
            }
        });
    }
}
