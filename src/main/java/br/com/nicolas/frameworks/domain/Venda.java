package br.com.nicolas.frameworks.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.AbstractPersistable;

@Entity
@Table(name="venda")
public class Venda extends AbstractPersistable<Long> {
	private static final long serialVersionUID = 5467040787101307998L;
	
	@ManyToOne
	private Usuario usuario;
	
	@ManyToOne
	private ConfiguracaoVenda configuracao;
	
	@ManyToOne
	private Conta conta;
	
	@Column(name="quantidade")
	private long quantidade;
	
	@Column(name="data_proposta")
	private Date dataProposta;
	
	@Column(name="data_venda")
	private Date dataVenda;
	
	@Column(name="data_pagamento")
	private Date dataPagamento;

	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	public ConfiguracaoVenda getConfiguracao() {
		return configuracao;
	}
	public void setConfiguracao(ConfiguracaoVenda configuracao) {
		this.configuracao = configuracao;
	}
	public Conta getConta() {
		return conta;
	}
	public void setConta(Conta conta) {
		this.conta = conta;
	}
	public long getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(long quantidade) {
		this.quantidade = quantidade;
	}
	public Date getDataProposta() {
		return dataProposta;
	}
	public void setDataProposta(Date dataProposta) {
		this.dataProposta = dataProposta;
	}
	public Date getDataVenda() {
		return dataVenda;
	}
	public void setDataVenda(Date dataVenda) {
		this.dataVenda = dataVenda;
	}
	public Date getDataPagamento() {
		return dataPagamento;
	}
	public void setDataPagamento(Date dataPagamento) {
		this.dataPagamento = dataPagamento;
	}
	public double getValorVenda() {
		return quantidade * configuracao.getValorVenda();
	}
}
