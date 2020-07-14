//package net.board.action;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import net.board.db.BoardBean;
//import net.board.db.BoardDAO;
//
//public class BoardReplyView implements Action {
//    @Override
//    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//
//        request.setCharacterEncoding("UTF-8");
//        ActionForward forward = new ActionForward();
//        BoardDAO boarddao = new BoardDAO();
//        BoardBean boarddata = new BoardBean();
//
//        int num = Integer.parseInt(request.getParameter("num"));
//        boarddata = boarddao.getDetail(num);
//
//        if (boarddata == null) {
//            System.out.println("답변글 작성 실패");
//            return null;
//        }
//        System.out.println("답변글 작성 성공");
//
//        request.setAttribute("boarddata", boarddata);
//
//        forward.setRedirect(false);
//        forward.setPath("./board/qna_board_reply.jsp");
//        return forward;
//    }
//}
