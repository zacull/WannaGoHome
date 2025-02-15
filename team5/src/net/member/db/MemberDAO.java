package net.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.*;
import javax.sql.DataSource;

public class MemberDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public MemberDAO() {
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			con = ds.getConnection();
		}catch(Exception ex){
			System.out.println("DB 연결 실패 : " + ex);
			return;
		}
	}

	//회원가입
	public boolean joinMember(MemberBean member){
		String sql="INSERT INTO MEMBER VALUES (?,?,?,?,?,?,?)";
		int result=0;

		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getNick());
			pstmt.setString(5, member.getSex());
			pstmt.setString(6, "");
			pstmt.setString(7, "");

			result=pstmt.executeUpdate();

			if(result!=0){
				return true;
			}
		}catch(Exception ex){
			System.out.println("joinMember 에러: " + ex);			
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
		}

		return false;
	}

	//유저로그인확인
	public int isMember(MemberBean member){
		String sql = "SELECT PW FROM MEMBER WHERE ID=?";
		int result=-1;

		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			rs = pstmt.executeQuery();

			if(rs.next()){
				if(rs.getString("pw").equals(
						member.getPw())){
					result=1;//일치.
				}else{
					result=0;//불일치.
				}
			}else{
				result=-1;//아이디 존재하지 않음.
			}
		}catch(Exception ex){
			System.out.println("isMember 에러: " + ex);			
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
		}

		return result;
	}
}
