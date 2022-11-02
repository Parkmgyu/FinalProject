package com.example.project.controller.receipt;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.service.receipt.ReceiptService;

@Controller
@RequestMapping("receipt/*")
public class ReceiptController {
	@Inject
	ReceiptService receiptService;
	
	@RequestMapping("list.do")
	public ModelAndView list() throws Exception {
		//pdf 파일 생성
		String result=receiptService.createPdf();
		return new ModelAndView("receipt/result", "message", result);
	}
}
