package com.tap.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tapfoods.DAO.menuDAO;
import com.tapfoods.DAOimpl.menuDAOImpl;
import com.tapfoods.model.Cart;
import com.tapfoods.model.CartItem;
import com.tapfoods.model.menu;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        
        String action = request.getParameter("action");

        if ("add".equalsIgnoreCase(action)) {
            addItemToCart(request, cart);
        } else if ("update".equalsIgnoreCase(action)) {
            updateItem(request, cart);
        } else if ("remove".equalsIgnoreCase(action)) {
            removeItem(request, cart);
        }
        
        session.setAttribute("cart", cart);
        response.sendRedirect("cart.jsp");
    }

    private void addItemToCart(HttpServletRequest request, Cart cart) {
        try {
            int menuId = Integer.parseInt(request.getParameter("itemId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            
            menuDAO menuDAO = new menuDAOImpl();
            menu menuItem = menuDAO.getMenu(menuId);
            
            if (menuItem != null) {
                CartItem item = new CartItem(
                    menuItem.getMenuId(),
                    menuItem.getRestaurentId(),
                    menuItem.getitemName(),
                    quantity,
                    menuItem.getPrice(),
                    quantity * menuItem.getPrice()
                );
                cart.addItem(item);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace(); // Log and handle exception
        }
    }

    private void updateItem(HttpServletRequest request, Cart cart) {
        try {
            int menuId = Integer.parseInt(request.getParameter("itemId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            cart.updateItem(menuId, quantity);
        } catch (NumberFormatException e) {
            e.printStackTrace(); // Log and handle exception
        }
    }

    private void removeItem(HttpServletRequest request, Cart cart) {
        try {
            int menuId = Integer.parseInt(request.getParameter("itemId"));

            cart.removeItem(menuId);
        } catch (NumberFormatException e) {
            e.printStackTrace(); // Log and handle exception
        }
    }
}
