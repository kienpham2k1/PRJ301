package dto;

import dao.CheckQuantityProductDAO;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author phamt
 */
public class CartDTO {

    private Map<String, ProductDTO> cart;

    public CartDTO(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }

    public CartDTO() {
    }

    public Map<String, ProductDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }

    public double getTotal() {
        double total = 0;
        if (this.cart.isEmpty()) {
            return 0;
        }
        for (ProductDTO prod : this.cart.values()) {
            total += prod.getPrice() * prod.getQuantity();
        }
        return total;
    }

    public int getQuantityProduct(String productID) {
        int quantity = 0;
        if (this.cart == null) {
            return 0;
        } else {
            for (ProductDTO prod : this.cart.values()) {
                if (prod.getProductID().equals(productID)) {
                    return prod.getQuantity();
                } else {
                    return 0;
                }
            }
        }
        return quantity;
    }

    public List<ProductDTO> getList() {
        List<ProductDTO> list = new ArrayList<ProductDTO>();
        for (ProductDTO prod : this.cart.values()) {
            list.add(prod);
        }
        if (!list.isEmpty()) {
            return list;
        }
        return null;
    }

    public void add(ProductDTO prod) throws SQLException {
        if (this.cart == null) {
            this.cart = new HashMap();
        }
        if (this.cart.containsKey(prod.getProductID())) {
            int currentQuantity = this.cart.get(prod.getProductID()).getQuantity();
            CheckQuantityProductDAO dao = new CheckQuantityProductDAO();
            if (dao.checkQuantity(prod.getProductID(), currentQuantity + prod.getQuantity())) {
                prod.setQuantity(currentQuantity + prod.getQuantity());
            } else {
                prod.setQuantity(currentQuantity);
            }
        }
        cart.put(prod.getProductID(), prod);
    }

    public void delete(String id) {
        if (this.cart == null) {
            return;
        }
        if (this.cart.containsKey(id)) {
            this.cart.remove(id);
        }
    }

    public void update(String id, ProductDTO newProd) throws SQLException {
        if (this.cart == null) {
            return;
        }
        if (this.cart.containsKey(id)) {
            CheckQuantityProductDAO dao = new CheckQuantityProductDAO();
            if (dao.checkQuantity(newProd.getProductID(), newProd.getQuantity()) && newProd.getQuantity() > 0) {
                this.cart.replace(id, newProd);
            }
        }
    }
}
