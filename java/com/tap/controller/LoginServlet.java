package com.tap.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tapfoods.DAO.userDAO;
import com.tapfoods.DAOimpl.userDAOImpl;
import com.tapfoods.model.user;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        userDAO userDAO = new userDAOImpl();
        user user = userDAO.getUser(email);

        if (user != null && password.equals(user.getPassword())) {
            HttpSession session = req.getSession();
            session.setAttribute("loggedInUser", user);
            resp.sendRedirect("home.jsp");
        } else {
            req.setAttribute("loginError", "Invalid email or password");
            req.getRequestDispatcher("home.jsp").forward(req, resp);
        }
    }
}

