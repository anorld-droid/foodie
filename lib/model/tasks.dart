class TaskModel {
  List<String> filters;
  Map<String, List<TaskItem>> tasks; // Use date as the key

  TaskModel({required this.tasks, required this.filters});
}

class TaskItem {
  String text;
  String time;
  bool done;

  TaskItem({required this.time, required this.text, required this.done});
}
