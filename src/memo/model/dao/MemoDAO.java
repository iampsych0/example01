package memo.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.DB;
import memo.model.dto.MemoDTO;

public class MemoDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<MemoDTO>  getSelectAll(String searchGubun, String searchData, int startRecord, int lastRecord) {
		if(searchGubun == null || searchGubun.trim().equals("")){
			searchGubun = "";
		}
		
		if(searchData == null || searchData.trim().equals("")){
			searchData = "";
		}
		
		if(searchGubun.equals("") || searchData.equals("")){
			searchGubun = "";
			searchData = "";
		}
		
		ArrayList<MemoDTO> list = new ArrayList<>();
		try {
			conn = DB.dbConn();
			//------------------------------------------------
			String basicSql = "";
			basicSql += "select * from memo where 1=1 ";
			
			if(searchGubun.equals("") || searchData.equals("")) {
				
			} else{
				if(searchGubun.equals("writer")) {
					basicSql += "and writer like ? ";
					
				} else if(searchGubun.equals("content")) {
					basicSql += "and content like ? ";
					
				} else if(searchGubun.equals("writer_content")) {
					basicSql += "and (writer like ?) or (content like ?) ";
					
				}
			}
			basicSql += "order by no desc";
			
			
			String sql = "";
			sql += "select * from (select A.*, rownum rnum from (";
			sql += basicSql;
			sql +=	") A) where rnum >= ? and rnum <= ?";
			
			
			pstmt = conn.prepareStatement(sql);
			
			if(searchGubun.equals("") || searchData.equals("")) {
				pstmt.setInt(1, startRecord);
				pstmt.setInt(2, lastRecord);
			} else {
				if(searchGubun.equals("writer")) {
					pstmt.setString(1, '%' + searchData + '%');
					pstmt.setInt(2, startRecord);
					pstmt.setInt(3, lastRecord);
					
				} else if(searchGubun.equals("content")) {
					pstmt.setString(1, '%' + searchData + '%');
					pstmt.setInt(2, startRecord);
					pstmt.setInt(3, lastRecord);
					
				} else if(searchGubun.equals("writer_content")) {
					pstmt.setString(1, '%' + searchData + '%');
					pstmt.setString(2, '%' + searchData + '%');
					pstmt.setInt(3, startRecord);
					pstmt.setInt(4, lastRecord);
				}
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int no = rs.getInt("no");
				String writer = rs.getString("writer");
				String content = rs.getString("content");
				Date regiDate = rs.getDate("regiDate");
				
				MemoDTO dto = new MemoDTO();
				dto.setNo(no);
				dto.setWriter(writer);
				dto.setContent(content);
				dto.setRegiDate(regiDate);
				
				list.add(dto);
			}
			//------------------------------------------------
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return list;
	}
	
	public MemoDTO getSelectOne(MemoDTO paramDto) {
		MemoDTO dto = new MemoDTO();
		try {
			conn = DB.dbConn();
			//------------------------------------------------
			String sql = "select * from memo where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getNo());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int no = rs.getInt("no");
				String writer = rs.getString("writer");
				String content = rs.getString("content");
				Date regiDate = rs.getDate("regiDate");
				
				dto.setNo(no);
				dto.setWriter(writer);
				dto.setContent(content);
				dto.setRegiDate(regiDate);
			}
			//------------------------------------------------
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	public int getTotalRecord(String searchGubun, String searchData) {
		int result = 0;
		try {
			conn = DB.dbConn();
			//------------------------------------------------
			String sql = ""; 
			sql += "select count(*) counter from memo where 1=1 ";
			
			if(searchGubun.equals("writer")) {
				sql += "and writer like ? ";
				
			} else if(searchGubun.equals("content")) {
				sql += "and content like ? ";
				
			} else if(searchGubun.equals("writer_content")) {
				sql += "and (writer like ?) or (content like ?) ";
				
			}
			sql += "order by no desc";
			pstmt = conn.prepareStatement(sql);
			
			if(searchGubun.equals("writer")) {
				pstmt.setString(1, '%' + searchData + '%');
				
			} else if(searchGubun.equals("content")) {
				pstmt.setString(1, '%' + searchData + '%');
				
			} else if(searchGubun.equals("writer_content")) {
				pstmt.setString(1, '%' + searchData + '%');
				pstmt.setString(2, '%' + searchData + '%');

			}
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("counter");
			}
			//------------------------------------------------
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setInsert(MemoDTO paramDto) {
		int result = 0;
		try {
			conn = DB.dbConn();
			//------------------------------------------------
			String sql = "insert into memo values(seq_memo.nextval, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getWriter());
			pstmt.setString(2, paramDto.getContent());
			result = pstmt.executeUpdate();
			//------------------------------------------------
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(MemoDTO paramDto) {
		int result = 0;
		try {
			conn = DB.dbConn();
			//------------------------------------------------
			String sql = "update memo set writer =?, content = ? where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getWriter());
			pstmt.setString(2, paramDto.getContent());
			pstmt.setInt(3, paramDto.getNo());
			result = pstmt.executeUpdate();
			//------------------------------------------------
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}

	public int setDelete(MemoDTO paramDto) {
		int result = 0;
		try {
			conn = DB.dbConn();
			//------------------------------------------------
			String sql = "delete from memo where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getNo());
			result = pstmt.executeUpdate();
			//------------------------------------------------
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
}
