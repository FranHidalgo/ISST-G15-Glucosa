package es.isst.g15;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.isst.g15.dao.ControlGlucosaDAOImpl;
import es.isst.g15.dao.ControlGlucosaDao;
import es.isst.g15.model.Usuario;

public class ServletSeleccionaPaciente extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		String paciente = req.getParameter("paciente");
		
		ControlGlucosaDao dao = ControlGlucosaDAOImpl.getInstance();
		Usuario user = dao.getPaciente(paciente);
		
		List<String> medidas = user.getMedidas();
		List<String> datos = new ArrayList<String>();
		List<String> fechas = new ArrayList<String>();
		List<String> dates = new ArrayList<String>();
		
		for (int i = 0; i<medidas.size(); i++){
			int coma = medidas.get(i).indexOf(",");
			String dato = medidas.get(i).substring(0, coma);
			datos.add(dato);
			String fecha = medidas.get(i).substring(coma+1);
			fechas.add(fecha);
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			try {
				Date date = df.parse(fecha);
				dates.add(date.toString());
			} catch (ParseException e) {
				e.printStackTrace();
			}			
		}
		
		req.getSession().setAttribute("datos", datos);
		req.getSession().setAttribute("medidas", medidas);
		req.getSession().setAttribute("fechas", fechas);
		req.getSession().setAttribute("dates", dates);
		
		resp.sendRedirect("/dataM.jsp");
		
		
		
	}
	
}