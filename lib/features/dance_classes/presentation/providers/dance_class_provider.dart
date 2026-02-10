import 'package:flutter/material.dart';

import '../../domain/entities/dance_class_entity.dart';
import '../../domain/repositories/dance_class_repository.dart';

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