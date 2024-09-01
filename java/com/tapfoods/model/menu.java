package com.tapfoods.model;

public class menu {
		private int menuId;
		private int restaurentId;
		private String itemName;
		private float price;
		private String description;
		private String isAvailable;
		private String imgpath;
		public menu() {
			super();
		}
		public menu(int menuId, int restaurentId, String itemName, float price, String description, String isAvailable,
				String imgpath) {
			super();
			this.menuId = menuId;
			this.restaurentId = restaurentId;
			this.itemName = itemName;
			this.price = price;
			this.description = description;
			this.isAvailable = isAvailable;
			this.imgpath = imgpath;
		}
		public menu(int restaurentId, String itemName, float price, String description, String isAvailable,
				String imgpath) {
			super();
			this.restaurentId = restaurentId;
			this.itemName = itemName;
			this.price = price;
			this.description = description;
			this.isAvailable = isAvailable;
			this.imgpath = imgpath;
		}
		public int getMenuId() {
			return menuId;
		}
		public void setMenuId(int menuId) {
			this.menuId = menuId;
		}
		public int getRestaurentId() {
			return restaurentId;
		}
		public void setRestaurentId(int restaurentId) {
			this.restaurentId = restaurentId;
		}
		public String getitemName() {
			return itemName;
		}
		public void setitemName(String itemName) {
			this.itemName = itemName;
		}
		public float getPrice() {
			return price;
		}
		public void setPrice(float price) {
			this.price = price;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		public String getIsAvailable() {
			return isAvailable;
		}
		public void setIsAvailable(String isAvailable) {
			this.isAvailable = isAvailable;
		}
		public String getImgpath() {
			return imgpath;
		}
		public void setImgpath(String imgpath) {
			this.imgpath = imgpath;
		}
		@Override
		public String toString() {
			return "menu [menuId=" + menuId + ", restaurentId=" + restaurentId + ", itemName=" + itemName + ", price="
					+ price + ", description=" + description + ", isAvailable=" + isAvailable + ", imgpath=" + imgpath
					+ "]";
		}
		public int getSubtotal() {
			// TODO Auto-generated method stub
			return 0;
		}
	}

