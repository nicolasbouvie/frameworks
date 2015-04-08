package br.com.nicolas.frameworks.repository;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.nicolas.frameworks.domain.Usuario;
import br.com.nicolas.frameworks.domain.Venda;

public interface VendaRepository extends JpaRepository<Venda, Long> {
	Collection<Venda> findByUsuario(Usuario user);
}
