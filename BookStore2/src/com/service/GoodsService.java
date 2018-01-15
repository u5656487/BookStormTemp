package com.service;

import java.util.List;

import com.beans.Goods;
import com.beans.Order;
import com.util.GoodsSearchBg;
import com.util.GoodsSearchUtil;


public interface GoodsService {
	/**
	 * 多条件分页查询
	 * 参数：GoodsSearchUtil gsu
	 * 返回：GoodsSearchUtil gsuBack
	 */
	public GoodsSearchUtil selectGoods(GoodsSearchUtil gsu);
	
	/**
	 * 根据goodId查询商品信息
	 * 参数：int goodsId
	 * 返回：Goods goods
	 */
	public Goods selectGoodsById(int goodsId);
	
	/**
	 * 后台多条件查询所有商品
	 * 参数：GoodsSearchBg gs
	 * 返回：List<Goods>
	 */
	public List<Goods> selectGoodsBg(GoodsSearchBg gsb);	
	
	/**
	 * 根据goodId删除商品信息
	 * 参数：int goodId
	 * 返回：int line
	 */
	public Integer deleteGoodsById(int goodId);
	
	/**
	 * 添加商品
	 * 参数：Goods goods
	 * 返回：int line
	 */
	public int add(Goods goods);
	
}
