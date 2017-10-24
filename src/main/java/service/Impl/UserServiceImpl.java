package service.Impl;

import dao.UserDao;
import domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Service;
import service.UserService;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

/**
 * Created by 越 on 2017/3/27.
 */
//将UserServiceImpl类标注为一个service
@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    public User findUserByPhone(String phone) {
        return userDao.findUserByPhone(phone);
    }

    public User findUserByUsername(String name) {
        User user = userDao.findUserByUsername(name);
        if (user!=null){
            List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
            authorities.add(new SimpleGrantedAuthority("user"));
        }
        return userDao.findUserByUsername(name);
    }

    public User findUserByEmail(String name) {
        return userDao.findUserByEmail(name);
    }



    public void addUser(String phoneNumber, String password,Date time) {
        userDao.addUser(password,phoneNumber,time);
    }



    public Set<String> findRoles(String phone) {
        return userDao.findRoles(phone);
    }
    public String findPermissionByRole(String role) {
        return null;
    }

    public String findRoleById(Integer id) {
        return userDao.findRoleById(id);
    }

    public List<User> findAllUsers() {
        return userDao.findAllUsers();
    }

    public void deleteUserById(Integer id) {
        userDao.deleteUserById(id);
    }

    public User findUserById(int userId) {
        return userDao.findUserById(userId);
    }

    public List<User> findUsersOrderByPostNum() {
        return userDao.findUsersOrderByPostNum();
    }

    public void addPostNum(int id) {
        userDao.addPostNum(id);
    }

    public void updateState(String state, int id) {
        userDao.updateState(state,id);
    }

    @Override
    public void update(Integer id, String img, String username, String sex, String address, String qq, String email, String phone, String text) {
        userDao.update(id,img,username,sex,address,qq,email,phone,text);
    }
}
