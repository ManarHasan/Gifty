package com.axsos.gifty.models;

import java.util.Date;
import java.util.List;

import javax.persistence.*;


@Entity
@Table(name="providers")
public class Provider {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	private String name;
	@Column(nullable = true, length = 64)
    private String photos;
	@Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;
    @OneToMany(mappedBy="provider", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
    private List<Product> products;
    
    public Provider() {
    	
    }

	public Provider(String name, String photos, List<Product> products) {
		this.name = name;
		this.photos = photos;
		this.products = products;
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
	
    public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public String getPhotos() {
		return photos;
	}
	 @Transient
	    public String getPhotosImagePath() {
	        if (photos == null || id == null) return null;
	         
	        return "/user-photos/" + id + "/" + photos;
	    }

	public void setPhotos(String photos) {
		this.photos = photos;
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