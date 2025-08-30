class TaskModel {
  String taskName;
  String taskDescription;
  bool isHighPriority;
  bool isDone = false;

  TaskModel({
    required this.taskName,
    required this.taskDescription,
    required this.isHighPriority,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      taskName: json['Task Name'],
      taskDescription: json['Task Description'],
      isHighPriority: json['High Priority'],
    );
  }
}
