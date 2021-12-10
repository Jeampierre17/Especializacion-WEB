package ar.org.centro8.curso.java.web.entities;

import ar.org.centro8.curso.java.web.enums.EspecieRecomendada;
import ar.org.centro8.curso.java.web.enums.TipoArticulo;


public class Articulo {
	
	private int id;
    private String nombre;
    private String descripcion;
    private TipoArticulo tipo;   
    private EspecieRecomendada especieRecomendada;
    private double costo;
    private double precio;
    private int stock;
    private int stockMinimo;
    private int stockMaximo;
    private String comentarios;
    private boolean activo;

public Articulo(){
	
}

public Articulo(int id, String nombre, String descripcion, TipoArticulo tipo, EspecieRecomendada especieRecomendada,
		double costo, double precio, int stock, int stockMinimo, int stockMaximo, String comentarios, boolean activo) {
	super();
	this.id = id;
	this.nombre = nombre;
	this.descripcion = descripcion;
	this.tipo = tipo;
	this.especieRecomendada = especieRecomendada;
	this.costo = costo;
	this.precio = precio;
	this.stock = stock;
	this.stockMinimo = stockMinimo;
	this.stockMaximo = stockMaximo;
	this.comentarios = comentarios;
	this.activo = activo;
}


public Articulo(String nombre, String descripcion, TipoArticulo tipo, EspecieRecomendada especieRecomendada,
		double costo, double precio, int stock, int stockMinimo, int stockMaximo, String comentarios, boolean activo) {
	super();
	this.nombre = nombre;
	this.descripcion = descripcion;
	this.tipo = tipo;
	this.especieRecomendada = especieRecomendada;
	this.costo = costo;
	this.precio = precio;
	this.stock = stock;
	this.stockMinimo = stockMinimo;
	this.stockMaximo = stockMaximo;
	this.comentarios = comentarios;
	this.activo = activo;
}

@Override
public String toString() {
	return "Articulos id:{" + id + ", nombre=" + nombre + ", descripcion=" + descripcion + ", tipo=" + tipo
			+ ", especieRecomendada=" + especieRecomendada + ", costo=" + costo + ", precio=" + precio + ", stock="
			+ stock + ", stockMinimo=" + stockMinimo + ", stockMaximo=" + stockMaximo + ", comentarios=" + comentarios
			+ ", activo=" + activo + "}";
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getNombre() {
	return nombre;
}

public void setNombre(String nombre) {
	this.nombre = nombre;
}

public String getDescripcion() {
	return descripcion;
}

public void setDescripcion(String descripcion) {
	this.descripcion = descripcion;
}

public TipoArticulo getTipo() {
	return tipo;
}

public void setTipo(TipoArticulo tipo) {
	this.tipo = tipo;
}

public EspecieRecomendada getEspecieRecomendada() {
	return especieRecomendada;
}

public void setEspecieRecomendada(EspecieRecomendada especieRecomendada) {
	this.especieRecomendada = especieRecomendada;
}

public double getCosto() {
	return costo;
}

public void setCosto(double costo) {
	this.costo = costo;
}

public double getPrecio() {
	return precio;
}

public void setPrecio(double precio) {
	this.precio = precio;
}

public int getStock() {
	return stock;
}

public void setStock(int stock) {
	this.stock = stock;
}

public int getStockMinimo() {
	return stockMinimo;
}

public void setStockMinimo(int stockMinimo) {
	this.stockMinimo = stockMinimo;
}

public int getStockMaximo() {
	return stockMaximo;
}

public void setStockMaximo(int stockMaximo) {
	this.stockMaximo = stockMaximo;
}

public String getComentarios() {
	return comentarios;
}

public void setComentarios(String comentarios) {
	this.comentarios = comentarios;
}

public boolean getActivo() {
	return activo;
}

public void setActivo(boolean activo) {
	this.activo = activo;
}



}

