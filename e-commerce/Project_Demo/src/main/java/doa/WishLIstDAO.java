package doa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.DBconnection;
import model.WishList;

public class WishLIstDAO {
	public static void insertWishList(WishList w) {
		try {
			Connection conn = DBconnection.drivConnection();
			String sql = "insert into wishlist(custid,pid,pprice,image,pname,pcategory,pdescription) values(?,?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, w.getCustid());
			pst.setInt(2, w.getPid());
			pst.setInt(3,w.getPprice());
			pst.setString(4, w.getImage());
			pst.setString(5, w.getPname());
			pst.setString(6,w.getPcategory());
			pst.setString(7, w.getPdescription());
			
			pst.executeUpdate();
			System.out.println("prodcut added to wishlist");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static List<WishList> getWishListByCusId(int id) {
		List<WishList> list = new ArrayList<WishList>();
		try {
			Connection conn = DBconnection.drivConnection();
			String sql = "select * from wishlist where custid=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				WishList w = new WishList();
				w.setWid(rs.getInt("wid"));
				w.setCustid(rs.getInt("custid"));
				w.setPid(rs.getInt("pid"));
				w.setPname(rs.getString("pname"));
				w.setPprice(rs.getInt("pprice"));
				w.setPcategory(rs.getString("pcategory"));
				w.setImage(rs.getString("image"));
				w.setPdescription(rs.getString("pdescription"));
				list.add(w);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return list;
	}
	public static Boolean checkWishItem(int pid, int cusid) {
		Boolean flag = false;
//		System.out.println("inside checkwish");
		try {
			Connection conn = DBconnection.drivConnection();
			String sql = "select * from wishlist where pid=? and custid=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, pid);
			pst.setInt(2, cusid);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				flag=true;
//				System.out.println("true");
			}
//			System.out.println("true");
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return flag;
	}
	public static void deleteWishlist(int id) {
		try {
			Connection conn = DBconnection.drivConnection();
			String sql = "delete from wishlist where wid=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.executeUpdate();
			System.out.println("remove ");
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
}
