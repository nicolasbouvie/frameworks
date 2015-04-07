package br.com.nicolas.frameworks.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.nicolas.frameworks.domain.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
	public Usuario findByUsername(String username);
}
