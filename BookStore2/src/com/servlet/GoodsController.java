package com.servlet;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beans.Goods;
import com.service.GoodsService;
import com.util.GoodsSearchBg;
import com.util.GoodsSearchUtil;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	@Autowired
	GoodsService gs;

	//查询符合条件的所有商品
	@RequestMapping("/search")
	public ModelAndView searchGoods(String goodsType,String goodsName,Integer currentPage){
		ModelAndView mv = new ModelAndView();
		//创建商品表查询工具对象
		GoodsSearchUtil gsu = new GoodsSearchUtil();
		//设置查询条件
		if(goodsType == null){
			goodsType="全部商品";
		}
		gsu.setGoodsType(goodsType);
		gsu.setGoodsName(goodsName);
		//设置当前页和起始下标
		if(currentPage != null){
			gsu.setCurrentPage(currentPage);
		}
		gsu.setStart((gsu.getCurrentPage()-1)*gsu.getPageSize());
		//调用业务
		gsu = gs.selectGoods(gsu);

		mv.addObject("gsu", gsu);
		mv.setViewName("product_list");
		return mv;
	}

	//根据id查询商品
	@RequestMapping("searchById")
	public ModelAndView searchGoodsById(int goodsId){
		ModelAndView mv = new ModelAndView();
		//调用业务
		Goods goods = gs.selectGoodsById(goodsId);

		mv.addObject("goods", goods);
		mv.setViewName("product_info");
		return mv;
	}

	//后台多条件查询
	@RequestMapping("searchBg")
	public ModelAndView searchGoodsBg(GoodsSearchBg gsb,HttpServletRequest req){
		ModelAndView mv = new ModelAndView();

		if(gsb.getMinPrice()==null){
			gsb.setMinPrice(0);
		}
		if(gsb.getMaxPrice()==null){
			gsb.setMaxPrice(99999999);
		}

		//保存查询条件
		req.getSession().setAttribute("gsb", gsb);

		//调用业务
		List<Goods> goodsList = gs.selectGoodsBg(gsb);

		mv.addObject("goodsList", goodsList);
		mv.setViewName("../admin/products/list");
		return mv;
	}	

	//根据id查询商品
	@RequestMapping("searchByIdToAdd")
	public ModelAndView searchGoodsByIdToAdd(int goodsId){
		ModelAndView mv = new ModelAndView();
		//调用业务
		Goods goods = gs.selectGoodsById(goodsId);

		mv.addObject("goods", goods);
		mv.setViewName("../admin/products/add");
		return mv;
	}

	//根据id删除商品
	@RequestMapping("deleteGoodsById")
	public ModelAndView deleteGoodsById(int goodsId,HttpServletRequest req){
		ModelAndView mv = new ModelAndView();
		//调用删除业务
		gs.deleteGoodsById(goodsId);

		//获取查询条件
		GoodsSearchBg gsb = (GoodsSearchBg)req.getSession().getAttribute("gsb");

		//调用查询业务
		List<Goods> goodsList = gs.selectGoodsBg(gsb);

		mv.addObject("goodsList", goodsList);
		mv.setViewName("../admin/products/list");
		return mv;
	}


}
