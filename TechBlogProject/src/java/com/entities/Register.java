package com.entities;

import com.helper.ConnectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Register {

    private int id;
    private String name;
    private String email;
    private String pwd;
    private Timestamp dateTime;
    private String profile;

    public Register() {
    }

    public Register(String name, String email, String pwd) {
        this.name = name;
        this.email = email;
        this.pwd = pwd;
    }

    public Register(int id, String name, String email, String pwd, Timestamp dateTime, String profile) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.pwd = pwd;
        this.dateTime = dateTime;
        this.profile = profile;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
    

    public boolean userExist() {
        int res = 0;
        try {
            Connection con = ConnectionProvider.createConnection();
            String query = "select count(*) from register where email=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                res = rs.getInt(1);
            }
            if (res == 0) {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;
    }

    public boolean saveUser() {

        boolean registerd = false;
        try {
            Connection con = ConnectionProvider.createConnection();
            String query = "insert into register(name, email, password) values"
                    + "(?,?,?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, name);
            pst.setString(2, email);
            pst.setString(3, pwd);
            pst.executeUpdate();
            registerd = true;
        } catch (SQLException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }
        return registerd;

    }

    public int loginUser(String mail, String pwd) {
        int res = 0;
        try {
            Connection con = ConnectionProvider.createConnection();
            String query = "select count(*) from register where email=? and password=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, mail);
            pst.setString(2, pwd);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                res = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }
        return res;
    }
    
    //get User Details by email and password
    public Register getUserByMailAndPwd(String mail, String pwd){
        Register user = null;
        try {
            Connection con = ConnectionProvider.createConnection();
            String query = "select * from register where email=? and password=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, mail);
            pst.setString(2, pwd);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                user = new Register();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPwd(rs.getString("password"));
                user.setDateTime(rs.getTimestamp("reg_date"));
                user.setProfile(rs.getString("profile"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }
    
    public boolean updateUser(Register user){
        boolean updated = false;
        try {
            Connection con = ConnectionProvider.createConnection();
            String query = "update register set name=?, email=?, password=?, profile=? where id=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, user.getName());
            pst.setString(2, user.getEmail());
            pst.setString(3, user.getPwd());
            pst.setString(4, user.getProfile());
            pst.setInt(5, user.getId());
            pst.executeUpdate();
            updated = true;
            
        } catch (SQLException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }
        return updated;
    }
    
    //get User Details by pid
    public Register getUserByUid(int uid){
        Register user = null;
        try {
            Connection con = ConnectionProvider.createConnection();
            String query = "select * from register where id=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, uid);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                user = new Register();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPwd(rs.getString("password"));
                user.setDateTime(rs.getTimestamp("reg_date"));
                user.setProfile(rs.getString("profile"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }
}
