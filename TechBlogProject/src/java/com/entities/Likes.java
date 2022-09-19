package com.entities;

import com.helper.ConnectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Likes {

    public boolean insertLike(int pid, int uid) {
        boolean saved = false;
        try {
            Connection con = ConnectionProvider.createConnection();
            String query = "insert into likes(pid, uid) values(?,?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, pid);
            pst.setInt(2, uid);

            pst.executeUpdate();
            saved = true;
        } catch (SQLException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }
        return saved;
    }

    public int countLikeOnPost(int pid) {
        int count = 0;
        try {
            Connection con = ConnectionProvider.createConnection();
            String query = "select count(*) from likes where pid=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, pid);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);// or rs.getInt("count(*)")
            }
        } catch (SQLException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }

        return count;
    }

    public boolean isLikedByUser(int pid, int uid) {
        boolean liked = false;
        try {
            Connection con = ConnectionProvider.createConnection();
            String query = "select * from likes where pid=? and uid=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, pid);
            pst.setInt(2, uid);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                liked = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }

        return liked;
    }

    public boolean deleteLike(int pid, int uid) {
        boolean deleted = false;
        try {
            Connection con = ConnectionProvider.createConnection();
            String query = "delete from likes where pid=? and uid=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, pid);
            pst.setInt(2, uid);
            pst.executeUpdate();
            deleted = true;
        } catch (SQLException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }

        return deleted;
    }
}
