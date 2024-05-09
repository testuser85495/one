package doa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.DBconnection;
import model.Customer;
import model.Product;

public class Customerdoa {
	public static boolean emailcheck(String email) {
		boolean check = false;
		try {
			Connection conn = DBconnection.drivConnection();
			String sql = "select * from customer where email=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				check = true;
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
		return check;
	}
	public static void register(Customer c) {
		try {
			Connection conn = DBconnection.drivConnection();
			String sql = "insert into customer(name,email,password,address,contact) values(?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, c.getName());
			pst.setString(2, c.getEmail());
			pst.setString(3, c.getPassword());
			pst.setString(4, c.getAddress());
			pst.setLong(5, c.getContact());
			pst.executeUpdate();
			System.out.println("Register Successfully !!!");
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	public static Customer login(Customer c) {
		Customer cus = null;
		try {
			Connection conn = DBconnection.drivConnection();
			String sql = "select * from customer where email=? and password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, c.getEmail());
			pst.setString(2, c.getPassword());
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				cus = new Customer();
				cus.setId(rs.getInt("id"));
				cus.setName(rs.getString("name"));
				cus.setEmail(rs.getString("email"));
				cus.setAddress(rs.getString("address"));
				cus.setPassword(rs.getString("password"));
				cus.setContact(rs.getLong("contact"));
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
		return cus;
	}
	public static void update(Customer c) {
		try {
			Connection conn = DBconnection.drivConnection();
			String sql = "update customer set name=?,email=?,contact=?,address=? where id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, c.getName());
			pst.setString(2, c.getEmail());
			pst.setLong(3, c.getContact());
			pst.setString(4, c.getAddress());
			pst.setInt(5, c.getId());
			pst.executeUpdate();
			System.out.println("data update");
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	public static boolean opcheck(int id , String op) {
		boolean flag=false;
		try {
			Connection conn = DBconnection.drivConnection();
			String sql = "select * from customer where id=? and password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, op);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				flag=true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return flag;
	}
	public static void updatepassword(int id,String np) {
		try {
			Connection conn = DBconnection.drivConnection();
			String sql = "update customer set password=? where id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, np);
			pst.setInt(2, id);
			pst.executeUpdate();
			System.out.println("password update");
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	
}
