import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/views/router/app_router.dart';
import 'logic/cubit/counter_cubit.dart';
import 'logic/cubit/internet_cubit.dart';
import 'logic/cubit/internet_cubit.dart';
import 'views/router/app_router.dart';

void main() {
  runApp(MyApp(
    // Initialise classes that dont depend on anything at top
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;

  MyApp({Key key, @required this.appRouter, @required this.connectivity});

// @override
  // void dispose() {
  ////_appRouter.dispose(); // No longer need to run .close on counterCubit so dispose no longer required
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        //* CAN DEPEND ON BLOCS WITHIN SAVE PROVIDER LIST AS BELOW
        BlocProvider<CounterCubit>(
          create: (context) =>
              CounterCubit(internetCubit: context.read<InternetCubit>()),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,

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
      ),
    );
  }
}
