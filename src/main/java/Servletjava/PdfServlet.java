package Servletjava;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

@WebServlet("/pdf")
public class PdfServlet extends HttpServlet {

protected void doGet(
HttpServletRequest request,
HttpServletResponse response)

throws IOException {

try{

response.setContentType(
"application/pdf"
);

response.setHeader(
"Content-Disposition",
"attachment; filename=students.pdf"
);

Document document =
new Document();

PdfWriter.getInstance(
document,
response.getOutputStream()
);

document.open();

Font titleFont =
FontFactory.getFont(
FontFactory.HELVETICA_BOLD,
20
);

Paragraph title =
new Paragraph(
"Student Report",
titleFont
);

title.setAlignment(
Element.ALIGN_CENTER
);

document.add(title);

document.add(new Paragraph(" "));

PdfPTable table =
new PdfPTable(8);

table.setWidthPercentage(100);

table.addCell("ID");
table.addCell("Name");
table.addCell("Email");
table.addCell("Course");
table.addCell("Phone");
table.addCell("Gender");
table.addCell("Status");
table.addCell("Join Date");

ConnectionDb db =
new ConnectionDb();

ResultSet rs =
db.getData();

while(rs.next()){

table.addCell(
String.valueOf(
rs.getInt("id"))
);

table.addCell(
rs.getString("name")
);

table.addCell(
rs.getString("email")
);

table.addCell(
rs.getString("course")
);

table.addCell(
rs.getString("phone")
);

table.addCell(
rs.getString("gender")
);

table.addCell(
rs.getString("status")
);

table.addCell(
rs.getString("joined_date")
);

}

document.add(table);

document.close();

}
catch(Exception e){

e.printStackTrace();
}
}
}