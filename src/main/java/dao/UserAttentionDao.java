package dao;

import domain.UserAttention;
import domain.UserPost;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserAttentionDao {

    UserAttention isAttention(@Param("userId") Integer userId, @Param("attentionId") Integer attentionId);

    int countByUId(@Param("userId") Integer id);

    int countByAId(@Param("attentionId") Integer id);

    List<UserAttention> findByUserId(@Param("userId") Integer id);

    List<UserAttention> findByAttentionId(@Param("attentionId")Integer id);

    void delete(@Param("userId") Integer userId, @Param("attentionId") Integer attentionId);

    void add(@Param("userId") Integer userId, @Param("attentionId") Integer attentionId);
}