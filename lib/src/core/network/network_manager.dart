import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class CoreDio with DioMixin implements Dio {
  @override
  final BaseOptions options;

  CoreDio(this.options) {
    options = options;
    interceptors.add(PrettyDioLogger());
    httpClientAdapter = HttpClientAdapter();
  }
}

/// It's a singleton class that provides a Dio instance with a baseUrl
class NetworkManager {
  /// It's creating a Dio instance with a baseUrl.
}
