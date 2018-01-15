package com.util;

import java.util.ArrayList;
import java.util.List;




import com.beans.Goods;
/**
 * Goods表多条件分页查询工具类
 * @author Administrator
 *
 */
public class GoodsSearchUtil {
	//当前页
	private int CurrentPage=1;
	//总页数
	private int TotalPages=1;
	//每页记录数
	private int pageSize=5;
	//起始行
	private int start;
	//条件
	private String goodsType;
	private String goodsName;
	//查询商品总数
	private int goodsNum;
	//搜索结果集合
	List<Goods> goodsList = new ArrayList<Goods>();
	
	
	
	public GoodsSearchUtil(int currentPage, int totalPages, int pageSize,
			int start, String goodsType, String goodsName, int goodsNum,
			List<Goods> goodsList) {
		super();
		CurrentPage = currentPage;
		TotalPages = totalPages;
		this.pageSize = pageSize;
		this.start = start;
		this.goodsType = goodsType;
		this.goodsName = goodsName;
		this.goodsNum = goodsNum;
		this.goodsList = goodsList;
	}


	public GoodsSearchUtil() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public int getGoodsNum() {
		return goodsNum;
	}


	public void setGoodsNum(int goodsNum) {
		this.goodsNum = goodsNum;
	}


	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getCurrentPage() {
		return CurrentPage;
	}
	public void setCurrentPage(int currentPage) {
		CurrentPage = currentPage;
	}
	public int getTotalPages() {
		return TotalPages;
	}
	public void setTotalPages(int totalPages) {
		TotalPages = totalPages;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getGoodsType() {
		return goodsType;
	}
	public void setGoodsType(String goodsType) {
		this.goodsType = goodsType;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public List<Goods> getGoodsList() {
		return goodsList;
	}
	public void setGoodsList(List<Goods> goodsList) {
		this.goodsList = goodsList;
	}
	
	
	
}
