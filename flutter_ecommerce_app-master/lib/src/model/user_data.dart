class UserData {
  int idUsuario;
  int? idPersona;
  String token;
  String? nombre;
  String? primerApellido;
  String? segundoApellido;
  String? fechaNacimiento;
  int? generoId;

  UserData({
    required this.idUsuario,
    this.idPersona,
    required this.token,
    this.nombre,
    this.primerApellido,
    this.segundoApellido,
    this.fechaNacimiento,
    this.generoId,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      idUsuario: json['idUsuario'] as int,
      idPersona: json['idPersona'] as int,
      token: json['token'] as String,
      nombre: json['nombre'] as String,
      primerApellido: json['primerApellido'] as String,
      segundoApellido: json['segundoApellido'] as String,
      fechaNacimiento: json['fechaNacimiento'] as String,
      generoId: json['generoId'] as int,
    );
  }
}
