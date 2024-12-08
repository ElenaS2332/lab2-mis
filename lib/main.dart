import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_jokes_app/bloc/jokes_bloc.dart';
import 'package:random_jokes_app/screens/joke_type_screen.dart';
import 'package:random_jokes_app/services/joke_service.dart';

void main() {
  runApp(
    RepositoryProvider(
      create: (context) => JokeService(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<JokesBloc>(
            create: (BuildContext context) =>
                JokesBloc(context.read<JokeService>()),
          ),
        ],
        child: const MainApp(),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: JokeTypeScreen(),
        ),
      ),
    );
  }
}
