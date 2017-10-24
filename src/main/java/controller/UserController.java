package controller;

import domain.*;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.*;
import util.CodeUtil;
import util.DateUtil;
import util.MessageCodeUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.ObjectInput;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by 越 on 2017/3/29.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private UserService userService;
    @Resource
    private UserPostService userPostService;
    @Resource
    private PostService postService;
    @Resource
    private UserAttentionService userAttentionService;
    @Resource
    private ReviewService reviewService;

    // 登录
    @RequestMapping("/login")
    public String login(HttpSession session, HttpServletRequest request) {
        User user = (User) session.getAttribute("user");
        if (user.getState().equals("true")) {
            int countP = postService.findPostsByUId(user.getId());
            session.setAttribute("countP", countP);
            List<Review> reviews = reviewService.findReviewsByUserId(user.getId());
            int countR = reviews.size();
            session.setAttribute("countR", countR);
            return "redirect:/";
        } else {
            session.setAttribute("user", null);
            session.setAttribute("userIsLock", "对不起，您的账号已被锁定，详情请联系管理员。");
            return "redirect:/jsp/user/login.jsp";
        }
    }

    // 注册
    @RequestMapping("/register")
    public String register(HttpServletRequest request) {
        String phoneNumber = request.getParameter("phoneNumber");
        String password = request.getParameter("password");
        userService.addUser(phoneNumber, password, new Date());
        return "redirect:/jsp/user/login.jsp";
    }

    // 注销
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.setAttribute("user", null);
        return "redirect:/";
    }

    // 发送网页验证码
    @RequestMapping("/sendCode")
    public void getCode(HttpServletRequest request, HttpServletResponse response) {
        CodeUtil codeUtil = new CodeUtil();
        codeUtil.makeValidateImage(request, response);
    }

    // ajax校验用户名与密码
    @RequestMapping("checkNameAndPsw")
    public void checkNameAndPsw(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        Subject subject = SecurityUtils.getSubject();
        String name = request.getParameter("name");
        String psw = request.getParameter("psw");
        String checked = request.getParameter("checked");
        boolean rememberMe = false;
        if (checked.equals("checked"))
            rememberMe = true;
//        System.out.println(rememberMe);
        UsernamePasswordToken token = null;
        /*if (!subject.isAuthenticated() && subject.isRemembered()) {
            System.out.println("rememberMe");
            Object object = subject.getPrincipal();
            if (null != object) {
                User user = (User) object;
                System.out.println(user);
                token = new UsernamePasswordToken(user.getUsername(), user.getPassword(),true);
            }
        } else {*/
        token = new UsernamePasswordToken(name, psw);
//        }

        try {
            subject.login(token);
            response.getWriter().write("1");
        } catch (Exception e) {
            response.getWriter().write("0");
        }
    }

    @RequestMapping("checkCode")
    public void checkCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String validateCode = (String) (request.getSession().getAttribute("validateCode"));
        response.getWriter().write(validateCode);
    }

    // 发送短信验证码
    @RequestMapping("/sendMessageCode")
    public void getMessageCode(HttpServletRequest request, HttpSession session) {
        String phoneNumber = request.getParameter("phoneNumber");
        String code = new MessageCodeUtil(phoneNumber).sendCode();
        session.setAttribute("messageCode", code);
        System.out.println("发送短信验证码");
    }

    @RequestMapping("/checkMessageCode")
    public void checkMessageCode(HttpServletResponse response, String code, HttpSession session) throws IOException {
        String messageCode = (String) session.getAttribute("messageCode");
        System.out.println(code + ":" + messageCode);
        if (code.equals(messageCode))
            response.getWriter().write("success");
    }

    @RequestMapping("/checkPhoneNumber")
    public void checkPhoneNumber(String phoneNumber, HttpServletResponse response) throws IOException {
        User user = userService.findUserByPhone(phoneNumber);
        if (user != null) {
            response.getWriter().write("success");
        }
    }

    @RequestMapping("showUser")
    @ResponseBody
    public Map<String, Object> showUser() throws IOException {
        List<User> userList = userService.findAllUsers();
        List<User> userList2 = new ArrayList<User>();
        List<String> times = new ArrayList<String>();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String time;
        for (User user : userList) {
            if (user.getIsDelete().equals("false")) {
                time = df.format(user.getTime());
                times.add(time);
                userList2.add(user);
            }
        }
        Map<String, Object> userMap = new HashMap<String, Object>();
        userMap.put("ul", userList2);
        userMap.put("times", times);
        return userMap;
    }

    /**
     * 删除用户，不是从表中删除，只是把IsDelete字段置为true
     *
     * @param request
     * @param response
     */
    @RequestMapping("/deleteUser")
    public void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        userService.deleteUserById(Integer.valueOf(id));
        response.getWriter().write("success");
    }

    @RequestMapping("/postsRankingList")
    @ResponseBody
    public Map<String, Object> postsRankingList() {
        Map<String, Object> rankingMap = new HashMap<String, Object>();
        List<User> userList = userService.findUsersOrderByPostNum();
        rankingMap.put("rankingList", userList);
        return rankingMap;
    }

    @RequestMapping("/sendOther")
    public String sendOther(HttpServletRequest request) {
        String id = request.getParameter("id");
        User user = userService.findUserById(Integer.parseInt(id));
        request.setAttribute("other", user);
        return "user/otherIndex";
    }

    @RequestMapping("/setState")
    public void setState(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        String check = request.getParameter("state");
        String state;
        if (check.equals("true"))
            state = "true";
        else
            state = "false";
        userService.updateState(state, Integer.parseInt(id));
        response.getWriter().write("success");
    }

    @RequestMapping("/findUserStores")
    @ResponseBody
    public Map<String, Object> findUserStores(HttpSession session) {
        User user = (User) session.getAttribute("user");
        Map<String, Object> map = new HashMap<String, Object>();
        List<Integer> postIds = userPostService.findUserStores(user.getId());
        List<Post> stores = new ArrayList<Post>();
        List<User> authors = new ArrayList<User>();
        List<UserAttention> attentions = new ArrayList<UserAttention>();
        List<Integer> countPosts = new ArrayList<Integer>();
        List<Integer> countReviews = new ArrayList<Integer>();
        List<Integer> countAs = new ArrayList<Integer>();
        List<Integer> countFs = new ArrayList<Integer>();
        for (int postId : postIds) {
            // 帖子
            Post post = postService.findPostById(postId);
            stores.add(post);
            // 作者
            User author = userService.findUserById(post.getUserId());
            authors.add(author);
            // 关注
            UserAttention userAttention = userAttentionService.isAttention(user.getId(), author.getId());
            attentions.add(userAttention);
            // 作者发帖数
            int countPost = postService.findPostsByUId(author.getId());
            countPosts.add(countPost);
            // 作者回复数
            List<Review> reviews = reviewService.findReviewsByUserId(author.getId());
            countReviews.add(reviews.size());
            // 作者关注数
            int countA = userAttentionService.countByUId(author.getId());
            countAs.add(countA);
            // 作者粉丝数
            int countF = userAttentionService.countByAId(author.getId());
            countFs.add(countF);
        }
        map.put("stores", stores);
        map.put("authors", authors);
        map.put("attentions", attentions);
        map.put("countPosts", countPosts);
        map.put("countReviews", countReviews);
        map.put("countAs", countAs);
        map.put("countFs", countFs);
        // 时间格式化显示
        List<String> times = new ArrayList<String>();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String time;
        for (Post post : stores) {
            time = df.format(post.getTime());
            times.add(time);
        }
        map.put("times", times);

        return map;
    }

    @RequestMapping("/cancelStore")
    public void cancelStore(String postId, HttpServletResponse response, HttpSession session) throws IOException {
        User user = (User) session.getAttribute("user");
        userPostService.setIsStore("false", user.getId(), Integer.parseInt(postId));
        response.getWriter().write("success");
    }

    @RequestMapping("/findUserAttentions")
    @ResponseBody
    public Map<String, Object> findUserAttentions(HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        User user = (User) session.getAttribute("user");
        List<UserAttention> userAttentions = userAttentionService.findByUserId(user.getId());
        List<User> userList = new ArrayList<User>();
        if (userAttentions.size() > 0) {
            for (UserAttention userAttention : userAttentions) {
                User aUser = userService.findUserById(userAttention.getAttentionId());
                // 作者发帖数
                int countPost = postService.findPostsByUId(aUser.getId());
                aUser.setPostNum(countPost);
                // 作者回复数
                List<Review> reviews = reviewService.findReviewsByUserId(aUser.getId());
                aUser.setReviewNum(reviews.size());
                // 作者关注数
                int countA = userAttentionService.countByUId(aUser.getId());
                aUser.setAttentionNum(countA);
                // 作者粉丝数
                int countF = userAttentionService.countByAId(aUser.getId());
                aUser.setFanNum(countF);
                userList.add(aUser);
            }
        }
        map.put("ul", userList);
        return map;
    }

    @RequestMapping("/findUserFans")
    @ResponseBody
    public Map<String, Object> findUserFans(HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        User user = (User) session.getAttribute("user");
        List<UserAttention> userAttentions = userAttentionService.findByAttentionId(user.getId());
        List<User> userList = new ArrayList<User>();
        if (userAttentions.size() > 0) {
            for (UserAttention userAttention : userAttentions) {
                User aUser = userService.findUserById(userAttention.getUserId());
                // 作者发帖数
                int countPost = postService.findPostsByUId(aUser.getId());
                aUser.setPostNum(countPost);
                // 作者回复数
                List<Review> reviews = reviewService.findReviewsByUserId(aUser.getId());
                aUser.setReviewNum(reviews.size());
                // 作者关注数
                int countA = userAttentionService.countByUId(aUser.getId());
                aUser.setAttentionNum(countA);
                // 作者粉丝数
                int countF = userAttentionService.countByAId(aUser.getId());
                aUser.setFanNum(countF);
                userList.add(aUser);
            }
        }
        map.put("ul", userList);
        return map;
    }

    @RequestMapping("/cancelAttention3")
    public void cancelAttention3(String userId,HttpServletResponse response,HttpSession session) throws IOException {
        User user = (User) session.getAttribute("user");
        userAttentionService.delete(user.getId(), Integer.valueOf(userId));
        response.getWriter().write("success");
    }

    @RequestMapping("/payAttention")
    public void payAttention(String userId,HttpServletResponse response,HttpSession session) throws IOException {
        User user = (User) session.getAttribute("user");
        userAttentionService.add(user.getId(), Integer.valueOf(userId));
        response.getWriter().write("success");
    }
}
