package com.kbstar.util;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;

public class CapturePdfUtil extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            // Load the JSP file using JSoup
            String jspFilePath = "/path/to/your/jsp/file.jsp";
            Document jspDocument = Jsoup.parse(new File(jspFilePath), "UTF-8");

            // Extract the HTML content from the JSP document
            Element htmlElement = jspDocument.select("html").first();
            String htmlContent = htmlElement.html();

            // Convert HTML content to PDF
            byte[] pdfBytes = convertHtmlToPDF(htmlContent);

            // Set response headers for file download
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=captured-pdf.pdf");

            // Write the PDF bytes to the response output stream
            response.getOutputStream().write(pdfBytes);
        } catch (IOException ex) {
            ex.printStackTrace();
            // Handle exception and return appropriate response
        }
    }

    private byte[] convertHtmlToPDF(String htmlContent) throws IOException {
        // Convert HTML content to PDF using a PDF generation library
        // ...

        // For demonstration purposes, let's assume the conversion is done and we have the PDF bytes
        // Dummy implementation
        String filePath = "/path/to/save/pdf/file.pdf";
        File pdfFile = new File(filePath);
        pdfFile.getParentFile().mkdirs();
        pdfFile.createNewFile();
        FileOutputStream fos = new FileOutputStream(pdfFile);
        fos.write("Dummy PDF content".getBytes());
        fos.close();

        // Read PDF file bytes
        byte[] pdfBytes = Files.readAllBytes(pdfFile.toPath());

        // Delete the temporary PDF file (optional)
        pdfFile.delete();

        return pdfBytes;
    }
}
