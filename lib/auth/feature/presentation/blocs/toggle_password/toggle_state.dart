part of 'toggle_bloc.dart';

@immutable
abstract class ToggleState {}

class ToggleInitial extends ToggleState {

}
class TogglePassowrdState extends ToggleState{
  final bool isToggle;
  TogglePassowrdState({required this.isToggle});
}
