import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/blocs/todo/todo_cubit.dart';
import 'package:todo_list_app/screens/add_todo.dart';


class TodoListScreen extends StatelessWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    var todo = TodoCubit.get(context);
    return Scaffold(
         appBar: AppBar(
           title: Text('Todo List'),
         ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>AddTodo()));
        },
        child: Icon(Icons.add),
        ),
      body: ListView.builder(
      itemCount: todo.allTasks.length,
      itemBuilder: ((context, index){
        return Padding(
          padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0,),
          child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(0),
    ),
    child: ListTile(
      title: Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          child: Text(
            todo.allTasks[index].title,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(todo.allTasks[index].date,
        style: TextStyle(
          fontSize: 12
        ),),
      ],
      ),
          leading: Checkbox(
            value: todo.allTasks[index].completed,
            onChanged: ((_) => todo.toggleTask(todo.allTasks[index])),
          ),
          subtitle: Text(todo.allTasks[index].description),
          trailing: IconButton(
              onPressed: () {
                todo.deleteTask(todo.allTasks[index]);
              },
              icon: const Icon(Icons.delete)
          ),
      )
    ),
        );
    }
      )
  )
    );
  },
);
  }
}
