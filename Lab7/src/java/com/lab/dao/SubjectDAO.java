package com.lab.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.lab.bean.SubjectBean;

public class SubjectDAO {

    private String dbURL = "jdbc:mysql://localhost:3306/lab7_db";
    private String dbUser = "root";
    private String dbPassword = "admin";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    // CREATE
    public boolean addSubject(SubjectBean subject) {
        try (Connection conn = getConnection()) {
            String sql = "INSERT INTO registered_subjects (matric_no, subject_name) VALUES (?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, subject.getMatricNo());  // was 2, also had 3 params in SQL
            pstmt.setString(2, subject.getSubjectName()); // was 3
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // READ — all subjects for a specific student
    public List<SubjectBean> getSubjectsByMatric(String matricNo) {
        List<SubjectBean> list = new ArrayList<>();
        try (Connection conn = getConnection()) {
            String sql = "SELECT * FROM registered_subjects WHERE matric_no = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, matricNo);  // was 2
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                SubjectBean s = new SubjectBean();
                s.setId(rs.getInt("id"));
                s.setMatricNo(rs.getString("matric_no"));
                s.setSubjectName(rs.getString("subject_name"));
                list.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // READ — single subject by id (for update form)
    public SubjectBean getSubjectById(int id) {
        SubjectBean subject = null;
        try (Connection conn = getConnection()) {
            String sql = "SELECT * FROM registered_subjects WHERE id = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                subject = new SubjectBean();
                subject.setId(rs.getInt("id"));
                subject.setMatricNo(rs.getString("matric_no"));
                subject.setSubjectName(rs.getString("subject_name"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return subject;
    }

    // UPDATE
    public boolean updateSubject(SubjectBean subject) {
        try (Connection conn = getConnection()) {
            String sql = "UPDATE registered_subjects SET subject_name = ? WHERE id = ? AND matric_no = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, subject.getSubjectName());
            pstmt.setInt(2, subject.getId());     // was 3
            pstmt.setString(3, subject.getMatricNo()); // was 4
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // DELETE
    public boolean deleteSubject(int id, String matricNo) {
        try (Connection conn = getConnection()) {
            String sql = "DELETE FROM registered_subjects WHERE id = ? AND matric_no = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            pstmt.setString(2, matricNo);
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}