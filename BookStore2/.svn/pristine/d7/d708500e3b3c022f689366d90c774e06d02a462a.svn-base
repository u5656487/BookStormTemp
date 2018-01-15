package com.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.beans.Goods;
import com.dao.GoodsDao;
import com.service.GoodsService;
import com.util.GoodsSearchBg;
import com.util.GoodsSearchUtil;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	GoodsDao gd;
	@Override
	public GoodsSearchUtil selectGoods(GoodsSearchUtil gsu) {
		List<Goods> goodsList = new ArrayList<Goods>(); 
		
		goodsList = gd.selectGoodsByPage(gsu);
		gsu.setGoodsList(goodsList);
		
		int goodsNum = gd.selectGoodsNum(gsu);
		gsu.setGoodsNum(goodsNum);
		
		int totalPages = (int)Math.ceil(goodsNum*1.0/gsu.getPageSize());
		if(totalPages == 0){
			totalPages=1;
		}
		gsu.setTotalPages(totalPages);
		return gsu;
	}

	@Override
	public Goods selectGoodsById(int goodsId) {
		
		return gd.selectGoodsById(goodsId);
	}

	@Override
	public List<Goods> selectGoodsBg(GoodsSearchBg gsb) {
		// TODO Auto-generated method stub
		return gd.selectGoodsBg(gsb);
	}

	@Override
	public Integer deleteGoodsById(int goodId) {
		// TODO Auto-generated method stub
		return gd.deleteGoodsById(goodId);
	}

	@Override
	public int add(Goods goods) {
		// TODO Auto-generated method stub
		return gd.add(goods);
	}
	

}
