class TaskModel {
  final int id;
  final String discription;
  final DateTime dateTime;
  final bool finished;

  TaskModel({
    required this.id,
    required this.discription,
    required this.dateTime,
    required this.finished,
  });

  factory TaskModel.loadFromDB(Map<String, dynamic> task) {
    return TaskModel(
      id: task['id'],
      discription: task['descrição'],
      dateTime: DateTime.parse(task['data_hora']),
      finished: task['finalizado'] == 1,
    );
  }
}
