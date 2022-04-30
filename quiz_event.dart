part of 'quiz_bloc.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object> get props => [];
}

class  AnswerTrue extends QuizEvent{}

class AnswerFalse extends QuizEvent{}