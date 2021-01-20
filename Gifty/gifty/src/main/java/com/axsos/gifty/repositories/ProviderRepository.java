package com.axsos.gifty.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.axsos.gifty.models.Provider;

@Repository
public interface ProviderRepository extends CrudRepository<Provider, Long>{

}
