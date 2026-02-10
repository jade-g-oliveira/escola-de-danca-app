import 'package:dio/dio.dart';

abstract class DanceClassRemoteDataSource {
  Future<List<dynamic>> getDanceClasses();
}

class DanceClassRemoteDataSourceImpl implements DanceClassRemoteDataSource {
  final Dio dio;
  DanceClassRemoteDataSourceImpl(this.dio);

  @override
  Future<List<dynamic>> getDanceClasses() async {
    try {
      final response = await dio.get('/albums');
      return response.data as List<dynamic>;
    } on DioException catch (e) {
      throw Exception("Falha ao buscar aulas: ${e.message}");
    }
  }
}