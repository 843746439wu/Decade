/**
 * 
 */
package com.abc.dao;

import java.io.IOException;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

import com.abc.domain.Comic;
import com.abc.utils.DBUtils;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author Decade
 *
 */
public class ComicDaoJDBCImpl implements ComicDao {
	
	private static final String SQL_ADD_COMIC="insert into tbl_comic values(?,?,?,?,?,?,?,?,?,?,?)";
	private static final String SQL_LOAD_COMIC= "select * from tbl_comic ORDER by comic_pinyin ASC ";
	private static final String SQL_DEL_COMIC="delete from tbl_comic where comic_name=?";
	private static final String SQL_GET_COMIC_BYNAME="select * from tbl_comic where comic_name=?";
	private static final String SQL_UPDAT_COMIC = "update tbl_comic set comic_pinyin=?,comic_number=? ,comic_pic=? ,comic_introduce=? ,comic_type1=? ,comic_type2=? ,comic_time=? ,comic_platform=? ,comic_aplatform=? ,comic_bplatform=? where comic_name=?";
	private static final String SQL_GET_PIC_BYNAME="select comic_pic from tbl_comic where comic_name=?";

	@Override
	public void addComic(Comic comic) {

		Connection conn = DBUtils.getConn();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(SQL_ADD_COMIC);
			pstmt.setString(1, comic.getComic_pinyin());
			pstmt.setString(2, comic.getComic_name());
			pstmt.setInt(3, comic.getComic_number());
			pstmt.setBytes(4,comic.getComic_pic());
			pstmt.setString(5, comic.getComic_introduce());
			pstmt.setString(6, comic.getComic_type1());
			pstmt.setString(7, comic.getComic_type2());
			pstmt.setString(8, comic.getComic_time());
			pstmt.setString(9, comic.getComic_platform());
			pstmt.setString(10, comic.getComic_aplatform());
			pstmt.setString(11, comic.getComic_bplatform());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBUtils.releaseRes(conn, pstmt, null);
		}
		
	}

	@Override
	public List<Comic> loadComics() {
		
		Connection conn = DBUtils.getConn();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Comic> comicList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(SQL_LOAD_COMIC);
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				Comic c = new Comic();
				c.setComic_pinyin(rset.getString("comic_pinyin"));
				c.setComic_pic(rset.getBytes("comic_pic"));
				c.setComic_name(rset.getString("comic_name"));
				c.setComic_introduce(rset.getString("comic_introduce"));
				c.setComic_type1(rset.getString("comic_type1"));
				c.setComic_type2(rset.getString("comic_type2"));
				c.setComic_time(rset.getString("comic_time"));
				c.setComic_number(rset.getInt("comic_number"));
				c.setComic_platform(rset.getString("comic_platform"));
				c.setComic_aplatform(rset.getString("comic_aplatform"));
				c.setComic_bplatform(rset.getString("comic_bplatform"));
				comicList.add(c);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBUtils.releaseRes(conn, pstmt, rset);
		}
		
		return comicList;
		
	}

	@Override
	public void delComic(String comic_name) {

		Connection conn = DBUtils.getConn();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(SQL_DEL_COMIC);
			pstmt.setString(1, comic_name);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBUtils.releaseRes(conn, pstmt, null);
		}
		
	}

	@Override
	public Comic getComicByName(String comic_name) {

		Connection conn = DBUtils.getConn();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Comic c = null;
		
		try {
			pstmt = conn.prepareStatement(SQL_GET_COMIC_BYNAME);
			pstmt.setString(1, comic_name);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				c = new Comic();
				c.setComic_pinyin(rset.getString("comic_pinyin"));
				c.setComic_pic(rset.getBytes("comic_pic"));
				c.setComic_name(rset.getString("comic_name"));
				c.setComic_introduce(rset.getString("comic_introduce"));
				c.setComic_type1(rset.getString("comic_type1"));
				c.setComic_type2(rset.getString("comic_type2"));
				c.setComic_time(rset.getString("comic_time"));
				c.setComic_number(rset.getInt("comic_number"));
				c.setComic_platform(rset.getString("comic_platform"));
				c.setComic_aplatform(rset.getString("comic_aplatform"));
				c.setComic_bplatform(rset.getString("comic_bplatform"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBUtils.releaseRes(conn, pstmt, rset);
		}
		
		return c;
		
	}

	@Override
	public void updateComic(Comic comic) {

		Connection conn = DBUtils.getConn();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(SQL_UPDAT_COMIC);
			pstmt.setString(1,comic.getComic_pinyin());
			pstmt.setString(2,comic.getComic_name());
			pstmt.setInt(3, comic.getComic_number());
			pstmt.setBytes(4,comic.getComic_pic());
			pstmt.setString(5, comic.getComic_introduce());
			pstmt.setString(6, comic.getComic_type1());
			pstmt.setString(7, comic.getComic_type2());
			pstmt.setString(8,  comic.getComic_time());
			pstmt.setString(9, comic.getComic_platform());
			pstmt.setString(10, comic.getComic_aplatform());
			pstmt.setString(11, comic.getComic_bplatform());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBUtils.releaseRes(conn, pstmt, null);
		}
		
	}

	@Override
	public byte[] getPicByName(String comic_name) {

			Connection conn = DBUtils.getConn();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			byte[] picData = null;

			try {
				pstmt = conn.prepareStatement(SQL_GET_PIC_BYNAME);
				pstmt.setString(1, comic_name);
				rset = pstmt.executeQuery();

				if(rset.next()){
					picData=rset.getBytes("comic_pic");
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally{
				DBUtils.releaseRes(conn, pstmt, rset);
			}

			return picData;
	}
}
