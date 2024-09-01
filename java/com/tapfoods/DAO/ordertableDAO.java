package com.tapfoods.DAO;

import java.util.ArrayList;
import java.util.List;
import com.tapfoods.model.ordertable;

public interface ordertableDAO {
    int addOrder(ordertable o);
    ArrayList<ordertable> getAllOrders();
    ordertable getOrder(int orderId);
    List<ordertable> getOrdersByUserId(int userId); 
}
