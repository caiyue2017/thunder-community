package controller;

import domain.Post;
import domain.Review;
import domain.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.PostService;
import service.ReviewService;
import util.ImageUploadUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by 阿越 on 2017/5/1.
 */
@Controller
@RequestMapping("/review")
public class ReviewController {
    @Resource
    private ReviewService rService;
    @Resource
    private PostService pService;

    /**
     * 发表评论
     * @param session
     * @param request
     * @param response
     */
    @RequestMapping("/sendReview")
    public void sendReview(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Review review = new Review();
        String content = request.getParameter("content");
        User user = (User) session.getAttribute("user");
        Integer postId = (Integer) session.getAttribute("postId");
        review.setTime(new Date());
        review.setUserId(user.getId());
        review.setPostId(postId);
        review.setContent(content);
        review.setUsername(user.getUsername());
        review.setImg(user.getImg());
        rService.addReview(review);
        pService.setLastUsernameAndTime(postId, review.getUsername(), new Date());
        response.getWriter().write("success");
    }

    /**
     * 上传图片
     *
     * @param request
     * @param response
     */
    @RequestMapping("/imageUpload")
    public void imageUpload(HttpServletRequest request, HttpServletResponse response) {
        String directoryName = "upload/";
        try {
            ImageUploadUtil.ckeditor(request, response, directoryName);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * ajax查找对应帖子中所有的评论
     *
     * @return
     */
    @RequestMapping("/showReviews")
    @ResponseBody
    public Map<String, Object> showReviews(String userId,HttpSession session) {
        System.out.println(userId);
        // 创建一个map，用来封装数据
        Map<String, Object> reviewMap = new HashMap<String, Object>();
        Integer postId = (Integer) session.getAttribute("postId");
        List<Review> reviewList = null;
        if (userId != null)
            reviewList = rService.findReviewsByPostIdAndUserId(postId,userId);
        else
            reviewList = rService.findReviewsByPostId(postId);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String time;
        List<String> times = new ArrayList<String>();
        if (reviewList.size()>0) {
            for (Review r : reviewList) {
                time = df.format(r.getTime());
                times.add(time);
            }
        }
        reviewMap.put("rl", reviewList);
        reviewMap.put("time", times);
        return reviewMap;
    }


    @RequestMapping("/lastReviews")
    @ResponseBody
    public Map<String,Object> lastReviews(){
        Map<String,Object> map = new HashMap<String,Object>();
        List<Review> lastReviews = rService.findReviewOrderByTime();
        map.put("lr",lastReviews);
        return map;
    }

    @RequestMapping("/showReviewsInAdmin")
    @ResponseBody
    public Map<String,Object> showReviews(String postId){
        Map<String,Object> map = new HashMap<String,Object>();
        List<Review> reviewList = rService.findReviewsByPostId(Integer.parseInt(postId));
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String time;
        List<String> times = new ArrayList<String>();
        for (Review r : reviewList) {
            time = df.format(r.getTime());
            times.add(time);
        }
        map.put("rl",reviewList);
        map.put("times",times);
        return map;
    }

    @RequestMapping("/deleteReview")
    public void deleteReview(String id,HttpServletResponse response) throws IOException {
        rService.deleteById(Integer.valueOf(id));
        response.getWriter().write("success");
    }


    @RequestMapping("/showTimeLine")
    @ResponseBody
    public Map<String,Object> showTimeLine(String userId){
        Map<String,Object> map = new HashMap<String,Object>();
        List<Review> reviewList = rService.findReviewsByUserId(Integer.parseInt(userId));
        if (reviewList.size()>0) {
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String time;
            List<String> times = new ArrayList<String>();
            List<String> titles = new ArrayList<String>();
            for (Review r : reviewList) {
                time = df.format(r.getTime());
                times.add(time);
                Post post = pService.findPostById(r.getPostId());
                titles.add(post.getTitle());
            }
            map.put("times",times);
            map.put("titles",titles);
        }
        map.put("rl",reviewList);
        List<Post> postList = pService.findPostsByUserId(Integer.parseInt(userId));
        if (postList.size()>0) {
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String time2;
            List<String> times2 = new ArrayList<String>();
            List<String> titles2 = new ArrayList<String>();
            for (Post p : postList) {
                time2 = df.format(p.getTime());
                times2.add(time2);
                titles2.add(p.getTitle());
            }
            map.put("times2",times2);
            map.put("titles2",titles2);
        }
        map.put("pl",postList);
        return map;
    }

    @RequestMapping("/showUserPosts")
    @ResponseBody
    public Map<String,Object> showUserPosts(String userId){
        Map<String,Object> map = new HashMap<String,Object>();
        List<Post> postList = pService.findPostsByUserId(Integer.parseInt(userId));
        if (postList.size()>0) {
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String time2;
            List<String> times2 = new ArrayList<String>();
            List<String> titles2 = new ArrayList<String>();
            for (Post p : postList) {
                time2 = df.format(p.getTime());
                times2.add(time2);
                titles2.add(p.getTitle());
            }
            map.put("times2",times2);
            map.put("titles2",titles2);
        }
        map.put("pl",postList);
        return map;
    }
    @RequestMapping("/showUserReviews")
    @ResponseBody
    public Map<String,Object> showUserReviews(String userId){
        Map<String,Object> map = new HashMap<String,Object>();
        List<Review> reviewList = rService.findReviewsByUserId(Integer.parseInt(userId));
        if (reviewList.size()>0) {
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String time;
            List<String> times = new ArrayList<String>();
            List<String> titles = new ArrayList<String>();
            for (Review r : reviewList) {
                time = df.format(r.getTime());
                times.add(time);
                Post post = pService.findPostById(r.getPostId());
                titles.add(post.getTitle());
            }
            map.put("times",times);
            map.put("titles",titles);
        }
        map.put("rl",reviewList);
        return map;
    }

}
