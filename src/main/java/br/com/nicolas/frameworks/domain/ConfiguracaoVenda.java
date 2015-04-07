package br.com.nicolas.frameworks.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.AbstractPersistable;

@Entity
@Table(name="configuracao_venda")
public class ConfiguracaoVenda extends AbstractPersistable<Long> {
	private static final long serialVersionUID = -5068007187443293200L;

	@Column(name="data_inicio")
	private Date dataInicio;

	@Column(name="data_fim")
	private Date dataFim;
	
	@Column(name="valor")
	private double valor;
	
	@Column(name="valor_venda")
	private double valorVenda;

	public Date getDataInicio() {
		return dataInicio;
	}
	public void setDataInicio(Date dataInicio) {
		this.dataInicio = dataInicio;
	}
	public Date getDataFim() {
		return dataFim;
	}
	public void setDataFim(Date dataFim) {
		this.dataFim = dataFim;
	}
	public double getValor() {
		return valor;
	}
	public void setValor(double valor) {
		this.valor = valor;
	}
	public double getValorVenda() {
		return valorVenda;
	}
	public void setValorVenda(double valorVenda) {
		this.valorVenda = valorVenda;
	}
}
