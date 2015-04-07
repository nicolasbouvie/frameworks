package br.com.nicolas.frameworks.config;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import br.com.nicolas.frameworks.repository.UsuarioRepository;

@Service
public class AuthenticationConfig implements UserDetailsService {
	
	@Inject
	private UsuarioRepository repo;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		return repo.findByUsername(username);
	}
}
