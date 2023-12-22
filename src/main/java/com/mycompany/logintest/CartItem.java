
package com.mycompany.logintest;


public class CartItem {
    String productCode;
    String productName;
    int qty;

    public CartItem(String productCode, String productName, int qty) {
        this.productCode = productCode;
        this.productName = productName;
        this.qty = qty;
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public String getProductName() {
        return productName;
    }

    public int getQty() {
        return qty;
    }

    
}
