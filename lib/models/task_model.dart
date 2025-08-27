class TaskModel {
  TaskModel({
    required this.taskName,
    required this.taskDescription,
    required this.isHighPriority,
  });
  String taskName;
  String taskDescription;
  bool isHighPriority;
}
