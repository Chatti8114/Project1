package net.board.action;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class BoardFrontController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException {
        String RequestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String command = RequestURI.substring(contextPath.length());
        ActionForward forward = null;
        Action action = null;

        // 1.
        if (command.equals("/BoardWrite.bo")) {
            request.setCharacterEncoding("utf-8");
            HttpSession session = request.getSession();
            String id = (String) session.getAttribute("id");
            if (id == null) {
                response.setContentType("text/html;charset=utf-8");
                PrintWriter out = response.getWriter();
                out.print("<script>");
                out.print("alert('글을 작성하시려면 로그인이 필요합니다!');");
                out.print("location.href='/MemberLogin.me';");
                out.print("</script>");
                out.close();
            }
            forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("qna_board_write.jsp");
            System.out.println("1번 컨트롤러 실행");
            //2
        } else if (command.equals("/BoardReplyView.bo")) {
//            action = new BoardReplyView();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/BoardModify.bo")) {
            action = new BoardModifyView();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/BoardModifyAction.bo")) {
            System.out.println("액션 실행");
            action = new BoardModifyAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/BoardReplyAction.bo")) {
            action = new BoardReplyAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
            // 4踰� BoardList
        } else if (command.equals("/BoardDetailAction.bo")) {
            action = new BoardDetailAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/BoardSoldOut.bo")) {
            action = new BoardSoldOutAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/BoardDeleteAction.bo")) {
            action = new BoardDeleteAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/BoardList.bo")) {
            action = new BoardListAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/BoardAddAction.bo")) {
            action = new BoardAddAction();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/NotifyAciton.bo")) {
            System.out.println("NotifyAciton.bo 실행");
            action = new BoardNotifyAciton();

            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/GetReply.bo")) {
            System.out.println("GetReply.bo 실행");
            action = new GetReplyAction();

            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        // 4踰�?
        if (forward != null) {
            if (forward.isRedirect()) {
                response.sendRedirect(forward.getPath());
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
                dispatcher.forward(request, response);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("board doGet() ~~");
        doProcess(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("board doPost() ~~");
        doProcess(request,response);
    }

}