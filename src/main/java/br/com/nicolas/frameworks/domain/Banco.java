package br.com.nicolas.frameworks.domain;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.AbstractPersistable;

@Entity
@Table(name="banco")
public class Banco extends AbstractPersistable<Long> {
	private static final long serialVersionUID = 1471118004904584566L;

	private String nome;

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
}
