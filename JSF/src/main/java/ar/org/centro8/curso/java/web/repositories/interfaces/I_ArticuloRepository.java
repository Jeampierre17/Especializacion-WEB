package ar.org.centro8.curso.java.web.repositories.interfaces;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import ar.org.centro8.curso.java.web.entities.Articulo;
import ar.org.centro8.curso.java.web.enums.EspecieRecomendada;
import ar.org.centro8.curso.java.web.enums.TipoArticulo;

public interface I_ArticuloRepository {
	void save(Articulo articulo);

	void remove(Articulo articulo);

	void update(Articulo articulo);

	default Articulo getById(int id) {
		return getAll().stream().filter(c -> c.getId() == id).findFirst().orElse(new Articulo());
	}

	List<Articulo> getAll();

	default List<Articulo> getLikeNombre(String nombre) {
		if (nombre == null)
			return new ArrayList<Articulo>();
		return getAll().stream()
				.filter(c -> c.getNombre() != null && c.getNombre().toLowerCase().contains(nombre.toLowerCase()))
				.collect(Collectors.toList());
	}

	default Articulo getByTipoArticulo(TipoArticulo tipo) {
		if (tipo == null)
			return new Articulo();
		return getAll().stream().filter(c -> c.getTipo() != null && c.getTipo() == tipo).findAny()
				.orElse(new Articulo());
	}

	default Articulo getByEspecieRecomendada(EspecieRecomendada tipo) {
		if (tipo == null)
			return new Articulo();
		return getAll().stream().filter(c -> c.getTipo() != null).findAny().orElse(new Articulo());
	}
}
