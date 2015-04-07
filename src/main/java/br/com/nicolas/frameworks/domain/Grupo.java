package br.com.nicolas.frameworks.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.apache.commons.lang3.StringUtils;
import org.springframework.data.jpa.domain.AbstractPersistable;
import org.springframework.security.core.GrantedAuthority;

@Entity
@Table(name="grupo")
public class Grupo extends AbstractPersistable<Long> implements GrantedAuthority {
	private static final long serialVersionUID = 7055477492851281602L;

	@Column(name="nome")
	private String authority;
	
	@Override
	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = StringUtils.trimToEmpty(authority);
	}
}
