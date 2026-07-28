class Producto {
  final int? id;
  final String codigo;
  final String nombre;
  final String descripcion;
  final double precio;
  final int existencia;
  final String? imagen;

  Producto({
    this.id,
    required this.codigo,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.existencia,
    this.imagen,
  });
  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'codigo': codigo,
      'nombre': nombre,
      'descripcion': descripcion,
      'precio': precio,
      'existencia': existencia,
      'imagen': imagen

    };
  }
  factory Producto.fromMap(Map<String, dynamic> map){
    return Producto(
      id: map['id'],
      codigo: map['codigo'],
      nombre: map['nombre'],
      descripcion: map ['descripcion'],
      precio: map['precio'],
      existencia: map['existencia'],
      imagen: map['imagen'],
      
    );
  }
}