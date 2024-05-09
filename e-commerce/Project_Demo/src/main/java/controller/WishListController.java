package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import doa.ProductDAO;
import doa.WishLIstDAO;
import model.Product;
import model.WishList;

/**
 * Servlet implementation class WishListController
 */
@WebServlet("/WishListController")
public class WishListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("addtowishlist")) {
			int pid = Integer.parseInt(request.getParameter("pid"));
			Product p = ProductDAO.GetProductById(pid);
			WishList w = new WishList();
			w.setPid(pid);
			w.setCustid(Integer.parseInt(request.getParameter("cusid")));
			w.setSid(p.getSid());
			w.setPprice(p.getPprice());
			w.setImage(p.getPimage());
			w.setPname(p.getPname());
			w.setPcategory(p.getPcategory());
			w.setPdescription(p.getPdesc());
			w.setCustid(Integer.parseInt(request.getParameter("cusid")));
			w.setPid(Integer.parseInt(request.getParameter("pid")));
			WishLIstDAO.insertWishList(w);
			
			response.sendRedirect("shop.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
