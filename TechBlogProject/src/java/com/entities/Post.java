package com.entities;

import com.helper.ConnectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Post {

    private int pid;
    private String title;
    private String content;
    private String code;
    private String pic;
    private Timestamp date;
    private int cid;
    private int uid;

    public Post() {
    }

    public Post(int pid, String title, String content, String code, String pic, Timestamp date, int cid, int uid) {
        this.pid = pid;
        this.title = title;
        this.content = content;
        this.code = code;
        this.pic = pic;
        this.date = date;
        this.cid = cid;
        this.uid = uid;
    }

    public Post(String title, String content, String code, String pic, int cid, int uid) {
        this.title = title;
        this.content = content;
        this.code = code;
        this.pic = pic;
        this.cid = cid;
        this.uid = uid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    //Store post in db
    public boolean savePost() {
        boolean saved = false;
        try {
            Connection con = ConnectionProvider.createConnection();
            String query = "insert into post(ptitle, pcontent,pcode,ppic,cid,uid) values"
                    + "(?,?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, title);
            pst.setString(2, content);
            pst.setString(3, code);
            pst.setString(4, pic);
            pst.setInt(5, cid);
            pst.setInt(6, uid);
            pst.executeUpdate();
            saved = true;
        } catch (SQLException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }
        return saved;
    }

    //Get All Post
    public ArrayList<Post> getAllPost() {
        ArrayList<Post> list = new ArrayList<>();

        try {
            Connection con = ConnectionProvider.createConnection();
            //Getting post sorted by latest time
            String query = "select * from post order by pdate desc";
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                int pid = rs.getInt(1);
                String title = rs.getString(2);
                String content = rs.getString(3);
                String code = rs.getString(4);
                String pic = rs.getString(5);
                Timestamp date = rs.getTimestamp(6);
                int cid = rs.getInt(7);
                int uid = rs.getInt(8);
                Post p = new Post(pid, title, content, code, pic, date, cid, uid);
                list.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    //Get All Post By id
    public ArrayList<Post> getAllPostByCid(int cid) {
        ArrayList<Post> list = new ArrayList<>();

        try {
            Connection con = ConnectionProvider.createConnection();
            String query = "select * from post where cid=? order by pdate desc";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, cid);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                int pid = rs.getInt(1);
                String title = rs.getString(2);
                String content = rs.getString(3);
                String code = rs.getString(4);
                String pic = rs.getString(5);
                Timestamp date = rs.getTimestamp(6);
                int uid = rs.getInt(8);
                Post p = new Post(pid, title, content, code, pic, date, cid, uid);
                list.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public Post getAllPostByPid(int pid) {
        Post post = null;
        try {
            Connection con = ConnectionProvider.createConnection();
            String query = "select * from post where pid=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, pid);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                String title = rs.getString(2);
                String content = rs.getString(3);
                String code = rs.getString(4);
                String pic = rs.getString(5);
                Timestamp date = rs.getTimestamp(6);
                int cid = rs.getInt(7);
                int uid = rs.getInt(8);
                post = new Post(pid, title, content, code, pic, date, cid, uid);
            }

        } catch (SQLException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }

        return post;
    }

}
