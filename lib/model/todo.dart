class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Pray Subuh', isDone: true),
      ToDo(id: '02', todoText: 'Mandi', isDone: true),
      ToDo(id: '03', todoText: 'Makan Pagi', isDone: true),
      ToDo(id: '04', todoText: 'Pray Dzuhur', isDone: true),
      ToDo(id: '05', todoText: 'Makan Siang', isDone: true),
      ToDo(id: '06', todoText: 'Pray Ashar', isDone: true),
      ToDo(id: '07', todoText: 'Pray Maghrib'),
      ToDo(id: '08', todoText: 'GYM'),
      ToDo(id: '09', todoText: 'Minum Susu Whey'),
      ToDo(id: '10', todoText: 'Pray Isya'),
    ];
  }
}
