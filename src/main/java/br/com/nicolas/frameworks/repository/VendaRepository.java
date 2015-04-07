package br.com.nicolas.frameworks.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.nicolas.frameworks.domain.Venda;

public interface VendaRepository extends JpaRepository<Venda, Long> {
}
