package com.rgomez.apirest.apirest.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rgomez.apirest.apirest.Entities.Producto;

// JpaRepository<Entidad, TipoDatoIdEntidad>
public interface ProductoRepository extends JpaRepository<Producto, Long> {
    // Este repositorio hace la conexión con la base de datos
}
