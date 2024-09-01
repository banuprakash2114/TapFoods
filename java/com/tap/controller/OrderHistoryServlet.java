package com.tap.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tapfoods.DAO.ordertableDAO;
import com.tapfoods.DAOimpl.ordertableDAOImpl;
import com.tapfoods.model.ordertable;
import com.tapfoods.model.user;

@WebServlet("/OrderHistoryServlet")
public class OrderHistoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        user loggedInUser = (user) session.getAttribute("loggedInUser");

        if (loggedInUser != null) {
            ordertableDAO orderDAO = new ordertableDAOImpl();
            List<ordertable> orderHistory = orderDAO.getOrdersByUserId(loggedInUser.getUserId());

            req.setAttribute("orderHistory", orderHistory);
            req.getRequestDispatcher("orderHistory.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("login.jsp"); // Redirect to login if user is not logged in
        }
    }
}
