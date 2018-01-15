package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beans.Order;
import com.dao.OrderDao;
import com.service.OrderService;
	@Service
public class OrderServceImpl implements OrderService {
	@Autowired
	OrderDao orderDao;
	@Override
	public List<Order> selectOrder(int userId) {
			return orderDao.selectOrder(userId);
		}

	@Override
	public boolean updateOrder(Order order) {
		
		return orderDao.updateOrder(order);
	}

	@Override
	public Order selectOrderByUidGoodsId(int uid, int goodsId) {
		return orderDao.selectOrderByUidGoodsId(uid, goodsId);
	}

	@Override
	public boolean changCounts(int orderId, int count) {
		
		return orderDao.changCounts(orderId, count);
	}

	@Override
	public boolean deleteOrder(int orderId) {
		
		return orderDao.deleteOrder(orderId);
	}
	 /*
	  * 根据userId新增订单
	  * @param int userId
	  * @param int bookId
	  * @return Boolean
	  */
	@Override
	public boolean insertOrder(int userId, int bookId) {
		
		return orderDao.insertOrder(userId, bookId);
	}
	
	}


