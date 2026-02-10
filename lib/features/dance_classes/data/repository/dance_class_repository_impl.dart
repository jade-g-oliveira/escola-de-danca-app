import 'package:dio/dio.dart';

import '../../domain/entities/dance_class_entity.dart';
import '../../domain/repositories/dance_class_repository.dart';
import '../models/dance_class_model.dart';

class DanceClassRepositoryImpl implements DanceClassRepository{
  final Dio dio;
  DanceClassRepositoryImpl(this.dio);

  @override
  Future<List<DanceClassEntity>> getDanceClasses() async {
  final response = await dio.get('/albums');
  final List data = response.data;
  
    return data.map((item) => DanceClassModel.fromJson(item)).toList();
  }
}
