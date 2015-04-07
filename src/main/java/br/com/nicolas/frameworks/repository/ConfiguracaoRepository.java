package br.com.nicolas.frameworks.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.nicolas.frameworks.domain.ConfiguracaoVenda;

public interface ConfiguracaoRepository extends JpaRepository<ConfiguracaoVenda, Long> {
}
