package doa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import connection.DBconnection;
import model.Product;

public class ProductDAO {
	public static void uploadProduct(Product p) {
		try {
			Connection conn = DBconnection.drivConnection();
			String sql = "insert into product(sid,image,pname,pprice,pcategory,pdescription) values(?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, p.getSid());
			pst.setString(2, p.getPimage());
			pst.setString(3, p.getPname());
			pst.setInt(4, p.getPprice());
			pst.setString(5, p.getPcategory());
			pst.setString(6, p.getPdesc());
			pst.executeUpdate();
			System.out.println("product uploaded");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static List<Product> getallproduct(int sid) {
		List<Product> list= new ArrayList<Product>();
		try {
			Connection conn = DBconnection.drivConnection();
			String sql = "select * from product where sid=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, sid);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				Product p = new Product();
				p.setPid(rs.getInt("pid"));
				p.setSid(rs.getInt("sid"));
				p.setPimage(rs.getString("image"));
				p.setPname(rs.getString("pname"));
				p.setPprice(rs.getInt("pprice"));
				p.setPcategory(rs.getString("pcategory"));
				p.setPdesc(rs.getString("pdescription"));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return list;
		
	}
	public static List<Product> AllProductlist() {
		List<Product> list= new ArrayList<Product>();
		try {
			Connection conn = DBconnection.drivConnection();
			String sql = "select * from product";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				Product p = new Product(); 
				p.setPid(rs.getInt("pid"));
				p.setSid(rs.getInt("sid"));
				p.setPimage(rs.getString("image"));
				p.setPname(rs.getString("pname"));
				p.setPprice(rs.getInt("pprice"));
				p.setPcategory(rs.getString("pcategory"));
				p.setPdesc(rs.getString("pdescription"));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return list;
	}
	public static Product GetProductById(int id) {
		Product p = null;
		try {
			Connection conn = DBconnection.drivConnection();
			String sql = "select * from product where pid=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				p = new Product();
				p.setPid(rs.getInt("pid"));
				p.setSid(rs.getInt("sid"));
				p.setPimage(rs.getString("image"));
				p.setPname(rs.getString("pname"));
				p.setPprice(rs.getInt("pprice"));
				p.setPcategory(rs.getString("pcategory"));
				p.setPdesc(rs.getString("pdescription"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return p;
		
	}
	public static void updateProduct(Product p) {
		try {
			Connection conn = DBconnection.drivConnection();
			String sql="update product set image=?,pname=?,pprice=?,pcategory=?,pdescription=? where pid=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, p.getPimage());
			pst.setString(2, p.getPname());
			pst.setInt(3, p.getPprice());
			pst.setString(4, p.getPcategory());
			pst.setString(5, p.getPdesc());
			pst.setInt(6, p.getPid());
			pst.executeUpdate();
			System.out.println("product updated");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void Deleteproduct(int id) {
		try {
			Connection conn = DBconnection.drivConnection();
			String sql="delete  from product  where pid=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.executeUpdate();
			System.out.println("product deleted");
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
}
