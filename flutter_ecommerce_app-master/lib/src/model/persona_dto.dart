class PersonaDTO {

  String? idUsuario;
  String? nombre;
  String? primerApellido;
  String? segundoApellido;
  String? fechaNacimiento;

  PersonaDTO({
    this.idUsuario,
    this.nombre,
    this.primerApellido,
    this.segundoApellido,
    this.fechaNacimiento,
  });

  factory PersonaDTO.fromJson(Map<String, dynamic> json) {
    return PersonaDTO(
      idUsuario: json['idUsuario'] as String?,
      nombre: json['nombre'] as String?,
      primerApellido: json['primerApellido'] as String?,
      segundoApellido: json['segundoApellido'] as String?,
      fechaNacimiento: json['fechaNacimiento'] as String?,
    );
  }

  // Método para convertir la instancia a un mapa JSON
  Map<String, dynamic> toJson() {
    return {
      'idUsuario': idUsuario,
      'nombre': nombre,
      'primerApellido': primerApellido,
      'segundoApellido': segundoApellido,
      'fechaNacimiento': fechaNacimiento
    };
  }
}
