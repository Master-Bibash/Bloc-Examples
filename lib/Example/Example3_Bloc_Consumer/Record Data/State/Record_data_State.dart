// bloc/visitor_state.dart
abstract class VisitorState {}

class VisitorInputState extends VisitorState {}

// bloc/visitor_list_event.dart
abstract class VisitorListEvent {}

class LoadVisitorListEvent extends VisitorListEvent {}

// bloc/visitor_list_state.dart
abstract class VisitorListState {}

class VisitorListLoadingState extends VisitorListState {}
