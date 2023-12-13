class DireccionDTO {
  int? idUsuario;
  String? numeroInterior;
  String? numeroExterior;
  String? calle;
  String? colonia;
  String? municipio;
  String? entidadFederativa;

  DireccionDTO({
    this.idUsuario,
    this.numeroInterior,
    this.numeroExterior,
    this.calle,
    this.colonia,
    this.municipio,
    this.entidadFederativa,
  });

  factory DireccionDTO.fromJson(Map<String, dynamic> json) {
    return DireccionDTO(
      idUsuario: json['idUsuario'] as int?,
      numeroInterior: json['numeroInterior'] as String?,
      numeroExterior: json['numeroExterior'] as String?,
      calle: json['calle'] as String?,
      colonia: json['colonia'] as String?,
      municipio: json['municipio'] as String?,
      entidadFederativa: json['entidadFederativa'] as String?,
    );
  }

  // Método para convertir la instancia a un mapa JSON
  Map<String, dynamic> toJson() {
    return {
      'idUsuario': idUsuario,
      'numeroInterior': numeroInterior,
      'numeroExterior': numeroExterior,
      'calle': calle,
      'colonia': colonia,
      'municipio': municipio,
      'entidadFederativa': entidadFederativa,
    };
  }
}
