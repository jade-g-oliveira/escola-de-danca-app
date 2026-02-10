
import '../entities/dance_class_entity.dart';

abstract class DanceClassRepository {
  Future<List<DanceClassEntity>> getDanceClasses();
}