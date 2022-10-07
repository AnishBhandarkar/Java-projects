package com.entity;

import com.helper.ConnectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Note {

    private int nId;
    private String nTitle;
    private String nContent;
    private Timestamp dateTime;

    public Note() {
    }

    public Note(String nTitle, String nContent) {
        this.nTitle = nTitle;
        this.nContent = nContent;
    }

    public Note(int nId, String nTitle, String nContent, Timestamp dateTime) {
        this.nId = nId;
        this.nTitle = nTitle;
        this.nContent = nContent;
        this.dateTime = dateTime;
    }

    public Note(int nId, String nTitle, String nContent) {
        this.nId = nId;
        this.nTitle = nTitle;
        this.nContent = nContent;
    }
    

    public int getnId() {
        return nId;
    }

    public void setnId(int nId) {
        this.nId = nId;
    }

    public String getnTitle() {
        return nTitle;
    }

    public void setnTitle(String nTitle) {
        this.nTitle = nTitle;
    }

    public String getnContent() {
        return nContent;
    }

    public void setnContent(String nContent) {
        this.nContent = nContent;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }

    public boolean addNoteToDb() {
        boolean saved = false;
        try {
            Connection conn = ConnectionProvider.createConnection();
            String query = "insert into Note(ntitle,ncontent) values(?,?)";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1, nTitle);
            pst.setString(2, nContent);
            int status = pst.executeUpdate();
            if (status != 0) {
                saved = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return saved;
    }

    public boolean updateNoteToDb() {
        boolean updated = false;
        try {
            Connection conn = ConnectionProvider.createConnection();
            String query = "update note set ntitle=?, ncontent=?, ndate=? where nid=?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1, nTitle);
            pst.setString(2, nContent);
            pst.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
            pst.setInt(4, nId);
            int status = pst.executeUpdate();
            if (status != 0) {
                updated = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return updated;
    }

    public boolean deleteNote(int nid) {
        boolean deleted = false;
        try {
            Connection con = ConnectionProvider.createConnection();
            String query = "delete from note where nid=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, nid);
            pst.executeUpdate();
            deleted = true;
        } catch (SQLException ex) {
            Logger.getLogger(Note.class.getName()).log(Level.SEVERE, null, ex);
        }
        return deleted;
    }

    public ArrayList<Note> getAllNotes() {
        ArrayList<Note> list = new ArrayList<>();

        try {
            Connection con = ConnectionProvider.createConnection();
            String query = "select * from note order by ndate desc;";
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                int nid = rs.getInt(1);
                String ntitle = rs.getString(2);
                String ncontent = rs.getString(3);
                Timestamp date_time = rs.getTimestamp(4);
                Note c = new Note(nid, ntitle, ncontent, date_time);
                list.add(c);
            }

        } catch (SQLException ex) {
            Logger.getLogger(Note.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public Note getNoteByNid(int nid) {
        Note note = null;
        try {
            Connection con = ConnectionProvider.createConnection();
            String query = "select * from note where nid=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, nid);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                String ntitle = rs.getString(2);
                String ncontent = rs.getString(3);
                Timestamp date_time = rs.getTimestamp(4);
                note = new Note(nid, ntitle, ncontent, date_time);
            }

        } catch (SQLException ex) {
            Logger.getLogger(Note.class.getName()).log(Level.SEVERE, null, ex);
        }

        return note;
    }
}
