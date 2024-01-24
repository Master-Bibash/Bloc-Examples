import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {}

//data loading state
class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];

}
//data loaded State