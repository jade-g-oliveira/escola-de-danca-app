import 'package:dio/dio.dart';

import '../../../features/dance_classes/data/models/dance_class_model.dart';
import '../../../features/dance_classes/domain/entities/dance_class_entity.dart';
import '../../../features/dance_classes/domain/repositories/dance_class_repository.dart';
class DanceClassRepositoryImpl implements DanceClassRepository {
  final Dio dio;
  DanceClassRepositoryImpl(this.dio);

  @override
  Future<List<DanceClassEntity>> getDanceClasses() async {
  final response = await dio.get('/albums');
  final List data = response.data;
  
    return data.map((item) => DanceClassModel.fromJson(item)).toList();
  }
}
