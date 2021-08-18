class TaskModel {
  int id;
  String taskName;
  String taskDescription;
  bool isComplete;

  TaskModel({
    this.id,
    this.taskName,
    this.taskDescription,
    this.isComplete = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'taskName': taskName,
      'taskDescription': taskDescription,
      'isComplete': isComplete ? 1 : 0,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      taskName: map['taskName'],
      taskDescription: map['taskDescription'],
      isComplete: map['isComplete'] == 1 ? true : false,
    );
  }
}
