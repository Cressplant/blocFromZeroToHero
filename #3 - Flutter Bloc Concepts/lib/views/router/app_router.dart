
import 'package:flutter/material.dart';
import 'package:flutter_bloc_concepts/views/screens/home_screen.dart';
import 'package:flutter_bloc_concepts/views/screens/second_screen.dart';
import 'package:flutter_bloc_concepts/views/screens/third_screen.dart';

class AppRouter {

Route onGenerateRoute(RouteSettings routeSettings){

switch (routeSettings.name) {

case '/':
return MaterialPageRoute(
  builder: (newContext) => HomeScreen(
    title: 'Home',
  ));
break;

case '/second-screen':
return MaterialPageRoute(
  builder: (newContext) => SecondScreen(
    title: 'Second',
  ));
break;

case '/third-screen':
return MaterialPageRoute(
  builder: (newContext) => ThirdScreen(
    title: 'Third',
  ));
break;

default: return null;


}

// switch (routeSettings.name) {

// case '/':
// return MaterialPageRoute(
//   builder: (newContext) => BlocProvider.value(
//     value: _counterCubit,
//     child: HomeScreen(
//       title: 'Home',
//     ),
//   ));
// break;

// case '/second-screen':
// return MaterialPageRoute(
//   builder: (newContext) => BlocProvider.value(
//     value: _counterCubit,
//     child: SecondScreen(
//       title: 'Second',
//     ),
//   ));
// break;

// case '/third-screen':
// return MaterialPageRoute(
//   builder: (newContext) => BlocProvider.value(
//     value: _counterCubit,
//     child: ThirdScreen(
//       title: 'Third',
//     ),
//   ));
// break;

// default: return null;


// }


}

}