package shiro;

import domain.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import service.UserService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by 越 on 2017/4/5.
 */
public class MyRealm extends AuthorizingRealm{

    @Resource
    private UserService userService;

    /**
     * 用于权限的认证
     * @param principalCollection
     * @return
     */
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        String username = principalCollection.getPrimaryPrincipal().toString();
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo() ;
        Set<String> roles = userService.findRoles(username);
        Set<String> permissions = new HashSet<String>();
        for (String role:roles){
            String permission = userService.findPermissionByRole(role);
            permissions.add(permission);
        }
        info.setRoles(roles);
        info.setStringPermissions(permissions);
        return info;
    }

    /**
     * 登录验证（先执行）
     * @param token
     * @return
     * @throws AuthenticationException
     */
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        // 获取登录名，密码
        String name = token.getPrincipal().toString();
        String psw = new String((char[])token.getCredentials());
        User user = userService.findUserByPhone(name);
        User user1 = userService.findUserByUsername(name);
        User user2 = userService.findUserByEmail(name);
        User currentUser = null;
        boolean b = false;
        if (user!=null&& user.getPassword().equals(psw)){
            b = true;
            currentUser = user;
        }else if (user1!=null&& user1.getPassword().equals(psw)){
            b = true;
            currentUser = user1;
        }else if (user2!=null&& user2.getPassword().equals(psw)){
            b = true;
            currentUser = user2;
        }
        if (b){
//            System.out.println(currentUser);
            // 设置session
            this.setSession("user",currentUser);
            // 将查询到的用户名和密码存放到authenticationInfo用于后面的权限判断。第三个参数传入realName。
            AuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(currentUser.getUsername(),currentUser.getPassword(),getName());
            return authenticationInfo;
        }else
            return null;
    }
    /**
     * 保存登录名
     */
    private void setSession(Object key, Object value){
        Session session = getSession();
//        System.out.println("Session默认超时时间为[" + session.getTimeout() + "]毫秒");
        if(null != session){
            session.setAttribute(key, value);
        }
    }

    private Session getSession(){
        try{
            Subject subject = SecurityUtils.getSubject();
            Session session = subject.getSession(false);
            if (session == null){
                session = subject.getSession();
            }
            if (session != null){
                return session;
            }
        }catch (InvalidSessionException e){

        }
        return null;
    }
}
