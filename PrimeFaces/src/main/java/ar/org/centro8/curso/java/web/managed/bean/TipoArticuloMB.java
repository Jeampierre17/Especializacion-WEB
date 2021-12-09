package ar.org.centro8.curso.java.web.managed.bean;

import ar.org.centro8.curso.java.web.enums.*;
import java.io.Serializable;
import java.util.Arrays;
import java.util.List;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

@Named()
@SessionScoped
public class TipoArticuloMB implements Serializable{
    public List<TipoArticulo>getEstados(){
        //return List.of(EstadoCivil.values());     //java 9
        return Arrays.asList(TipoArticulo.values());
    }
}

