package net.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.db.BoardDAO;

public class ReplyDeleteAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("euc-kr");

		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");

		boolean result=false;
		boolean usercheck=false;
		int num=Integer.parseInt(request.getParameter("reply_num"));

		BoardDAO boarddao=new BoardDAO();
		usercheck=boarddao.isBoardWriterReply(num, id);

		if(usercheck==false){
			response.setContentType("text/html;charset=euc-kr");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('삭제할 권한이 없습니다.');");
			out.println("location.href='./BoardList.bo';");
			out.println("</script>");
			out.close();
			return null;
		}

		result=boarddao.replyDelete(num);
		if(result==false){
			System.out.println("댓글 삭제 실패");
			return null;
		}

		System.out.println("댓글 삭제 성공");
		forward.setRedirect(true);
		forward.setPath("./BoardList.bo"); //해당 게시물 url로 수정해야함 
		return forward;
	}

}
