package util;

import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.AlibabaAliqinFcSmsNumSendRequest;
import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;

/**
 * Created by 阿越 on 2017/4/19.
 */
public class MessageCodeUtil {
    private String phoneNumber;

    public MessageCodeUtil() {

    }

    public MessageCodeUtil(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    // 发送验证码
    public String sendCode(){
        String rusult = null;
        String code = createCode();

        // 官网的URL
        String url = "http://gw.api.taobao.com/router/rest";
        // 成为开发者，创建应用后系统自动生成
        String appkey = "23755519";
        String secret = "d61b446642e8e9baab22a9ce60cfb248";
        TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
        AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
        req.setExtend("1234");
        req.setSmsType("normal");
        req.setSmsFreeSignName("Thunder社区");
        req.setSmsParamString("{\"code\":\""+code+"\"}");
        req.setRecNum(phoneNumber);
        req.setSmsTemplateCode("SMS_62190187");
        try {
            AlibabaAliqinFcSmsNumSendResponse rsp = client.execute(req);
            System.out.println(rsp.getBody());
            rusult = rsp.getSubMsg();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return code;
    }

    // 生成验证码
    public String createCode() {
        String retStr = "";
        int length = 6;
        String strTable = "1234567890";
        int len = strTable.length();
        boolean bDone = true;
        do {
            retStr = "";
            int count = 0;
            for (int i = 0; i < length; i++) {
                double dblR = Math.random() * len;
                int intR = (int) Math.floor(dblR);
                char c = strTable.charAt(intR);
                if (('0' <= c) && (c <= '9')) {
                    count++;
                }
                retStr += strTable.charAt(intR);
            }
            if (count >= 2) {
                bDone = false;
            }
        } while (bDone);
        return retStr;
//        System.out.println(retStr);
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}
