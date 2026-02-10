
import '../../domain/entities/dance_class_entity.dart';
class DanceClassModel extends DanceClassEntity {
  final int id;
  final String ritmo;

  DanceClassModel({required this.id, required this.ritmo}) : super(id: id, ritmo: ritmo);

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