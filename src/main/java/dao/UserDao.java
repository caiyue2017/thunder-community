package dao;

import domain.User;
import domain.UserPost;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Set;

public interface UserDao {


    void addUser(@Param("password") String password,@Param("phone") String phoneNumber,@Param("time")Date time);

    User findUserByPhone(String phone);

    User findUserByUsername(String name);

    User findUserByEmail(String name);

    Set<String> findRoles(String phone);

    Set<String> findPermissions(String phone);


    String findRoleById(@Param("id") Integer id);

    List<User> findAllUsers();

    void deleteUserById(@Param("id")Integer id);

    User findUserById(@Param("id")int userId);

    List<User> findUsersOrderByPostNum();

    void addPostNum(@Param("id") int id);

    void updateState(@Param("state")String state, @Param("id")int id);

    void update(@Param("id") Integer id, @Param("img") String img, @Param("username") String username, @Param("sex") String sex, @Param("address") String address, @Param("qq") String qq, @Param("email") String email,@Param("phone") String phone, @Param("text") String text);
}