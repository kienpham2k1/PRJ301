/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

/**
 *
 * @author phamt
 */
public class ProductErrorDTO {

    private String productIDError, productNameError;
    private String priceError;
    private String quantityError;
    private String catagoryIDError;
    private String importDateError, usingDateError;
    private String imageError;
    private String messageError;

    public ProductErrorDTO() {
    }

    public ProductErrorDTO(String productIDError, String productNameError, String priceError, String quantityError, String catagoryIDError, String importDateError, String usingDateError, String imageError, String messageError) {
        this.productIDError = productIDError;
        this.productNameError = productNameError;
        this.priceError = priceError;
        this.quantityError = quantityError;
        this.catagoryIDError = catagoryIDError;
        this.importDateError = importDateError;
        this.usingDateError = usingDateError;
        this.imageError = imageError;
        this.messageError = messageError;
    }

    public String getProductIDError() {
        return productIDError;
    }

    public void setProductIDError(String productIDError) {
        this.productIDError = productIDError;
    }

    public String getProductNameError() {
        return productNameError;
    }

    public void setProductNameError(String productNameError) {
        this.productNameError = productNameError;
    }

    public String getPriceError() {
        return priceError;
    }

    public void setPriceError(String priceError) {
        this.priceError = priceError;
    }

    public String getQuantityError() {
        return quantityError;
    }

    public void setQuantityError(String quantityError) {
        this.quantityError = quantityError;
    }

    public String getCatagoryIDError() {
        return catagoryIDError;
    }

    public void setCatagoryIDError(String catagoryIDError) {
        this.catagoryIDError = catagoryIDError;
    }

    public String getImportDateError() {
        return importDateError;
    }

    public void setImportDateError(String importDateError) {
        this.importDateError = importDateError;
    }

    public String getUsingDateError() {
        return usingDateError;
    }

    public void setUsingDateError(String usingDateError) {
        this.usingDateError = usingDateError;
    }

    public String getImageError() {
        return imageError;
    }

    public void setImageError(String imageError) {
        this.imageError = imageError;
    }

    public String getMessageError() {
        return messageError;
    }

    public void setMessageError(String messageError) {
        this.messageError = messageError;
    }

}
