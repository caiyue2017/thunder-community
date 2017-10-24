package controller;

import domain.*;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.PostService;
import service.ReviewService;
import service.UserPostService;
import service.UserService;
import util.DateUtil;
import util.ImageUploadUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by 越 on 2017/3/29.
 */
@Controller
@RequestMapping("/post")
public class PostController {
    @Resource
    private PostService pService;
    @Resource
    private UserService userService;
    @Resource
    private UserPostService userPostService;

    /**
     * 发帖
     *
     * @param post
     * @param session
     * @return
     */
    @RequestMapping("/sendPost")
    public String/*ModelAndView*/ sendPost(Post post, HttpSession session) {
        User user = (User) session.getAttribute("user");
        userService.addPostNum(user.getId());
        post.setAuthor(user.getUsername());
        post.setTime(new Date());
        post.setUserId(user.getId());
        post.setSectionId(1);// 分板块，先写为1
        post.setLastReviewUN(user.getUsername());
        post.setLastReviewT(post.getTime());
        pService.addPost(post);
        WebsocketController.broadcastAll("有新内容");
        /*WebsocketController.broadcast("post","有新内容");*/
        return "redirect:/";
    }

    /**
     * 编辑器图片上传
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
     * 修改基本信息中的图片上传
     *
     * @param request
     * @param response
     */
    @RequestMapping("/imageUploadInBase")
    @ResponseBody
    public Map<String, Object> imageUploadInBase(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String directoryName = "jsp/img/user";
        String fileName = ImageUploadUtil.upload(request, directoryName);
        String imageContextPath = request.getContextPath() + "/" + directoryName + "/" + fileName;
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("url", imageContextPath);
        map.put("url2","img/user/" + fileName);
        return map;
    }
    @RequestMapping("/editBase")
    public String editBase(User user,HttpSession session){
        User currentUser = (User) session.getAttribute("user");
        String img = user.getImg();
        if (img!=null&&img!="")
            currentUser.setImg(img);
        String username = user.getUsername();
        if (username!=null&&username!="")
            currentUser.setUsername(username);
        String sex = user.getSex();
        if (sex!=null&&sex!="")
            currentUser.setSex(sex);
        String address = user.getAddress();
        if (address!=null&&address!="")
            currentUser.setAddress(address);
        String qq = user.getQq();
        if (qq!=null&&qq!="")
            currentUser.setQq(qq);
        String email = user.getEmail();
        if (email!=null&&email!="")
            currentUser.setEmail(email);
        String phone = user.getPhone();
        if (phone!=null&&phone!="")
            currentUser.setPhone(phone);
        String text = user.getText();
        if (text!=null&&text!="")
            currentUser.setText(text);
        userService.update(currentUser.getId(),currentUser.getImg(),currentUser.getUsername(),currentUser.getSex(),currentUser.getAddress(),currentUser.getQq(),currentUser.getEmail(),currentUser.getPhone(),currentUser.getText());
        return "redirect:/jsp/user/userIndex.jsp";
    }

    /**
     * 发送帖子列表（主页）
     *
     * @return
     */
    @RequestMapping("/showPosts")
    @ResponseBody
    public Map<String, Object> showSection(HttpSession session) {
        // 创建一个map，用来封装数据
//        System.out.println("发送帖子列表");
        Map<String, Object> postMap = new HashMap<String, Object>();
        List<Post> postList = pService.findPostsBySID(1);
        List<Post> post2List = new ArrayList<Post>();
        List<List<String>> times = new ArrayList<List<String>>();
        List<String> time;
        List<List<String>> times2 = new ArrayList<List<String>>();
        List<String> time2;
        // 排除删除贴，置顶贴优先
        for (Post p : postList) {
            if (p != null) {
                if (p.getIsDelete().equals("false") && p.getIsTop().equals("true")) {
                    setPostList(post2List, times, times2, p);
                }
            }
        }
        for (Post p : postList) {
            if (p.getIsDelete().equals("false") && p.getIsTop().equals("false")) {
                setPostList(post2List, times, times2, p);
            }
        }
        postMap.put("pl", post2List);
        postMap.put("times", times);
        postMap.put("times2", times2);
        // 时间排序（一周为例）
        // 这些写在前端比较好，点击才加载
        String month, day;
        List<Post> weekList = new ArrayList<Post>();
        List<List<String>> weekTimes = new ArrayList<List<String>>();
        int cDay = new Date().getDate();
        int cMonth = new Date().getMonth() + 1;
        for (int i = 0; i < times.size(); i++) {
            month = times.get(i).get(1);
            day = times.get(i).get(2);
            if (cMonth - Integer.parseInt(month) == 0) {
                int temp = cDay - Integer.parseInt(day);
                if (temp <= 7) {
                    time = DateUtil.getYMDHMM(post2List.get(i).getTime());
                    weekTimes.add(time);
                    weekList.add(post2List.get(i));
                }
            }
        }
        postMap.put("wl", weekList);
        postMap.put("wt", weekTimes);

        // 精华
        List<Post> goodList = new ArrayList<Post>();
        List<List<String>> goodTimes = new ArrayList<List<String>>();
        for (Post p : post2List) {
            if (p != null) {
                if (p.getIsDelete().equals("false") && p.getIsGood().equals("true")) {
                    time = DateUtil.getYMDHMM(p.getTime());
                    goodTimes.add(time);
                    goodList.add(p);
                }
            }
        }
        for (Post p : post2List) {
            if (p.getIsDelete().equals("false") && p.getIsGood().equals("false")) {
                time = DateUtil.getYMDHMM(p.getTime());
                goodTimes.add(time);
                goodList.add(p);
            }
        }
        postMap.put("gl", goodList);
        postMap.put("gt", goodTimes);
        return postMap;
    }

    private void setPostList(List<Post> post2List, List<List<String>> times, List<List<String>> times2, Post p) {
        List<String> time;
        List<String> time2;
        time = DateUtil.getYMDHMM(p.getTime());
        times.add(time);
        time2 = DateUtil.getYMDHMM(p.getLastReviewT());
        times2.add(time2);
        post2List.add(p);
    }

    /**
     * 发送帖子列表（管理页面）
     *
     * @return
     */
    @RequestMapping("/showPosts2")
    @ResponseBody
    public Map<String, Object> showSection2() throws Exception {
//        System.out.println("发送帖子列表2");
        Map<String, Object> postMap = new HashMap<String, Object>();
        List<Post> postList = pService.findPostsBySID(1);
        List<Post2> post2List = new ArrayList<Post2>();
        Post2 post2;
        for (Post p : postList) {
            post2 = new Post2();
            post2.setId(p.getId());
            post2.setTitle(p.getTitle());
            post2.setAuthor(p.getAuthor());
            post2.setTime(p.getTime());
            post2.setIsTop(p.getIsTop());
            post2.setIsGood(p.getIsGood());
            if (p.getIsDelete().equals("false")) {
                post2.setIsDelete(p.getIsDelete());
                post2List.add(post2);
            }
        }
        // 设置时间显示格式
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String time;
        for (Post2 p2 : post2List) {
            time = df.format(p2.getTime());
            p2.setStringTime(time);
        }

        postMap.put("pl", post2List);
        return postMap;
    }

    /**
     * 帖子页面
     *
     * @param request
     * @param session
     * @return
     */
    @RequestMapping("/showPost")
    public String showPost(HttpServletRequest request, HttpSession session) {
        String id = request.getParameter("id");
        User user = (User) session.getAttribute("user");
        // 查询是否点赞，收藏
        if (user != null) {
            UserPost userPost = userPostService.find(user.getId(), Integer.parseInt(id));
            if (userPost != null) {
                if (userPost.getIsUp().equals("true"))
                    request.setAttribute("isUp", "true");
                else
                    request.setAttribute("isUp", "false");
                if (userPost.getIsStore().equals("true"))
                    request.setAttribute("isStore", "true");
                else
                    request.setAttribute("isStore", "false");
            } else {
                request.setAttribute("isUp", "false");
                request.setAttribute("isStore", "false");
            }
        } else {
            request.setAttribute("isUp", "false");
            request.setAttribute("isStore", "false");
        }
        // 查询帖子
        Post post = pService.findPostById(Integer.parseInt(id));
        pService.AddOneBrowseRecord(Integer.parseInt(id));
        request.setAttribute("post", post);
        User author = userService.findUserById(post.getUserId());
        request.setAttribute("author", author);
        session.setAttribute("postId", post.getId());
        return "post/showPost";
    }

    /**
     * 置顶
     *
     * @param request
     * @return
     */
    @RequestMapping("/setTop")
    public void setTop(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        String check = request.getParameter("check");
        String isTop;
        if (check.equals("true"))
            isTop = "true";
        else
            isTop = "false";
        pService.updatePostTop(isTop, Integer.parseInt(id));
        WebsocketController.broadcastAll("有新内容");
        response.getWriter().write("success");
    }

    /**
     * 加精
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/setGood")
    public void setGood(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        String check = request.getParameter("check");
//        System.out.println(id+check);
        String isGood;
        if (check.equals("true"))
            isGood = "true";
        else
            isGood = "false";
        pService.updatePostGood(isGood, Integer.parseInt(id));
        WebsocketController.broadcastAll("有新内容");
        response.getWriter().write("success");
    }

    /**
     * 搜索帖子
     *
     * @param request
     * @param session
     * @return
     */

    @RequestMapping("/searchPosts")
    public String searchPosts(HttpServletRequest request, HttpSession session) {
        String word = request.getParameter("word");
        List<Post> postSearch = pService.findPostsByWord("%" + word + "%");
        for (Post post : postSearch) {
            String[] arr = post.getTitle().split(word);
            String title = "";
            String html = "<font color=\"#FF0000\">" + word + "</font>";
            for (int i = 0; i < arr.length; i++) {
                title += arr[i];
                if (i != arr.length - 1)
                    title += html;
                else if (post.getTitle().endsWith(word))
                    title += html;
            }
            post.setTitle(title);
        }
        session.setAttribute("postSearch", postSearch);
        return "redirect:/jsp/searchPosts.jsp";
    }

    /**
     * 利用ajax异步显示搜索出来的帖子列表
     *
     * @param session
     * @return
     */
    @RequestMapping("/ajaxSearchPosts")
    @ResponseBody
    public Map<String, Object> ajaxSearchPosts(HttpSession session) {
        // 创建一个map，用来封装数据
        Map<String, Object> postMap = new HashMap<String, Object>();
        List<Post> postSearch = (List<Post>) session.getAttribute("postSearch");
        List<List<String>> timesSearch = new ArrayList<List<String>>();
        List<String> time;
        for (Post r : postSearch) {
            time = DateUtil.getYMDHMM(r.getTime());
            timesSearch.add(time);
        }
        postMap.put("ps", postSearch);
        postMap.put("ts", timesSearch);
        return postMap;
    }

    /**
     * 删帖
     *
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/deletePost")
    public void deletePost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        pService.deletePostById(Integer.parseInt(id));
        WebsocketController.broadcastAll("有新内容");
        response.getWriter().write("success");
    }

    @RequestMapping("/setIsUp")
    public void setIsUp(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            String isUp = request.getParameter("isUp");
            Integer postId = (Integer) session.getAttribute("postId");
            pService.setUpNum(isUp, postId);
            UserPost userPost = userPostService.find(user.getId(), postId);
            if (userPost == null)
                userPostService.add(user.getId(), postId);
            userPostService.setIsUp(isUp, user.getId(), postId);
            response.getWriter().write("success");
        } else
            response.getWriter().write("null");
    }

    @RequestMapping("/setIsStore")
    public void setIsStore(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        String isStore = request.getParameter("isStore");
        Integer postId = (Integer) session.getAttribute("postId");
        pService.setStoreNum(isStore, postId);
        User user = (User) session.getAttribute("user");
        UserPost userPost = userPostService.find(user.getId(),postId);
        if (userPost==null)
            userPostService.add(user.getId(),postId);
        userPostService.setIsStore(isStore, user.getId(), postId);
        response.getWriter().write("success");
    }

    @RequestMapping("/hotPosts")
    @ResponseBody
    public Map<String, Object> hotPosts() {
        Map<String, Object> map = new HashMap<String, Object>();
        List<Post> hotPosts = pService.findPostsOrderByBrowseNum();
        map.put("hp", hotPosts);
        return map;
    }

    @RequestMapping("/hotReviews")
    @ResponseBody
    public Map<String, Object> hotReviews() {
        Map<String, Object> map = new HashMap<String, Object>();
        List<Post> hotReviews = pService.findPostsOrderByReviewNum();
        map.put("hr", hotReviews);
        return map;
    }

    @RequestMapping("/forumDescription")
    @ResponseBody
    public Map<String, Object> forumDescription() {
        Map<String, Object> map = new HashMap<String, Object>();
        List<User> users = userService.findAllUsers();
        List<Post> posts = pService.findAllPosts();
        List<Post> todayPosts = pService.findTodayPosts();
        map.put("users", users.size());
        map.put("posts", posts.size());
        map.put("todayPosts", todayPosts.size());
        return map;
    }
}
