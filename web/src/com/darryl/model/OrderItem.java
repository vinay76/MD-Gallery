package com.darryl.model;

import java.io.Serializable;

import javax.jdo.annotations.*;
import javax.persistence.OneToMany;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class OrderItem implements Serializable{
    private static final long serialVersionUID = -2740374621543432373L;//TODO: update it

    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    @Extension(vendorName="datanucleus", key="gae.encoded-pk", value="true")
    String Id;

    @Persistent
    private String imageName;

    @Persistent
    private Integer quantity;

    @Persistent
    private Double unitPrice;
    
    @Persistent
    private Order order;

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }


    public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getId() {
        return Id;
    }

    public void setId(String id) {
        Id = id;
    }

    public Double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Double unitPrice) {
        this.unitPrice = unitPrice;
    }
}
