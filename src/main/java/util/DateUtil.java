package util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by 阿越 on 2017/5/6.
 */
public class DateUtil {
    public static List<String> getYMDHMM(Date date) {
        List<String> list = new ArrayList<String>();
        String y,m,d,h,mm;
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String s = df.format(date);
        String[] ss = s.split(" ");
        String[] sss = ss[0].split("-");
        y = sss[0];
        m = sss[1];
        if (m.substring(0,1).equals("0"))
            m = m.substring(1);
        d = sss[2];
        if (d.substring(0,1).equals("0"))
            d = d.substring(1);
        String[] ssss = ss[1].split(":");
        h = ssss[0];
        if (h.substring(0,1).equals("0"))
            h = h.substring(1);
        mm = ssss[1];
        if (mm.substring(0,1).equals("0"))
            mm = mm.substring(1);
        /*System.out.println(y);
        System.out.println(m);
        System.out.println(d);
        System.out.println(h);
        System.out.println(mm);*/
        list.add(y);
        list.add(m);
        list.add(d);
        list.add(h);
        list.add(mm);
        return list;
    }
}
