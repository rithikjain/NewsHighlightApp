import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_bloc.dart';
import 'package:news_app/data/repositories/news_repository.dart';
import 'package:news_app/pages/news_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      home: BlocProvider(
        create: (context) => NewsBloc(newsRepository: ArticleRepository()),
        child: NewsPage(),
      ),
    );
  }
}
