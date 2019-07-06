package net.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.db.BoardDAO;

public class TalkDeleteAction implements Action {


	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("euc-kr");

		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");

		boolean result=false;
		boolean usercheck=false;
		int num=Integer.parseInt(request.getParameter("board_num"));

		BoardDAO boarddao=new BoardDAO();
		usercheck=boarddao.isBoardWriter(num, id);

		if(usercheck==false){
			response.setContentType("text/html;charset=euc-kr");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('������ ������ �����ϴ�.');");
			out.println("location.href='./BoardList.bo';");
			out.println("</script>");
			out.close();
			return null;
		}

		
		result=boarddao.talkDelete(num);
		if(result==false){
			System.out.println("��ũ �Խ��� ���� ����");
			return null;
		}

		System.out.println("��ũ �Խ��� ���� ����");
		forward.setRedirect(true);
		forward.setPath("./BoardList.bo"); //��ũ url�� �����ؾ��� 
		return forward;
	}
}
