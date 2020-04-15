part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
}

class NewsInitial extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsLoading extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsLoaded extends NewsState {
  final List<Articles> articles;

  NewsLoaded({@required this.articles});

  @override
  List<Object> get props => [articles];
}

class NewsError extends NewsState {
  final String message;

  NewsError({@required this.message});

  @override
  List<Object> get props => [];
}

