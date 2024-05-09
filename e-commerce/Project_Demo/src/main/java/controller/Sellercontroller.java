package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import doa.sellerdoa;
import model.Customer;
import model.seller;

/**
 * Servlet implementation class Sellercontroller
 */
@WebServlet("/Sellercontroller")
public class Sellercontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sellercontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("Register")) {
			seller sell = new seller();
			sell.setName(request.getParameter("name"));
			sell.setEmail(request.getParameter("email"));
			sell.setContact(Long.parseLong(request.getParameter("contact")));
			sell.setAddress(request.getParameter("address"));
			sell.setPassword(request.getParameter("password"));
			System.out.println(sell);
			String email = request.getParameter("email");
			Boolean flag = sellerdoa.emailcheck(email);
			if (flag != true) {
				sellerdoa.register(sell);
				response.sendRedirect("sell-home.jsp");
			}
			else {
				request.setAttribute("msg", "Email Already Exists");
				request.getRequestDispatcher("sell-login.jsp").forward(request, response);
			}
		}
		else if (action.equalsIgnoreCase("login")) {
			seller sell = new seller();
			sell.setEmail(request.getParameter("email"));
			sell.setPassword(request.getParameter("password"));
			String email = request.getParameter("email");
			boolean check = sellerdoa.emailcheck(email);
			if (check == true) {
				seller s1 = sellerdoa.login(sell);
				if (s1 != null) {
					HttpSession session = request.getSession();
					session.setAttribute("data", s1);
					request.getRequestDispatcher("sell-home.jsp").forward(request, response);
				}
				else {
					request.setAttribute("msg1", "password Incorrect");
					request.getRequestDispatcher("sell-login.jsp").forward(request, response);
				}
			}
			else {
				request.setAttribute("msg", "Account Not Register");
				request.getRequestDispatcher("sell-login.jsp").forward(request, response);
			}
		}
		else if (action.equalsIgnoreCase("update")) {
			seller sell = new seller();
			sell.setId(Integer.parseInt(request.getParameter("id")));
			sell.setName(request.getParameter("name"));
			sell.setEmail(request.getParameter("email"));
			sell.setAddress(request.getParameter("address"));
			sell.setContact(Long.parseLong(request.getParameter("contact")));
			
			System.out.println(sell);
			sellerdoa.update(sell);
			HttpSession session = request.getSession();
			session.setAttribute("data", sell);
			request.getRequestDispatcher("sell-home.jsp").forward(request, response);
			
		}
		else if (action.equalsIgnoreCase("cp")) {
			String op = request.getParameter("op");
			String np = request.getParameter("np");
			String cp = request.getParameter("cp");
			int id = Integer.parseInt(request.getParameter("id"));
			boolean flag = sellerdoa.opcheck(id, op);
			if (flag==true) {
				if (np.equals(cp)) {
					sellerdoa.updatepassword(id, np);
					response.sendRedirect("sell-home.jsp");
				}
				else {
					request.setAttribute("msg1", "New & confirm password Doesn't match");
					request.getRequestDispatcher("sell-changepassword.jsp").forward(request, response);
				}
			}
			else {
				request.setAttribute("msg", "old password incorrect");
				request.getRequestDispatcher("sell-changepassword.jsp").forward(request, response);
			}
			
		}
	}

}
