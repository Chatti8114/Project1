//package net.member.action;
//
//import java.io.PrintWriter;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import net.member.db.MemberBean;
//import net.member.db.MemberDAO;
//
//public class MemberViewAction implements Action {
//    @Override
//    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        ActionForward forward = new ActionForward();
//        HttpSession session = request.getSession();
//        MemberDAO memberdao = new MemberDAO();
//        MemberBean member = new MemberBean();
//
//        String id = (String) session.getAttribute("id");
//        if (id == null) {
//            forward.setRedirect(true);
//            forward.setPath("./MemberLogin.me"); /* 아이디 세션이 없을 땐 로그인창으로 이동 */
//            return forward;
//        } else if (!id.equals("admin")) {
//            response.setContentType("text/html;charset=utf-8");
//            PrintWriter out = response.getWriter();
//            out.println("<script>");
//            out.println("alert('관리자가 아닙니다');");
//            out.println("location.href='./BoardList.bo';"); /* 세션은 있으나 어드민이 세션아이디가 admin이 아님 */
//            out.println("</script>");
//            out.close();
//            return null;
//        }
//        String viewId = request.getParameter("id");
//        member = memberdao.getDetailMember(viewId); // 세션이아닌 Name값을 불러옴
//
//        if (member == null) {
//            System.out.println("실패");
//            return null;
//        }
//
//        request.setAttribute("member", member);
//        forward.setRedirect(false);
//        forward.setPath("./member/member_info.jsp");
//        return forward;
//    }
//}
