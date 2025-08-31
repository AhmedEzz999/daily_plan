class TaskModel {
  String taskName;
  String taskDescription;
  bool isHighPriority;
  bool isFinished;

  TaskModel({
    required this.taskName,
    required this.taskDescription,
    required this.isHighPriority,
    this.isFinished = false,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      taskName: json['Task Name'],
      taskDescription: json['Task Description'],
      isHighPriority: json['High Priority'],
      isFinished: json['is Finished'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Task Name': taskName,
      'Task Description': taskDescription,
      'High Priority': isHighPriority,
      'is Finished': isFinished,
    };
  }
}
