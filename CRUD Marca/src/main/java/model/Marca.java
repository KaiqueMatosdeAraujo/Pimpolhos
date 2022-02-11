package model;

public class Marca {

	private Integer cod_marca;
	private String nome_marca;
	
	public Marca(String nome_marca) {
		super();
		this.nome_marca = nome_marca;
	}

	public Integer getCod_marca() {
		return cod_marca;
	}

	public void setCod_marca(Integer cod_marca) {
		this.cod_marca = cod_marca;
	}

	public String getNome_marca() {
		return nome_marca;
	}

	public void setNome_marca(String nome_marca) {
		this.nome_marca = nome_marca;
	}
	

	public String toString() {
		return this.cod_marca + " - " + this.nome_marca;
	}
	
	
}
