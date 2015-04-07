package br.com.nicolas.frameworks.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.nicolas.frameworks.domain.Grupo;

public interface GrupoRepository extends JpaRepository<Grupo, Long> {
}
