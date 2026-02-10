import 'package:flutter/material.dart';

import '../../../features/dance_classes/domain/entities/dance_class_entity.dart';
import '../../../features/dance_classes/domain/repositories/dance_class_repository.dart';

class DanceClassProvider extends ChangeNotifier {
  final DanceClassRepository repository;
  
  List<DanceClassEntity> _danceClasses = [];
  List<DanceClassEntity> get danceClasses => _danceClasses;
  
  bool _loading = false;
  bool get loading => _loading;

  DanceClassProvider(this.repository);

  Future<void> fetchAulas() async {
    _loading = true;
    notifyListeners();
    try {
      _danceClasses = await repository.getDanceClasses();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}