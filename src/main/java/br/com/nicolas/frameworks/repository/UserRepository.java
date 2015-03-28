package br.com.nicolas.frameworks.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.nicolas.frameworks.domain.User;

public interface UserRepository extends JpaRepository<User, Long> {
}
