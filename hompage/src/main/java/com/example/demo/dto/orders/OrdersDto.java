package com.example.demo.dto.orders;

import lombok.*;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
@Data
@AllArgsConstructor
public class OrdersDto {
	private int ono;
	private String bookTitle;
	private String imageName;
	private Long orderTotal;
	private Long totalBookPrice;
	private Long totalOrderCount;
	private String zipCode;
	private String receiverName;

	public int getOno() {
		return ono;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public String getImageName() {
		return imageName;
	}

	public Long getOrderTotal() {
		return orderTotal;
	}

	public Long getTotalBookPrice() {
		return totalBookPrice;
	}

	public Long getTotalOrderCount() {
		return totalOrderCount;
	}

	public String getZipCode() {
		return zipCode;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setOno(int ono) {
		this.ono = ono;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public void setOrderTotal(Long orderTotal) {
		this.orderTotal = orderTotal;
	}

	public void setTotalBookPrice(Long totalBookPrice) {
		this.totalBookPrice = totalBookPrice;
	}

	public void setTotalOrderCount(Long totalOrderCount) {
		this.totalOrderCount = totalOrderCount;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
}