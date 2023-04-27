class Todo {
  String title;
  bool completed;
  String description;
  String date;

  Todo({required this.title,required this.description,required this.date, this.completed = false});

  void toggleCompleted() {
    completed = !completed;
  }
}