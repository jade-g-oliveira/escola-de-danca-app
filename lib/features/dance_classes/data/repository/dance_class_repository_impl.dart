
import '../../domain/entities/dance_class_entity.dart';
import '../../domain/repositories/dance_class_repository.dart';
import '../datasource/dance_class_remote_datasource.dart';
import '../models/dance_class_model.dart';

class DanceClassRepositoryImpl implements DanceClassRepository {
  final DanceClassRemoteDataSource dataSource;

  DanceClassRepositoryImpl(this.dataSource);

  @override
  Future<List<DanceClassEntity>> getDanceClasses() async {
    final List data = await dataSource.getDanceClasses();
    
    return data.map((item) => DanceClassModel.fromJson(item)).toList();
  }
}