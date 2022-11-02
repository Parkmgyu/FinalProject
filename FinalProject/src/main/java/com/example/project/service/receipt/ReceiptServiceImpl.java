package com.example.project.service.receipt;

import java.io.FileOutputStream;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.project.model.shop.dto.CartDTO;
import com.example.project.service.shop.CartService;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

@Service
public class ReceiptServiceImpl implements ReceiptService {
	@Inject
	CartService cartService;

	@Override
	public String createPdf() {
		String result="";
		try {
			//pdf 문서 객체
			Document document=new Document();
			//pdf 생성 객체
			PdfWriter writer=PdfWriter.getInstance(
					document, new FileOutputStream("c:/test/sample2.pdf"));
			document.open();
			//한글이 지원되는 폰트 지정(ex:HY견명조 보통-H2MJRE.TTF)
			BaseFont baseFont=BaseFont.createFont(
					"C:/Windows/Fonts/H2MJRE.TTF",
					BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
			//폰트 사이즈 지정
			Font font=new Font(baseFont, 12);
			//4컬럼 테이블 
			PdfPTable table=new PdfPTable(5);
			//Chunk : 문단(웹의 p태그와 비슷), 텍스트 내용
			Chunk chunk=new Chunk("구매내역",font);
			Paragraph ph=new Paragraph(chunk);
			ph.setAlignment(Element.ALIGN_CENTER); //가운데 정렬
			document.add(ph);
			document.add(Chunk.NEWLINE); //줄바꿈
			document.add(Chunk.NEWLINE);
			//document.add(Chunk.NEXTPAGE); //다음 페이지로
			//PdfCell : 셀 생성( <td> )
			PdfPCell cell1=new PdfPCell(new Phrase("구매자 이름",font));
			PdfPCell cell2=new PdfPCell(new Phrase("상품명",font));
			PdfPCell cell3=new PdfPCell(new Phrase("단가",font));
			PdfPCell cell4=new PdfPCell(new Phrase("수량",font));
			PdfPCell cell5=new PdfPCell(new Phrase("금액",font));
			//가운데 정렬
			cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell5.setHorizontalAlignment(Element.ALIGN_CENTER);

			//테이블에 셀 추가
			table.addCell(cell1);
			table.addCell(cell2);
			table.addCell(cell3);
			table.addCell(cell4);
			table.addCell(cell5);
			//장바구니 목록 리턴, listCart("사용자id")
			List<CartDTO> items=cartService.listCart("kim");
			for(int i=0; i<items.size(); i++) {
				CartDTO dto=items.get(i); //i번째 레코드를 dto에 저장
				PdfPCell cellName=new PdfPCell(
						new Phrase(dto.getName(), font));
				cellName.setHorizontalAlignment(
						Element.ALIGN_CENTER);
				table.addCell(cellName);
				PdfPCell cellProductName=new PdfPCell(
						new Phrase(dto.getProduct_name(), font));
				cellProductName.setHorizontalAlignment(
						Element.ALIGN_RIGHT);
				table.addCell(cellProductName);//테이블에 셀 추가
				//				PdfPCell cellPrice=new PdfPCell(
				//				new Phrase(dto.getPrice()+"", font));
				PdfPCell cellPrice=new PdfPCell(
						new Phrase(Integer.toString(dto.getPrice())
								, font));
				cellPrice.setHorizontalAlignment(
						Element.ALIGN_RIGHT);

				table.addCell(cellPrice);

				PdfPCell cellAmount=new PdfPCell(
						new Phrase(dto.getAmount()+"", font));
				cellAmount.setHorizontalAlignment(
						Element.ALIGN_RIGHT);
				table.addCell(cellAmount);

				PdfPCell cellMoney=new PdfPCell(
						new Phrase(dto.getMoney()+"", font));
				cellMoney.setHorizontalAlignment(
						Element.ALIGN_RIGHT);
				table.addCell(cellMoney);
			}

			//document에 테이블 추가
			document.add(table);
			//close() 할때 pdf 파일이 생성됨
			document.close();

			result="pdf 파일이 생성되었습니다.";
		} catch (Exception e) {
			result="pdf 파일 생성 실패...";
			e.printStackTrace();
		}
		return result;
	}

}
