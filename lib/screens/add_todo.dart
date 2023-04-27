import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/blocs/todo/todo_cubit.dart';


class AddTodo extends StatelessWidget {
  const AddTodo({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var todo = TodoCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text("ToDo App"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: todo.todoTitleController,
                  decoration: InputDecoration(
                      labelText: 'Title',
                      hintText: 'Write Todo Title'
                  ),
                ),
                TextField(
                  controller: todo.todoDescriptionController,
                  decoration: InputDecoration(
                      labelText: 'Description',
                      hintText: 'Write Todo Description'
                  ),
                ),
                TextField(
                  controller: todo.todoDateController,
                  decoration: InputDecoration(
                      labelText: 'Date',
                      hintText: 'Pick a Date',
                      prefixIcon: InkWell(
                        onTap: () {
                          todo.selectedTodoDate(context);
                        },
                        child: Icon(Icons.calendar_today),
                      )
                  ),
                ),
                SizedBox(
                    height: 20
                ),
                ElevatedButton(
                    onPressed: () {
                      todo.submit(context);
                    },
                    child: Text('Save',
                      style: TextStyle(color: Colors.white),)),
              ],
            ),
          ),
        );
      },
    );
  }
}

