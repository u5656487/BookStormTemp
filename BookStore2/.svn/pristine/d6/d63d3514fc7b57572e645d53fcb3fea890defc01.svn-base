package com.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.beans.User;
import com.dao.GoodsDao;
import com.dao.UserDao;
import com.service.GoodsService;
import com.service.impl.GoodsServiceImpl;
import com.util.GoodsSearchUtil;


public class T1 {

	@Test
	public void aaa(){
		ApplicationContext context=new ClassPathXmlApplicationContext(new String[]{
				"spring/applicationContext.xml",
				"spring/applicationContext-dao.xml",
				"spring/applicationContext-service.xml",
		});
		GoodsDao gd = (GoodsDao)context.getBean("goodsDao");
		//GoodsService gs = (GoodsService)context.getBean("goodsService");

		
		System.out.println(gd.deleteGoodsById(55));
	}
	
	
	

	@Test
	public void test(){
		ApplicationContext context=new ClassPathXmlApplicationContext(new String[]{
				"spring/applicationContext.xml",
				"spring/applicationContext-dao.xml",
				"spring/applicationContext-service.xml",
		});
		UserDao ud = (UserDao)context.getBean("userDao");
		
		User user = new User();
		user.setUsername("八哥");
		user.setPhone("23567");
		boolean bl = ud.insertUser(user);
	//	boolean bl = ud.updateUserById(user);
		
		System.out.println(bl);
		//System.out.println(gd.selectGoodsByPage(gsu));
		//System.out.println(gd.selectGoodsNum(gsu));
		
	}

}
