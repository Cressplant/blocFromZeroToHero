import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/views/router/app_router.dart';
import 'package:flutter_bloc_concepts/views/screens/home_screen.dart';
import 'package:flutter_bloc_concepts/views/screens/second_screen.dart';
import 'package:flutter_bloc_concepts/views/screens/third_screen.dart';

import 'logic/cubit/counter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


AppRouter _appRouter = AppRouter();


// @override
  // void dispose() {
    ////_appRouter.dispose(); // No longer need to run .close on counterCubit so dispose no longer required
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
          initialRoute: '/',
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: _appRouter.onGenerateRoute,
    
    
          // routes: {
          //   '/' : (context) => BlocProvider.value( // Use BlocProvider.value & instantiate within MyApp as BlocProvider() will provide different instantiations
          //     value: counterCubit,
          //     child: HomeScreen(title: 'Home Screen')),
          //   '/second-screen' : (context) => BlocProvider.value(
          //     value: counterCubit,
          //     child: SecondScreen(title: 'Second Screen',)),
          //   '/third-screen' : (context) => BlocProvider.value(
          //     value: counterCubit,
          //     child: ThirdScre,
    // )en(title: 'Third Screen',)),
      // },

    ));
  }
}

