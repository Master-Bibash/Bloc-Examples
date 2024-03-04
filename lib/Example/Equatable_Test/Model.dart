import 'package:equatable/equatable.dart';

class Person extends Equatable {
  final String name;
  final int age;
  Person({required this.name, required this.age});

  
     
  
  @override
  // TODO: implement props
  List<Object?> get props => [name,age];
}
