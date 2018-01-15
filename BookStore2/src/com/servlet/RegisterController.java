package com.servlet;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beans.User;
import com.service.UserService;

@Controller
@RequestMapping("/register")
public class RegisterController {

	@Autowired
	UserService userService;
	@RequestMapping(value="/reg")	
	public ModelAndView register(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		ModelAndView mv = new ModelAndView();

		//获取参数,保存在user中
		User user = new User();
		user.setEmail(request.getParameter("email"));
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
						request.getParameter("rePassword");
						request.getParameter("mess");
		user.setGender(request.getParameter("gender"));
		user.setPhone(request.getParameter("telephone"));
		user.setAddress(request.getParameter("address"));
			
		//根据user新增
		boolean bool = userService.insertUser(user);
		if(bool){
			mv.setViewName("registersuccess");
		}else{
			mv.setViewName("register");
		}
		return mv;
    }
	
	@RequestMapping(value="/check")	
	public void check(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		
	}
}
