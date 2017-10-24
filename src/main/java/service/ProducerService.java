package service;

import javax.jms.Destination;

/**
 * Created by 阿越 on 2017/5/23.
 */
public interface ProducerService {
    void sendMessage(Destination destination, final String message);
}
