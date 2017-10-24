package controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.websocket.*;
import javax.websocket.server.*;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by 阿越 on 2017/6/6.
 */
@ServerEndpoint("/wsOne/{myWebsocket}")
public class WSOneController {

    private static final Logger logger = LoggerFactory.getLogger(WSOneController.class);

    public static Map<String, Session> clients = new ConcurrentHashMap<String, Session>();

    /**
     * 打开连接时触发
     *
     * @param myWebsocket
     * @param session
     */
    @OnOpen
    public void onOpen(@PathParam("myWebsocket") String myWebsocket, Session session) {
        logger.info("Websocket Start Connecting:" + myWebsocket);
        System.out.println("进入：" + myWebsocket);
        clients.put(myWebsocket, session);
    }

    /**
     * 收到客户端消息时触发
     *
     * @param message
     * @return
     */
    @OnMessage
    public String onMessage(String message) {
        return "Got your message (" + message + ").Thanks !";
    }

    /**
     * 异常时触发
     *
     * @param myWebsocket
     * @param throwable
     */
    @OnError
    public void onError(@PathParam("myWebsocket") String myWebsocket, Throwable throwable) {
        logger.info("Websocket Connection Exception:" + myWebsocket);
        logger.info(throwable.getMessage(), throwable);
        clients.remove(myWebsocket);
    }

    /**
     * 关闭连接时触发
     *
     * @param myWebsocket
     */
    @OnClose
    public void onClose(@PathParam("myWebsocket") String myWebsocket) {
        logger.info("Websocket Close Connection:" + myWebsocket);
        clients.remove(myWebsocket);
    }


    /**
     * 异步的方式将数据传回客户端
     *
     * @param myWebsocket
     * @param message
     */
    public static void broadcast(String myWebsocket, String message) {
        if (clients.containsKey(myWebsocket)) {
            clients.get(myWebsocket).getAsyncRemote().sendText(message);
        } else {
            throw new NullPointerException("[" + myWebsocket + "]Connection does not exist");
        }
    }
}
