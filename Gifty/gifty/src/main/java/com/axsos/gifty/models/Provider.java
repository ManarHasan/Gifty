package com.axsos.gifty.models;

import java.util.Date;
import java.util.List;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;


@Entity
@Table(name="providers")
public class Provider {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	@NotEmpty
	private String name;
	@Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;
    @OneToMany(mappedBy="provider", fetch = FetchType.LAZY)
    private List<Product> products;
    
    public Provider() {
    	
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
    
}
