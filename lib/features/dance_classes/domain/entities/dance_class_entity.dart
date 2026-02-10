import 'package:equatable/equatable.dart';

class DanceClassEntity extends Equatable{
  final int id;
  final String rhythm;

  const DanceClassEntity({required this.id, required this.rhythm});

  @override
  List<Object?> get props => [id, rhythm];
}