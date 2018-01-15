package com.servlet;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beans.Order;
import com.beans.User;
import com.service.OrderService;

@Controller
@RequestMapping("/cart")
public class CartController {
	@Autowired		
	OrderService ordersService;
	ModelAndView mv = new ModelAndView();
	
    @RequestMapping(value="/addcart",params="goodsid")
    public ModelAndView searchProducts(HttpServletRequest request){
    	//参数获取goodId
    	int id=Integer.valueOf(request.getParameter("goodsid"));
    	//session获取userId
    	User user = (User) request.getSession().getAttribute("user");
   	 if(user==null){
        	mv.setViewName("login");
        	mv.addObject("addmessage","请先登录");
   	 	}
   	 else{
   		 int uid = user.getUid();
    	
    	//根据双id查询订单
    	Order order = ordersService.selectOrderByUidGoodsId(uid, id);
    	//如果不存在这条记录，则新增一条；
    	if(order==null){
    		boolean bool=ordersService.insertOrder(uid, id);
    				if(bool){
    			mv.addObject("addmessage", "成功添加购物车");
    				}else {
    			mv.addObject("addmessage", "添加购物车失败");
    				}
				mv.setViewName("product_info");
		}else{
    	//添加购物车，将现有的数量加上1
    		int count = order.getCount()+1;
    		order.setCount(count);
    	//返回数据库修改记录
    		boolean bool = ordersService.updateOrder(order);
    	if(bool){
    			mv.addObject("addmessage", "成功添加购物车");
    	} else {
    			mv.addObject("addmessage", "添加购物车失败");
    	}
    			mv.setViewName("product_info");
    	}
    	}
   	 		return mv;
	}
    //****************用户购物车***********
    @RequestMapping(value="/usercart")
    public ModelAndView searchProduct(HttpServletRequest request){
    	User user =(User)request.getSession().getAttribute("user");
    if(user==null){
    	mv.setViewName("login");
    	return mv;
    	}
    else {
		int userId=user.getUid();
    	List<Order> orderList = new ArrayList<Order>();
		mv.setViewName("cart");
    	orderList =ordersService.selectOrder(userId);
    	mv.addObject("orderList", orderList);
    	return mv;
    	}
	}
    @RequestMapping(value="/changeCounts")
    public ModelAndView changeCounts(HttpServletRequest request){
	    	int orderId=Integer.valueOf(request.getParameter("orderId"));
	    	int count=Integer.valueOf(request.getParameter("count"));
	     	User user =(User)request.getSession().getAttribute("user");
        if(user==null){
        	mv.setViewName("login");
	    	return mv;}
        else{
    		int userId=user.getUid();
    		ordersService.changCounts(orderId, count);
	    	mv.addObject("orderList", ordersService.selectOrder(userId));
	    	mv.setViewName("cart");
	    	return mv;
        	}
    	}
    @RequestMapping(value="/deleteOrder")
    public ModelAndView deleteOrder(HttpServletRequest request){
    	int orderId=Integer.valueOf(request.getParameter("orderId"));
    	User user =(User)request.getSession().getAttribute("user");
    	 if(user==null){
         	mv.setViewName("login");
 	    	return mv;}
         else{
     		int userId=user.getUid();
     		ordersService.deleteOrder(orderId);
 	    	mv.addObject("orderList", ordersService.selectOrder(userId));
 	    	mv.setViewName("cart");
 	    	return mv;
         	}
    }
    //*********订单页查询*********s
    @RequestMapping("/order")
    public ModelAndView searchOrder(HttpServletRequest request){
    	User user =(User)request.getSession().getAttribute("user");
    if(user==null){
    	mv.setViewName("login");
    	return mv;
    	}
    else {
		int userId=user.getUid();
    	List<Order> orderList = new ArrayList<Order>();
		mv.setViewName("order");
    	orderList =(ArrayList<Order>)ordersService.selectOrder(userId);
    	int totals=0;
    	for(Order order:orderList){
    		int counts=	order.getCount();
    		int price=Integer.valueOf(order.getGoods().getGoodsPrice());
    		totals+=counts*price;
    		}
    	mv.addObject("totals", totals);
    	mv.addObject("orderList", orderList);
    	return mv;
    	}
	}
    //**********订单详细*********************
    @RequestMapping("/orderList")
    public ModelAndView searchOrderList(HttpServletRequest request){
    	User user =(User)request.getSession().getAttribute("user");
    if(user==null){
    	mv.setViewName("login");
    	return mv;
    	}
    else {
		int userId=user.getUid();
    	List<Order> orderList = new ArrayList<Order>();
		mv.setViewName("orderlist");
    	orderList =(ArrayList<Order>)ordersService.selectOrder(userId);
    	int totals=0;
    	int i=0;
    	for(Order order:orderList){
    		int counts=	order.getCount();
    		int price=Integer.valueOf(order.getGoods().getGoodsPrice());
    		totals+=counts*price;
    		i++;
    		}
    	mv.addObject("listnum",i);
    	mv.addObject("user",user);
    	mv.addObject("totals", totals);
    	mv.addObject("orderList", orderList);
    	return mv;
    	}
	}
}
