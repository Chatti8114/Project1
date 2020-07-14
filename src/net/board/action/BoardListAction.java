package net.board.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.db.BoardDAO;

public class BoardListAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ActionForward forward = new ActionForward();
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");

        BoardDAO boarddao = new BoardDAO();

        List boardlist = new ArrayList();

        int page = 1;
        int limit = 10;

        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        int listcount = boarddao.getListCount(); // �� ����Ʈ �� �޾ƿ�
        boardlist = boarddao.getBoardList(page, limit);  // ����Ʈ�� �޾ƿ�

     // �� ������ ��
        int maxpage = (int)((double)listcount/limit+0.95); // 0.95�� ���ؼ� �ø�

        // ���� �������� ������ ���� ������ �� 1, 11, 21
        int startpage = (((int)((double)page / 10 + 0.9)) -1 ) * 10 + 1;

        // ���� �������� ������ ������ ������ �� 10, 20, 30
        int endpage = maxpage;

        if (endpage > startpage+10-1) endpage = startpage + 10 - 1;

        request.setAttribute("page",page); // ���� ��������
        request.setAttribute("maxpage",maxpage); // �ִ� ������ ��
        request.setAttribute("startpage",startpage); // ���� �������� ǥ����  ���� ������
        request.setAttribute("endpage",endpage); // ���� �������� ǥ���� �� ������
        request.setAttribute("listcount",listcount); // �� ��
        request.setAttribute("boardlist",boardlist);

        forward.setRedirect(false);
        forward.setPath("./qna_board_list.jsp");
        return forward;
    }
}
