import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc/home_bloc_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(children: [
        BlocBuilder<HomeBlocBloc, HomeBlocState>(
          builder: (context, state) {
            if (state is HomeBlocInitial) {
              BlocProvider.of<HomeBlocBloc>(context).add(FetchTodods());
            }
            if (state is HomeBlocLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeBlocLoaded) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.todos.todos!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.todos.todos![index].description!),
                  );
                },
              );
            }
            if (state is HomeBlocError) {
              return Center(
                child: Text(state.message),
              );
            }
            return Container();
          },
        ),
        ElevatedButton(
            onPressed: () {
              BlocProvider.of<HomeBlocBloc>(context).add(const FetchTodods());
            },
            child: const Text('Refresh'))
      ]),
    );
  }
}
