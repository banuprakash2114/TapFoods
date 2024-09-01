package com.tap.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tapfoods.DAOimpl.ordertableDAOImpl;
import com.tapfoods.model.Cart;
import com.tapfoods.model.CartItem;
import com.tapfoods.model.ordertable;
import com.tapfoods.model.user;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        // Retrieve the cart from the session
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.getItems().isEmpty()) {
            resp.sendRedirect("checkout.jsp?error=EmptyCart");
            return;
        }

        // Retrieve the logged-in user from the session
        user loggedInUser = (user) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            resp.sendRedirect("checkout.jsp?error=NotLoggedIn");
            return;
        }

        // Prepare order details
        int userId = loggedInUser.getUserId();
        int restaurentId = -1; // Assuming all items in the cart are from the same restaurant

        // Fetching the restaurant ID from the first cart item
        for (CartItem item : cart.getItems().values()) {
            restaurentId = item.getRestaurentId();
            break;
        }

        String orderDate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        float totalAmount = (float) cart.getItems().values().stream().mapToDouble(CartItem::getSubtotal).sum();
        String status = "Pending";

        // Create a new order object
        ordertable order = new ordertable();
        order.setUserId(userId);
        order.setRestaurentId(restaurentId);
        order.setOrderDate(orderDate);
        order.setTotalAmount(totalAmount);
        order.setStatus(status);

        // Save the order to the database
        ordertableDAOImpl orderDAO = new ordertableDAOImpl();
        int orderId = orderDAO.addOrder(order);

        if (orderId > 0) {
            // Order saved successfully, clear the cart
            cart.clear();
            session.setAttribute("cart", cart);

            // Set order details as request attributes and forward to the success page
            req.setAttribute("orderId", orderId);
            req.setAttribute("orderDate", orderDate);
            req.setAttribute("totalAmount", totalAmount);
            req.getRequestDispatcher("orderSuccess.jsp").forward(req, resp);
        } else {
            // Order saving failed, redirect to the checkout page with an error message
            resp.sendRedirect("checkout.jsp?error=OrderFailed");
        }
    }
}
