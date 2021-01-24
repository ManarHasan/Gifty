package com.axsos.gifty.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.axsos.gifty.models.Cart;
import com.axsos.gifty.models.Item;
import com.axsos.gifty.models.Price;
import com.axsos.gifty.models.Product;

@Repository
public interface ItemRepository extends CrudRepository<Item, Long>{

Item findItemByProduct(Product product);
@Query("SELECT i FROM Item i WHERE i.cart = ?1")
List<Item> findByCartContaining(Cart cart);


}
