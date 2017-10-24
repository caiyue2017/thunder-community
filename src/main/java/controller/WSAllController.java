package controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.websocket.*;
import javax.websocket.server.*;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by 阿越 on 2017/6/6.
 */
@ServerEndpoint("/wsAll")
public class WSAllController {

    private static final Logger logger = LoggerFactory.getLogger(WSAllController.class);

    public static Map<String, Session> clients = new ConcurrentHashMap<String, Session>();

    /**
     * 打开连接时触发
     *
     * @param session
     */
    @OnOpen
    public void onOpen(Session session) {
        logger.info("Websocket Start Connecting:" + session.getId());
        System.out.println("进入：" + session.getId());
        clients.put(session.getId(), session);
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
     * @param throwable
     */
    @OnError
    public void onError(Throwable throwable, Session session) {
        logger.info("Websocket Connection Exception:" + session.getId());
        logger.info(throwable.getMessage(), throwable);
        clients.remove(session.getId());
    }

    /**
     * 关闭连接时触发
     */
    @OnClose
    public void onClose(Session session) {
        logger.info("Websocket Close Connection:" + session.getId());
        clients.remove(session.getId());
    }


    /**
     * 向所有人广播
     *
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
