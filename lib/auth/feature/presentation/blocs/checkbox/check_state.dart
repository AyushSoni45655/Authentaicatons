part of 'check_bloc.dart';

@immutable
abstract class CheckState {}

class CheckInitial extends CheckState {}
class CheckBoxState extends CheckState{
  final bool curruntValue;
  CheckBoxState({required this.curruntValue});
}