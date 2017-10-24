package util;

import controller.WebsocketController;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

/**
 * Created by 阿越 on 2017/5/23.
 */
public class QueueMessageListener implements MessageListener {

    // 当收到信息后，自动调用该方法
    @Override
    public void onMessage(Message message) {
        TextMessage tm = (TextMessage) message;
        try {
            String rMessage = tm.getText();
            System.out.println("接收者受到消息："
                    + rMessage);
            //do something ...
            WebsocketController.broadcast("post", rMessage);
        } catch (JMSException e) {
            e.printStackTrace();
        }
    }
}
