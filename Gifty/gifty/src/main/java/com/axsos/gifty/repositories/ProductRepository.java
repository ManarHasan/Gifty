package com.axsos.gifty.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.axsos.gifty.models.Product;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long>{

}
