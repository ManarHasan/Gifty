package com.axsos.gifty.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.axsos.gifty.models.Price;
import com.axsos.gifty.models.Product;

@Repository
public interface PriceRepository extends CrudRepository<Price, Long>{
	@Query("SELECT p FROM Price p WHERE p.product = ?1 and p.priceTag = ?2")
	Price findPriceByProductandPriceTag(Product product, int priceTag);
}
