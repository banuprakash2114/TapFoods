package com.tapfoods.model;

public class CartItem {
	private int itemId;
	private int restaurentId;
	private String name;
	private int Quantity;
	private double price;
	private double subtotal;
	public CartItem() {
		super();
	}
	public CartItem(int itemId, int restaurentId, String name, int quantity, double price, float subtotal) {
		super();
		this.itemId = itemId;
		this.restaurentId = restaurentId;
		this.name = name;
		Quantity = quantity;
		this.price = price;
		this.subtotal = subtotal;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public int getRestaurentId() {
		return restaurentId;
	}
	public void setRestaurentId(int restaurentId) {
		this.restaurentId = restaurentId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getQuantity() {
		return Quantity;
	}
	public void setQuantity(int quantity) {
		Quantity = quantity;
		setSubtotal(quantity);
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(int subtotal) {
		this.subtotal = this.Quantity * this.price;
	}
	@Override
	public String toString() {
		return "CartItem [itemId=" + itemId + ", restaurentId=" + restaurentId + ", name=" + name + ", Quantity="
				+ Quantity + ", price=" + price + ", subtotal=" + subtotal + "]";
	}
}
