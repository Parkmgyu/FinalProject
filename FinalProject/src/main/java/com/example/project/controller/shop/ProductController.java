package com.example.project.controller.shop;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.shop.dto.CategoryDTO;
import com.example.project.model.shop.dto.ProductDTO;
import com.example.project.service.shop.ProductService;
import com.example.project.service.shop.RecentService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("shop/product/*")
public class ProductController {
	
	private static final Logger logger=LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	ProductService productService;
	
	@Inject
	RecentService recentService;
	
	@RequestMapping("list.do")
	public ModelAndView list(ModelAndView mav) {
		mav.setViewName("/shop/product_list");
		mav.addObject("list", productService.listProduct());
		return mav;
	}
	
	/*@RequestMapping("detail/{product_id}")
	public ModelAndView detail(@PathVariable int product_id, ModelAndView mav) {
		mav.setViewName("/shop/product_detail");
		mav.addObject("dto", productService.detailProduct(product_id));
		return mav;
	}*/
	@RequestMapping("detail/{product_id}")
	public ModelAndView detail(HttpSession session, @PathVariable int product_id, ModelAndView mav) {
		
		String userid = (String)session.getAttribute("userid");
		mav.setViewName("/shop/product_detail");
		mav.addObject("dto", productService.detailProduct(product_id));
		
		ProductDTO productDto = new ProductDTO();
		
		productDto.setProduct_id(product_id);
		productDto.setUserid(userid);
		
		recentService.insert(productDto);
		
		return mav;
	}
	
	/*@RequestMapping("insert.do")
	public String insert(@ModelAttribute ProductDTO dto) {
		String filename="-";
		if(!dto.getFile1().isEmpty()) {
			filename=dto.getFile1().getOriginalFilename();
			try {
				String path="C:\\work_spring\\.metadata\\.plugins"
						+ "\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps"
						+ "\\spring02\\WEB-INF\\views\\images\\";
				new File(path).mkdir();
				dto.getFile1().transferTo(new File(path+filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		dto.setPicture_url(filename);
		productService.insertProduct(dto);
		return "redirect:/shop/product/list.do";
	}*/
	@RequestMapping(value="insert.do", method = {RequestMethod.POST})
	public String insert(@ModelAttribute ProductDTO dto) {
		String filename="-";
		if(!dto.getFile1().isEmpty()) {
			filename=dto.getFile1().getOriginalFilename();
			try {
				String path="C:\\work\\.metadata\\.plugins"
						+ "\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps"
						+ "\\FinalProject\\WEB-INF\\views\\images\\";
				new File(path).mkdir();
				dto.getFile1().transferTo(new File(path+filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		dto.setPicture_url(filename);
		productService.insertProduct(dto);
		return "redirect:/shop/product/list.do";
	}
	
	/*@RequestMapping("edit/{product_id}")
	public ModelAndView edit(@PathVariable("product_id") int product_id, ModelAndView mav) {
		mav.setViewName("shop/product_edit");
		mav.addObject("dto", productService.detailProduct(product_id));
		return mav;
	}*/
	@RequestMapping("edit/{product_id}")
	public ModelAndView edit(@PathVariable("product_id") int product_id, ModelAndView mav) {
		List<CategoryDTO> category = null;
		category = productService.category();		
		mav.setViewName("shop/product_edit");
		mav.addObject("category", JSONArray.fromObject(category));
		mav.addObject("dto", productService.detailProduct(product_id));
		return mav;
	}
	
	@RequestMapping("update.do")
	public String update(ProductDTO dto) {
		String filename="-";
		if(!dto.getFile1().isEmpty()) {
			filename=dto.getFile1().getOriginalFilename();
			try {
				String path="C:\\work\\.metadata\\.plugins\\"
				+ "org.eclipse.wst.server.core\\tmp0\\wtpwebapps"
				+ "\\FinalProject\\WEB-INF\\views\\images\\";
				new File(path).mkdir();
				dto.getFile1().transferTo(new File(path+filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
			dto.setPicture_url(filename);
		} else {
			ProductDTO dto2=productService.detailProduct(dto.getProduct_id());
			dto.setPicture_url(dto2.getPicture_url());
		}
		productService.updateProduct(dto);
		return "redirect:/admin/list.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(@RequestParam int product_id) {
		String filename=productService.fileInfo(product_id);
		System.out.println("첨부파일 이름 : " + filename);
		if(filename != null && !filename.equals("-")) {
			String path="C:\\work\\.metadata\\.plugins"
					+ "\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps"
					+ "\\FinalProject\\WEB-INF\\views\\images\\";
			File f = new File(path + filename);
			System.out.println("파일 존재 여부 : " + f.exists());
			if (f.exists()) {
				f.delete();
				System.out.println("파일이 삭제되었습니다.");
			}
		}
		productService.deleteProduct(product_id);
		return "redirect:/admin/list.do";
	}
	
}
