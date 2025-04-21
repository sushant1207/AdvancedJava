// model/Perfume.java
package model;

public class Perfume {
    private int perfumeID;
    private String perfumeName;
    private String brand;
    private double price;
    private int stock;
    private String image;
    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }

    // Getters and setters
    public int getPerfumeID() { return perfumeID; }
    public void setPerfumeID(int perfumeID) { this.perfumeID = perfumeID; }

    public String getPerfumeName() { return perfumeName; }
    public void setPerfumeName(String perfumeName) { this.perfumeName = perfumeName; }

    public String getBrand() { return brand; }
    public void setBrand(String brand) { this.brand = brand; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public int getStock() { return stock; }
    public void setStock(int stock) { this.stock = stock; }
}
