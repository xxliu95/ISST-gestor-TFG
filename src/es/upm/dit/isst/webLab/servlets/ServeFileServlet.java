package es.upm.dit.isst.webLab.servlets;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import es.upm.dit.isst.webLab.dao.TFGDAO;
import es.upm.dit.isst.webLab.dao.TFGDAOImplementation;
import es.upm.dit.isst.webLab.model.TFG;

@WebServlet("/ServeFileServlet")
public class ServeFileServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter( "email" );
		
		TFGDAO tdao = TFGDAOImplementation.getInstance();
		TFG tfg = tdao.read(email);
		
		resp.setContentLength(tfg.getDocument().length);
		resp.getOutputStream().write(tfg.getDocument());
	}
}
