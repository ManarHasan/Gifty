package com.axsos.gifty.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.axsos.gifty.models.Cart;


@Repository
public interface CartRepository extends CrudRepository<Cart, Long>{

}
