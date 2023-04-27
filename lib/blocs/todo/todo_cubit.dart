import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../models/todo.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  static TodoCubit get(context) => BlocProvider.of(context);

  List<Todo> tasks = [];
  final todoTitleController = TextEditingController();
  final todoDescriptionController = TextEditingController();
  final todoDateController = TextEditingController();
  DateTime dateTime = DateTime.now();

  List<Todo> get allTasks => List<Todo>.from(tasks);


  void addTask(String title, String description, String date) {
    tasks.add(Todo(
        title: title,
        completed: false,
        description: description,
        date: date));
    emit(AddTaskState());
  }

  void toggleTask(Todo task) {
    final taskIndex = tasks.indexOf(task);
    tasks[taskIndex].toggleCompleted();
    emit(CheckCompleteTaskState());
  }

  void deleteTask(Todo task) {
    tasks.remove(task);
    emit(DeleteTaskState());
  }

  void submit(BuildContext context) {
      addTask(
          todoTitleController.text,
          todoDescriptionController.text,
          todoDateController.text);

    Navigator.pop(context);
       todoTitleController.clear();
       todoDescriptionController.clear();
       todoDateController.clear();
  }
  selectedTodoDate(BuildContext context) async {
    var pickedDate = await showDatePicker(context: context,
        initialDate: dateTime,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (pickedDate != null) {
        dateTime = pickedDate;
        todoDateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }
}

