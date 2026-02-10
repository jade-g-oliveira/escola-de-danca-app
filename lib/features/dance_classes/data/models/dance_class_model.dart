
import '../../domain/entities/dance_class_entity.dart';
class DanceClassModel extends DanceClassEntity {

  DanceClassModel({required super.id, required super.ritmo});

  factory DanceClassModel.fromJson(Map<String, dynamic> json) {
    return DanceClassModel(
      id: json['id'],
      ritmo: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
        return {
      'id': id,
      'title': ritmo,
    };
  }
}