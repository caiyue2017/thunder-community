package controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

/**
 * Created by 阿越 on 2017/6/6.
 */
@ServerEndpoint("/websocket/{myWebsocket}")
public class WebsocketController {

    private static final Logger logger = LoggerFactory.getLogger(WebsocketController.class);

    public static Map<String, Session> clients = new ConcurrentHashMap<String, Session>();

    /**
     * 打开连接时触发
     *
     * @param myWebsocket
     * @param session
     */
    @OnOpen
    public void onOpen(@PathParam("myWebsocket") String myWebsocket, Session session) {
        /*logger.info("Websocket Start Connecting:" + myWebsocket);
        System.out.println("进入：" + myWebsocket);
        clients.put(myWebsocket, session);*/
        logger.info("Websocket Start Connecting:" + session.getId());
        System.out.println("进入：" + session.getId());
        clients.put(session.getId(), session);
    }

    /**
     * 收到客户端消息时触发
     *
     * @param myWebsocket
     * @param message
     * @return
     */
    @OnMessage
    public String onMessage(@PathParam("myWebsocket") String myWebsocket, String message) {
        return "Got your message (" + message + ").Thanks !";
    }

    /**
     * 异常时触发
     *
     * @param myWebsocket
     * @param throwable
     */
    @OnError
    public void onError(@PathParam("myWebsocket") String myWebsocket, Throwable throwable,Session session) {
       /* logger.info("Websocket Connection Exception:" + myWebsocket);
        logger.info(throwable.getMessage(), throwable);
        clients.remove(myWebsocket);*/
        logger.info("Websocket Connection Exception:" + session.getId());
        logger.info(throwable.getMessage(), throwable);
        clients.remove(session.getId());
    }

    /**
     * 关闭连接时触发
     *
     * @param myWebsocket
     */
    @OnClose
    public void onClose(@PathParam("myWebsocket") String myWebsocket,Session session) {
        /*logger.info("Websocket Close Connection:" + myWebsocket);
        clients.remove(myWebsocket);*/
        logger.info("Websocket Close Connection:" + session.getId());
        clients.remove(session.getId());
    }


    /**
     * 将数据传回客户端
     * 异步的方式
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

    /**
     * 向所有人广播
     * @param message
     */
    public static void broadcastAll(String message) {
        Set<Map.Entry<String, Session>> set = clients.entrySet();
        for (Map.Entry<String, Session> i : set) {
            try {
                i.getValue().getBasicRemote().sendText(message);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
