package com.service;

import java.util.List;

import com.beans.Order;

public interface OrderService {
	/*
	 * ����dao�㷽����ѯ
	 * ���userId��ѯorder��goods��
	 * return:List<Order>
	 * param:int userId 
	 */
	List<Order>  selectOrder(int userId);

	/*
	 * 根据用户id和货物id修改订单数量
	 * @param uid
	 * @param goodId
	 * @return boolean
	 */
	public boolean updateOrder(Order order);
	
	/*
	 * 双id查询订单
	 * @param uid
	 * @param goodId
	 * @return
	 */
	public Order selectOrderByUidGoodsId(int uid,int goodsId);
	/*
	 * 根据订单Id进行数量修改
	 * @param orderid,count
	 * @return boolean
	 */
	boolean changCounts(int orderId,int count);
	/*
	  * 根据id删除订单
	  * @param int orderid
	  * @param int count
	  * @return Boolean
	  */
	 boolean deleteOrder(int orderId);
	 /*
	  * 根据userId新增订单
	  * @param int userId
	  * @param int bookId
	  * @return Boolean
	  */
	 boolean insertOrder(int userId,int bookId);
	 
}
