package ar.org.centro8.curso.java.web.managed.bean;

import ar.org.centro8.curso.java.web.entities.*;
import ar.org.centro8.curso.java.web.interfaces.connectors.Connector;
import ar.org.centro8.curso.java.web.repositories.interfaces.*;
import ar.org.centro8.curso.java.web.repositories.jdbc.*;
import java.io.Serializable;
import java.util.List;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

@Named()
@SessionScoped
public class ArticuloMB implements Serializable{
    private Articulo articulo;
    private String mensaje="";
    private String buscarArticulo="";
    private I_ArticuloRepository ar=new ArticuloRepository(Connector.getConnection());
    
    public ArticuloMB(){
        articulo =new Articulo();

    }
    
    public void save(){
        try {
            ar.save(articulo);
            if(articulo.getId()>0){
                mensaje="Se guardo el articulo id: "+articulo.getId();
                articulo=new Articulo();
            }else{
                mensaje="¡No se pudo guardar el Articulo!";
            }
        } catch (Exception e) {
            System.out.println(e);
            mensaje="¡No se pudo guardar!";
        }
    }
    
    public List<Articulo>getAll(){
        return ar.getAll();
    }
    
    public List<Articulo>getLikeArticulos(){
        return ar.getLikeNombre(buscarArticulo);
    }
    
    public Articulo getArticulo() {
        return articulo;
    }

    public void setArticulo(Articulo articulo) {
        this.articulo = articulo;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getBuscarArticulo() {
        return buscarArticulo;
    }

    public void setBuscarApellido(String buscarArticulo) {
        this.buscarArticulo = buscarArticulo;
    }
    
    
}
