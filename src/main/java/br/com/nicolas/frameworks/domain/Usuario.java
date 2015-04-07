package br.com.nicolas.frameworks.domain;

import java.util.Collection;
import java.util.Collections;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.AbstractPersistable;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@Entity
@Table(name="usuario")
public class Usuario extends AbstractPersistable<Long> implements UserDetails {
	private static final long serialVersionUID = -6412400881515469476L;

	@Column(unique = true, name="email") 
	private String username;
	
	@Column(name="nome") 
	private String nome;
	
	@Column(name="senha")
	private String password;
	
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="grupo_usuario", 
				joinColumns=@JoinColumn(name="usuario_id"),
				inverseJoinColumns=@JoinColumn(name="grupo_id"))
	private Collection<Grupo> authorities;
	
	@OneToMany(fetch=FetchType.LAZY)
	@JoinColumn(name="usuario_id")
	private Collection<Venda> vendas;

	@Override
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	@Override
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return Collections.unmodifiableCollection(authorities);
	}
	public void setAuthorities(Collection<Grupo> authorities) {
		this.authorities = authorities;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	public Collection<Venda> getVendas() {
		return vendas;
	}
	public void setVendas(Collection<Venda> vendas) {
		this.vendas = vendas;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
}
