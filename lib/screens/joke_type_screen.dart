import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_jokes_app/bloc/jokes_bloc.dart';

class JokeTypeScreen extends StatefulWidget {
  const JokeTypeScreen({super.key});

  @override
  State<JokeTypeScreen> createState() => _JokeTypeScreenState();
}

class _JokeTypeScreenState extends State<JokeTypeScreen> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<JokesBloc>(context).add(
      JokeTypesInitialLoad(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<JokesBloc, JokesState>(
        builder: (BuildContext context, JokesState state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Text(
                            "Choose a joke type",
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                    if (state is JokeTypesLoadSuccess)
                      Column(
                        children: state.jokeTypes.map(
                          (jokeType) {
                            return ListTile(
                              title: Text(
                                jokeType.type,
                              ),
                              onTap: () {
                                BlocProvider.of<JokesBloc>(context).add(
                                  JokeSelected(joke: jokeType),
                                );
                              },
                            );
                          },
                        ).toList(),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, JokesState state) {
          if (state is JokeTypeSelected) {
            BlocProvider.of<JokesBloc>(context).add(
              JokeSelected(joke: state.jokeType),
            );
            // Navigator.pushReplacement(
            // context,
            // MaterialPageRoute(
            // builder: (context) =>
            // QuestionsScreen(
            //   category: state.category,
            //   gradientColor: state.color,
            // ),
            // ),
            // );
          }
        },
      ),
    );
  }
}
