package com.tap.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.tapfoods.DAOimpl.menuDAOImpl;
import com.tapfoods.model.menu;

@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Create the menuDAOImpl object inside the service method
        menuDAOImpl menuDAO = new menuDAOImpl();

        // Retrieve the restaurentId from the request
        String restaurentIdStr = request.getParameter("restaurentId");
        int restaurentId = Integer.parseInt(restaurentIdStr);

        // Fetch all menu items for the given restaurentId using the DAO
        ArrayList<menu> menuList = menuDAO.getAllMenusByRestaurentId(restaurentId);

        // Add the menu list to the session
        HttpSession session = request.getSession();
        session.setAttribute("menuList", menuList);

        // Redirect to the viewMenu.jsp to display the menu items
        response.sendRedirect("viewMenu.jsp");
    }
}
