part of 'todo_cubit.dart';

@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {}

class AddTaskState extends TodoState {}

class CheckCompleteTaskState extends TodoState {}

class DeleteTaskState extends TodoState {}


