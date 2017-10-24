package service;

import domain.User;

import java.util.Date;
import java.util.List;
import java.util.Set;


/**
 * Created by 越 on 2017/3/27.
 */
public interface UserService {

    Set<String> findRoles(String phone);

    User findUserByPhone(String phone);

    void addUser(String phoneNumber, String password,Date time);

    User findUserByUsername(String name);

    User findUserByEmail(String name);

    String findPermissionByRole(String role);

    String findRoleById(Integer id);

    List<User> findAllUsers();

    void deleteUserById(Integer id);

    User findUserById(int userId);

    List<User> findUsersOrderByPostNum();

    void addPostNum(int id);

    void updateState(String state, int i);

    void update(Integer id, String img, String username, String sex, String address, String qq, String email, String phone, String text);
}
