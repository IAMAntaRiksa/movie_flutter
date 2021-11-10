import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/bloc/bloc/movie_bloc.dart';
import 'package:flutter_movie/bloc/cubit/buttom_nav_cubit.dart';
import 'package:flutter_movie/routes/routes.dart';
import 'package:flutter_movie/storage/hive.dart';

Future<void> main() async {
  runApp(const MyApp());

  await HiveDB().initialHiveDatabase();

  Bloc.observer = BlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ButtomNavCubit>(
          create: (context) => ButtomNavCubit(),
        ),
        BlocProvider<MovieBloc>(
          create: (context) => MovieBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
