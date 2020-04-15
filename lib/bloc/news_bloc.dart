import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/data/models/news_response.dart';
import 'package:news_app/data/repositories/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsRepository newsRepository;

  NewsBloc({@required this.newsRepository});

  @override
  NewsState get initialState => NewsInitial();

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    if (event is FetchNewsEvent) {
      yield NewsLoading();
      try {
        List<Articles> articles = await newsRepository.getArticles();
        yield NewsLoaded(articles: articles);
      } catch (e) {
        yield NewsError(message: e.toString());
      }
    }
  }
}
