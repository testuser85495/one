package doa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.DBconnection;
import model.seller;

public class sellerdoa {
	public static boolean emailcheck(String email) {
		boolean flag=false;
		try {
			Connection conn = DBconnection.drivConnection();
			String sql ="select * from seller where email=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			ResultSet rs =pst.executeQuery();
			if (rs.next()) {
				flag = true;
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
		return flag;
	}
	public static void register(seller s) {
		try {
			Connection conn = DBconnection.drivConnection();
			String sql ="insert into seller (name,email,address,contact,password) values(?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, s.getName());
			pst.setString(2, s.getEmail());
			pst.setString(3, s.getAddress());
			pst.setLong(4, s.getContact());
			pst.setString(5, s.getPassword());
			pst.executeUpdate();
			System.out.println("Registation Done (:");
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	public static seller login(seller s) {
		seller sell = null;
		try {
			Connection conn = DBconnection.drivConnection();
			String sql ="select * from seller where email=? and password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, s.getEmail());
			pst.setString(2, s.getPassword());
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				sell = new seller();
				sell.setId(rs.getInt("id"));
				sell.setName(rs.getString("name"));
				sell.setEmail(rs.getString("email"));
				sell.setAddress(rs.getString("address"));
				sell.setContact(rs.getLong("contact"));
				sell.setPassword(rs.getString("password"));
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
		return  sell;
	}
	public static void update(seller s) {
		try {
			Connection conn = DBconnection.drivConnection();
			String sql ="update seller set name=?,email=?,contact=?,address=? where id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, s.getName());
			pst.setString(2, s.getEmail());
			pst.setLong(3, s.getContact());
			pst.setString(4, s.getAddress());
			pst.setInt(5, s.getId());
			pst.executeUpdate();
			System.out.println("update done (:");
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	public static boolean opcheck(int id ,String op) {
		boolean flag = false;
		try {
			Connection conn = DBconnection.drivConnection();
			String sql ="select * from seller where id=? and password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, op);
		 	ResultSet rs=pst.executeQuery();
		 	if (rs.next()) {
				flag= true;
			}
			
		} catch (Exception e) {
			e.getStackTrace();
		}
		return flag;
	}
	public static void updatepassword(int id,String np) {
		try {
			Connection conn = DBconnection.drivConnection();
			String sql ="update seller set password=? where id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, np);
			pst.setInt(2, id);
			pst.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}

}
