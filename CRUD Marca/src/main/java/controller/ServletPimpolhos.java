package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO;
import model.Marca;

/**
 * Servlet implementation class ServletPimpolhos
 */
@WebServlet("/ServletPimpolhos")
public class ServletPimpolhos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private DAO dao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletPimpolhos() {
        super();
        // TODO Auto-generated constructor stub
        this.dao = new DAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		String option = request.getParameter("option");
		if (option == null) {
			option = "Opção Invalida";
		}
		switch(option) {
			case ("insertForm"):
				showInsertUser(request, response);
			break;
			case ("updateForm"):
				showUpdateUser(request, response);
			break;
			case ("update"):
				updateUser(request, response);
			break;
			case ("delete"):
				deleteUser(request, response);
			break;
			case ("insert"):
				insertUser(request, response);
			break;
			default:
				selectAllUsers(request, response);
		}
		
	}

	
	
	private void showInsertUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.getRequestDispatcher("formMarca.jsp").forward(request, response);
	}
	
	private void showUpdateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Integer id = Integer.parseInt(request.getParameter("cod_marca"));
		Marca marca = this.dao.recuperarMarca(id);
		request.setAttribute("marca", marca);
		request.getRequestDispatcher("formMarca.jsp").forward(request, response);
	}
	
	private void insertUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String nomeBack = request.getParameter("name");
		
		
		if (nomeBack != null) {
			if (!nomeBack.equals("")){
				Marca user1 = new Marca (nomeBack);
				this.dao.inserir(user1);
	}
		}
		response.sendRedirect("ServletPimpolhos");
	}
	
	private void selectAllUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		request.setAttribute("listUser", this.dao.exibir());
		request.getRequestDispatcher("indexMarca.jsp").forward(request, response);
	}
	
	private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idBack = request.getParameter("cod_marca");
		if (idBack != null) {
			Integer id = Integer.parseInt(idBack);
			this.dao.deletar(id);
		}
		response.sendRedirect("ServletPimpolhos");
	}
	
	private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idBack = request.getParameter("cod_marca");
		String nomeBack = request.getParameter("name");
		
		if ((nomeBack != null) && (idBack != null)) {
			if (!nomeBack.equals("")){
				Integer id = Integer.parseInt(idBack);
				Marca marca = new Marca (nomeBack);
				marca.setCod_marca(id);
				this.dao.atualizar(marca);
			}
		}
		response.sendRedirect("ServletPimpolhos");
	}
	
	
	
}
