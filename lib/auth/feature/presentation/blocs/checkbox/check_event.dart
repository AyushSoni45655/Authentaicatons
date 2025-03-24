part of 'check_bloc.dart';

@immutable
abstract class CheckEvent {}
class CheckBoxEvent extends CheckEvent{
  final bool value;
  CheckBoxEvent({required this.value});
}