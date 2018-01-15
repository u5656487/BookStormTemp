package com.servlet;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.portlet.ModelAndView;

import com.beans.User;
import com.service.UserService;

@Controller
@RequestMapping("/upload")
public class UploadController {
	@Autowired
	UserService userService;
	@RequestMapping("/fileUpload")	  
	public String fileUpload(@RequestParam("photo") MultipartFile file,HttpServletRequest request) {  
		//文件保存路径
	 	String path = request.getSession().getServletContext().getRealPath("upload");
		//如果文件不为空，写入上传路径
        if(!file.isEmpty()) {
            //上传文件名
            String filename = file.getOriginalFilename();
            //根据地址 文件名——生成文件
            File filepath = new File(path,filename);
            
            //将图片名字放入user的account字段
            User user = (User) request.getSession().getAttribute("user");
            user.setAccount(filename);
        	userService.updateUserById(user);
            //判断路径是否存在，如果不存在就创建一个
            if(!filepath.exists()){  
            	filepath.mkdirs();  
	        }  
            //将文件保存到硬盘上  
	        try {  
	           file.transferTo(filepath);  
	       } catch (Exception e) {  
	           e.printStackTrace();  
	       }  
	    }else{
	    	System.out.println("文件不存在");
	    } 
        return "modifyuserinfo";
	}
	@RequestMapping("/showphoto")
	public ModelAndView showphoto(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		User user = (User) request.getSession().getAttribute("user");
		user = userService.findUserById(user.getUid());
		String photo = user.getAccount();
		mv.addObject("photo", photo);
		mv.setViewName("modifyuserinfo");
		return mv;
	}
}
