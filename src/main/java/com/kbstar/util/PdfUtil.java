package com.kbstar.util;

import com.kbstar.dto.Match;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import java.io.FileOutputStream;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

@Component
public class PdfUtil {

    @Value("${PdfDir}")
    public  String PdfDir;
    @Value("${font}")
    public  String font;
    @Value("${logoImg}")
    public  String logoImg;
    // value annotation can only be used with non-static class
    // because value annotation is including getter,setter and constructors

    // 방법 1
    // 이 경우는 application.properties에 경로를 따로 지정
    // (1) @Component : 유틸화하고싶은 클래스를 @Component 로 부여
    // (2) @Autowired : 사용하고자하는 곳에 @Autowired
    // (3) non-static : 클래스 내 필드와 메소드가 non-static 이어도 객체가 주입되어 불러올 수 있음
    // (4) @Value : 따라서 non-static 필드와 같이 사용할 수 있는 @Value로 dir의 경로를 설정해줄 수 있음

    // 방법 2
    // 이 경우는 static필드로서 경로를 하드코딩으로 선언 ,
    // 혹은 메소드에 argument로 String dir 등으로 입력해서 사용
    // 따라서 이경우는 해당 유틸을 사용할 때에 경로 등도 함께 입력해주어서 사용( 첨부파일 저장경로 설정으로 생각.. )
    // (1) static : 유틸화하려는 클래스 내의 필드와 메소드를 static으로 선언
    // , static으로 선언된 메소드는 객체 생성없이 사용할 수 있으므로 @Autowired 없이 사용
    // (2) 경로를 변수로 : 대신 dir 등도 하드코딩으로 static 필드로 선언 혹은 argument로 메소드에 입력

    public String createPdf(Match obj) {
        String result = ""; // 초기값이 null이면 오류가 발생될 수 있기 때문에 공백
//        String PdfDir ="/Users/hyosunpark/sample.pdf";

        try{
            Document document = new Document(); // pdf문서를 처리하는 객체
            PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(PdfDir));
            // pdf 파일의 저장경로를 유저 아래에 sample.pdf로 한다는 뜻
            document.open();

            // Font
            BaseFont baseFont = BaseFont.createFont(font,BaseFont.IDENTITY_H,BaseFont.EMBEDDED);
            // Pdf가 기본적으로 한글처리가 안되기 때문에 한글폰트 처리를 따로 해주어야 함.
            // createFont메소드에 사용할 폰트의 경로를 지정해준다.
            // 만약에 이 경로에 없을 경우엔 java 파일로 만들어서 집어넣어야 함
            Font font_chunk = new Font(baseFont,30); // 폰트 사이즈를 12픽셀로
            Font font = new Font(baseFont,14); // 폰트 사이즈를 12픽셀로


            // Header
            Chunk chunk = new Chunk("영수증", font_chunk); // 타이틀 객체 생성
            Image logo = Image.getInstance(logoImg);
            logo.scaleToFit(200,200);
            Chunk co_name = new Chunk("봄생봄사", font); // 타이틀 객체 생성
            Chunk co_addr = new Chunk("대한민국 서울특별시 성동구 아차산로 111", font); // 타이틀 객체 생성
            Chunk co_phone = new Chunk("+82 982-314-0958", font); // 타이틀 객체 생성

            Paragraph ph = new Paragraph(chunk);
            ph.setAlignment(Element.ALIGN_CENTER);
            Paragraph ph_logo = new Paragraph();
            ph_logo.add(new Chunk(logo,0,0));
            Paragraph ph2 = new Paragraph(co_name);
            ph2.setAlignment(Element.ALIGN_LEFT);
            Paragraph ph3 = new Paragraph(co_addr);
            ph3.setAlignment(Element.ALIGN_RIGHT);
            Paragraph ph4 = new Paragraph(co_phone);
            ph4.setAlignment(Element.ALIGN_RIGHT);

            document.add(ph);
            document.add(Chunk.NEWLINE);//줄바꿈
            document.add(Chunk.NEWLINE);
            document.add(logo);
//            document.add(ph2); // 회사명 ( 기재하고싶으면 주석풀기 )
            document.add(ph3);
            document.add(ph4);
            document.add(Chunk.NEWLINE);
            document.add(Chunk.NEWLINE);

            PdfPTable table = new PdfPTable(4); //4개의 열을 가진 테이블 객체 생성

            String[] cellTitles = {"서비스명","일별가격","일수","총 결제금액"};
            BaseColor backgroundColor = BaseColor.BLUE;

            for ( String title : cellTitles ){
                PdfPCell cell = new PdfPCell(new Phrase(title, font));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                cell.setBackgroundColor(backgroundColor);
                table.addCell(cell);
            }

            // Create a PdfContentByte object from the PdfWriter
            PdfContentByte contentByte = writer.getDirectContent();

            // Create a PdfTemplate for the watermark image
            PdfTemplate template = contentByte.createTemplate(document.getPageSize().getWidth(), document.getPageSize().getHeight());
            template.setBoundingBox(new Rectangle(document.getPageSize()));
            PdfContentByte templateContentByte = writer.getDirectContentUnder();
            templateContentByte.addTemplate(template, 0, 0);

            // Set the transparency of the watermark
            PdfGState gs = new PdfGState();
            gs.setFillOpacity(0.5f);
            contentByte.setGState(gs);

            // Add the watermark image to the content
            Image watermark = Image.getInstance(logoImg);
            watermark.scaleToFit(document.getPageSize().getWidth(),document.getPageSize().getHeight());
            watermark.setAbsolutePosition(0, 100); // Adjust the position as needed
            watermark.setRotationDegrees(45);
            watermark.setScaleToFitLineWhenOverflow(true);
            contentByte.addImage(watermark);

            Paragraph ph5 = new Paragraph();
            ph5.setAlignment(Element.ALIGN_LEFT);

            String[] lineContents = new String[4];
            lineContents[0] = "결제자명: 김제니";
            lineContents[1] = "결제수단: " + obj.getPayment();
            lineContents[2] = "결제번호: " + obj.getId();
            lineContents[3] = "결제일자: " + obj.getPayDate();

            for (String content : lineContents){
                Paragraph line = new Paragraph();
                line.setAlignment(Element.ALIGN_LEFT);
                line.add(new Phrase(content, font));
                ph5.add(line);
            }

            ph5.setAlignment(Element.ALIGN_CENTER);
            document.add(ph5);
            document.add(Chunk.NEWLINE);
            document.add(Chunk.NEWLINE);
            document.add(Chunk.NEWLINE);

            PdfPCell cellProductName = new PdfPCell(new Phrase(obj.getService(), font));
            PdfPCell cellPrice = new PdfPCell(new Phrase("30,000원", font));

                // Calculate the difference between the dates
                String startDateString = obj.getStartDate();
                String endDateString = obj.getEndDate();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                LocalDate startDate = LocalDate.parse(startDateString, formatter);
                LocalDate endDate = LocalDate.parse(endDateString, formatter);
                long daysBetween = ChronoUnit.DAYS.between(startDate, endDate);

            PdfPCell cellDaysBetween = new PdfPCell(new Phrase("" +daysBetween, font));
            PdfPCell cellTotalPrice = new PdfPCell(new Phrase("" + obj.getPrice(), font));

            PdfPCell[] cells = new PdfPCell[4];
            cells[0]=cellProductName;
            cells[1]=cellPrice;
            cells[2]=cellDaysBetween;
            cells[3]=cellTotalPrice;

            for (PdfPCell cell : cells ) {
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(cell);
            }

            document.add(table);
            document.close();
            result = "pdf파일이 생성되었습니다.";

        }catch(Exception e){
            e.printStackTrace();
            result = "pdf파일 생성 실패...";
        }
        return result;
    }
}
