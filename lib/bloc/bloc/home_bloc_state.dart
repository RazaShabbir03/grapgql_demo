part of 'home_bloc_bloc.dart';

abstract class HomeBlocState extends Equatable {
  const HomeBlocState();

  @override
  List<Object> get props => [];
}

class HomeBlocInitial extends HomeBlocState {}

class HomeBlocLoading extends HomeBlocState {}

class HomeBlocLoaded extends HomeBlocState {
  final TodosModel todos;
  const HomeBlocLoaded(this.todos);
  @override
  List<Object> get props => [];
}

class HomeBlocError extends HomeBlocState {
  final String message;
  const HomeBlocError(this.message);
}
