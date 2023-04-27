import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/blocs/todo/todo_cubit.dart';
import 'package:todo_list_app/screens/splash_screen.dart';


class AppRoot extends StatelessWidget {
  AppRoot({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=> TodoCubit())
    ],
      child: MaterialApp(
        title: 'Simple ToDo App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
         primarySwatch: Colors.deepOrange,
        ),
        home: SplashScreen(),
      ),
    );
  }
}