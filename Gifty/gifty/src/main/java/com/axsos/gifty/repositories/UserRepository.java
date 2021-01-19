package com.axsos.gifty.repositories;

import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends CrudRepository<User, Long>{
	List<User> findAll();
}
