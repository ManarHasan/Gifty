package com.axsos.gifty1.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;

import com.sun.istack.NotNull;

@Entity
@Table(name="products")
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@NotNull
	private String title;
	private String description;
	@Column(updatable=false)
	private Date createdAt;
	private Date updatedAt;
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
		  name="cart",
		  joinColumns = @JoinColumn(name="product_id"),
		  inverseJoinColumns = @JoinColumn(name="user_id")
	    )
	private List<User> users;
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="provider_id")
	private Provider provider;
	@OneToMany(fetch=FetchType.LAZY, mappedBy="product")
    private List<Price> prices;
	
	public Product() {}
	
	
	public Product(String title, String description, List<User> users, Provider provider, List<Price> prices) {
		this.title = title;
		this.description = description;
		this.users = users;
		this.provider = provider;
		this.prices = prices;
	}

	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
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


	public List<User> getUsers() {
		return users;
	}


	public void setUsers(List<User> users) {
		this.users = users;
	}


	public Provider getProvider() {
		return provider;
	}


	public void setProvider(Provider provider) {
		this.provider = provider;
	}


	public List<Price> getPrices() {
		return prices;
	}


	public void setPrices(List<Price> prices) {
		this.prices = prices;
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
