package doa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import connection.DBconnection;
import model.cart;

public class Cartdoa {
	public static boolean checkCartItem(int pid,int cid) {
		boolean flag = false;
		try {
			Connection conn = DBconnection.drivConnection();
			String sql = "select * from cart where cid=? and pid=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, cid);
			pst.setInt(2, pid);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return flag;
	}
	public static void insertcart(cart c) {
		try {
			Connection conn = DBconnection.drivConnection();
			String sql ="insert into cart (cid,pid,qty,pprice,total_price,payment,pname,pimage) values(?,?,?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			System.out.println("inside insertcart");
//			pst.setInt(1, c.getId());
			pst.setInt(1, c.getCid());
			pst.setInt(2, c.getPid());
			pst.setInt(3, c.getQty());
			pst.setInt(4, c.getPprice());
			pst.setInt(5, c.getTotal_price());
			pst.setString(6, c.getPayment());
			pst.setString(7, c.getPname());
			pst.setString(8, c.getPimage());
			pst.executeUpdate();
			System.out.println("insert to cart");
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
	public static List<cart> getCartBycustId(int id) {
		List<cart> list =  new ArrayList<cart>();
		try {
			Connection conn = DBconnection.drivConnection();
			String sql ="select * from cart where cid=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				cart c = new cart();
				c.setId(rs.getInt("id"));
				c.setPid(rs.getInt("pid"));
				c.setCid(rs.getInt("cid"));
				c.setQty(rs.getInt("qty"));
				c.setPname(rs.getString("pname"));
				c.setPimage(rs.getString("pimage"));
				c.setPprice(rs.getInt("pprice"));
				c.setTotal_price(rs.getInt("total_price"));
				c.setPayment(rs.getString("payment"));
				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return list;
	}
	public static void Deletefromcartbycustid(int id) {
		try {
			Connection conn = DBconnection.drivConnection();
			String sql ="delete from cart where id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.executeUpdate();
			System.out.println("delete successfully");
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}

}
