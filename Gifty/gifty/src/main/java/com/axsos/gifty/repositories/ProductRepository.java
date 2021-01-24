package com.axsos.gifty.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.axsos.gifty.models.Product;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long>{
List<Product> findAll();
}
