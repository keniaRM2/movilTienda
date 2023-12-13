class CompraDTO {

  int? idCompra;
  int? total;
  int? montoPagado;
  String? statusNombre;
  String? fechaCompra;

  CompraDTO({
    this.idCompra,
    this.total,
    this.montoPagado,
    this.statusNombre,
    this.fechaCompra
  });

  factory CompraDTO.fromJson(Map<String, dynamic> json) {
    return CompraDTO(
      idCompra: json['idCompra'] as int?,
      total: json['total'] as int?,
      montoPagado: json['montoPagado'] as int?,
      statusNombre: json['statusNombre'] as String?,
      fechaCompra: json['fechaCompra'] as String?,
    );
  }

  // Método para convertir la instancia a un mapa JSON
  Map<String, dynamic> toJson() {
    return {
      'idCompra': idCompra,
      'total': total,
      'montoPagado': montoPagado,
      'statusNombre': statusNombre,
      'fechaCompra': fechaCompra,
    };
  }
}
