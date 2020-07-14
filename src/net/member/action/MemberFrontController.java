package net.member.action;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


public class MemberFrontController extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
    private static final long serialVersionUID = 1L;

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("member");

        String RequestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String command = RequestURI.substring(contextPath.length());
        System.out.println(command);

        ActionForward forward = null;
        Action action = null;

        if (command.equals("/MemberLogin.me")) {
            forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("./loginForm.jsp");
        } else if (command.equals("/MemberAgree.me")) {
            forward = new ActionForward();
            forward.setRedirect(true);
            forward.setPath("agree.jsp");
        } else if (command.equals("/MemberIdCheck.me")) {
//            request.setCharacterEncoding("UTF-8");
            forward = new ActionForward();
            String id = request.getParameter("username");
            System.out.println("에이작스 성공 " + id);
            MemberDAO memberdao = new MemberDAO();
            MemberBean memberdata = new MemberBean();
            Boolean result = false;
            result = memberdao.userId(id);

            if (result) {
                response.setContentType("text/html;charset=utf-8");
                PrintWriter out = response.getWriter();
                out.print("1");
                out.close();
                return;
            } else {
                response.setContentType("text/html;charset=utf-8");
                PrintWriter out = response.getWriter();
                out.print("0");
                out.close();
                return;
            }

        } else if (command.equals("/MemberJoin.me")) {
            forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("./joinForm.jsp");
        } else if (command.equals("/MemberLoginAction.me")) {
            action = new MemberLoginAction();

            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/MemberJoinAction.me")) {
            action = new MemberJoinAction();

            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/MembershipManagement.me")) {
            action = new MemberListAction();

            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/MemberViewAction.me")) {
//            action = new MemberViewAction();

            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/MemberDeleteAction.me")) {
            action = new MemberDeleteAction();

            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/MemberInfo.me")) {
            action = new MemberInfo();

            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/MemberLogout.me")) {
            action = new MemberLogoutAction();

            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/MemberModify.me")) {
            action = new MemberModifyView();

            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/MemberModifyAction.me")) {
            action = new MemberModifyAction();

            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

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
        System.out.println(" get ");
        doProcess(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

}