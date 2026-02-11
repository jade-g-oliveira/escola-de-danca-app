import 'package:flutter/material.dart';

import '../../domain/entities/dance_class_entity.dart';
import '../../domain/repositories/dance_class_repository.dart';

class DanceClassProvider extends ChangeNotifier {
  final DanceClassRepository repository;
  
  List<DanceClassEntity> _danceClasses = [];
  List<DanceClassEntity> get danceClasses => _danceClasses;
  
  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  DanceClassProvider(this.repository);

  Future<void> loadDanceClasses() async {
    if (_danceClasses.isNotEmpty || _loading) return;
    _loading = true;
    _errorMessage = null;

    try {
      _danceClasses = await repository.getDanceClasses();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}