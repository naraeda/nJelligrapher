package com.codingdojo.groupproject.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.groupproject.models.User;

@Repository
public interface UserRepo extends CrudRepository<User, Long>{


	User findByEmail(String email);

	Optional<User> findAllById(Long id);
}
