package com.servlet;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.beans.User;
import com.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	ModelAndView mv = new ModelAndView();
	
	//修改用户信息*****修改用户信息*****修改用户信息*****跳转到modifyuserinfo.jsp
	@RequestMapping("/updateUser")
	public ModelAndView searchProducts(User user,HttpServletRequest request){
		user =new User();
		user.setPassword(request.getParameter("password"));
		user.setGender(request.getParameter("gender"));
		user.setPhone(request.getParameter("phone"));
		user.setAddress(request.getParameter("address"));
		user.setUid(Integer.valueOf(request.getParameter("Uid")));
		System.out.println(user);
		boolean bool = userService.updateUserById(user);
		if(bool){  
			
            user = userService.findUserById(user.getUid());  
            mv.setViewName("modifyUserInfoSuccess");
            request.getSession().setAttribute("user", user);
        }else{
        	mv.setViewName("myAccount");
    		mv.addObject("error","操作失败，请再次尝试");
        } 
		return mv; 
	}
	
	//根据id查询用户信息*****根据id查询用户信息*****根据id查询用户信息*****跳转到？？？？？
	@RequestMapping("/getUser")  
    public ModelAndView getUser(int id){
		mv.setViewName("play");
 		mv.addObject("user",userService.findUserById(id));  
        return mv;
    }
	
    //登录验证********登录验证********登录验证********登录验证********成功跳转到index.jsp
    @RequestMapping("/checkLogin")
    public ModelAndView checkLogin(User user,HttpServletRequest request) throws IOException{
    	//调用service方法
        user = userService.checkLogin(user.getUsername(), user.getPassword());
        //判断user是否为空
        if(user != null){
        	       	
        	request.getSession().setAttribute("user", user); 
        	if("admin".equals(user.getIdentity())){
        		mv.setViewName("../admin/login/home");
        	}else{
        		mv.setViewName("index");  
            	request.getSession().setAttribute("loginSuccess", "登录成功在线"); 
        	}
        	
        }else{
        	mv.setViewName("login");
     		mv.addObject("error","用户名或者密码错误,登录失败");  
        }
        		return mv;
    }
    
    //跳转我的账户路径确认***********跳转我的账户路径确认***********成功跳转myAccount.jsp
    @RequestMapping("/onlineTest")
    public ModelAndView onlineTest(HttpServletRequest request){

    	User user = (User) request.getSession().getAttribute("user");   	
    	if(user != null){ 		
	        mv.setViewName("myAccount");
    	}else{
    		mv.setViewName("index"); 	
    	}
    	return mv;
    }
    
    //注销*************注销*************注销*************
    @RequestMapping("/outLogin")
    public ModelAndView outLogin(HttpServletRequest request,HttpSession session){
        //调用session.invalidata()将数据从session中去除
        session.invalidate();
        
        //System.out.println("***************************");
        //System.out.println(request.getAttribute("user"));

        mv.setViewName("login");
 		mv.addObject("loginerror","用户名或者密码错误,登录失败"); 
        return mv;
    }
    
}
