class TaskModel {
  final List<String> filters;
  final Map<String, TaskItem> tasks; // Use date as the key

  TaskModel({required this.tasks, required this.filters});
}

class TaskItem {
  final String text;
  final bool done;

  TaskItem({required this.text, required this.done});
}
