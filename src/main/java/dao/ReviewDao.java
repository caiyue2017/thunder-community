package dao;

import domain.Review;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.access.method.P;

import java.util.List;

/**
 * Created by 阿越 on 2017/5/1.
 */
public interface ReviewDao {
    void addReview(Review review);

    List<Review> findReviewsByPostId(int postId);

    List<Review> findReviewOrderByTime();

    void deleteById(@Param("id") int id);

    List<Review> findReviewsByPostIdAndUserId(@Param("postId") Integer postId, @Param("userId") String userId);

    List<Review> findReviewsByUserId(@Param("userId") int userId);
}
