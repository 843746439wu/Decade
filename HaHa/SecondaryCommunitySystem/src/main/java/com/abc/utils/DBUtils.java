package com.abc.utils;

import java.sql.*;

public class DBUtils {

    private static final String CONN_URL
            ="jdbc:mysql://localhost:3306/db_administer?useUnicode=true&characterEncoding=utf8&useSSL=true&serverTimezone=UTC";
    private static final String USERNAME="2018user";
    private static final String PWD = "123321";

    public static Connection getConn(){

        Connection connection = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(CONN_URL,USERNAME,PWD);
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return connection;

    }

    /**
     * @param conn
     * @param pstmt
     * @param rset
     */
    public static void releaseRes(Connection conn, PreparedStatement pstmt, ResultSet rset){

        try {
            if(rset!=null) rset.close();
            if(pstmt!=null) pstmt.close();
            if(conn!=null) conn.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

}