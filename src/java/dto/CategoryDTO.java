/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

/**
 *
 * @author phamt
 */
public class CategoryDTO {

    String catagoryID;
    String catagoryName;

    public CategoryDTO() {
    }

    public CategoryDTO(String catagoryID, String catagoryName) {
        this.catagoryID = catagoryID;
        this.catagoryName = catagoryName;
    }

    public String getCatagoryID() {
        return catagoryID;
    }

    public void setCatagoryID(String catagoryID) {
        this.catagoryID = catagoryID;
    }

    public String getCatagoryName() {
        return catagoryName;
    }

    public void setCatagoryName(String catagoryName) {
        this.catagoryName = catagoryName;
    }

}
