import 'ApiCall.dart';

abstract class MyEvent {}

class MyApiCallEvent extends MyEvent {}

abstract class MyState {}

class MyInitialState extends MyState {}

class MyLoadingState extends MyState {}

class MySuccessState extends MyState {
  final String data;

  MySuccessState(this.data);
}

class MyErrorState extends MyState {
  final String message;

  MyErrorState(this.message);
}