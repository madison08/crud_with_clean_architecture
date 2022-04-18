// ignore_for_file: prefer_const_constructors

import 'package:crud_with_clean_architecture/features/Post/presentation/pages/get_post_screen.dart';
import 'package:crud_with_clean_architecture/features/Post/presentation/provider/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './dependencies_injection.dart' as di;

void main() async {
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => PostProvider(
                fetchPostUsecase: di.getIt(),
                fetchPostsUsecase: di.getIt(),
                addPostUsecase: di.getIt(),
                deletePostUsecase: di.getIt()))
      ],
      child: MaterialApp(
        home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('welcome'),
              GetPosts(),
            ],
          ),
        ),
      ),
    );
  }
}
