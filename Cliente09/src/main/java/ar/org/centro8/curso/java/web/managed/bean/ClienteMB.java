package ar.org.centro8.curso.java.web.managed.bean;

import ar.org.centro8.curso.java.web.entities.Cliente;
import ar.org.centro8.curso.java.web.entities.Direccion;
import ar.org.centro8.curso.java.web.interfaces.connectors.Connector;
import ar.org.centro8.curso.java.web.repositories.interfaces.I_ClienteRepository;
import ar.org.centro8.curso.java.web.repositories.jdbc.ClienteRepository;
import java.io.Serializable;
import java.util.List;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

@Named()
@SessionScoped
public class ClienteMB implements Serializable{
    private Cliente cliente;
    private String mensaje="";
    private String buscarApellido="";
    private I_ClienteRepository cr=new ClienteRepository(Connector.getConnection());
    
    public ClienteMB(){
        cliente=new Cliente();
        cliente.setDireccion(new Direccion());
    }
    
    public void save(){
        try {
            cr.save(cliente);
            if(cliente.getId()>0){
                mensaje="Se guardo el cliente id: "+cliente.getId();
                cliente=new Cliente();
                cliente.setDireccion(new Direccion());
            }else{
                mensaje="No se pudo guardar el cliente!";
            }
        } catch (Exception e) {
            System.out.println(e);
            mensaje="No se pudo guardar el cliente!";
        }
    }
    
    public List<Cliente>getAll(){
        return cr.getAll();
    }
    
    public List<Cliente>getLikeApellido(){
        return cr.getLikeApellido(buscarApellido);
    }
    
    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getBuscarApellido() {
        return buscarApellido;
    }

    public void setBuscarApellido(String buscarApellido) {
        this.buscarApellido = buscarApellido;
    }
    
    
}
