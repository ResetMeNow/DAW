<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ModeloProductos;

class ControladorProductos extends Controller
{
    // Muestra el listado de productos
    public function index()
    {
        $productos = ModeloProductos::all();
        return view('productos.VistaProductos', compact('productos'));
    }

    // Muestra un producto individual (AMPLIACIÓN)
    public function show($id)
    {
        $producto = ModeloProductos::find($id);
        return view('productos.VistaProducto', compact('producto'));
    }
}

