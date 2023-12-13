class ContactoDTO {
  int? idUsuario;
  String? correoElectronico;
  String? telefonoPrincipal;
  String? telefonoSecundario;

  // Constructor con parámetros nombrados
  ContactoDTO({
    this.idUsuario,
    this.correoElectronico,
    this.telefonoPrincipal,
    this.telefonoSecundario,
  });

  // Constructor factory para crear una instancia desde un mapa JSON
  factory ContactoDTO.fromJson(Map<String, dynamic> json) {
    return ContactoDTO(
      idUsuario: json['idUsuario'] as int?,
      correoElectronico: json['correoElectronico'] as String?,
      telefonoPrincipal: json['telefonoPrincipal'] as String?,
      telefonoSecundario: json['telefonoSecundario'] as String?,
    );
  }

  // Método para convertir la instancia a un mapa JSON
  Map<String, dynamic> toJson() {
    return {
      'idUsuario': idUsuario,
      'correoElectronico': correoElectronico,
      'telefonoPrincipal': telefonoPrincipal,
      'telefonoSecundario': telefonoSecundario,
    };
  }
}


