package com.axsos.gifty.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.axsos.gifty.models.User;



@Repository
public interface UserRepository extends CrudRepository<User, Long>{
    User findByEmail(String email);

}
