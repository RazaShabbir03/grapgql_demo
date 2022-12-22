import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graph_ql_demo/models/todo_model.dart';
import 'package:graph_ql_demo/service/graph_ql_client.dart';
import 'dart:convert';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  GraphQLService graphQLService;
  HomeBlocBloc(
    this.graphQLService,
  ) : super(HomeBlocInitial()) {
    on<FetchTodods>((event, emit) async {
      emit(HomeBlocLoading());
      try {
        const query = '''
          {
    todos  {
        id
        description
    }
}
        ''';
        final result = await graphQLService.performMutation(query);

        if (result.hasException) {
        } else {
          final todos = TodosModel.fromMap(result.data!);
          emit(HomeBlocLoaded(todos));
        }
      } catch (e, s) {
        print(e);
        print(s);
        emit(HomeBlocError(e.toString()));
      }
    });
  }
}
