part of 'home_bloc_bloc.dart';

abstract class HomeBlocEvent extends Equatable {
  const HomeBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchTodods extends HomeBlocEvent {
  const FetchTodods();
  @override
  List<Object> get props => [];
}
