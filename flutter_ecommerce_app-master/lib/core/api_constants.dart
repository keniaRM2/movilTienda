import '../config/api_config.dart';

class APIConstants {

  static const String login = '${ApiConfig.baseUrl}auth/login';

  static const String categoriaListar = '${ApiConfig.baseUrl}categoria';

  static const String productoListar = '${ApiConfig.baseUrl}producto';
  static const String productoObtener = '${ApiConfig.baseUrl}producto/obtener';

  static const String stockListar = '${ApiConfig.baseUrl}stock';
  static const String stockObtener = '${ApiConfig.baseUrl}stock/obtener';

  static const String pagoListar = '${ApiConfig.baseUrl}pago';
  static const String pagoObtener = '${ApiConfig.baseUrl}pago/obtener';

  static const String subcategoriaListar = '${ApiConfig.baseUrl}subcategoria';
  static const String subcategoriaObtener = '${ApiConfig.baseUrl}subcategoria/obtener';

  static const String usuarioRegistrar = '${ApiConfig.baseUrl}usuario/registrar';
  static const String usuarioObtener = '${ApiConfig.baseUrl}usuario/obtener';
  static const String usuarioActualizar = '${ApiConfig.baseUrl}usuario/actualizar';

  static const String generoListar = '${ApiConfig.baseUrl}genero';
  static const String generoObtener = '${ApiConfig.baseUrl}genero/obtener';


  static const String tallaListar = '${ApiConfig.baseUrl}talla';
  static const String tallaObtener = '${ApiConfig.baseUrl}talla/obtener';

  static const String tipoMedidaListar = '${ApiConfig.baseUrl}tipoMedida';
  static const String tipoMedidaObtener = '${ApiConfig.baseUrl}tipoMedida/obtener';

  static const String compraListar = '${ApiConfig.baseUrl}compra';
  static const String compraRegistrar = '${ApiConfig.baseUrl}compra/registrar';
  static const String compraObtener = '${ApiConfig.baseUrl}compra/obtener';
  static const String compraActualizar = '${ApiConfig.baseUrl}compra/actualizar';

  static const String envioListar = '${ApiConfig.baseUrl}envio';
  static const String envioObtener = '${ApiConfig.baseUrl}envio/obtener';

  static const String carritoListar = '${ApiConfig.baseUrl}carrito';
  static const String carritoRegistrar = '${ApiConfig.baseUrl}carrito/registrar';
  static const String carritoObtener = '${ApiConfig.baseUrl}carrito/obtener';
  static const String carritoActualizar = '${ApiConfig.baseUrl}carrito/actualizar';
  static const String carritoEliminar = '${ApiConfig.baseUrl}carrito/eliminar';
  static const String carritoMiCarrito = '${ApiConfig.baseUrl}carrito/miCarrito';

}
