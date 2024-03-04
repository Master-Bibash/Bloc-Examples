// bloc/visitor_event.dart
import 'package:flutter_application_1/Example/Example3_Bloc_Consumer/Record%20Data/Model/VisitorModel.dart';

abstract class VisitorEvent {}

class AddVisitorEvent extends VisitorEvent {
  final Visitor visitor;
  AddVisitorEvent(this.visitor);
}

