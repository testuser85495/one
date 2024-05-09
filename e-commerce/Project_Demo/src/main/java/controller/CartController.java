package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import doa.Cartdoa;
import doa.ProductDAO;
import model.Product;
import model.cart;

/**
 * Servlet implementation class CartController
 */
@WebServlet("/CartController")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("addtocart")) {
			
			int pid = Integer.parseInt(request.getParameter("pid"));
			Product p = ProductDAO.GetProductById(pid);
			cart crt = new cart();
			crt.setPid(Integer.parseInt(request.getParameter("pid")));
			crt.setCid(Integer.parseInt(request.getParameter("cid")));
			crt.setQty(1);
			crt.setPprice(p.getPprice());
			crt.setPimage(p.getPimage());
			crt.setPname(p.getPname());
			crt.setTotal_price(p.getPprice());
			crt.setPayment("pending");
			System.out.println("cart data "+crt);
			Cartdoa.insertcart(crt);
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
